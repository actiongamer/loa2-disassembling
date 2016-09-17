package nslm2.modules.foundations.chatModules.historyPanels
{
   import game.ui.chatModules.ChatHistoryUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.foundations.chatModules.historyPanels.historyS1.ChatHistoryPanelS1;
   import nslm2.modules.foundations.chatModules.historyPanels.historyS2.ChatHistoryPanelS2;
   import nslm2.modules.foundations.chatModules.historyPanels.historyS3.ChatHistoryPanelS3;
   import com.greensock.TweenLite;
   import com.greensock.easing.Cubic;
   import nslm2.modules.foundations.chatModules.ChatConsts;
   import nslm2.modules.foundations.chatModules.ChannelGroupVo;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.chatModules.ChatModel;
   import nslm2.utils.RTools;
   import game.ui.miniMaps.MiniMapBtnUI;
   import nslm2.modules.foundations.miniMaps.MiniMap;
   import nslm2.modules.foundations.miniMaps.MiniMapBtn;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.chatModules.ChatUtils;
   import com.mz.core.event.MzEvent;
   import proto.PublicTalkNotify;
   import flash.events.Event;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.customs.expands.MornExpandUtil;
   import com.mz.core.mediators.RollMediator;
   
   public class ChatHistory extends ChatHistoryUI implements IObserver
   {
      
      public static const KIND_S1:int = 1;
      
      public static const KIND_S2:int = 2;
       
      
      public var oriHeight:int;
      
      private var curPanelKind:int = 1;
      
      public var lineSkin:String;
      
      private var newMsgPrompt:nslm2.modules.foundations.chatModules.historyPanels.NewMsgPrompt;
      
      private var groupIdArr:Array;
      
      private var _curGroupId:int = -789;
      
      public function ChatHistory()
      {
         super();
         oriHeight = this.height;
         tab_channelGroup.userChangeHandler = tab_channel_handler;
         initTabChannel(ChatConsts.ins.historyChannelArr);
         this.lineSkin = this.img_line.skin;
         this.img_line.dispose();
         this.img_line = null;
         panelS1.boxScrollBarCtrl.addEventListener("scrollBarChange",onScrollBarChange);
         panelS1.addEventListener("mouseWheel",onWheel);
         panelS2.boxScrollBarCtrl.addEventListener("scrollBarChange",onScrollBarChange);
         panelS2.addEventListener("mouseWheel",onWheel);
         (panelS3 as ChatHistoryPanelS3).setImgChatBG(this.img_chatBg2);
         newMsgPrompt = new nslm2.modules.foundations.chatModules.historyPanels.NewMsgPrompt(317,20);
         newMsgPrompt.bottom = 24;
         this.addChild(newMsgPrompt);
         newMsgPrompt.addEventListener("click",newMsgPrompt_mouseHandler);
         newMsgPrompt.x = this.img_newMsgBg.x;
         newMsgPrompt.addChildAt(this.img_newMsgBg,0);
         this.img_newMsgBg.x = 0;
         this.img_newMsgBg.y = 0;
         btnMore.buttonMode = true;
         btnMore.addEventListener("click",onMornClick);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.parts.push(new RollMediator(this,box_onRoll));
         this.img_chatBg.alpha = 0.3;
         this.img_chatBg2.alpha = 0.3;
         this.btn_win.alpha = 0.3;
         this.btnMore.alpha = 0.3;
         this.btnMore.visible = false;
         curGroupId = 1000;
         validateKind();
         ObserverMgr.ins.regObserver(this);
         initBtn(btn_gm,13200);
         btn_gm.visible = MiniMap.getGmBtnVisible();
      }
      
      public function get panelS1() : ChatHistoryPanelS1
      {
         return this.panelS1in as ChatHistoryPanelS1;
      }
      
      private function get panelS2() : ChatHistoryPanelS2
      {
         return this.panelS2in as ChatHistoryPanelS2;
      }
      
      private function get panelS3() : ChatHistoryPanelS3
      {
         return this.panelS3in as ChatHistoryPanelS3;
      }
      
      private function box_onRoll(param1:Boolean) : void
      {
         TweenLite.to(this.img_chatBg,0.6,{
            "alpha":(!!param1?1:0.3),
            "ease":Cubic.easeOut
         });
         TweenLite.to(this.img_chatBg2,0.6,{
            "alpha":(!!param1?1:0.3),
            "ease":Cubic.easeOut
         });
         TweenLite.to(this.btn_win,0.6,{
            "alpha":(!!param1?1:0.3),
            "ease":Cubic.easeOut
         });
         TweenLite.to(this.btnMore,0.6,{
            "alpha":(!!param1?1:0.3),
            "ease":Cubic.easeOut
         });
      }
      
      public function initTabChannel(param1:Array) : void
      {
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:* = null;
         groupIdArr = param1;
         var _loc6_:Array = [];
         var _loc4_:int = groupIdArr.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = groupIdArr[_loc5_];
            _loc2_ = ChatConsts.ins.getChannelGroupVo(_loc3_);
            _loc6_.push(_loc2_.name);
            _loc5_++;
         }
         this.tab_channelGroup.labels = _loc6_.join(",");
         this.tab_channelGroup.selectedIndex = 0;
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_win !== _loc3_)
         {
            if(this.btn_chatScale !== _loc3_)
            {
               if(this.btn_no === _loc3_)
               {
                  ChatModel.ins.clearHistoryAll();
                  this.panelS1.clear();
                  this.panelS2.clear();
                  this.panelS3.clear();
               }
            }
            else
            {
               btnMore.visible = false;
               this.switchKind();
            }
         }
         else
         {
            clickFullScreenHandler();
         }
         RTools.gc();
      }
      
      private function initBtn(param1:MiniMapBtnUI, param2:int) : void
      {
         param1.addEventListener("click",btnClicked);
         this.setBtnFuncId(param1,param2);
      }
      
      private function btnClicked(param1:MouseEvent) : void
      {
         var _loc2_:* = param1.currentTarget;
         if(btn_gm === _loc2_)
         {
            MiniMap.onBtnGMClick(param1);
         }
      }
      
      private function setBtnFuncId(param1:MiniMapBtnUI, param2:int) : void
      {
         (param1 as MiniMapBtn).funcId = param2;
      }
      
      protected function onMornClick(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(10550);
      }
      
      private function clickFullScreenHandler() : void
      {
         if(App.stage.displayState == "normal")
         {
            App.stage.displayState = "fullScreenInteractive";
         }
         else
         {
            App.stage.displayState = "normal";
         }
      }
      
      public function switchKind() : void
      {
         switch(int(this.curPanelKind) - 1)
         {
            case 0:
               curPanelKind = 2;
               break;
            case 1:
               curPanelKind = 1;
         }
         this.validateKind();
      }
      
      private function validateKind() : void
      {
         switch(int(this.curPanelKind) - 1)
         {
            case 0:
               this.height = this.oriHeight;
               this.panelS1.actived = true;
               this.panelS2.actived = false;
               this.panelS3.actived = true;
               this.panelS3.setHeight(false);
               this.y = -this.height;
               break;
            case 1:
               changeHistorySize();
               this.panelS1.actived = false;
               this.panelS2.actived = true;
               this.panelS3.actived = true;
               this.panelS3.setHeight(true);
         }
         refresh();
      }
      
      private function tab_channel_handler(param1:int) : void
      {
         this.curGroupId = this.groupIdArr[param1];
         ChatUtils.lastStr = "";
         this.btnMore.visible = false;
         this.dispatchEvent(new MzEvent("eventHistoryGroupIdChange",this.curGroupId));
      }
      
      public function changeGroupByChannelId(param1:int) : void
      {
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:* = null;
         if(this.curGroupId == 1000)
         {
            return;
         }
         var _loc4_:int = this.groupIdArr.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = this.groupIdArr[_loc5_];
            _loc2_ = ChatConsts.ins.getChannelGroupVo(_loc3_);
            if(_loc2_.sendChannelId == param1)
            {
               this.curGroupId = _loc3_;
               this.dispatchEvent(new MzEvent("eventHistoryGroupIdChange",this.curGroupId));
               break;
            }
            _loc5_++;
         }
      }
      
      public function get curGroupId() : int
      {
         return _curGroupId;
      }
      
      public function set curGroupId(param1:int) : void
      {
         if(_curGroupId != param1)
         {
            _curGroupId = param1;
            this.tab_channelGroup.selectedIndex = this.groupIdArr.indexOf(_curGroupId);
            this.refresh();
         }
      }
      
      private function canAppend(param1:int) : Boolean
      {
         var _loc2_:ChannelGroupVo = ChatConsts.ins.getChannelGroupVo(this.curGroupId);
         return _loc2_.channelArr.indexOf(param1) != -1;
      }
      
      public function appendChat(param1:PublicTalkNotify, param2:Boolean = false) : void
      {
         if(canAppend(param1.pindao))
         {
            switch(int(this.curPanelKind) - 1)
            {
               case 0:
                  if(param2)
                  {
                     panelS3.append(param1);
                  }
                  else
                  {
                     panelS1.append(param1);
                     if(panelS1.autoScroll == false)
                     {
                        newMsgPrompt.show(param1,this.panelS1.scrollBar.max);
                     }
                  }
                  break;
               case 1:
                  if(param2)
                  {
                     panelS3.append(param1);
                     break;
                  }
                  panelS2.append(param1);
                  if(panelS2.autoScroll == false)
                  {
                     newMsgPrompt.show(param1,this.panelS2.scrollBar.max);
                     break;
                  }
                  break;
            }
         }
      }
      
      private function newMsgPrompt_mouseHandler(param1:MouseEvent) : void
      {
         newMsgPrompt.hide();
         switch(int(this.curPanelKind) - 1)
         {
            case 0:
               TweenLite.to(this.panelS1.scrollBar,0.2,{"value":newMsgPrompt.scrollV});
               break;
            case 1:
               TweenLite.to(this.panelS2.scrollBar,0.2,{"value":newMsgPrompt.scrollV});
         }
      }
      
      public function refresh() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc1_:Array = ChatModel.ins.getGroupHistory(this.curGroupId);
         switch(int(this.curPanelKind) - 1)
         {
            case 0:
               panelS1.clear();
               _loc3_ = _loc1_.length;
               _loc4_ = 0;
               while(_loc4_ < _loc3_)
               {
                  _loc2_ = _loc1_[_loc4_];
                  panelS1.append(_loc2_);
                  _loc4_++;
               }
               break;
            case 1:
               panelS2.show(_loc1_);
         }
      }
      
      public function refreshSystem() : void
      {
         var _loc2_:int = 0;
         var _loc1_:Vector.<PublicTalkNotify> = ChatModel.ins.systemHistoryLib;
         panelS3.clear();
         _loc2_ = 0;
         while(_loc2_ < _loc1_.length)
         {
            panelS3.append(_loc1_[_loc2_]);
            _loc2_++;
         }
      }
      
      private function onScrollBarChange(param1:Event) : void
      {
         switch(int(this.curPanelKind) - 1)
         {
            case 0:
               this.btnMore.visible = false;
               if(this.panelS1.scrollBar.value >= this.panelS1.scrollBar.max)
               {
                  this.newMsgPrompt.hide();
               }
               this.btnMore.visible = false;
               break;
            case 1:
               this.btnMore.visible = false;
               if(this.panelS2.scrollBar.value >= this.panelS2.scrollBar.max)
               {
                  this.newMsgPrompt.hide();
               }
               this.btnMore.visible = false;
         }
      }
      
      protected function onWheel(param1:MouseEvent) : void
      {
      }
      
      private function isHistoyLibMax() : Boolean
      {
         if(ChatModel.ins.historyLib.length >= ChatModel.ins.chat_HistoryChatMax)
         {
            return true;
         }
         return false;
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
      
      public function getFocusNotices() : Array
      {
         return ["msg_game_resize","CHAT_REMOVE_OLD","CHAT_REMOVE_OLD_SYSTEM"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("msg_game_resize" !== _loc3_)
         {
            if("CHAT_REMOVE_OLD" !== _loc3_)
            {
               if("CHAT_REMOVE_OLD_SYSTEM" === _loc3_)
               {
                  this.refreshSystem();
                  RTools.checkAndGc();
               }
            }
            else
            {
               this.refresh();
               RTools.checkAndGc();
            }
         }
         else
         {
            changeHistorySize();
         }
      }
      
      private function changeHistorySize() : void
      {
         switch(int(this.curPanelKind) - 1)
         {
            case 0:
               break;
            case 1:
               this.height = 450 - ChatConsts.chat_bottom;
               this.y = -this.height;
         }
      }
   }
}
