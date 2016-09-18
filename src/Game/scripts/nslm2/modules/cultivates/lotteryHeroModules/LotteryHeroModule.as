package nslm2.modules.cultivates.lotteryHeroModules
{
   import game.ui.lotteryHeroModules.LotteryHeroModuleUI;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideGetComp;
   import nslm2.modules.scenes.ctrls.SceneLotteryHeroCtrl;
   import morn.core.components.ViewStack;
   import nslm2.modules.cultivates.lotteryHeroModules.results.LotteryHeroResultHigthName;
   import nslm2.modules.cultivates.lotteryHeroModules.kindPanels.LHKindPanel;
   import nslm2.modules.cultivates.lotteryHeroModules.selectPanels.LotteryHeroSelectNormal;
   import nslm2.modules.cultivates.lotteryHeroModules.selectPanels.LotteryHeroSelectDiamond;
   import nslm2.modules.cultivates.lotteryHeroModules.results.LotteryHeroResultPage;
   import proto.LotteryInfoRes;
   import nslm2.common.ctrls.TSMDict;
   import nslm2.modules.cultivates.lotteryHeroModules.getRewards.GetRewardPrompt;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.common.ctrls.TSM;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.loadingModules.LoadingMsg;
   import nslm2.modules.foundations.mainToolBar.MainToolBarBackMsg;
   import proto.LotteryInfoReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import com.mz.core.logging.Log;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import flash.events.Event;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.cultivates.lotteryHeroModules.kindPanels.LHKindNormal;
   import nslm2.modules.cultivates.lotteryHeroModules.kindPanels.LHKindAdvan;
   import com.netease.protobuf.Message;
   import proto.LotteryReq;
   import proto.LotterySuperReq;
   import proto.HeroInfo;
   import proto.LotterySuperRes;
   import proto.ProtocolStatusRes;
   import nslm2.nets.sockets.ServerEvent;
   import proto.LotteryRandRes;
   import nslm2.common.model.PlayerModel;
   import proto.PlayerDataNotify;
   import com.mz.core.utils.ArrayUtil;
   import morn.core.handlers.Handler;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import com.greensock.TweenLite;
   import morn.core.components.Component;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   
   public class LotteryHeroModule extends LotteryHeroModuleUI implements INewerGuideGetComp
   {
       
      
      private var sceneCtrl:SceneLotteryHeroCtrl;
      
      private var viewStack:ViewStack;
      
      public var normalPage:LotteryHeroSelectNormal;
      
      public var diamondPage:LotteryHeroSelectDiamond;
      
      public var resultPage:LotteryHeroResultPage;
      
      private var tsms:TSMDict;
      
      private var _state:int;
      
      private var lastLotteryCMD:int;
      
      private var lastlotteryId:int;
      
      private var lastlotteryVo:nslm2.modules.cultivates.lotteryHeroModules.LotteryHeroVo;
      
      private var lastLotteryReq:Message;
      
      private var newheroids:Array;
      
      public function LotteryHeroModule()
      {
         tsms = new TSMDict();
         super();
      }
      
      public function get highHeroName() : LotteryHeroResultHigthName
      {
         return this.highHeroNameUI as LotteryHeroResultHigthName;
      }
      
      public function get kindPanel() : LHKindPanel
      {
         return this.kindPanelUI as LHKindPanel;
      }
      
      private function get panelInfo() : LotteryInfoRes
      {
         return LHModel.ins.panelInfo;
      }
      
      private function set panelInfo(param1:LotteryInfoRes) : void
      {
         LHModel.ins.panelInfo = param1;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.addChild(new GetRewardPrompt());
         MornExpandUtil.setLayout(this);
         this.highHeroName.visible = false;
         viewStack = new ViewStack();
         MornExpandUtil.setLayout(viewStack);
         this.addChild(viewStack);
         normalPage = new LotteryHeroSelectNormal();
         viewStack.addItem(new LotteryHeroSelectNormal());
         diamondPage = new LotteryHeroSelectDiamond();
         viewStack.addItem(new LotteryHeroSelectDiamond());
         resultPage = new LotteryHeroResultPage();
         viewStack.addItem(new LotteryHeroResultPage());
         this.viewStack.selectedIndex = -1;
         tsms.put(this.kindPanel,new TSM(this.kindPanel,0.4).addState(404,{
            "alpha":0,
            "visible":false,
            "mouseEvent":false
         }));
         tsms.put(this.viewStack,new TSM(this.viewStack,0.4).addState(404,{
            "bottom":-300,
            "mouseEvent":false
         }).addState(3,{
            "alpha":0,
            "visible":false,
            "mouseEvent":false
         }));
         tsms.getTSM(this.viewStack).toState(404,0);
         var _loc2_:int = 0;
         diamondPage.centerX = _loc2_;
         normalPage.centerX = _loc2_;
         _loc2_ = 40;
         diamondPage.bottom = _loc2_;
         normalPage.bottom = _loc2_;
         addEventListener("evt_result_again",result_onAgain);
         addEventListener("evtResultClose",result_onClose);
         addEventListener("lottery_enter_lottery",onEnter);
         addEventListener("lottery_back_to_first",onBack);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         super.preShow(param1);
         if(this.parent)
         {
            this.parent.setChildIndex(this,0);
         }
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         ObserverMgr.ins.sendNotice("LOADING_BAR_INIT",new LoadingMsg(this.moduleId,2,0));
         this.visible = false;
         this.sceneCtrl = param1["sceneCtrl"];
         this.show2();
      }
      
      private function show2() : void
      {
         ObserverMgr.ins.sendNotice("main_tool_bar_back_add",new MainToolBarBackMsg(40500,btnBack_handler,null));
         var _loc1_:LotteryInfoReq = new LotteryInfoReq();
         ServerEngine.ins.send(4000,_loc1_,server_cpl);
      }
      
      private function server_cpl(param1:LotteryInfoRes) : void
      {
         this.visible = true;
         ObserverMgr.ins.sendNotice("LOADING_BAR_CPL",new LoadingMsg(this.moduleId,2,0));
         this.panelInfo = param1;
         this.kindPanel.init(param1);
         this.state = 1;
      }
      
      private function btnBack_handler() : void
      {
         if(NGUtil.isCurGuideId(97109) || NGUtil.isCurGuideId(97107))
         {
            Log.info(this,"NewerGuild Hack",97107,97109);
         }
         else
         {
            ObserverMgr.ins.sendNotice("main_tool_bar_back_delete",new MainToolBarBackMsg(40500,btnBack_handler,null));
            ObserverMgr.ins.sendNotice("msg_lottery_hero_close");
         }
      }
      
      private function btn_handler(param1:Button, param2:MouseEvent) : void
      {
      }
      
      override protected function onResize(param1:Event) : void
      {
         super.onResize(param1);
      }
      
      protected function onBack(param1:Event) : void
      {
         this.state = 1;
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      public function set state(param1:int) : void
      {
         _state = param1;
         var _loc2_:* = param1;
         if(1 !== _loc2_)
         {
            if(11 !== _loc2_)
            {
               if(12 !== _loc2_)
               {
                  if(31 !== _loc2_)
                  {
                     if(32 !== _loc2_)
                     {
                        if(33 === _loc2_)
                        {
                           viewStack.selection = resultPage;
                           this.kindPanel.switchState(33);
                           tsms.getTSM(this.viewStack).toState();
                           tsms.getTSM(this.kindPanel).toState();
                        }
                     }
                     else
                     {
                        viewStack.selection = resultPage;
                        this.kindPanel.switchState(32);
                        tsms.getTSM(this.viewStack).toState();
                        tsms.getTSM(this.kindPanel).toState();
                     }
                  }
                  else
                  {
                     ModuleMgr.ins.staticLayer.switchVisible("LotteryHero_result",false,[11900]);
                     tsms.getTSM(this.viewStack).toState(3);
                     tsms.getTSM(this.kindPanel).toState(404);
                  }
               }
               else
               {
                  this.kindPanel.switchState(12);
                  tsms.getTSM(this.viewStack).toState();
                  tsms.getTSM(this.kindPanel).toState();
                  viewStack.selection = diamondPage;
                  diamondPage.parse(panelInfo);
                  sceneCtrl.switchEffPrepare(true);
               }
            }
            else
            {
               this.kindPanel.switchState(11);
               tsms.getTSM(this.viewStack).toState();
               tsms.getTSM(this.kindPanel).toState();
               viewStack.selection = normalPage;
               normalPage.parse(panelInfo);
               sceneCtrl.switchEffPrepare(true);
            }
         }
         else
         {
            ModuleMgr.ins.staticLayer.switchVisible("LotteryHero_result",true,[11900]);
            this.lastLotteryCMD = 0;
            this.lastlotteryId = 0;
            viewStack.selection = null;
            this.kindPanel.switchState(1);
            tsms.getTSM(this.viewStack).toState(404);
            sceneCtrl.switchEffPrepare(false);
         }
      }
      
      protected function onEnter(param1:Event) : void
      {
         if(param1.target is LHKindNormal)
         {
            this.state = 11;
         }
         else if(param1.target is LHKindAdvan)
         {
            this.state = 12;
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["MSG_LOTTERY_HERO_GET_REWARD","MSG_LOTTERY_HERO_TEST","msg_lottery_hero","msg_lottery_direct","MSG_LOTTERY_HIGH_NAME"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc5_:* = null;
         var _loc3_:int = 0;
         var _loc6_:* = null;
         var _loc4_:* = null;
         super.handleNotices(param1,param2);
         var _loc7_:* = param1;
         if("MSG_LOTTERY_HERO_GET_REWARD" !== _loc7_)
         {
            if("MSG_LOTTERY_HERO_TEST" !== _loc7_)
            {
               if("msg_lottery_hero" !== _loc7_)
               {
                  if("msg_lottery_direct" !== _loc7_)
                  {
                     if("MSG_LOTTERY_HIGH_NAME" === _loc7_)
                     {
                        if(param2 != null)
                        {
                           highHeroName.show(param2 as HeroInfo);
                        }
                        else
                        {
                           highHeroName.hide();
                        }
                     }
                  }
                  else
                  {
                     _loc4_ = new LotterySuperReq();
                     _loc4_.lotteryId = int(param2);
                     lastlotteryId = int(param2);
                     lastLotteryCMD = 3000;
                     lastLotteryReq = _loc4_;
                     ServerEngine.ins.send(3000,_loc4_,server_DirectLotteryCpl,server_lotteryErr);
                  }
               }
               else
               {
                  _loc5_ = param2 as nslm2.modules.cultivates.lotteryHeroModules.LotteryHeroVo;
                  _loc3_ = _loc5_.lotteryId;
                  _loc7_ = _loc3_;
                  if(1000 !== _loc7_)
                  {
                     if(1010 !== _loc7_)
                     {
                        if(2000 !== _loc7_)
                        {
                           if(2010 !== _loc7_)
                           {
                           }
                        }
                     }
                  }
                  _loc6_ = new LotteryReq();
                  _loc6_.lotteryId = _loc3_;
                  lastlotteryId = _loc3_;
                  lastlotteryVo = _loc5_;
                  lastLotteryCMD = 4001;
                  lastLotteryReq = _loc6_;
                  ServerEngine.ins.send(4001,_loc6_,server_lotteryCpl,server_lotteryErr);
               }
            }
            else
            {
               showLotteryResult(param2);
            }
         }
         else
         {
            this.state = 12;
            showLotteryResult(param2);
         }
      }
      
      private function server_DirectLotteryCpl(param1:LotterySuperRes = null) : void
      {
         this.panelInfo.superDiamond = param1.superDiamond;
         kindPanel.parse(this.panelInfo);
         showLotteryResult(param1.rewards);
      }
      
      private function server_lotteryErr(param1:ProtocolStatusRes, param2:ServerEvent) : void
      {
         if(param1.errCode == 300007200)
         {
            ObserverMgr.ins.sendNotice("MSG_LOTTERY_HERO_GET_REWARD_PROMPT",1);
         }
         else
         {
            ServerEngine.ins.doDefaultErr(param1);
         }
      }
      
      private function server_lotteryCpl(param1:LotteryRandRes, param2:ServerEvent) : void
      {
         LotteryTimesManager.server_cpl(LotteryHeroUtil.ptRandToInfo(param1,panelInfo));
         newheroids = param2.dataNotifyCacheVo.playerDataNotify.newheroids;
         var _loc3_:int = this.panelInfo.superDiamond;
         this.panelInfo = LotteryHeroUtil.ptRandToInfo(param1,panelInfo);
         this.panelInfo.superDiamond = _loc3_;
         var _loc5_:Vector.<PlayerDataNotify> = PlayerModel.ins.oldDataNotify;
         var _loc4_:PlayerDataNotify = ArrayUtil.findByAttr(_loc5_,PlayerDataNotify.CMD.name,4001);
         showLotteryResult(_loc4_.addHeroes,param1.cashYuLiang);
      }
      
      private function showLotteryResult(param1:Array, param2:int = 0) : void
      {
         kindPanel.parse(this.panelInfo);
         this.sceneCtrl.showResult(param1,new Handler(this.showSceneResultEff_cpl,[param1,param2]));
         this.state = 31;
      }
      
      private function showSceneResultEff_cpl(param1:Array, param2:int = 0) : void
      {
         if(lastlotteryId == 1000 || lastlotteryId == 1010)
         {
            this.state = 32;
         }
         else
         {
            this.state = 33;
         }
         this.resultPage.show(param1,param2,lastlotteryId,newheroids);
         if(LHModel.ins.panelInfo.point >= int(DefindConsts.LOTTERY_POINT_FULL))
         {
            ObserverMgr.ins.sendNotice("MSG_LOTTERY_HERO_GET_REWARD_PROMPT",2);
         }
      }
      
      private function result_onClose(param1:Event) : void
      {
         this.sceneCtrl.disposeHeroShowEffList();
         this.state = 1;
         kindPanel.floatMagicPoint();
      }
      
      protected function result_onAgain(param1:Event) : void
      {
         ServerEngine.ins.send(lastLotteryCMD,lastLotteryReq,server_lotteryCpl,server_lotteryErr);
      }
      
      override public function fadeIn(param1:Number = 0, param2:int = 0) : void
      {
         super.fadeIn(param1,param2);
         this.alpha = 1;
         this.visible = true;
      }
      
      override public function preClose(param1:Object = null) : void
      {
         kindPanel.switchState(4);
         TweenLite.delayedCall(0.3,super.preClose,[param1]);
         switchOtherStaticModule(true);
      }
      
      private function switchOtherStaticModule(param1:Boolean) : void
      {
         ModuleMgr.ins.staticLayer.switchVisible("LotteryHero",param1,[11900,10430]);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.sceneCtrl = null;
      }
      
      public function getCompById(param1:String, param2:StcGuideVo) : Component
      {
         var _loc3_:* = null;
         switch(int(param2.id) - 99106)
         {
            case 0:
               ModuleMgr.ins.popLayer.closeAll(null);
            default:
            case 2:
               ModuleMgr.ins.popLayer.closeAll(null);
         }
         var _loc4_:* = param1;
         if("btn_enterL" !== _loc4_)
         {
            if("btn_enterR" !== _loc4_)
            {
               _loc3_ = NGUtil.getCompById(this,param1,param2);
            }
            else
            {
               _loc3_ = this.kindPanel.advanKind.renderSelect.boxCommon.btn_1;
            }
         }
         else
         {
            _loc3_ = this.kindPanel.normalKind.renderSelect.boxCommon.btn_1;
         }
         return _loc3_;
      }
   }
}
