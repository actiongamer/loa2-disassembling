package game.ui.lotteryHeroModules.heroPreviews
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Tab;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   
   public class HeroPreviewModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="803" height="554">
			  <PanelBg x="0" y="0" width="803" height="554" showTabLine="true"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="16" y="75" width="770" height="424" sizeGrid="10,10,10,10"/>
			  <Tab labels="阵营,三个" x="25" y="36" selectedIndex="0" style="TAB长" var="tabBar"/>
			  <List x="29" y="83" repeatX="5" repeatY="2" spaceY="4" var="list_items" spaceX="8">
			    <HeroPreviewRender name="render" x="-35" y="-103" runtime="game.ui.lotteryHeroModules.heroPreviews.HeroPreviewRenderUI"/>
			  </List>
			  <PageBarS2 x="324" y="512" var="pageBar" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			</PopModuleView>;
       
      
      public var tabBar:Tab = null;
      
      public var list_items:List = null;
      
      public var pageBar:PageBarS2UI = null;
      
      public function HeroPreviewModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.lotteryHeroModules.heroPreviews.HeroPreviewRenderUI"] = HeroPreviewRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
