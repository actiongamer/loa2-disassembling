package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import game.ui.commons.icons.WealthRenderS3UI;
   import morn.core.components.Label;
   
   public class TooltipGodhoodRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="148" height="43">
			  <Image skin="png.a5.commonImgs.透明底框" x="0" y="0"/>
			  <WealthRenderS3 x="7" y="7" scale="0.6" var="render_hero" runtime="game.ui.commons.icons.WealthRenderS3UI"/>
			  <Label text="名称" autoSize="none" x="46" y="5" bold="false" var="txt_name" align="left" width="104" style="随品质变化" height="20"/>
			  <Label text="名称" autoSize="none" x="46" y="23" bold="false" var="txt_itemCnt" align="left" width="104" style="随品质变化" height="20"/>
			</View>;
       
      
      public var render_hero:WealthRenderS3UI = null;
      
      public var txt_name:Label = null;
      
      public var txt_itemCnt:Label = null;
      
      public function TooltipGodhoodRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS3UI"] = WealthRenderS3UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
