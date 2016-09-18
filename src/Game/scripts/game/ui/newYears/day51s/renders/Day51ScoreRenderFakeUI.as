package game.ui.newYears.day51s.renders
{
   import morn.core.components.View;
   
   public class Day51ScoreRenderFakeUI extends View
   {
      
      protected static var uiView:XML = <View width="500" height="48">
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0.8" x="1" y="2" lineThickness="6" left="3" right="3" top="3" bottom="3"/>
			</View>;
       
      
      public function Day51ScoreRenderFakeUI()
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
