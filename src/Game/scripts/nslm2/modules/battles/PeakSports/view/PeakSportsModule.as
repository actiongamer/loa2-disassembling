package nslm2.modules.battles.PeakSports.view
{
   import game.ui.peakSports.PeakSportsModuleUI;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS3;
   import nslm2.modules.battles.PeakSports.type.PeakSportsMsgs;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.battles.PeakSports.model.PeakSportsModel;
   import nslm2.modules.battles.PeakSports.type.PeakSportsTempType;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.battles.PeakSports.utils.PeakSportsUtil;
   import nslm2.modules.battles.PeakSports.service.PeakSportsService;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.utils.ServerTimer;
   import morn.core.components.Label;
   import nslm2.utils.TimeUtils;
   import nslm2.modules.foundations.AlertUtil;
   import morn.customs.expands.MornExpandUtil;
   
   public class PeakSportsModule extends PeakSportsModuleUI
   {
       
      
      private var _textCDCtrlS2:TextCDCtrlS2;
      
      private var _textCDS2:TextCDCtrlS2;
      
      private var _textCDCtrlS3:TextCDCtrlS3;
      
      public function PeakSportsModule()
      {
         super();
         switchEventListeners(true);
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            PeakSportsMsgs.ins.addEventListener("msgPeakSportsInfoCpl",onGetBgInfoCpl);
            PeakSportsMsgs.ins.addEventListener("msgPeakSportsApplyCpl",onApplyCpl);
            PeakSportsMsgs.ins.addEventListener("msgPeakSportsExitCpl",onExitCpl);
            PeakSportsMsgs.ins.addEventListener("msgPeakSportsStart",onStartCpl);
         }
         else
         {
            PeakSportsMsgs.ins.removeEventListener("msgPeakSportsInfoCpl",onGetBgInfoCpl);
            PeakSportsMsgs.ins.removeEventListener("msgPeakSportsApplyCpl",onApplyCpl);
            PeakSportsMsgs.ins.removeEventListener("msgPeakSportsExitCpl",onExitCpl);
            PeakSportsMsgs.ins.removeEventListener("msgPeakSportsStart",onStartCpl);
         }
      }
      
      private function onGetBgInfoCpl(param1:MzEvent) : void
      {
         moduleServerCpl();
      }
      
      private function onApplyCpl(param1:MzEvent) : void
      {
         descTxt.visible = false;
         startInfoTxt.visible = true;
         startInfoTxt.text = LocaleMgr.ins.getStr(999600111);
         applyBtn.label = LocaleMgr.ins.getStr(10000013);
         if(PeakSportsModel.ins.startStamp != 0)
         {
            onStartCpl(null);
            return;
         }
         onTimeTxt3(timeTxt,PeakSportsModel.ins.regStamp,PeakSportsModel.ins.regStamp + PeakSportsTempType.battleTime);
      }
      
      private function onExitCpl(param1:MzEvent) : void
      {
         descTxt.visible = true;
         startInfoTxt.visible = false;
         timeTxt.text = "";
         applyBtn.label = LocaleMgr.ins.getStr(999600102);
         if(_textCDCtrlS2)
         {
            _textCDCtrlS2.dispose();
            _textCDCtrlS2 = null;
         }
         if(_textCDCtrlS3)
         {
            _textCDCtrlS3.dispose();
            _textCDCtrlS3 = null;
         }
         if(_textCDS2)
         {
            _textCDS2.stop();
            _textCDS2.dispose();
            _textCDS2 = null;
         }
      }
      
      private function onStartCpl(param1:MzEvent) : void
      {
         descTxt.visible = false;
         startInfoTxt.visible = true;
         startInfoTxt.text = LocaleMgr.ins.getStr(999600104);
         applyBtn.label = LocaleMgr.ins.getStr(998000980);
         onTimeTxt2(timeTxt,PeakSportsModel.ins.startStamp + int(PeakSportsTempType.BK_CONFIRM_TIME));
      }
      
      private function onBtnFunc(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(applyBtn !== _loc3_)
         {
            if(infoBtn !== _loc3_)
            {
               if(rewardBtn === _loc3_)
               {
                  ModuleMgr.ins.showModule(50532,null,ModuleMgr.ins.popLayer.curModuleId);
               }
            }
            else
            {
               ModuleMgr.ins.showModule(50526,null,ModuleMgr.ins.popLayer.curModuleId);
            }
         }
         else if(PeakSportsModel.ins.startStamp != 0)
         {
            PeakSportsUtil.enterPeakSports();
         }
         else if(PeakSportsModel.ins.regStamp != 0)
         {
            PeakSportsService.ins.exitPeakSports();
         }
         else
         {
            PeakSportsService.ins.applySingle();
         }
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         PeakSportsService.ins.getPeakSportsInfo();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         $param = param1;
         this.panelBg.titleImgId = this.moduleId;
         DisplayUtils.addChildAbove(bgImage,panelBg.img_rimBg);
         bgImage.url = UrlLib.peakSportsUI("enterbBgImage");
         if(PeakSportsModel.ins.bkInfoRes.penaltyStamp > ServerTimer.ins.second)
         {
            if(_textCDS2)
            {
               _textCDS2.stop();
               _textCDS2.dispose();
               _textCDS2 = null;
            }
            _textCDS2 = new TextCDCtrlS2(punishTimeTxt,textCDFormat,function():*
            {
               var /*UnknownSlot*/:* = function():void
               {
                  punishTimeBox.visible = false;
                  applyBox.visible = true;
                  PeakSportsModel.ins.clearData();
                  if(PeakSportsModel.ins.startStamp != 0)
                  {
                     onStartCpl(null);
                  }
                  else if(PeakSportsModel.ins.regStamp != 0)
                  {
                     onApplyCpl(null);
                  }
                  else
                  {
                     onExitCpl(null);
                  }
               };
               return function():void
               {
                  punishTimeBox.visible = false;
                  applyBox.visible = true;
                  PeakSportsModel.ins.clearData();
                  if(PeakSportsModel.ins.startStamp != 0)
                  {
                     onStartCpl(null);
                  }
                  else if(PeakSportsModel.ins.regStamp != 0)
                  {
                     onApplyCpl(null);
                  }
                  else
                  {
                     onExitCpl(null);
                  }
               };
            }());
            this.parts.push(new TextCDCtrlS2(punishTimeTxt,textCDFormat,function():*
            {
               var /*UnknownSlot*/:* = function():void
               {
                  punishTimeBox.visible = false;
                  applyBox.visible = true;
                  PeakSportsModel.ins.clearData();
                  if(PeakSportsModel.ins.startStamp != 0)
                  {
                     onStartCpl(null);
                  }
                  else if(PeakSportsModel.ins.regStamp != 0)
                  {
                     onApplyCpl(null);
                  }
                  else
                  {
                     onExitCpl(null);
                  }
               };
               return function():void
               {
                  punishTimeBox.visible = false;
                  applyBox.visible = true;
                  PeakSportsModel.ins.clearData();
                  if(PeakSportsModel.ins.startStamp != 0)
                  {
                     onStartCpl(null);
                  }
                  else if(PeakSportsModel.ins.regStamp != 0)
                  {
                     onApplyCpl(null);
                  }
                  else
                  {
                     onExitCpl(null);
                  }
               };
            }()));
            _textCDS2.start(PeakSportsModel.ins.bkInfoRes.penaltyStamp);
            applyBox.visible = false;
            punishTimeBox.visible = true;
         }
         else
         {
            punishTimeBox.visible = false;
            applyBox.visible = true;
            if(PeakSportsModel.ins.startStamp != 0)
            {
               onStartCpl(null);
            }
            else if(PeakSportsModel.ins.regStamp != 0)
            {
               onApplyCpl(null);
            }
            else
            {
               onExitCpl(null);
            }
         }
         preShowCpl();
      }
      
      private function onTimeTxt2(param1:Label, param2:uint) : void
      {
         if(_textCDCtrlS2)
         {
            _textCDCtrlS2.stop();
            _textCDCtrlS2.dispose();
            _textCDCtrlS2 = null;
         }
         if(_textCDCtrlS3)
         {
            _textCDCtrlS3.stop();
            _textCDCtrlS3.dispose();
            _textCDCtrlS3 = null;
         }
         _textCDCtrlS2 = new TextCDCtrlS2(param1,textCDFormat,textCDCpl);
         this.parts.push(new TextCDCtrlS2(param1,textCDFormat,textCDCpl));
         _textCDCtrlS2.start(param2);
      }
      
      private function onTimeTxt3(param1:Label, param2:uint, param3:uint) : void
      {
         if(_textCDCtrlS2)
         {
            _textCDCtrlS2.dispose();
            _textCDCtrlS2 = null;
         }
         if(_textCDCtrlS3)
         {
            _textCDCtrlS3.dispose();
            _textCDCtrlS3 = null;
         }
         _textCDCtrlS3 = new TextCDCtrlS3(param1,textCDFormat,textCDCpl);
         this.parts.push(new TextCDCtrlS3(param1,textCDFormat,textCDCpl));
         _textCDCtrlS3.start(param2,param3);
      }
      
      private function textCDFormat(param1:int) : String
      {
         param1 = param1 < 0?0:param1;
         return TimeUtils.hisColonAddZero2(param1);
      }
      
      private function textCDCpl() : void
      {
         PeakSportsModel.ins.clearData();
         onExitCpl(null);
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         if(PeakSportsModel.ins.regStamp != 0)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999600040));
            return;
         }
         super.btnCloseHandler(param1);
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         super.dispose();
      }
   }
}
