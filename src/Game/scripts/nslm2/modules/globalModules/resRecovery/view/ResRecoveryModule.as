package nslm2.modules.globalModules.resRecovery.view
{
   import game.ui.ResRecovery.ResRecoveryModuleUI;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import morn.customs.expands.MornExpandUtil;
   
   public class ResRecoveryModule extends ResRecoveryModuleUI
   {
       
      
      public function ResRecoveryModule()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnClick);
      }
      
      private function onBtnClick(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(openBtn !== _loc3_)
         {
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         super.preShow(param1);
         closeBtn.addEventListener("click",btnCloseHandler);
      }
      
      override public function preClose(param1:Object = null) : void
      {
         super.preClose(param1);
         closeBtn.removeEventListener("click",btnCloseHandler);
      }
   }
}
