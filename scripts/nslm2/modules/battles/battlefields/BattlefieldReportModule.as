package nslm2.modules.battles.battlefields
{
   import game.ui.battlefield.BattlefieldReport.BattlefieldReportModuleUI;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import flash.display.MovieClip;
   import proto.BgStageGetReportRes;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.modules.battles.battlefields.service.BattlefieldBattleService;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import nslm2.modules.battles.battlefields.consts.BattlefieldConsts;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.BgStageReportInfo;
   import nslm2.modules.battles.battlefields.vos.BattlefieldStageReportVo;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.event.MzEvent;
   import nslm2.utils.ServerTimer;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcBginfoVo;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.MouseIconManager;
   import nslm2.modules.footstones.assistantModules.model.AssistantModel;
   import nslm2.utils.TimeUtils;
   import morn.core.components.Button;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import com.greensock.TweenMax;
   import com.greensock.easing.Linear;
   import com.greensock.TweenLite;
   import game.ui.battleResults.BattleWinWordUI;
   import nslm2.common.compsEffects.ScaleTweenEff;
   import com.greensock.easing.Elastic;
   import com.mz.core.utils.DisplayUtils;
   import morn.customs.expands.MornExpandUtil;
   
   public class BattlefieldReportModule extends BattlefieldReportModuleUI
   {
       
      
      private var _textCDCtrl:TextCDCtrlS2;
      
      private var _mc:MovieClip;
      
      private var _firstShowed:Boolean;
      
      private var _img_win:BattleWinWordUI;
      
      public function BattlefieldReportModule()
      {
         super();
         switchEventListeners(true);
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         this.fadeViewId = 13000;
      }
      
      private function get stageReportRes() : BgStageGetReportRes
      {
         return BattlefieldModel.ins.bgStageGetReportRes;
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         if(BattlefieldModel.ins.isFinished == true)
         {
            _firstShowed = true;
            this.moduleServerCpl();
         }
         else
         {
            BattlefieldBattleService.ins.getBattlefieldReport();
         }
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            BattlefieldMsgs.ins.addEventListener("msgFightReportChanged",onReportChanged);
            BattlefieldMsgs.ins.addEventListener("msgFightFinished",onFinished);
         }
         else
         {
            BattlefieldMsgs.ins.removeEventListener("msgFightReportChanged",onReportChanged);
            BattlefieldMsgs.ins.removeEventListener("msgFightFinished",onFinished);
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = this.moduleId;
         this.list_tab.selectHandler = onTabChanged;
         this.list_tab.dataSource = BattlefieldConsts.REPORT_LIST_DATA;
         this.list_tab.commitMeasure();
         this.list_tab.selectedIndex = 0;
         this.img_bg.skin = UrlLib.battlefieldUI("img_reportBg");
         refresh();
         if(BattlefieldModel.ins.curBattlefieldId == 1001)
         {
            txt_gatherLabel.text = LocaleMgr.ins.getStr(50500158);
         }
         this.preShowCpl();
      }
      
      private function onTabChanged(param1:int) : void
      {
         var _loc6_:int = 0;
         var _loc2_:Array = stageReportRes.reportInfos.sort(onSortFunc);
         var _loc4_:Array = [];
         var _loc3_:int = BattlefieldConsts.REPORT_LIST_DATA[param1];
         var _loc5_:int = -1;
         _loc6_ = 0;
         while(_loc6_ < _loc2_.length)
         {
            if(_loc3_ == 99 || _loc3_ == (_loc2_[_loc6_] as BgStageReportInfo).side)
            {
               _loc4_.push(new BattlefieldStageReportVo(_loc6_ + 1,_loc2_[_loc6_]));
               if(PlayerModel.ins.isCurPlayer((_loc2_[_loc6_] as BgStageReportInfo).baseInfo.id))
               {
                  _loc5_ = _loc4_.length - 1;
               }
            }
            _loc6_++;
         }
         this.list_task.dataSource = _loc4_;
         this.list_task.selectedIndex = _loc5_;
         this.fadeIn(0,13000);
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgBattlefieldReportTabChanged",_loc3_));
      }
      
      private function refresh() : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc1_:int = 0;
         var _loc4_:* = null;
         if(stageReportRes.end)
         {
            _textCDCtrl = new TextCDCtrlS2(this.txt_leaveAlert,textCDFormat,textCDCpl);
            this.parts.push(new TextCDCtrlS2(this.txt_leaveAlert,textCDFormat,textCDCpl));
            _textCDCtrl.start(ServerTimer.ins.second + 30);
            this.txt_leaveAlert.visible = true;
            _loc3_ = StcMgr.ins.getBginfoVo(BattlefieldModel.ins.curBattlefieldId);
            var _loc7_:int = 0;
            var _loc6_:* = stageReportRes.reportInfos;
            for each(var _loc5_ in stageReportRes.reportInfos)
            {
               if(PlayerModel.ins.isCurPlayer(_loc5_.baseInfo.id))
               {
                  _loc2_ = _loc5_;
               }
            }
            this.txt_myHonor.text = LocaleMgr.ins.getStr(50500093) + ":" + stageReportRes.myInitHonor + "+" + TextFieldUtil.htmlText2(_loc2_.gatherHonor + _loc2_.assistHonor + _loc2_.killHonor + _loc2_.resultHonor,458496);
            this.txt_myScore.text = LocaleMgr.ins.getStr(50500094) + ":" + stageReportRes.myInitScore + "+" + TextFieldUtil.htmlText2(_loc2_.score,458496);
            if(BattlefieldModel.ins.winSide == BattlefieldModel.ins.currentBgStagePlayerInfo.side)
            {
               showWin();
               _loc1_ = 60200043;
            }
            else
            {
               showLoss();
               _loc1_ = 60200044;
            }
            MouseIconManager.changeMouseCursor("auto");
            MouseIconManager.ins.hideSpecialMouseCursor();
            if(AssistantModel.ins.isActingAuto(50500))
            {
               _loc4_ = LocaleMgr.ins.getStr(_loc1_,[LocaleMgr.ins.getStr(_loc3_.bg_name),int(_loc2_.gatherHonor + _loc2_.assistHonor + _loc2_.killHonor + _loc2_.resultHonor),_loc2_.score]);
               AssistantModel.ins.addLog(_loc4_,50500);
            }
         }
         else
         {
            this.txt_leaveAlert.visible = false;
            this.txt_myHonor.text = LocaleMgr.ins.getStr(50500093) + ":" + stageReportRes.myInitHonor + "+" + TextFieldUtil.htmlText2(BattlefieldModel.ins.getAddHonor(),458496);
            this.txt_myScore.text = LocaleMgr.ins.getStr(50500094) + ":" + stageReportRes.myInitScore;
         }
         this.txt_teamInfo.text = LocaleMgr.ins.getStr(50500900 + 1) + ":" + BattlefieldModel.ins.getPlayerNum(1) + "V" + BattlefieldModel.ins.getPlayerNum(2) + ":" + LocaleMgr.ins.getStr(50500900 + 2);
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(50500096,[TimeUtils.hisColonFullAddZero(param1)]);
      }
      
      private function textCDCpl() : void
      {
         onConfirm();
      }
      
      private function onSortFunc(param1:BgStageReportInfo, param2:BgStageReportInfo) : int
      {
         var _loc3_:int = param1.assistHonor + param1.gatherHonor + param1.killHonor + param1.resultHonor;
         var _loc4_:int = param2.assistHonor + param2.gatherHonor + param2.killHonor + param2.resultHonor;
         if(_loc3_ > _loc4_)
         {
            return -1;
         }
         if(_loc4_ > _loc3_)
         {
            return 1;
         }
         return 0;
      }
      
      private function onReportChanged(param1:MzEvent) : void
      {
         if(_firstShowed == false)
         {
            _firstShowed = true;
            this.moduleServerCpl();
         }
         else
         {
            refresh();
         }
      }
      
      private function onFinished(param1:MzEvent) : void
      {
         refresh();
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_leave === _loc2_)
         {
            if(stageReportRes.end)
            {
               onConfirm();
            }
            else
            {
               AlertUtil.comfirm(LocaleMgr.ins.getStr(50500108),onConfirm);
            }
         }
      }
      
      private function onConfirm() : void
      {
         if(stageReportRes.end == false)
         {
            BattlefieldBattleService.ins.leave();
         }
         MouseIconManager.changeMouseCursor("auto");
         MouseIconManager.ins.hideSpecialMouseCursor();
         ModuleMgr.ins.closeModule(this.moduleId);
         ModuleMgr.ins.closeModule(50507);
      }
      
      private function showWin() : void
      {
         var _loc1_:int = 0;
         _mc = ResMgr.ins.getRes("effect2d/battle/dgWinLogo.swf");
         _mc.gotoAndStop(1);
         var _loc2_:* = 0.7;
         _mc.scaleY = _loc2_;
         _mc.scaleX = _loc2_;
         _mc.x = (this.width - _mc.width) / 2 + 236;
         _mc.y = (this.height - _mc.height) / 2 + 445;
         _loc1_ = 0;
         while(_loc1_ < 3)
         {
            _mc["star" + _loc1_].visible = false;
            _mc["star_bg" + _loc1_].visible = false;
            _loc1_++;
         }
         this.addChild(_mc);
         showWinTxt();
         TweenMax.to(_mc,0.7,{
            "frame":17,
            "ease":Linear.easeNone
         });
         TweenLite.delayedCall(2.7,removeMc);
      }
      
      private function showWinTxt() : void
      {
         _img_win = new BattleWinWordUI();
         _img_win.x = 262;
         _img_win.y = 223;
         _img_win.img_light.blendMode = "add";
         new ScaleTweenEff().init(_img_win,0.5,2,1,Elastic.easeInOut,false);
         this.addChild(_img_win);
      }
      
      private function showLoss() : void
      {
         _mc = ResMgr.ins.getRes("effect2d/battle/lossLogo.swf");
         _mc.gotoAndStop(1);
         var _loc1_:* = 0.7;
         _mc.scaleY = _loc1_;
         _mc.scaleX = _loc1_;
         _mc.x = (this.width - _mc.width) / 2;
         _mc.y = (this.height - _mc.height) / 2 - 100;
         this.addChild(_mc);
         TweenMax.to(_mc,1.1,{
            "frame":28,
            "ease":Linear.easeNone
         });
         TweenLite.delayedCall(3.1,removeMc);
      }
      
      private function removeMc() : void
      {
         DisplayUtils.removeSelf(_mc);
         if(_img_win)
         {
            DisplayUtils.removeSelf(_img_win);
         }
      }
      
      override public function preClose(param1:Object = null) : void
      {
         if(stageReportRes.end)
         {
            onConfirm();
         }
         super.preClose(param1);
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         super.dispose();
      }
   }
}
