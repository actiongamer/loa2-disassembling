package nslm2.modules.footstones.alerts
{
   import game.ui.alerts.FPSLowlyAlertUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.utils.LocalData;
   import morn.customs.expands.MornExpandUtil;
   
   public class FPSLowlyAlert extends FPSLowlyAlertUI
   {
       
      
      public function FPSLowlyAlert()
      {
         super();
         this.centerX = 0;
         this.centerY = 0;
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.txt_content.text = LocaleMgr.ins.getStr(999902699);
         super.preShow();
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.box_ok.btn_ok !== _loc3_)
         {
            if(this.box_canel.btn_cancel === _loc3_)
            {
               ModuleMgr.ins.closeModule(10910);
               saveNoShow();
            }
         }
         else
         {
            ModuleMgr.ins.showModule(10900);
            ModuleMgr.ins.closeModule(10910);
            saveNoShow();
         }
      }
      
      private function saveNoShow() : void
      {
         LocalData.insCurPlayer.save("FPSLowlyAlertShow",cb_noShow.selected);
      }
   }
}
