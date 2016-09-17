package game.ui.newYears.luckTrees.panels
{
   import morn.core.components.View;
   import morn.core.components.Tab;
   import morn.core.components.List;
   import game.ui.dialModule.renders.DialWealthRenderUI;
   import morn.core.components.Label;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import game.ui.newYears.luckTrees.renders.LuckTreeShopRenderUI;
   
   public class LuckTreeShopPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="400">
			  <Image skin="png.uiLuckTree.personShop.img_line1" x="212" y="385"/>
			  <Image skin="png.uiLuckTree.personShop.img_avatar" x="-204" y="-180"/>
			  <Image skin="png.uiLuckTree.personShop.img_line1" x="213" y="27"/>
			  <Tab labels="标 签,标 签,标 签,标 签" x="222" y="25" selectedIndex="1" style="TAB短" var="tab"/>
			  <List y="57" repeatX="2" repeatY="3" spaceX="0" spaceY="7" var="list_shop" x="213">
			    <LuckTreeShopRender name="render" runtime="game.ui.newYears.luckTrees.renders.LuckTreeShopRenderUI"/>
			  </List>
			  <DialWealthRender x="214" y="420" var="render_coin" runtime="game.ui.dialModule.renders.DialWealthRenderUI"/>
			  <Label text="Date Time CD" autoSize="none" x="219" y="3" style="普通说明" width="533" height="19" var="txt_cd" align="right"/>
			  <Label text="\l13350031" autoSize="none" x="-29" y="3" style="渐变1" width="488" height="22" align="right" size="14" var="txt_60800021"/>
			  <PageBarS2 x="410" y="420" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			</View>;
       
      
      public var tab:Tab = null;
      
      public var list_shop:List = null;
      
      public var render_coin:DialWealthRenderUI = null;
      
      public var txt_cd:Label = null;
      
      public var txt_60800021:Label = null;
      
      public var pageBarUI:PageBarS2UI = null;
      
      public function LuckTreeShopPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.dialModule.renders.DialWealthRenderUI"] = DialWealthRenderUI;
         viewClassMap["game.ui.newYears.luckTrees.renders.LuckTreeShopRenderUI"] = LuckTreeShopRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
