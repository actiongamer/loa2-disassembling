package game.ui.newYears.day51s.renders
{
   import morn.core.components.View;
   
   public class Day51ShopRenderFakeUI extends View
   {
      
      protected static var uiView:XML = <View width="265" height="110">
			  <GRect fillAlpha="0.6" radius="0,0,0,0" lineAlpha="0.7" x="15" y="-15" lineColor="0x0000FF" lineThickness="8" left="4" right="4" top="4" bottom="4" fillColor="0x00FF00"/>
			</View>;
       
      
      public function Day51ShopRenderFakeUI()
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
