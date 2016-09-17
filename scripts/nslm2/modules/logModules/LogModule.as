package nslm2.modules.logModules
{
   import game.ui.logModules.LogModuleUI;
   import com.mz.core.utils.DisplayUtils;
   import com.mz.core.configs.EnvConfig;
   import morn.core.components.Label;
   import morn.core.components.TextInput;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import flash.events.Event;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import proto.TalkContent;
   import proto.PublicTalkReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.LotteryReq;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import com.greensock.TweenLite;
   import org.specter3d.context.AppGlobalContext;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.funnies.mainCities.MainCityModuleParam;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.mgrs.stcMgrs.vos.StcLanguageVo;
   import com.mz.core.logging.Log;
   import morn.core.utils.StringUtils;
   import morn.customs.tests.TestInsCollect;
   import morn.core.utils.URLUtils;
   import flash.external.ExternalInterface;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.modules.foundations.chatModules.ChatModel;
   import com.mz.core.utils.TextFieldUtil;
   import morn.customs.tests.TestTimerCount;
   import com.netease.protobuf.Message;
   
   public class LogModule extends LogModuleUI
   {
       
      
      public function LogModule()
      {
         super();
      }
      
      private function get appender() : LogModuelAppender
      {
         return LogModuelAppender.ins;
      }
      
      override public function show(param1:Object = null) : void
      {
         this.panelBg.dragFixedEnabled = false;
         appender.ui = new LogView();
         appender.ui.y = 30;
         appender.ui.width = this.width - 30;
         appender.ui.height = this.debugUI.y - this.y - 30;
         DisplayUtils.addChildBelow(appender.ui,debugUI);
         appender.showHistroy();
         debugUI.btns_test.labels = "0回位,1加item,2加装备,3加精炼石,4祝福/培养/突破,5加可出售物品,6加普通宝箱,7英雄碎片,8装备碎片,9圣物,10符文,11称号道具";
         debugUI.btns_test.selectHandler = tab_selectHandler;
         debugUI.btns_test1.labels = "0回位,1加时装,2加精通石,3加商店资源,4加徽章,5宝物碎片,6坐骑印记,7经验卷轴,8抽将一百次,9经验圣物,10三合一宝箱,觉醒道具";
         debugUI.btns_test1.selectHandler = tab1_selectHandler;
         debugUI.btns_test2.labels = "0回位,1切换3dStatus,2加经验99999,3加钻石,4加金币,5默认主城,6人类主城,7跨服主城,8加一级VIP,9加双倍荣誉卡,10刻印石";
         debugUI.btns_test2.selectHandler = tab2_selectHandler;
         debugUI.txt0.text = "参数0";
         debugUI.txt1.text = "参数1";
         debugUI.checkBox_dev.label = "切换成内网模式";
         debugUI.checkBox_dev.selected = EnvConfig.ins.showDevModule;
         debugUI.checkBox_dev.addEventListener("change",onDevClicked);
         debugUI.btns_test3.labels = "0,1实例清除,2跟踪实例,3去主页,4测试js,5DriveInfo,6opid,7拉私聊信息,8刷新当前页面,9断网";
         debugUI.btns_test3.userChangeHandler = tab3_selectHandler;
         var _loc2_:Label = new Label();
         _loc2_.text = "ok吧\\l1001\\l我@{cost:3:0:2001}知道";
         this.addChild(_loc2_);
         var _loc5_:int = 100;
         _loc2_.y = _loc5_;
         _loc2_.x = _loc5_;
         var _loc4_:Label = new Label();
         _loc4_.text = "当前用户ID:";
         this.addChild(_loc4_);
         _loc4_.x = 0;
         _loc4_.y = 4;
         var _loc3_:TextInput = new TextInput();
         _loc3_.autoSize = "left";
         _loc3_.text = Uint64Util.toString(PlayerModel.ins.playerInfo.id);
         _loc3_.x = 70;
         _loc3_.y = 4;
         this.addChild(_loc3_);
         super.show(param1);
      }
      
      private function onDevClicked(param1:Event) : void
      {
         EnvConfig.ins.showDevModule = debugUI.checkBox_dev.selected;
      }
      
      private function onCrossClicked(param1:Event) : void
      {
      }
      
      private function tab1_selectHandler(param1:int) : void
      {
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc4_:* = null;
         var _loc9_:* = null;
         var _loc12_:* = null;
         var _loc6_:int = 0;
         var _loc11_:* = null;
         var _loc13_:* = null;
         var _loc8_:* = null;
         var _loc10_:int = 0;
         var _loc3_:* = undefined;
         var _loc2_:Array = [];
         switch(int(param1))
         {
            case 0:
               break;
            case 1:
               _loc2_ = [];
               _loc12_ = StcMgr.ins.getItemTable().array;
               _loc5_ = _loc12_.length;
               _loc7_ = 0;
               while(_loc7_ < _loc5_)
               {
                  _loc4_ = _loc12_[_loc7_];
                  if(_loc4_.kind == 10 || _loc4_.kind == 12)
                  {
                     _loc2_.push(_loc4_);
                  }
                  _loc7_++;
               }
               _loc12_ = _loc2_;
               _loc6_ = 1;
               break;
            case 2:
               _loc12_ = [StcMgr.ins.getItemVo(60530)];
               _loc6_ = 100;
               break;
            case 3:
               _loc11_ = new TalkContent();
               _loc11_.content = "//addsource kind=15 num=2000^#@^#@";
               _loc13_ = new PublicTalkReq();
               _loc13_.pindao = 0;
               _loc13_.content = _loc11_;
               ServerEngine.ins.send(6001,_loc13_);
               _loc11_ = new TalkContent();
               _loc11_.content = "//addsource kind=12 num=10000^#@^#@";
               _loc13_ = new PublicTalkReq();
               _loc13_.pindao = 0;
               _loc13_.content = _loc11_;
               ServerEngine.ins.send(6001,_loc13_);
               _loc12_ = [StcMgr.ins.getItemVo(23100)];
               _loc6_ = 10;
               break;
            case 4:
               _loc2_ = [];
               _loc12_ = StcMgr.ins.getItemTable().array;
               _loc5_ = _loc12_.length;
               _loc7_ = 0;
               while(_loc7_ < _loc5_)
               {
                  _loc4_ = _loc12_[_loc7_];
                  if(_loc4_.kind == 33)
                  {
                     _loc2_.push(_loc4_);
                  }
                  _loc7_++;
               }
               _loc12_ = _loc2_;
               _loc6_ = 10;
               break;
            case 5:
               _loc2_ = [];
               _loc12_ = StcMgr.ins.getItemTable().array;
               _loc5_ = _loc12_.length;
               _loc7_ = 0;
               while(_loc7_ < _loc5_)
               {
                  _loc4_ = _loc12_[_loc7_];
                  if(_loc4_.kind == 72)
                  {
                     _loc2_.push(_loc4_);
                  }
                  _loc7_++;
               }
               _loc12_ = _loc2_;
               _loc6_ = 10;
               break;
            case 6:
               _loc2_ = [];
               _loc2_.push(StcMgr.ins.getItemVo(70020));
               _loc12_ = _loc2_;
               _loc6_ = 10;
               break;
            case 7:
               _loc2_ = [];
               _loc12_ = StcMgr.ins.getItemTable().array;
               _loc5_ = _loc12_.length;
               _loc7_ = 0;
               while(_loc7_ < _loc5_)
               {
                  _loc4_ = _loc12_[_loc7_];
                  if(_loc4_.kind == 32 || _loc4_.kind == 39)
                  {
                     _loc2_.push(_loc4_);
                  }
                  _loc7_++;
               }
               _loc12_ = _loc2_;
               _loc6_ = 100;
               break;
            case 8:
               _loc7_ = 0;
               while(_loc7_ < 10)
               {
                  _loc8_ = new LotteryReq();
                  _loc8_.lotteryId = 2010;
                  ServerEngine.ins.send(4001,_loc8_);
                  _loc7_++;
               }
               break;
            case 9:
               _loc2_ = [];
               _loc12_ = StcMgr.ins.getItemTable().array;
               _loc5_ = _loc12_.length;
               _loc7_ = 0;
               while(_loc7_ < _loc5_)
               {
                  _loc4_ = _loc12_[_loc7_];
                  if(_loc4_.kind == 31)
                  {
                     _loc2_.push(_loc4_);
                  }
                  _loc7_++;
               }
               _loc12_ = _loc2_;
               _loc6_ = 100;
               break;
            case 10:
               _loc2_ = [];
               _loc12_ = StcMgr.ins.getItemTable().array;
               _loc5_ = _loc12_.length;
               _loc7_ = 0;
               while(_loc7_ < _loc5_)
               {
                  _loc4_ = _loc12_[_loc7_];
                  if(_loc4_.kind == 97)
                  {
                     _loc2_.push(_loc4_);
                  }
                  _loc7_++;
               }
               _loc12_ = _loc2_;
               _loc6_ = 5;
               break;
            case 11:
               _loc2_ = [];
               _loc12_ = StcMgr.ins.getItemTable().array;
               _loc5_ = _loc12_.length;
               _loc7_ = 0;
               while(_loc7_ < _loc5_)
               {
                  _loc4_ = _loc12_[_loc7_];
                  if(_loc4_.kind == 82)
                  {
                     _loc2_.push(_loc4_);
                  }
                  _loc7_++;
               }
               _loc12_ = _loc2_;
               _loc6_ = 100;
         }
         if(_loc12_)
         {
            _loc5_ = _loc12_.length;
            _loc7_ = 0;
            while(_loc7_ < _loc5_)
            {
               _loc3_ = _loc12_[_loc7_];
               if(_loc3_ is StcItemVo)
               {
                  _loc10_ = (_loc3_ as StcItemVo).id;
                  addr448:
                  _loc13_ = new PublicTalkReq();
                  _loc13_.pindao = 0;
                  _loc11_ = new TalkContent();
                  _loc11_.content = "//additem id=" + _loc10_ + " num=" + _loc6_ + "^#@" + "^#@";
                  _loc13_.content = _loc11_;
                  TweenLite.delayedCall(_loc7_ * 0.1,delaySend,[_loc13_]);
               }
               else if(_loc3_ is StcNpcVo)
               {
                  _loc10_ = (_loc3_ as StcNpcVo).id;
                  §§goto(addr448);
               }
               _loc7_++;
            }
         }
         debugUI.btns_test1.selectedIndex = 0;
      }
      
      private function tab2_selectHandler(param1:int) : void
      {
         var _loc12_:* = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc2_:* = null;
         var _loc13_:* = null;
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         _loc5_ = 0;
         _loc7_ = 0;
         var _loc3_:* = undefined;
         switch(int(param1))
         {
            case 0:
               break;
            case 1:
               AppGlobalContext.stage3d.debugStats = !AppGlobalContext.stage3d.debugStats;
               break;
            case 2:
               _loc12_ = new PublicTalkReq();
               _loc12_.pindao = 0;
               _loc12_.content = new TalkContent();
               _loc12_.content.content = "//addexp num=99999^#@^#@";
               delaySend(_loc12_);
               break;
            case 3:
               _loc12_ = new PublicTalkReq();
               _loc12_.pindao = 0;
               _loc12_.content = new TalkContent();
               _loc12_.content.content = "//adddiamond num=10000^#@^#@";
               delaySend(_loc12_);
               break;
            case 4:
               _loc12_ = new PublicTalkReq();
               _loc12_.pindao = 0;
               _loc12_.content = new TalkContent();
               _loc12_.content.content = "//addgold num=1000000^#@^#@";
               delaySend(_loc12_);
               break;
            case 5:
               ModuleMgr.ins.showModule(40500,new MainCityModuleParam(10000));
               break;
            case 6:
               ModuleMgr.ins.showModule(40500,new MainCityModuleParam(10001));
               break;
            case 7:
               break;
            case 8:
               _loc12_ = new PublicTalkReq();
               _loc12_.pindao = 0;
               _loc12_.content = new TalkContent();
               _loc8_ = VipModel.ins.getDiamondPrice(VipModel.ins.getVipValue(10000,PlayerModel.ins.vip + 1));
               _loc9_ = VipModel.ins.getDiamondPrice(VipModel.ins.getVipValue(10000,PlayerModel.ins.vip));
               _loc12_.content.content = "//addvip num=" + (_loc8_ - _loc9_) + "^#@" + "^#@";
               delaySend(_loc12_);
               break;
            case 9:
               _loc2_ = [];
               _loc13_ = StcMgr.ins.getItemTable().array;
               _loc5_ = _loc13_.length;
               _loc7_ = 0;
               _loc7_ = 0;
               while(_loc7_ < _loc5_)
               {
                  _loc4_ = _loc13_[_loc7_];
                  if(_loc4_.kind == 36 || _loc4_.kind == 35)
                  {
                     _loc2_.push(_loc4_);
                  }
                  _loc7_++;
               }
               _loc13_ = _loc2_;
               _loc6_ = 10;
               if(_loc13_)
               {
                  _loc5_ = _loc13_.length;
                  _loc7_ = 0;
                  while(_loc7_ < _loc5_)
                  {
                     _loc3_ = _loc13_[_loc7_];
                     if(_loc3_ is StcItemVo)
                     {
                        _loc10_ = (_loc3_ as StcItemVo).id;
                        addr253:
                        _loc12_ = new PublicTalkReq();
                        _loc12_.pindao = 0;
                        _loc11_ = new TalkContent();
                        _loc11_.content = "//additem id=" + _loc10_ + " num=" + _loc6_ + "^#@" + "^#@";
                        _loc12_.content = _loc11_;
                        TweenLite.delayedCall(_loc7_ * 0.1,delaySend,[_loc12_]);
                     }
                     else if(_loc3_ is StcNpcVo)
                     {
                        _loc10_ = (_loc3_ as StcNpcVo).id;
                        §§goto(addr253);
                     }
                     _loc7_++;
                  }
               }
               break;
            case 10:
               _loc12_ = new PublicTalkReq();
               _loc12_.pindao = 0;
               _loc11_ = new TalkContent();
               _loc11_.content = "//additem id=60110 num=500^#@^#@";
               _loc12_.content = _loc11_;
               delaySend(_loc12_);
         }
         debugUI.btns_test2.selectedIndex = 0;
      }
      
      private function tab_selectHandler(param1:int) : void
      {
         var _loc9_:* = null;
         var _loc12_:* = null;
         var _loc6_:int = 0;
         var _loc13_:* = null;
         var _loc10_:* = 0;
         var _loc8_:* = null;
         var _loc4_:* = null;
         var _loc11_:* = null;
         var _loc2_:* = null;
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:* = undefined;
         switch(int(param1))
         {
            case 0:
               break;
            case 1:
               _loc13_ = new PublicTalkReq();
               _loc13_.pindao = 0;
               if(uint(debugUI.txt0.text) == 0 && debugUI.txt0.text != null)
               {
                  _loc8_ = StcMgr.ins.getVoByColumnValue("static_language","text",debugUI.txt0.text);
                  if(_loc8_)
                  {
                     _loc4_ = StcMgr.ins.getVoByColumnValue("static_item","name",_loc8_.id);
                  }
                  if(_loc4_)
                  {
                     _loc10_ = uint(_loc4_.id);
                  }
                  else
                  {
                     _loc10_ = uint(debugUI.txt0.text);
                  }
               }
               else
               {
                  _loc10_ = uint(debugUI.txt0.text);
               }
               _loc11_ = new TalkContent();
               _loc11_.content = "//additem id=" + _loc10_ + " num=" + debugUI.txt1.text + "^#@" + "^#@";
               _loc13_.content = _loc11_;
               ServerEngine.ins.send(6001,_loc13_);
               Log.debug(this,debugUI.txt0.text + "的物品ID为" + _loc10_);
               break;
            case 2:
               _loc2_ = [];
               _loc12_ = StcMgr.ins.getItemTable().array;
               _loc5_ = _loc12_.length;
               _loc7_ = 0;
               _loc7_ = 0;
               while(_loc7_ < _loc5_)
               {
                  _loc4_ = _loc12_[_loc7_];
                  if(_loc4_.kind <= 4)
                  {
                     _loc2_.push(_loc4_);
                  }
                  _loc7_++;
               }
               _loc12_ = _loc2_;
               _loc6_ = 1;
               break;
            case 3:
               _loc12_ = StcMgr.ins.getVoArrByColumnValue("static_item","kind",41);
               _loc6_ = 60;
               break;
            case 4:
               _loc2_ = [];
               _loc12_ = StcMgr.ins.getItemTable().array;
               _loc5_ = _loc12_.length;
               _loc7_ = 0;
               while(_loc7_ < _loc5_)
               {
                  _loc4_ = _loc12_[_loc7_];
                  if(_loc4_.kind == 81)
                  {
                     _loc2_.push(_loc4_);
                  }
                  _loc7_++;
               }
               _loc12_ = _loc2_;
               _loc12_.push(StcMgr.ins.getItemVo(60500));
               _loc12_.push(StcMgr.ins.getItemVo(60510));
               _loc6_ = 100;
               break;
            case 5:
               _loc2_ = [];
               _loc12_ = StcMgr.ins.getItemTable().array;
               _loc5_ = _loc12_.length;
               _loc7_ = 0;
               while(_loc7_ < _loc5_)
               {
                  _loc4_ = _loc12_[_loc7_];
                  if(!StringUtils.isNull(_loc4_.sell_price))
                  {
                     _loc2_.push(_loc4_);
                  }
                  _loc7_++;
               }
               _loc12_ = _loc2_;
               _loc6_ = 10;
               break;
            case 6:
               _loc2_ = [];
               _loc12_ = StcMgr.ins.getItemTable().array;
               _loc5_ = _loc12_.length;
               _loc7_ = 0;
               while(_loc7_ < _loc5_)
               {
                  _loc4_ = _loc12_[_loc7_];
                  if(_loc4_.kind == 99)
                  {
                     _loc2_.push(_loc4_);
                  }
                  _loc7_++;
               }
               _loc12_ = _loc2_;
               _loc6_ = 1;
               break;
            case 7:
               _loc2_ = [];
               _loc12_ = StcMgr.ins.getItemTable().array;
               _loc5_ = _loc12_.length;
               _loc7_ = 0;
               while(_loc7_ < _loc5_)
               {
                  _loc4_ = _loc12_[_loc7_];
                  if(_loc4_.kind == 21)
                  {
                     _loc2_.push(_loc4_);
                  }
                  _loc7_++;
               }
               _loc12_ = _loc2_;
               _loc6_ = 100;
               break;
            case 8:
               _loc2_ = [];
               _loc12_ = StcMgr.ins.getItemTable().array;
               _loc5_ = _loc12_.length;
               _loc7_ = 0;
               while(_loc7_ < _loc5_)
               {
                  _loc4_ = _loc12_[_loc7_];
                  if(_loc4_.kind == 51)
                  {
                     _loc2_.push(_loc4_);
                  }
                  _loc7_++;
               }
               _loc12_ = _loc2_;
               _loc6_ = 210;
               break;
            case 9:
               _loc2_ = [];
               _loc12_ = StcMgr.ins.getItemTable().array;
               _loc5_ = _loc12_.length;
               _loc7_ = 0;
               while(_loc7_ < _loc5_)
               {
                  _loc4_ = _loc12_[_loc7_];
                  if(_loc4_.kind == 8 || _loc4_.kind == 9)
                  {
                     _loc2_.push(_loc4_);
                  }
                  _loc7_++;
               }
               _loc12_ = _loc2_;
               _loc6_ = 10;
               break;
            case 10:
               _loc2_ = [];
               _loc12_ = StcMgr.ins.getItemTable().array;
               _loc5_ = _loc12_.length;
               _loc7_ = 0;
               while(_loc7_ < _loc5_)
               {
                  _loc4_ = _loc12_[_loc7_];
                  if(_loc4_.kind == 61)
                  {
                     _loc2_.push(_loc4_);
                  }
                  _loc7_++;
               }
               _loc12_ = _loc2_;
               _loc6_ = 10;
               break;
            case 11:
               _loc2_ = [];
               _loc12_ = StcMgr.ins.getItemTable().array;
               _loc5_ = _loc12_.length;
               _loc7_ = 0;
               while(_loc7_ < _loc5_)
               {
                  _loc4_ = _loc12_[_loc7_];
                  if(_loc4_.kind == 37)
                  {
                     _loc2_.push(_loc4_);
                  }
                  _loc7_++;
               }
               _loc12_ = _loc2_;
               _loc6_ = 1;
         }
         if(_loc12_)
         {
            _loc5_ = _loc12_.length;
            _loc7_ = 0;
            while(_loc7_ < _loc5_)
            {
               _loc3_ = _loc12_[_loc7_];
               if(_loc3_ is StcItemVo)
               {
                  _loc10_ = uint((_loc3_ as StcItemVo).id);
                  addr542:
                  _loc13_ = new PublicTalkReq();
                  _loc13_.pindao = 0;
                  _loc11_ = new TalkContent();
                  _loc11_.content = "//additem id=" + _loc10_ + " num=" + _loc6_ + "^#@" + "^#@";
                  _loc13_.content = _loc11_;
                  TweenLite.delayedCall(_loc7_ * 0.1,delaySend,[_loc13_]);
               }
               else if(_loc3_ is StcNpcVo)
               {
                  _loc10_ = uint((_loc3_ as StcNpcVo).id);
                  §§goto(addr542);
               }
               _loc7_++;
            }
         }
         debugUI.btns_test.selectedIndex = 0;
      }
      
      private function tab3_selectHandler(param1:int) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:* = null;
         switch(int(param1))
         {
            case 0:
               break;
            case 1:
               TestInsCollect.ins.insArr = [];
               break;
            case 2:
               TestInsCollect.ins.debug();
               break;
            case 3:
               if(URLUtils.toMainPageSelf() == false)
               {
                  URLUtils.refreshCurPage();
               }
               break;
            case 4:
               _loc3_ = ExternalInterface.call(debugUI.txt0.text);
               Log.debug("call js return",_loc3_," from ",debugUI.txt0.text);
               break;
            case 5:
               Log.info(this,ClientConfig._driverInfo);
               break;
            case 6:
               Log.info(this,"opid",EnvConfig.ins.ptId,EnvConfig.ins.vipType,EnvConfig.ins.showQQModule);
               break;
            case 7:
               ChatModel.ins.imclient.requestPersonalOffLine(0,20);
               break;
            case 8:
               URLUtils.refreshCurPage();
               break;
            case 9:
               ServerEngine.ins.doDisConnect();
         }
         this.debugUI.btns_test3.selectedIndex = 0;
      }
      
      private function delaySend(param1:Message) : void
      {
         ServerEngine.ins.send(6001,param1);
      }
      
      override public function dispose() : void
      {
         if(appender.ui.parent == this)
         {
            this.removeChild(appender.ui);
            appender.ui = null;
         }
         debugUI.checkBox_dev.removeEventListener("change",onDevClicked);
         super.dispose();
      }
   }
}
