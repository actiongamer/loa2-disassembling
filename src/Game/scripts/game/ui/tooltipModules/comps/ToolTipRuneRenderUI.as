package game.ui.tooltipModules.comps
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class ToolTipRuneRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="123" height="54">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_3" x="1" y="0" var="img_quality" width="28" height="28" sizeGrid="8,8,8,8"/>
			  <Image skin="png.a5.comps.img_block" x="4" y="3" width="22" height="22" var="img_icon"/>
			  <Label text="名称" autoSize="left" x="33" y="0" bold="false" var="txt_name" align="left" style="随品质变化"/>
			  <TooltipPropRenderS1 x="33" y="20" var="propRender" visible="false" runtime="game.ui.tooltipModules.comps.TooltipPropRenderS1UI"/>
			  <Label text="属性名称" autoSize="none" y="20" bold="false" var="txt_value" align="left" style="普通说明" x="33"/>
			  <TooltipPropRenderS1 x="33" y="37" var="propRender2" runtime="game.ui.tooltipModules.comps.TooltipPropRenderS1UI"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var propRender:game.ui.tooltipModules.comps.TooltipPropRenderS1UI = null;
      
      public var txt_value:Label = null;
      
      public var propRender2:game.ui.tooltipModules.comps.TooltipPropRenderS1UI = null;
      
      public function ToolTipRuneRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.tooltipModules.comps.TooltipPropRenderS1UI"] = game.ui.tooltipModules.comps.TooltipPropRenderS1UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
