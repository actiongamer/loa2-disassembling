package game.ui.mallModule
{
   import morn.core.components.View;
   import morn.core.components.List;
   import game.ui.mallModule.render.BannerViewRenderUI;
   
   public class BannerViewUI extends View
   {
      
      protected static var uiView:XML = <View width="522" height="228">
			  <List var="list_banner" x="0" y="0" width="521" height="228">
			    <BannerViewRender x="0" y="0" name="render" runtime="game.ui.mallModule.render.BannerViewRenderUI"/>
			  </List>
			  <Image skin="png.uiMall.img_bannerFrame" x="-2" y="-1" mouseEnabled="false" mouseChildren="false" sizeGrid="50,20,5050,"/>
			  <List x="212" y="204" width="22" height="22" repeatX="5" spaceX="3" var="list_navBtn" buttonMode="true">
			    <Box name="render" buttonMode="true" x="1" y="1">
			      <Image skin="png.uiMall.imgDot"/>
			      <Image skin="png.uiMall.imgDotSelect" name="selectBox1" buttonMode="true"/>
			    </Box>
			  </List>
			  <Label text="畅销品" autoSize="none" x="210" y="11" style="加底标题" width="89" height="28" align="center" size="16"/>
			</View>;
       
      
      public var list_banner:List = null;
      
      public var list_navBtn:List = null;
      
      public function BannerViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.mallModule.render.BannerViewRenderUI"] = BannerViewRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
