package nslm2.modules.footstones.driverInfoModules
{
   import game.ui.driverInfoModules.DriverInfoPanel1UI;
   import nslm2.mgrs.ExternalMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.miniApp.MiniAppModule;
   import com.mz.core.configs.ClientConfig;
   import flash.system.Security;
   
   public class DriverInfoPanel1 extends DriverInfoPanel1UI
   {
       
      
      public function DriverInfoPanel1()
      {
         super();
         this.txt_driverInfoStr.text = ClientConfig._driverInfo;
         Security.showSettings("display");
         this.btn_refreshBrowser.clickHandler = btn_refreshBrowserHandler;
         this.btn_downMiniApp.clickHandler = btn_downMiniAppHandler;
         this.btn_downMiniApp.visible = false;
      }
      
      private function btn_refreshBrowserHandler() : void
      {
         ExternalMgr.ins.refreshBrowzer();
         ModuleMgr.ins.closeModule(95400);
      }
      
      private function btn_downMiniAppHandler() : void
      {
         MiniAppModule.downMiniApp();
      }
   }
}
