package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.List;
   import morn.core.components.Label;
   
   public class TooltipTitleListPanelS3UI extends View
   {
      
      protected static var uiView:XML = <View width="169" height="106">
			  <List x="18" y="26" repeatY="3" var="list_prop" spaceY="2">
			    <TooltipProp2Render name="render" runtime="game.ui.tooltipModules.comps.TooltipProp2RenderUI"/>
			  </List>
			  <Label text="天赋" autoSize="left" y="0" color="0xffe1a2" bold="false" size="15" var="txt_title" align="left" x="19"/>
			  <Image skin="png.a5.prefabs.img_titlePoint" x="2" y="5"/>
			</View>;
       
      
      public var list_prop:List = null;
      
      public var txt_title:Label = null;
      
      public function TooltipTitleListPanelS3UI()
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
