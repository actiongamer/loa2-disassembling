package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.List;
   import morn.core.components.Label;
   
   public class TooltipTitleListPanelS1UI extends View
   {
      
      protected static var uiView:XML = <View width="300" height="90">
			  <List x="30" y="24" repeatY="3" var="list_prop" spaceY="6">
			    <TooltipProp2Render name="render" runtime="game.ui.tooltipModules.comps.TooltipProp2RenderUI"/>
			  </List>
			  <Label text="标题文字" y="0" var="txt_title" align="left" x="18" style="加底标题" width="290"/>
			  <Image skin="png.a5.prefabs.img_titlePoint" x="3" y="3"/>
			</View>;
       
      
      public var list_prop:List = null;
      
      public var txt_title:Label = null;
      
      public function TooltipTitleListPanelS1UI()
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
