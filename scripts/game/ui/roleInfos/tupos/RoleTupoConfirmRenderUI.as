package game.ui.roleInfos.tupos
{
   import morn.core.components.View;
   import game.ui.commons.icons.HeroRenderS1UI;
   
   public class RoleTupoConfirmRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="54" height="54">
			  <HeroRenderS1 x="0" y="0" var="render_player" runtime="game.ui.commons.icons.HeroRenderS1UI"/>
			</View>;
       
      
      public var render_player:HeroRenderS1UI = null;
      
      public function RoleTupoConfirmRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.HeroRenderS1UI"] = HeroRenderS1UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
