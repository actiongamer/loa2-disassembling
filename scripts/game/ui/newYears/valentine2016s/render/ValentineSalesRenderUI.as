package game.ui.newYears.valentine2016s.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS9UI;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import game.ui.commons.icons.LotteryRenderS3UI;
   import game.ui.commons.icons.LotteryRenderS4UI;
   
   public class ValentineSalesRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="273" height="112">
			  <Image skin="png.uiCharmStar.底框" x="10" y="3" sizeGrid="1,1,1,1" width="263" height="109"/>
			  <Label text="英雄长剑" autoSize="none" x="147" y="8" style="普通说明" var="label_name"/>
			  <Label text="限购：1000/1000" x="124" y="33" style="普通说明" width="117" height="20" align="right" var="label_limit"/>
			  <WealthRenderS9 x="31" y="37" var="render_item" runtime="game.ui.commons.icons.WealthRenderS9UI"/>
			  <Image skin="png.uiCharmStar.买一送一" x="5" y="0" var="img_give_tag"/>
			  <Button x="152" style="按钮中绿" y="68" var="btn_buy"/>
			  <LotteryRenderS3 x="160" y="71" var="render_cost" mouseChildren="false" mouseEnabled="false" runtime="game.ui.commons.icons.LotteryRenderS3UI"/>
			  <LotteryRenderS4 scale="0.9" var="oriRes" x="155" y="49" runtime="game.ui.commons.icons.LotteryRenderS4UI"/>
			  <Image skin="png.a5.commonImgs.img_barginLine" y="58" x="159" var="img_saleLine" mouseChildren="false" mouseEnabled="false" height="3"/>
			  <Label text="狂省钻石3000" x="135" y="93" style="普通说明" width="117" height="20" align="center" var="label_hint"/>
			</View>;
       
      
      public var label_name:Label = null;
      
      public var label_limit:Label = null;
      
      public var render_item:WealthRenderS9UI = null;
      
      public var img_give_tag:Image = null;
      
      public var btn_buy:Button = null;
      
      public var render_cost:LotteryRenderS3UI = null;
      
      public var oriRes:LotteryRenderS4UI = null;
      
      public var img_saleLine:Image = null;
      
      public var label_hint:Label = null;
      
      public function ValentineSalesRenderUI()
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
