package game.ui.salesModule.render
{
   import morn.core.components.View;
   import game.ui.commons.icons.WealthRenderS56UI;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import game.ui.commons.icons.LotteryRenderS4UI;
   import morn.core.components.Button;
   
   public class SalesItemRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="224" height="96">
			  <Image skin="png.uiSales.物品底框" x="0" y="0"/>
			  <WealthRenderS56 x="20" y="19" var="itemRender" runtime="game.ui.commons.icons.WealthRenderS56UI"/>
			  <Image skin="png.a5.comps.img_block" x="-1" y="-1" var="img_discountBg" mouseChildren="false" mouseEnabled="false" width="59" height="59"/>
			  <Image skin="png.a5.comps.img_block" x="20" y="20" var="img_discount" mouseChildren="false" mouseEnabled="false" width="25" height="25" anchorX="0.5" anchorY="0.5"/>
			  <Image skin="png.uiSales.物品框-橙光" x="68" y="3"/>
			  <Label text="英雄长剑材料" autoSize="none" x="68" y="7" style="普通说明" var="label_itemName" align="center" width="168"/>
			  <Label text="原价：" x="91" y="23" style="普通说明"/>
			  <LotteryRenderS4 scale="0.9" var="oriRes" x="92" y="41" runtime="game.ui.commons.icons.LotteryRenderS4UI"/>
			  <Image skin="png.a5.commonImgs.img_barginLine" y="49" x="96" var="img_saleLine" mouseChildren="false" mouseEnabled="false" height="3"/>
			  <Button x="92" y="59" style="按钮中蓝" stateNum="1" var="btn_buy"/>
			  <LotteryRenderS4 scale="0.9" var="curRes" x="99" y="62" mouseChildren="false" mouseEnabled="false" runtime="game.ui.commons.icons.LotteryRenderS4UI"/>
			  <Image skin="png.uiSales.已购买" x="163" y="-17" var="img_havebought"/>
			</View>;
       
      
      public var itemRender:WealthRenderS56UI = null;
      
      public var img_discountBg:Image = null;
      
      public var img_discount:Image = null;
      
      public var label_itemName:Label = null;
      
      public var oriRes:LotteryRenderS4UI = null;
      
      public var img_saleLine:Image = null;
      
      public var btn_buy:Button = null;
      
      public var curRes:LotteryRenderS4UI = null;
      
      public var img_havebought:Image = null;
      
      public function SalesItemRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS4UI"] = LotteryRenderS4UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS56UI"] = WealthRenderS56UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
