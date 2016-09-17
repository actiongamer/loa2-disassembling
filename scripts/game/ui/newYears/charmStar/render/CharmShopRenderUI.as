package game.ui.newYears.charmStar.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS9UI;
   import morn.core.components.Button;
   import game.ui.commons.icons.LotteryRenderS3UI;
   
   public class CharmShopRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="280" height="109">
			  <Image skin="png.uiCharmStar.底框" x="0" y="-0.5" sizeGrid="1,1,1,1" width="280" height="109"/>
			  <Label text="英雄长剑" x="88" y="5" style="普通说明" var="label_name" width="172" height="20" align="right"/>
			  <Label text="限购：1000/1000" x="17" y="38" style="普通说明" width="242" height="20" align="right" var="label_limit" selectable="false" mouseChildren="false" mouseEnabled="false"/>
			  <WealthRenderS9 x="21" y="23.5" var="render_item" runtime="game.ui.commons.icons.WealthRenderS9UI"/>
			  <Button x="163" style="按钮中蓝" y="66" var="btn_buy"/>
			  <LotteryRenderS3 x="175" y="69" var="render_cost" mouseChildren="false" mouseEnabled="false" runtime="game.ui.commons.icons.LotteryRenderS3UI"/>
			</View>;
       
      
      public var label_name:Label = null;
      
      public var label_limit:Label = null;
      
      public var render_item:WealthRenderS9UI = null;
      
      public var btn_buy:Button = null;
      
      public var render_cost:LotteryRenderS3UI = null;
      
      public function CharmShopRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS3UI"] = LotteryRenderS3UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS9UI"] = WealthRenderS9UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
