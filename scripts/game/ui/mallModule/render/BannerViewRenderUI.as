package game.ui.mallModule.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Button;
   import game.ui.commons.icons.LotteryRenderS3UI;
   import morn.core.components.Label;
   
   public class BannerViewRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="522" height="228">
			  <Image var="img_banner" smoothing="true" x="261" y="114" mouseChildren="false" mouseEnabled="false" skin="png.comp.image" anchorX=".5" anchorY=".5" width="522" height="228"/>
			  <List x="16" y="149" repeatX="5" spaceX="0" var="list_items">
			    <MallBannelItemRender name="render" runtime="game.ui.mallModule.render.MallBannelItemRenderUI"/>
			  </List>
			  <Button y="166" style="按钮大蓝" x="381" var="btn_buy"/>
			  <LotteryRenderS3 x="409" y="173" var="priceRender" mouseChildren="false" mouseEnabled="false" runtime="game.ui.commons.icons.LotteryRenderS3UI"/>
			  <Label text="组合包内容：" autoSize="none" x="18" y="133" style="普通说明" width="262" height="20"/>
			  <LotteryRenderS3 var="oriPriceRender" mouseChildren="false" mouseEnabled="false" x="418" y="142" runtime="game.ui.commons.icons.LotteryRenderS3UI"/>
			  <Image skin="png.a5.commonImgs.img_barginLine" y="154" x="425" var="img_saleLine" mouseChildren="false" mouseEnabled="false" height="3"/>
			  <Label text="限购：1000/1000" x="385" y="125" style="普通说明" width="117" height="20" align="right" var="txt_count"/>
			</View>;
       
      
      public var img_banner:Image = null;
      
      public var list_items:List = null;
      
      public var btn_buy:Button = null;
      
      public var priceRender:LotteryRenderS3UI = null;
      
      public var oriPriceRender:LotteryRenderS3UI = null;
      
      public var img_saleLine:Image = null;
      
      public var txt_count:Label = null;
      
      public function BannerViewRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS3UI"] = LotteryRenderS3UI;
         viewClassMap["game.ui.mallModule.render.MallBannelItemRenderUI"] = MallBannelItemRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
