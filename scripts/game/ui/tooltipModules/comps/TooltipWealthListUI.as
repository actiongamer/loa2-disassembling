package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.List;
   
   public class TooltipWealthListUI extends View
   {
      
      protected static var uiView:XML = <View width="269" height="118">
			  <List x="0" y="0" repeatX="4" spaceX="10" spaceY="6" repeatY="2" var="list_icon">
			    <TooltipWealthListRender name="render" runtime="game.ui.tooltipModules.comps.TooltipWealthListRenderUI"/>
			  </List>
			</View>;
       
      
      public var list_icon:List = null;
      
      public function TooltipWealthListUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.tooltipModules.comps.TooltipWealthListRenderUI"] = TooltipWealthListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
