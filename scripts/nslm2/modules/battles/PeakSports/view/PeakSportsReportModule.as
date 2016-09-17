package nslm2.modules.battles.PeakSports.view
{
   import game.ui.peakSports.peakSportsReport.PeakSportsReportModuleUI;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import flash.display.MovieClip;
   import proto.BkStageGetReportRes;
   import nslm2.modules.battles.PeakSports.model.PeakSportsModel;
   import nslm2.modules.battles.PeakSports.type.PeakSportsMsgs;
   import com.mz.core.event.MzEvent;
   import morn.core.components.Button;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.battles.PeakSports.service.PeakSportsBattleService;
   import nslm2.mgrs.MouseIconManager;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.battles.PeakSports.type.PeakSportsConsts;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import proto.BkStageReportInfo;
   import nslm2.modules.battles.PeakSports.model.vos.PeakSportsStageReportVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.ServerTimer;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcBginfoVo;
   import nslm2.utils.TimeUtils;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import com.greensock.TweenMax;
   import com.greensock.easing.Linear;
   import com.greensock.TweenLite;
   import game.ui.battleResults.BattleWinWordUI;
   import nslm2.common.compsEffects.ScaleTweenEff;
   import com.greensock.easing.Elastic;
   import com.mz.core.utils.DisplayUtils;
   import morn.customs.expands.MornExpandUtil;
   
   public class PeakSportsReportModule extends PeakSportsReportModuleUI
   {
       
      
      private var _textCDCtrl:TextCDCtrlS2;
      
      private var _mc:MovieClip;
      
      private var _firstShowed:Boolean;
      
      private var _img_win:BattleWinWordUI;
      
      public function PeakSportsReportModule()
      {
         super();
         switchEventListeners(true);
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         this.fadeViewId = 13000;
      }
      
      private function get stageReportRes() : BkStageGetReportRes
      {
         return PeakSportsModel.ins.bkStageGetReportRes;
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            PeakSportsMsgs.ins.addEventListener("msgFightReportChanged",onReportChanged);
            PeakSportsMsgs.ins.addEventListener("msgFightFinished",onFinished);
         }
         else
         {
            PeakSportsMsgs.ins.removeEventListener("msgFightReportChanged",onReportChanged);
            PeakSportsMsgs.ins.removeEventListener("msgFightFinished",onFinished);
         }
      }
      
      private function onReportChanged(param1:MzEvent) : void
      {
         if(_firstShowed == false)
         {
            _firstShowed = true;
            moduleServerCpl();
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
               AlertUtil.comfirm(LocaleMgr.ins.getStr(999600129),onConfirm);
            }
         }
      }
      
      private function onConfirm() : void
      {
         if(stageReportRes.end == false)
         {
            PeakSportsBattleService.ins.leave();
         }
         MouseIconManager.changeMouseCursor("auto");
         MouseIconManager.ins.hideSpecialMouseCursor();
         ModuleMgr.ins.closeModule(moduleId);
         ModuleMgr.ins.closeModule(50527);
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         if(PeakSportsModel.ins.isFinished == true)
         {
            _firstShowed = true;
            moduleServerCpl();
         }
         else
         {
            PeakSportsBattleService.ins.getPeakSportsReport();
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = moduleId;
         this.list_tab.selectHandler = onTabChanged;
         this.list_tab.dataSource = PeakSportsConsts.REPORT_LIST_DATA;
         this.list_tab.commitMeasure();
         this.list_tab.selectedIndex = 0;
         this.img_bg.skin = UrlLib.peakSportsUI("img_reportBg");
         refresh();
         this.preShowCpl();
      }
      
      private function onTabChanged(param1:int) : void
      {
         var _loc6_:int = 0;
         var _loc2_:Array = stageReportRes.reportInfos.sort(onSortFunc);
         var _loc4_:Array = [];
         var _loc3_:int = PeakSportsConsts.REPORT_LIST_DATA[param1];
         var _loc5_:int = -1;
         _loc6_ = 0;
         while(_loc6_ < _loc2_.length)
         {
            if(_loc3_ == 99 || _loc3_ == (_loc2_[_loc6_] as BkStageReportInfo).side)
            {
               _loc4_.push(new PeakSportsStageReportVo(_loc6_ + 1,_loc2_[_loc6_]));
               if(PlayerModel.ins.isCurPlayer((_loc2_[_loc6_] as BkStageReportInfo).baseInfo.id))
               {
                  _loc5_ = _loc4_.length - 1;
               }
            }
            _loc6_++;
         }
         this.list_task.dataSource = _loc4_;
         this.list_task.selectedIndex = _loc5_;
         this.fadeIn(0,13000);
         PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgPeakSportsReportTabChanged",_loc3_));
      }
      
      private function refresh() : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc1_:int = 0;
         if(stageReportRes.end)
         {
            _textCDCtrl = new TextCDCtrlS2(this.txt_leaveAlert,textCDFormat,textCDCpl);
            this.parts.push(new TextCDCtrlS2(this.txt_leaveAlert,textCDFormat,textCDCpl));
            _textCDCtrl.start(ServerTimer.ins.second + 30);
            this.txt_leaveAlert.visible = true;
            _loc3_ = StcMgr.ins.getBginfoVo(PeakSportsModel.ins.curPeakSportsId);
            var _loc6_:int = 0;
            var _loc5_:* = stageReportRes.reportInfos;
            for each(var _loc4_ in stageReportRes.reportInfos)
            {
               if(PlayerModel.ins.isCurPlayer(_loc4_.baseInfo.id))
               {
                  _loc2_ = _loc4_;
               }
            }
            if(PeakSportsModel.ins.winSide == PeakSportsModel.ins.currentBkStagePlayerInfo.side)
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
         }
         else
         {
            this.txt_leaveAlert.visible = false;
         }
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(50500096,[TimeUtils.hisColonFullAddZero(param1)]);
      }
      
      private function textCDCpl() : void
      {
         onConfirm();
      }
      
      private function onSortFunc(param1:BkStageReportInfo, param2:BkStageReportInfo) : int
      {
         var _loc3_:int = param1.assistHonor + param1.killHonor;
         var _loc4_:int = param2.assistHonor + param2.killHonor;
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
