package nslm2.modules.funnies.newYears.day51s.panels
{
   import game.ui.newYears.day51s.panels.Day51HelpModuleUI;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class Day51HelpModule extends Day51HelpModuleUI
   {
       
      
      public function Day51HelpModule()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         super.preShow(param1);
         this.panelBg.titleImgId = this.moduleId;
         this.img_pic.skin = UrlLib.day51help(1);
      }
   }
}
