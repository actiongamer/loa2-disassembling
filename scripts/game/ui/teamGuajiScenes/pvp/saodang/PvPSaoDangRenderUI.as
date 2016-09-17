package game.ui.teamGuajiScenes.pvp.saodang
{
   import morn.core.components.View;
   
   public class PvPSaoDangRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="257" height="120"/>;
       
      
      public function PvPSaoDangRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
