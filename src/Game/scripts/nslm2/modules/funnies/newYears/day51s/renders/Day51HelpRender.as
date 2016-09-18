package nslm2.modules.funnies.newYears.day51s.renders
{
   import game.ui.newYears.day51s.renders.Day51HelpRenderUI;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class Day51HelpRender extends Day51HelpRenderUI
   {
       
      
      public function Day51HelpRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1 > 0)
         {
            this.img_pic.skin = UrlLib.day51help(int(param1));
         }
      }
   }
}
