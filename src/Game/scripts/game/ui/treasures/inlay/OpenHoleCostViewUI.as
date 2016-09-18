package game.ui.treasures.inlay
{
   import morn.core.components.View;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.treasures.render.OpenHoleCostRenderUI;
   
   public class OpenHoleCostViewUI extends View
   {
      
      protected static var uiView:XML = <View width="255.5" height="116">
			  <List x="40.5" y="29" repeatY="2" spaceY="2" var="list_cost">
			    <OpenHoleCostRender name="render" runtime="game.ui.treasures.render.OpenHoleCostRenderUI"/>
			  </List>
			  <Label text="随品质变化" autoSize="none" x="0" y="0" style="随品质变化" width="250" height="18" align="center" var="txt_title"/>
			</View>;
       
      
      public var list_cost:List = null;
      
      public var txt_title:Label = null;
      
      public function OpenHoleCostViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.treasures.render.OpenHoleCostRenderUI"] = OpenHoleCostRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
