package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.List;
   import morn.core.components.Label;
   
   public class TooltipTitleListPanelS5UI extends View
   {
      
      protected static var uiView:XML = <View width="243" height="78">
			  <List x="30" y="22" repeatY="3" var="list_prop" spaceY="4" repeatX="2" spaceX="33">
			    <TooltipPropRenderS2 name="render" runtime="game.ui.tooltipModules.comps.TooltipPropRenderS2UI"/>
			  </List>
			  <Label text="标题文字" autoSize="none" y="0" bold="false" var="txt_title" align="left" x="18" style="普通说明"/>
			  <Image skin="png.a5.prefabs.img_titlePoint" x="3" y="3"/>
			</View>;
       
      
      public var list_prop:List = null;
      
      public var txt_title:Label = null;
      
      public function TooltipTitleListPanelS5UI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.tooltipModules.comps.TooltipPropRenderS2UI"] = TooltipPropRenderS2UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
