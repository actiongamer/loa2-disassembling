package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.List;
   
   public class ToolTipNpcGroupViewUI extends View
   {
      
      protected static var uiView:XML = <View width="200" height="122">
			  <List y="0" repeatY="3" var="list_prop" x="0" spaceY="5">
			    <NpcGroupRender name="render" runtime="game.ui.tooltipModules.comps.NpcGroupRenderUI"/>
			  </List>
			</View>;
       
      
      public var list_prop:List = null;
      
      public function ToolTipNpcGroupViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.tooltipModules.comps.NpcGroupRenderUI"] = NpcGroupRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
