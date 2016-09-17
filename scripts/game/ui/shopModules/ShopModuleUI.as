package game.ui.shopModules
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Tab;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS16UI;
   import game.ui.shopModules.render.GeneralShopFakeRenderUI;
   
   public class ShopModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="840" height="553">
			  <PanelBgShop x="56" y="15"/>
			  <Image skin="png.a5.comps.img_block" x="-155" y="-42" var="img_avatar"/>
			  <Tab labels="标 签,标 签" x="148" y="57" style="TAB长" var="tab_shop" selectedIndex="0"/>
			  <PageBarS2 x="361.5" y="502" var="pageBarRef" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <List right="19" y="55" repeatX="2" var="list_res" x="670" spaceX="-50">
			    <WealthRenderS16 name="render" runtime="game.ui.commons.icons.WealthRenderS16UI"/>
			  </List>
			  <List x="133" y="91" repeatX="2" repeatY="4" spaceX="8" spaceY="7" var="list_items">
			    <GeneralShopFakeRender x="0" y="0" name="render" runtime="game.ui.shopModules.render.GeneralShopFakeRenderUI"/>
			  </List>
			  <Label y="58" height="20" style="普通说明" var="txt_limit" text="今日兑换上限：10000/15000" align="right" right="245" x="444"/>
			</PopModuleView>;
       
      
      public var img_avatar:Image = null;
      
      public var tab_shop:Tab = null;
      
      public var pageBarRef:PageBarS2UI = null;
      
      public var list_res:List = null;
      
      public var list_items:List = null;
      
      public var txt_limit:Label = null;
      
      public function ShopModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS16UI"] = WealthRenderS16UI;
         viewClassMap["game.ui.shopModules.render.GeneralShopFakeRenderUI"] = GeneralShopFakeRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
