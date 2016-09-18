package nslm2.modules.funnies.busyActivity.dragonBoats.others
{
   import game.ui.newYears.day51s.panels.Day51HelpModule1UI;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   
   public class DragonBoatHelpModule extends Day51HelpModule1UI
   {
       
      
      public function DragonBoatHelpModule()
      {
         super();
      }
      
      public function get pageBar() : IPageBar
      {
         return pageBarUI as IPageBar;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         super.preShow(param1);
         this.panelBg.titleImgId = this.moduleId;
         this.list_content.dataSource = [1,2];
         this.pageBar.bindList(list_content);
      }
   }
}
