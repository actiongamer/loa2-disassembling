package game.ui.newYears.lantern2016s.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS9UI;
   import morn.core.components.Button;
   import game.ui.commons.icons.LotteryRenderS3UI;
   import game.ui.commons.icons.LotteryRenderS4UI;
   import morn.core.components.Image;
   
   public class LanternSalesRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="273" height="112">
			  <Image skin="png.uiLantern2016.底框" x="10" y="3" sizeGrid="1,1,1,1" width="263" height="109"/>
			  <Label text="英雄长剑" autoSize="none" x="80" y="8" style="普通说明" var="label_name" width="175" height="20" align="center"/>
			  <Label text="限购：1000/1000" x="116" y="32" style="普通说明" width="117" height="20" align="right" var="label_limit"/>
			  <WealthRenderS9 x="49" y="35" var="render_item" runtime="game.ui.commons.icons.WealthRenderS9UI"/>
			  <Image skin="png.uiLantern2016.买一送一" x="5" y="0"/>
			  <Button x="148" style="按钮中绿" y="74" var="btn_buy"/>
			  <LotteryRenderS3 x="156" y="76" var="render_cost" mouseChildren="false" mouseEnabled="false" runtime="game.ui.commons.icons.LotteryRenderS3UI"/>
			  <LotteryRenderS4 scale="0.9" var="oriRes" x="161" y="52" runtime="game.ui.commons.icons.LotteryRenderS4UI"/>
			  <Image skin="png.a5.commonImgs.img_barginLine" y="61" x="160" var="img_saleLine" mouseChildren="false" mouseEnabled="false" height="3"/>
			</View>;
       
      
      public var label_name:Label = null;
      
      public var label_limit:Label = null;
      
      public var render_item:WealthRenderS9UI = null;
      
      public var btn_buy:Button = null;
      
      public var render_cost:LotteryRenderS3UI = null;
      
      public var oriRes:LotteryRenderS4UI = null;
      
      public var img_saleLine:Image = null;
      
      public function LanternSalesRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS3UI"] = LotteryRenderS3UI;
         viewClassMap["game.ui.commons.icons.LotteryRenderS4UI"] = LotteryRenderS4UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS9UI"] = WealthRenderS9UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
