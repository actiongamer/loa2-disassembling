package nslm2.modules.footstones.driverInfoModules
{
   import game.ui.driverInfoModules.DriverInfoPanel2UI;
   import nslm2.modules.foundations.miniApp.MiniAppModule;
   
   public class DriverInfoPanel2 extends DriverInfoPanel2UI
   {
       
      
      public function DriverInfoPanel2()
      {
         super();
         this.btn_downMiniApp.clickHandler = btn_downMiniAppHandler;
         this.btn_downMiniApp.visible = false;
      }
      
      private function btn_downMiniAppHandler() : void
      {
         MiniAppModule.downMiniApp();
      }
   }
}
