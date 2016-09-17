package nslm2.modules.funnies.teamGuajiScenes.pvp
{
   import game.ui.teamGuajiScenes.pvp.CanGetViewUI;
   
   public class CanGetListRender extends CanGetViewUI
   {
       
      
      public function CanGetListRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         itemRender.dataSource = param1;
      }
   }
}
