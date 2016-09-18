package game.ui.arenas.rewards
{
   import morn.core.components.View;
   
   public class ArenaRewardRenderFakeUI extends View
   {
      
      protected static var uiView:XML = <View width="351" height="77">
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="1" width="351" height="77"/>
			</View>;
       
      
      public function ArenaRewardRenderFakeUI()
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
