package game.ui.mallModule
{
   import morn.customs.components.FadeView;
   import morn.core.components.List;
   import morn.core.components.Button;
   import game.ui.commons.icons.ResWealthRenderUI;
   import game.ui.mallModule.render.MallListItemRenderUI;
   
   public class FirstPageViewUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="600" height="400">
			  <List x="533" y="18" spaceY="5" repeatY="2" var="list_sale">
			    <MallListItemRender name="render" runtime="game.ui.mallModule.render.MallListItemRenderUI"/>
			  </List>
			  <List x="5" y="316" repeatY="1" repeatX="3" spaceX="8" var="list_commend">
			    <MallListItemRender name="render" runtime="game.ui.mallModule.render.MallListItemRenderUI"/>
			  </List>
			  <BannerView x="-1" y="55" var="bannerView" runtime="game.ui.mallModule.BannerViewUI"/>
			  <Button label="充值" skin="png.uiMall.btn_reCharge" x="12" y="0" stateNum="1" var="btn_charge"/>
			  <ResWealthRender x="180" y="5" var="crtDiamondRender" runtime="game.ui.commons.icons.ResWealthRenderUI"/>
			  <Label text="推荐商品" autoSize="none" x="271" y="299" style="重要提示黄" align="center" width="249" height="20" bold="true"/>
			  <Label text="今日特价" autoSize="none" x="627" y="-2" style="重要提示黄" align="center" width="98" height="20" bold="true"/>
			</FadeView>;
       
      
      public var list_sale:List = null;
      
      public var list_commend:List = null;
      
      public var bannerView:game.ui.mallModule.BannerViewUI = null;
      
      public var btn_charge:Button = null;
      
      public var crtDiamondRender:ResWealthRenderUI = null;
      
      public function FirstPageViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.ResWealthRenderUI"] = ResWealthRenderUI;
         viewClassMap["game.ui.mallModule.BannerViewUI"] = game.ui.mallModule.BannerViewUI;
         viewClassMap["game.ui.mallModule.render.MallListItemRenderUI"] = MallListItemRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
