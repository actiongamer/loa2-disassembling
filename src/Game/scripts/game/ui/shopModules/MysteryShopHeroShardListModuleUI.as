package game.ui.shopModules
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Tab;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   
   public class MysteryShopHeroShardListModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="600" height="400">
			  <PanelBg x="0" y="0" width="803" height="553" showTabLine="true"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="16.5" y="75" width="770" height="424" sizeGrid="10,10,10,10"/>
			  <Tab labels="英 雄,碎 片" x="24" y="40" selectedIndex="0" style="TAB长" var="tabBar"/>
			  <List x="28" y="83" repeatX="5" repeatY="3" spaceY="4" var="list_items" spaceX="8"/>
			  <PageBarS2 x="324" y="512" var="pageBar" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			</PopModuleView>;
       
      
      public var tabBar:Tab = null;
      
      public var list_items:List = null;
      
      public var pageBar:PageBarS2UI = null;
      
      public function MysteryShopHeroShardListModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
