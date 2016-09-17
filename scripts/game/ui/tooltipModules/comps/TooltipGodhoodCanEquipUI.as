package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.List;
   
   public class TooltipGodhoodCanEquipUI extends View
   {
      
      protected static var uiView:XML = <View width="319" height="136">
			  <Image skin="png.a5.commonImgs.img_yellow" x="82" y="-5"/>
			  <Label text="名称" autoSize="none" x="1" y="1" bold="false" var="txt_name" align="center" width="315" style="加底标题"/>
			  <List x="8" y="28" var="list_hero" repeatX="2" repeatY="3" spaceX="2">
			    <TooltipGodhoodRender name="render" runtime="game.ui.tooltipModules.comps.TooltipGodhoodRenderUI"/>
			  </List>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public var list_hero:List = null;
      
      public function TooltipGodhoodCanEquipUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.tooltipModules.comps.TooltipGodhoodRenderUI"] = TooltipGodhoodRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
