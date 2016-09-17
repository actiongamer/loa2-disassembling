package nslm2.modules.foundations.chatModules
{
   import game.ui.chatModules.ChatModuleUI;
   import nslm2.modules.foundations.chatModules.chatSendBoxes.ChatSendBox;
   import nslm2.common.ui.components.comps2d.BtnPopBind;
   import nslm2.modules.foundations.chatModules.historyPanels.ChatHistory;
   import nslm2.common.compsEffects.GlowFilterBreathCtrl;
   import com.mz.core.event.MzEvent;
   import morn.core.utils.ObjectUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.MathUtil;
   import flash.events.Event;
   import com.mz.core.mgrs.UIMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.utils.ArrayUtil;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import com.mz.core.utils.LocalData;
   import flash.utils.Dictionary;
   import com.greensock.TweenLite;
   import com.greensock.easing.Cubic;
   import com.greensock.easing.Back;
   import nslm2.modules.foundations.chatModules.chatSendBoxes.sendHandlers.ChatSendHandlerBase;
   import nslm2.modules.foundations.chatModules.chatSendBoxes.sendHandlers.ChatSendHandler_Normal;
   import nslm2.modules.foundations.chatModules.chatSendBoxes.sendHandlers.ChatSendHandler_ServerGM;
   import flash.events.KeyboardEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.PublicTalkNotify;
   import flash.utils.ByteArray;
   import morn.core.utils.BaUtil;
   import com.mz.core.mgrs.resMgrs.ZipBaVo;
   import proto.Item;
   import proto.BaoWu;
   import com.mz.core.logging.Log;
   import flash.geom.Rectangle;
   import flash.system.System;
   import nslm2.modules.foundations.AlertUtil;
   import proto.TalkContent;
   import morn.core.utils.UniqueId;
   import nslm2.nets.sockets.ServerUtil;
   import proto.PublicTalkReq;
   import nslm2.nets.sockets.ServerEngine;
   import com.netease.protobuf.UInt64;
   import com.mz.core.utils.DisplayUtils;
   import morn.customs.expands.MornExpandUtil;
   import morn.customs.FilterLib;
   
   public class ChatModule extends ChatModuleUI
   {
       
      
      private const STR_ARR:Array = [999000834,999000835,999000836,999000837];
      
      private var btn_sendChannelBind:BtnPopBind;
      
      private var filterBreath:GlowFilterBreathCtrl;
      
      private var _grayTime:Object;
      
      private var _curChannelId:int = -789;
      
      private var showAllCurParam:nslm2.modules.foundations.chatModules.ChatModuleParam;
      
      private var _showAll:Boolean = true;
      
      private var _showAllLib:Dictionary;
      
      private var showBtnHideAllFilter:Boolean = false;
      
      private var sendHandlerChain:ChatSendHandlerBase;
      
      public var chatSendNormal:ChatSendHandler_Normal;
      
      public function ChatModule()
      {
         _showAllLib = new Dictionary();
         super();
         this.left = 3;
         this.bottom = 3;
         this.showAllTip.visible = false;
         this.showAllTip.mouseEvent = false;
         this.showAllTip.txtChatMsgBG.width = this.showAllTip.txtChatMsg.width + 15;
         ChatConsts.chat_bottom = this.bottom;
         DisplayUtils.addChildFromGlobal(this.btn_hideAll,this.img_icon_scaleAll);
         this.sendBox.addEventListener("evtSendText",sendTextHandler);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.list_sendChannelOther.changeHandler = list_sendChannelOther_handler;
         this.list_sendChannelOther.visible = false;
         this.curChannelId = 0;
         this.hisotryViewRef.addEventListener("eventHistoryGroupIdChange",historyGroupIdChangeHandler);
         btn_sendChannelBind = new BtnPopBind(this.btn_sendChannel,this.list_sendChannelOther);
         filterBreath = new GlowFilterBreathCtrl(FilterLib.TEXT_GROW_SELECTED_FILTER).set_duration(1.2).addHandler(filterBreath_cb);
         this.model.addEventListener("evtAddChat",model_addChat);
         this.model.start();
         UIMgr.stage.addEventListener("keyUp",stage_onKeyUp);
      }
      
      public function get sendBox() : ChatSendBox
      {
         return this.sendBoxUI as ChatSendBox;
      }
      
      public function get hisotryViewRef() : ChatHistory
      {
         return this.historyView as ChatHistory;
      }
      
      public function get model() : ChatModel
      {
         return ChatModel.ins;
      }
      
      protected function grayChatModule(param1:MzEvent) : void
      {
         _grayTime && App.timer.clearTimer(_grayTime);
         _grayTime = App.timer.doOnce(180000,graytime);
         ObjectUtils.gray(this,true);
         if(Math.random() >= 0.7)
         {
            handleNotices("MSG_CHAT_SYS_NOTICE",LocaleMgr.ins.getStr(STR_ARR[MathUtil.randomInt(3,0)]));
         }
      }
      
      private function graytime() : void
      {
         ObjectUtils.gray(this,false);
      }
      
      override protected function onResize(param1:Event) : void
      {
         super.onResize(param1);
         validateResize();
      }
      
      private function validateResize() : void
      {
         if(this.showAllCurParam.isBattle)
         {
            if(UIMgr.gameWidth < 1310)
            {
               this.bottom = 108;
            }
            else
            {
               this.bottom = 3;
            }
         }
         else
         {
            this.bottom = 3;
         }
         ChatConsts.chat_bottom = this.bottom;
         ObserverMgr.ins.sendNotice("msg_game_resize");
      }
      
      public function get curChannelId() : int
      {
         return _curChannelId;
      }
      
      public function set curChannelId(param1:int) : void
      {
         if(_curChannelId != param1)
         {
            _curChannelId = param1;
            this.btn_sendChannel.label = ChatConsts.ins.getChannelVo(_curChannelId).name;
            validateListSendChannelOther();
         }
      }
      
      private function validateListSendChannelOther() : void
      {
         var _loc1_:Array = ChatConsts.ins.sendChannelArr.concat();
         ArrayUtil.removeItem(_loc1_,this._curChannelId);
         if(this.list_sendChannelOther.repeatY != _loc1_.length)
         {
            this.list_sendChannelOther.repeatY = _loc1_.length;
         }
         this.list_sendChannelOther.array = _loc1_.reverse();
      }
      
      private function list_sendChannelOther_handler(param1:int) : void
      {
         var _loc2_:int = this.list_sendChannelOther.getItem(param1) as int;
         this.curChannelId = _loc2_;
         this.list_sendChannelOther.visible = false;
         this.hisotryViewRef.changeGroupByChannelId(this.curChannelId);
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_sendChannel !== _loc3_)
         {
            if(this.btn_hideAll === _loc3_)
            {
               if(this.showAllTip.visible)
               {
                  LocalData.insCurPlayer.save("SHOW_ALL_TIP",true);
                  this.showAllTip.visible = false;
               }
               _showAllLib[this.showAllCurParam.moduleId] = !this.showAll;
               this.setShowAll(this.showAllCurParam.moduleId,!this.showAll);
            }
         }
         else
         {
            this.btn_sendChannelBind.switchPop();
         }
      }
      
      public function get showAll() : Boolean
      {
         return _showAll;
      }
      
      public function setShowAll(param1:int, param2:*) : void
      {
         if(_showAll != param2)
         {
            _showAll = param2;
            if(_showAll == false)
            {
               TweenLite.to(this.boxChatAll,0.5,{
                  "x":-this.width - 50,
                  "y":0,
                  "ease":Cubic.easeOut
               });
               TweenLite.to(this.img_icon_scaleAll,0.5,{"rotation":-180});
            }
            else
            {
               this.showBtnHideAllFilter = false;
               this.btn_hideAll.filters = [];
               TweenLite.to(this.boxChatAll,0.4,{
                  "x":0,
                  "y":0,
                  "ease":Back.easeOut
               });
               TweenLite.to(this.img_icon_scaleAll,0.5,{"rotation":0});
            }
         }
      }
      
      private function filterBreath_cb(param1:Array) : void
      {
         if(this.showBtnHideAllFilter)
         {
            this.btn_hideAll.filters = param1;
         }
      }
      
      private function sendTextHandler(param1:Event) : void
      {
         onSendText();
      }
      
      private function onSendText() : void
      {
         var _loc2_:* = null;
         if(sendHandlerChain == null)
         {
            _loc2_ = new ChatSendHandler_ServerGM();
            sendHandlerChain = new ChatSendHandler_ServerGM();
            chatSendNormal = new ChatSendHandler_Normal().config(this.sendBox,this.hisotryViewRef);
            var _loc3_:* = new ChatSendHandler_Normal().config(this.sendBox,this.hisotryViewRef);
            _loc2_.next = _loc3_;
            _loc2_ = _loc3_;
         }
         chatSendNormal.channelId = this.curChannelId;
         var _loc1_:String = this.sendBox.getContent();
         sendHandlerChain.exec(_loc1_);
      }
      
      private function historyGroupIdChangeHandler(param1:MzEvent) : void
      {
         var _loc3_:int = param1.data;
         var _loc2_:ChannelGroupVo = ChatConsts.ins.getChannelGroupVo(_loc3_);
         if(_loc2_.sendChannelId >= 0)
         {
            this.curChannelId = _loc2_.sendChannelId;
         }
      }
      
      private function stage_onKeyUp(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == 13)
         {
            if(ModuleMgr.ins.isShow(10500) && ModuleMgr.ins.isShow(10540) == false)
            {
               if(this.showAll)
               {
                  this.sendBox.focus();
               }
            }
         }
      }
      
      private function model_addChat(param1:MzEvent) : void
      {
         var _loc9_:* = null;
         var _loc6_:* = undefined;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc8_:int = 0;
         var _loc7_:PublicTalkNotify = param1.data as PublicTalkNotify;
         var _loc3_:Boolean = false;
         try
         {
            if(_loc7_.content.extraContent)
            {
               _loc9_ = _loc7_.content.extraContent;
               _loc6_ = BaUtil.unzipArr(_loc9_);
               _loc10_ = _loc6_.length;
               _loc11_ = 0;
               while(_loc11_ < _loc10_)
               {
                  _loc2_ = _loc6_[_loc11_];
                  var _loc13_:* = _loc2_.name;
                  if("item" !== _loc13_)
                  {
                     if("baowu" === _loc13_)
                     {
                        _loc4_ = new BaoWu();
                        _loc4_.readFromSlice(_loc6_[_loc11_].ba,0);
                        _loc7_.content.extraBaow = _loc4_;
                     }
                  }
                  else
                  {
                     _loc5_ = new Item();
                     _loc5_.readFromSlice(_loc6_[_loc11_].ba,0);
                     _loc7_.content.extraItem = _loc5_;
                  }
                  _loc11_++;
               }
            }
            _loc3_ = true;
         }
         catch($err:Error)
         {
            Log.error(this,"model_addChat解码错误",$err,"\n",$err.getStackTrace());
         }
         if(_loc3_)
         {
            if(this.showAll == false)
            {
               this.showBtnHideAllFilter = true;
            }
            _loc8_ = 1;
            while(true)
            {
               _loc8_--;
               if(!_loc8_)
               {
                  break;
               }
               this.hisotryViewRef.appendChat(_loc7_);
            }
         }
      }
      
      override public function dispose() : void
      {
         if(btn_sendChannelBind)
         {
            btn_sendChannelBind.dispose();
            btn_sendChannelBind = null;
         }
         super.dispose();
      }
      
      override protected function get bounds() : Rectangle
      {
         var _loc1_:Rectangle = super.bounds;
         _loc1_.width = this.width;
         return _loc1_;
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat("MSG_GM_CMD","MSG_ITEM_SEND_CHAT","MSG_TEAM_GUAJI_INVITE_SEND_CHAT","MSG_CHAT_SYS_NOTICE","MSG_CHAT_GUILD_SYS_NOTICE","msg_change_chat_group","MSG_TEAM_BATTLEFIELD_INVITE_SEND_CHAT","MSG_BAOWU_SEND_CHAT");
      }
      
      override public function show(param1:Object = null) : void
      {
         var _loc2_:* = null;
         super.show(param1);
         var _loc3_:nslm2.modules.foundations.chatModules.ChatModuleParam = param1 as nslm2.modules.foundations.chatModules.ChatModuleParam;
         if(_loc3_ == null)
         {
            _loc3_ = nslm2.modules.foundations.chatModules.ChatModuleParam.init(10500,true,false);
         }
         if(_loc3_.channelGroupId == 1000)
         {
            _loc3_.channelGroupId = ChatConsts.ins.historyChannelArr[hisotryViewRef.tab_channelGroup.selectedIndex];
         }
         if(_loc3_.channelGroupId == 1008 && _loc3_.moduleId == 50527)
         {
            ChatModel.isPeakSportsBool = true;
         }
         else
         {
            ChatModel.isPeakSportsBool = false;
         }
         this.showAllCurParam = _loc3_;
         this.showAllTip.visible = false;
         if(this._showAllLib.hasOwnProperty(_loc3_.moduleId))
         {
            this.setShowAll(_loc3_.moduleId,_showAllLib[_loc3_.moduleId]);
         }
         else if(_loc3_.isBattle)
         {
            if(UIMgr.gameWidth < 1310)
            {
               if(LocalData.insCurPlayer.load("SHOW_ALL_TIP",false) == false)
               {
                  this.showAllTip.visible = true;
               }
               this.setShowAll(_loc3_.moduleId,false);
            }
            else
            {
               this.setShowAll(_loc3_.moduleId,true);
            }
         }
         else
         {
            this.setShowAll(_loc3_.moduleId,_loc3_.defaultShow);
         }
         if(_loc3_.channelGroupId)
         {
            this.hisotryViewRef.curGroupId = _loc3_.channelGroupId;
            _loc2_ = ChatConsts.ins.getChannelGroupVo(_loc3_.channelGroupId);
            if(_loc2_.sendChannelId >= 0)
            {
               this.curChannelId = _loc2_.sendChannelId;
            }
            else
            {
               _loc2_ = ChatConsts.ins.getChannelGroupVo(0);
               this.curChannelId = !!_loc2_?_loc2_.sendChannelId:0;
            }
         }
         this.validateResize();
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc15_:* = null;
         var _loc18_:* = null;
         var _loc16_:* = null;
         var _loc11_:* = null;
         var _loc9_:* = null;
         var _loc17_:* = null;
         var _loc12_:* = null;
         var _loc10_:* = null;
         var _loc19_:int = 0;
         var _loc5_:* = null;
         var _loc13_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc14_:* = null;
         var _loc7_:* = null;
         var _loc6_:int = 0;
         var _loc8_:* = null;
         super.handleNotices(param1,param2);
         var _loc20_:* = param1;
         if("MSG_GM_CMD" !== _loc20_)
         {
            if("MSG_CHAT_SYS_NOTICE" !== _loc20_)
            {
               if("MSG_CHAT_GUILD_SYS_NOTICE" !== _loc20_)
               {
                  if("MSG_ITEM_SEND_CHAT" !== _loc20_)
                  {
                     if("MSG_BAOWU_SEND_CHAT" !== _loc20_)
                     {
                        if("MSG_TEAM_GUAJI_INVITE_SEND_CHAT" !== _loc20_)
                        {
                           if("MSG_TEAM_BATTLEFIELD_INVITE_SEND_CHAT" !== _loc20_)
                           {
                              if("msg_change_chat_group" === _loc20_)
                              {
                                 _loc6_ = param2;
                                 _loc8_ = ChatConsts.ins.getChannelGroupVo(_loc6_);
                                 if(_loc8_.sendChannelId >= 0)
                                 {
                                    this.curChannelId = _loc8_.sendChannelId;
                                 }
                                 this.hisotryViewRef.curGroupId = _loc8_.id;
                              }
                           }
                           else
                           {
                              _loc7_ = param2 as UInt64;
                              _loc16_ = UniqueId.next + "^#@" + "battlefieldInviteKind" + ":" + _loc7_.toString() + "^#@";
                              ChatModel.ins.saveLastSendTime(curChannelId);
                              _loc9_ = new TalkContent();
                              _loc9_.content = _loc16_;
                              _loc17_ = new PublicTalkReq();
                              _loc17_.pindao = curChannelId;
                              _loc17_.content = _loc9_;
                              ServerEngine.ins.send(6001,_loc17_);
                              this.sendBox.clear();
                           }
                        }
                        else
                        {
                           _loc14_ = param2 as UInt64;
                           _loc16_ = UniqueId.next + "^#@" + "TeamGuajiInvite" + ":" + _loc14_.toString() + "^#@";
                           ChatModel.ins.saveLastSendTime(curChannelId);
                           _loc9_ = new TalkContent();
                           _loc9_.content = _loc16_;
                           _loc17_ = new PublicTalkReq();
                           _loc17_.pindao = curChannelId;
                           _loc17_.content = _loc9_;
                           ServerEngine.ins.send(6001,_loc17_);
                           this.sendBox.clear();
                        }
                     }
                     else
                     {
                        _loc3_ = param2 as BaoWu;
                        _loc10_ = "itemMsg" + UniqueId.next + "^#@" + "baowu" + "^#@";
                        _loc19_ = this.curChannelId;
                        _loc5_ = ChatUtils.checkSendTxt(_loc10_,_loc19_);
                        if(_loc5_)
                        {
                           this.hisotryViewRef.appendChat(ChatUtils.createWarnRes(_loc5_));
                        }
                        else
                        {
                           ChatModel.ins.saveLastSendTime(_loc19_);
                           _loc13_ = ServerUtil.createByteArray();
                           _loc3_.writeTo(_loc13_);
                           _loc9_ = new TalkContent();
                           _loc9_.content = _loc10_;
                           _loc4_ = BaUtil.createByteArray();
                           BaUtil.writeKeyValue(_loc4_,"baowu",_loc13_);
                           BaUtil.compress(_loc4_);
                           _loc9_.extraContent = _loc4_;
                           _loc17_ = new PublicTalkReq();
                           _loc17_.pindao = curChannelId;
                           _loc17_.content = _loc9_;
                           ServerEngine.ins.send(6001,_loc17_);
                           this.sendBox.clear();
                        }
                     }
                  }
                  else
                  {
                     _loc12_ = param2 as Item;
                     _loc10_ = "itemMsg" + UniqueId.next + "^#@" + "item" + "^#@";
                     _loc19_ = this.curChannelId;
                     _loc5_ = ChatUtils.checkSendTxt(_loc10_,_loc19_);
                     if(_loc5_)
                     {
                        this.hisotryViewRef.appendChat(ChatUtils.createWarnRes(_loc5_));
                     }
                     else
                     {
                        ChatModel.ins.saveLastSendTime(_loc19_);
                        _loc13_ = ServerUtil.createByteArray();
                        _loc12_.writeTo(_loc13_);
                        _loc9_ = new TalkContent();
                        _loc9_.content = _loc10_;
                        _loc4_ = BaUtil.createByteArray();
                        BaUtil.writeKeyValue(_loc4_,"item",_loc13_);
                        BaUtil.compress(_loc4_);
                        _loc9_.extraContent = _loc4_;
                        _loc17_ = new PublicTalkReq();
                        _loc17_.pindao = curChannelId;
                        _loc17_.content = _loc9_;
                        ServerEngine.ins.send(6001,_loc17_);
                        this.sendBox.clear();
                     }
                  }
               }
               else
               {
                  _loc15_ = new PublicTalkNotify();
                  _loc15_.pindao = 3;
                  _loc18_ = new TalkContent();
                  _loc18_.isNormal = false;
                  _loc18_.content = param2 as String;
                  _loc15_.content = _loc18_;
                  if(model.isStart == false)
                  {
                     this.model.addNotifyBeforeStart(_loc15_);
                  }
                  else
                  {
                     this.model.addHistory(_loc15_);
                     this.hisotryViewRef.appendChat(_loc15_);
                  }
               }
            }
            else
            {
               _loc15_ = new PublicTalkNotify();
               _loc15_.pindao = 11;
               _loc18_ = new TalkContent();
               _loc18_.isNormal = false;
               _loc18_.content = param2 as String;
               _loc15_.content = _loc18_;
               this.model.addHistory(_loc15_,true);
               this.hisotryViewRef.appendChat(_loc15_,true);
            }
         }
         else if(param2[0] == "ch")
         {
            System.setClipboard(this.hisotryViewRef.panelS1.contentBox.textfield.htmlText);
            AlertUtil.float("ok");
         }
      }
   }
}
