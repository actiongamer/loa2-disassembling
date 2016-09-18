package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.List;
   import morn.core.components.Label;
   
   public class TooltipTitleListPanelS2UI extends View
   {
      
      protected static var uiView:XML = <View width="200" height="80">
			  <List x="30" y="42" repeatY="3" var="list_prop" spaceY="6">
			    <TooltipProp2Render name="render" runtime="game.ui.tooltipModules.comps.TooltipProp2RenderUI"/>
			  </List>
			  <Label text="标题文字" autoSize="left" y="0" color="0xeac472" bold="false" size="12" var="txt_title" align="left" x="18"/>
			  <Label text="标题文字" autoSize="left" y="22" color="0xdcdcdc" bold="false" size="12" var="txt_title2" align="left" x="30" height="16"/>
			  <Image skin="png.a5.prefabs.img_titlePoint" x="3" y="3"/>
			</View>;
       
      
      public var list_prop:List = null;
      
      public var txt_title:Label = null;
      
      public var txt_title2:Label = null;
      
      public function TooltipTitleListPanelS2UI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.tooltipModules.comps.TooltipProp2RenderUI"] = TooltipProp2RenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
