package game.ui.heroCompare
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import game.ui.heroCompare.render.HCDescRenderUI;
   import morn.core.components.List;
   import game.ui.heroCompare.render.HCHeroHeadRenderUI;
   import game.ui.heroCompare.render.HCHeroInfoRenderUI;
   
   public class HeroCompareModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="800" height="550">
			  <PanelBg x="0" y="-1" width="803" height="554"/>
			  <Image skin="png.uiHeroCompare.底图" x="2" y="18" var="img_bghead"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="8" y="144" width="778" height="400" sizeGrid="20,20,20,20"/>
			  <Image skin="png.uiHeroCompare.VS" x="197" y="35"/>
			  <Image skin="png.uiHeroCompare.VS" x="512" y="35"/>
			  <Image skin="png.uiHeroCompare.英雄对比" x="46" y="80"/>
			  <Panel x="6" y="150" width="795" height="395" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3">
			    <HCDescRender x="7" y="5" var="heroInfoDesc" runtime="game.ui.heroCompare.render.HCDescRenderUI"/>
			    <List x="123" repeatX="4" var="listHeroInfo" y="0">
			      <HCHeroInfoRender name="render" runtime="game.ui.heroCompare.render.HCHeroInfoRenderUI"/>
			    </List>
			  </Panel>
			  <List x="171" y="58" var="listHeroHead">
			    <HCHeroHeadRender name="item0" y="1" runtime="game.ui.heroCompare.render.HCHeroHeadRenderUI"/>
			    <HCHeroHeadRender name="item2" x="315" runtime="game.ui.heroCompare.render.HCHeroHeadRenderUI"/>
			    <HCHeroHeadRender name="item1" x="171" runtime="game.ui.heroCompare.render.HCHeroHeadRenderUI"/>
			    <HCHeroHeadRender name="item3" x="486" y="1" runtime="game.ui.heroCompare.render.HCHeroHeadRenderUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var img_bghead:Image = null;
      
      public var heroInfoDesc:HCDescRenderUI = null;
      
      public var listHeroInfo:List = null;
      
      public var listHeroHead:List = null;
      
      public function HeroCompareModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.heroCompare.render.HCDescRenderUI"] = HCDescRenderUI;
         viewClassMap["game.ui.heroCompare.render.HCHeroHeadRenderUI"] = HCHeroHeadRenderUI;
         viewClassMap["game.ui.heroCompare.render.HCHeroInfoRenderUI"] = HCHeroInfoRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
