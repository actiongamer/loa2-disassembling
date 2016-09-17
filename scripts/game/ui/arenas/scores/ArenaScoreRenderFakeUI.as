package game.ui.arenas.scores
{
   import morn.core.components.View;
   
   public class ArenaScoreRenderFakeUI extends View
   {
      
      protected static var uiView:XML = <View width="430" height="82">
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" width="430" height="82"/>
			</View>;
       
      
      public function ArenaScoreRenderFakeUI()
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
