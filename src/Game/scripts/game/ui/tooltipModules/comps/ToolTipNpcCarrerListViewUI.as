package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.List;
   
   public class ToolTipNpcCarrerListViewUI extends View
   {
      
      protected static var uiView:XML = <View width="412" height="162">
			  <List y="0" repeatY="4" spaceY="2" var="list_prop">
			    <NpcCarrerTypeRender name="render" runtime="game.ui.tooltipModules.comps.NpcCarrerTypeRenderUI"/>
			  </List>
			</View>;
       
      
      public var list_prop:List = null;
      
      public function ToolTipNpcCarrerListViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.tooltipModules.comps.NpcCarrerTypeRenderUI"] = NpcCarrerTypeRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
