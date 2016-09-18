package nslm2.modules.footstones.newerAlertModules
{
   import game.ui.newerAlertModules.NewerAlertNormalPanelUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.common.globals.GlobalRef;
   import nslm2.utils.ServerTimer;
   
   public class NewerAlertNormalPanel extends NewerAlertNormalPanelUI implements INewerAlert
   {
       
      
      private var _showingFuncId:int;
      
      public function NewerAlertNormalPanel()
      {
         super();
      }
      
      public function show(param1:int) : void
      {
         _showingFuncId = param1;
         this.txt_func.text = LocaleMgr.ins.getStr(9000000 + _showingFuncId);
         this.txt_desc.text = LocaleMgr.ins.getStr(964000000 + _showingFuncId);
         this.img_icon.url = UrlLib.moduleNewerAlertIcon(_showingFuncId);
      }
      
      public function btnCloseHandler() : void
      {
         if(checkBox_alert.selected == true)
         {
            GlobalRef.mainCityReshowParam.newerAlertCanShowStamp = ServerTimer.ins.second + 600;
         }
      }
   }
}
