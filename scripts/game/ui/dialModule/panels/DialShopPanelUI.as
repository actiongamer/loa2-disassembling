package game.ui.dialModule.panels
{
   import morn.customs.components.PanelView;
   import morn.core.components.Tab;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import game.ui.dialModule.renders.DialShopRenderFakeUI;
   import game.ui.dialModule.renders.DialWealthRenderUI;
   
   public class DialShopPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="600" height="400">
			  <Image skin="png.uiFunnyCommon.shop.img_line1" x="185" y="47"/>
			  <Tab labels="标 签,标标标标标" x="194" y="45" selectedIndex="1" style="TAB短" var="tab"/>
			  <Label text="Date Time CD" autoSize="none" x="59" y="25" style="普通说明" width="403" height="19" var="txt_cd" align="left"/>
			  <Label text="活动结束后金棕币、银粽币清零" autoSize="none" x="129" y="25" style="小标题" width="451" height="19" var="txt_tip1" align="right" size="12"/>
			  <List x="180" y="74" repeatX="2" repeatY="3" spaceX="10" spaceY="10" var="list_shop">
			    <DialShopRenderFake name="render" runtime="game.ui.dialModule.renders.DialShopRenderFakeUI"/>
			  </List>
			  <PageBarS2 x="379" y="440" var="pageBarRef" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <List x="591" y="24" var="list_coin" repeatY="2">
			    <DialWealthRender name="render" runtime="game.ui.dialModule.renders.DialWealthRenderUI"/>
			  </List>
			</PanelView>;
       
      
      public var tab:Tab = null;
      
      public var txt_cd:Label = null;
      
      public var txt_tip1:Label = null;
      
      public var list_shop:List = null;
      
      public var pageBarRef:PageBarS2UI = null;
      
      public var list_coin:List = null;
      
      public function DialShopPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.dialModule.renders.DialShopRenderFakeUI"] = DialShopRenderFakeUI;
         viewClassMap["game.ui.dialModule.renders.DialWealthRenderUI"] = DialWealthRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
