package game.ui.dialModule.renders
{
   import morn.core.components.View;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class DialItemRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="50" height="50">
			  <WealthRenderS5 x="0" y="0" var="render_wealth" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			</View>;
       
      
      public var render_wealth:WealthRenderS5UI = null;
      
      public function DialItemRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS5UI"] = WealthRenderS5UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
