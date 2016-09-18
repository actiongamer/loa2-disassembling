package game.ui.dialModule.renders
{
   import morn.core.components.View;
   
   public class DialShopRenderFakeUI extends View
   {
      
      protected static var uiView:XML = <View width="265" height="110">
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0.8" left="4" right="4" top="4" bottom="4" lineThickness="8" lineColor="0xFF9900"/>
			</View>;
       
      
      public function DialShopRenderFakeUI()
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
