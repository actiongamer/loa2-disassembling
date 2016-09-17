package nslm2.modules.foundations.alerts.views
{
   import game.ui.alerts.RechargeAlertUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.Button;
   import nslm2.modules.foundations.vip.model.VipModel;
   import morn.customs.expands.MornExpandUtil;
   
   public class RechargeAlert extends RechargeAlertUI
   {
       
      
      public function RechargeAlert()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btnHandler);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(9010102);
         super.preShow();
      }
      
      private function btnHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btn_cancel !== _loc2_)
         {
            if(btn_recharge === _loc2_)
            {
               VipModel.ins.gotoCharge();
               btnCloseHandler();
            }
         }
         else
         {
            btnCloseHandler();
         }
      }
   }
}
