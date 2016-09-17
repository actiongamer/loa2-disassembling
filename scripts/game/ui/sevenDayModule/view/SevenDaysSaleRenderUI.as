package game.ui.sevenDayModule.view
{
   import morn.core.components.View;
   import game.ui.mallModule.render.MallItemRenderUI;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import game.ui.commons.icons.LotteryRenderS4UI;
   import game.ui.commons.icons.LotteryRenderS3UI;
   
   public class SevenDaysSaleRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="256" height="130">
			  <Image skin="png.uiSevenDays.renderBg" x="0" y="1"/>
			  <MallItemRender x="18" y="45" var="itemRender" runtime="game.ui.mallModule.render.MallItemRenderUI"/>
			  <Button x="112.5" style="按钮大蓝" y="59" var="btn_buy" language="en" lgx="112.5,112.5" lgy="67,59"/>
			  <Label autoSize="left" x="95" y="4" height="20" style="小标题" var="txt_name" size="14" text="王者武器进阶图纸"/>
			  <Image skin="png.uiSevenDays.itemBorder" x="16" y="42" mouseEnabled="false" mouseChildren="false"/>
			  <Image skin="png.uiSevenDays.VIP1" x="-1" y="-5" var="img_statusBg"/>
			  <LotteryRenderS4 scale="0.9" var="oriRes" x="151" y="37" language="en" lgx="115,151" lgy="47,37" runtime="game.ui.commons.icons.LotteryRenderS4UI"/>
			  <Label x="8" y="1" width="68" height="29" style="小标题" var="txt_status" size="16" text="8折" align="center" bold="true"/>
			  <LotteryRenderS3 x="138" y="65" var="priceRender" mouseChildren="false" mouseEnabled="false" language="en" lgx="138,138" lgy="73,65" runtime="game.ui.commons.icons.LotteryRenderS3UI"/>
			  <Label text="限购：1000/1000" x="114" y="103" style="普通说明" width="137" height="20" align="left" var="txt_limit" language="en" lgx="114,114" lgy="103,98"/>
			  <Image skin="png.a5.commonImgs.img_barginLine" y="52" x="114" var="img_saleLine" mouseChildren="false" mouseEnabled="false" height="3" lgx="114,150" lgy="55,47" language="en"/>
			  <Label text="原价：" x="114" y="30" style="普通说明" width="95" height="20" align="left" var="txt_ori" language="en" lgx="114,114" lgy="30,38"/>
			</View>;
       
      
      public var itemRender:MallItemRenderUI = null;
      
      public var btn_buy:Button = null;
      
      public var txt_name:Label = null;
      
      public var img_statusBg:Image = null;
      
      public var oriRes:LotteryRenderS4UI = null;
      
      public var txt_status:Label = null;
      
      public var priceRender:LotteryRenderS3UI = null;
      
      public var txt_limit:Label = null;
      
      public var img_saleLine:Image = null;
      
      public var txt_ori:Label = null;
      
      public function SevenDaysSaleRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS3UI"] = LotteryRenderS3UI;
         viewClassMap["game.ui.commons.icons.LotteryRenderS4UI"] = LotteryRenderS4UI;
         viewClassMap["game.ui.mallModule.render.MallItemRenderUI"] = MallItemRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
