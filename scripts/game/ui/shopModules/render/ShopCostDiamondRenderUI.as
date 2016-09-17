package game.ui.shopModules.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class ShopCostDiamondRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="373" height="258">
			  <ShopBuyRender x="106" y="86" var="render_wealth" runtime="game.ui.shopModules.render.ShopBuyRenderUI"/>
			  <Label stroke="0xffffff" mouseEnabled="false" var="txt_limit" width="371" align="center" x="1" y="49" style="小标题" height="18" text="\l60300019"/>
			</View>;
       
      
      public var render_wealth:game.ui.shopModules.render.ShopBuyRenderUI = null;
      
      public var txt_limit:Label = null;
      
      public function ShopCostDiamondRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.shopModules.render.ShopBuyRenderUI"] = game.ui.shopModules.render.ShopBuyRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
