package game.ui.mallModule.render
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import game.ui.commons.icons.LotteryRenderS3UI;
   import game.ui.commons.icons.LotteryRenderS4UI;
   
   public class MallListItemRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="256" height="130">
			  <Image skin="png.uiMall.renderBg" x="0" y="1"/>
			  <MallItemRender x="18" y="45" var="itemRender" runtime="game.ui.mallModule.render.MallItemRenderUI"/>
			  <Button x="116.5" style="按钮大蓝" y="84" var="btn_buy"/>
			  <Label autoSize="left" x="95" y="4" height="20" style="小标题" var="txt_name" size="14" text="王者武器进阶图纸"/>
			  <Image skin="png.uiMall.itemBorder" x="16" y="42" mouseEnabled="false" mouseChildren="false"/>
			  <Image skin="png.uiMall.VIP1" x="-1" y="-5" var="img_statusBg"/>
			  <Label x="0" y="1" width="92" height="29" style="小标题" var="txt_status" size="16" text="8折" align="center" bold="true"/>
			  <LotteryRenderS3 x="142" y="90" var="priceRender" mouseChildren="false" mouseEnabled="false" runtime="game.ui.commons.icons.LotteryRenderS3UI"/>
			  <Label text="限购：1000/1000" x="118.5" y="37" style="普通说明" width="129" height="20" align="left" var="txt_count"/>
			  <LotteryRenderS4 scale="0.9" var="oriRes" x="165" y="59" runtime="game.ui.commons.icons.LotteryRenderS4UI"/>
			  <Image skin="png.a5.commonImgs.img_barginLine" y="69" x="164" var="img_saleLine" mouseChildren="false" mouseEnabled="false" height="3"/>
			</View>;
       
      
      public var itemRender:game.ui.mallModule.render.MallItemRenderUI = null;
      
      public var btn_buy:Button = null;
      
      public var txt_name:Label = null;
      
      public var img_statusBg:Image = null;
      
      public var txt_status:Label = null;
      
      public var priceRender:LotteryRenderS3UI = null;
      
      public var txt_count:Label = null;
      
      public var oriRes:LotteryRenderS4UI = null;
      
      public var img_saleLine:Image = null;
      
      public function MallListItemRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS3UI"] = LotteryRenderS3UI;
         viewClassMap["game.ui.commons.icons.LotteryRenderS4UI"] = LotteryRenderS4UI;
         viewClassMap["game.ui.mallModule.render.MallItemRenderUI"] = game.ui.mallModule.render.MallItemRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
