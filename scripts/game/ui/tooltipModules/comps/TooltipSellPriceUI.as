package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS16UI;
   
   public class TooltipSellPriceUI extends View
   {
      
      protected static var uiView:XML = <View width="160" height="18">
			  <Label text="\l10000001\l:" autoSize="none" y="0" color="0xdcdcdc" bold="false" size="12" var="txt_name" align="left" x="10" width="69" height="19"/>
			  <WealthRenderS16 x="82" y="-4" var="render_sellPrice" runtime="game.ui.commons.icons.WealthRenderS16UI"/>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public var render_sellPrice:WealthRenderS16UI = null;
      
      public function TooltipSellPriceUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS16UI"] = WealthRenderS16UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
