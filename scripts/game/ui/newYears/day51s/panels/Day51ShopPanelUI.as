package game.ui.newYears.day51s.panels
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import morn.core.components.Tab;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import game.ui.newYears.day51s.renders.Day51CoinRenderUI;
   import game.ui.newYears.day51s.renders.Day51ShopRenderFakeUI;
   
   public class Day51ShopPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="400">
			  <Label text="活动结束后金棕币、银粽币清零" autoSize="none" x="215" y="29" style="小标题" width="393" height="19" var="txt_tip1" align="right" size="12"/>
			  <Image skin="png.uiFunnyCommon.shop.img_line1" x="212" y="385"/>
			  <Image skin="png.a5.comps.img_block" x="-183" y="-73" autoSize="true" var="img_avatar" width="388" height="386"/>
			  <Image skin="png.uiFunnyCommon.shop.img_line1" x="213" y="27"/>
			  <Tab labels="标 签,标标标标标" x="222" y="25" selectedIndex="1" style="TAB短" var="tab"/>
			  <List y="57" repeatX="2" repeatY="3" spaceX="0" spaceY="7" var="list_shop" x="213">
			    <Day51ShopRenderFake name="render" runtime="game.ui.newYears.day51s.renders.Day51ShopRenderFakeUI"/>
			  </List>
			  <PageBarS2 x="410" y="420" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <Day51CoinRender x="620" y="-3" var="render_coin2" runtime="game.ui.newYears.day51s.renders.Day51CoinRenderUI"/>
			  <Label text="Date Time CD" autoSize="none" x="218" y="3" style="普通说明" width="397" height="19" var="txt_cd" align="left"/>
			  <Day51CoinRender x="620" y="24" var="render_coin" runtime="game.ui.newYears.day51s.renders.Day51CoinRenderUI"/>
			</View>;
       
      
      public var txt_tip1:Label = null;
      
      public var img_avatar:Image = null;
      
      public var tab:Tab = null;
      
      public var list_shop:List = null;
      
      public var pageBarUI:PageBarS2UI = null;
      
      public var render_coin2:Day51CoinRenderUI = null;
      
      public var txt_cd:Label = null;
      
      public var render_coin:Day51CoinRenderUI = null;
      
      public function Day51ShopPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.newYears.day51s.renders.Day51CoinRenderUI"] = Day51CoinRenderUI;
         viewClassMap["game.ui.newYears.day51s.renders.Day51ShopRenderFakeUI"] = Day51ShopRenderFakeUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
