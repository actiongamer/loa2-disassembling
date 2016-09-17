package game.ui.recommendHero
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Tab;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.recommendHero.render.RecoHeroGroupRenderUI;
   
   public class RecommendHeroModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="800" height="550">
			  <PanelBg x="4" y="1" width="804" height="551"/>
			  <Tab labels="标 签,标 签" x="35" y="37" selectedIndex="0" style="TAB长" var="tab_group"/>
			  <Image skin="png.a5.bgs.panelBgs.img_frameS1" x="18" y="63" sizeGrid="14,18,14,14" width="779" height="477"/>
			  <Label text="点击英雄头像可查看详细信息" autoSize="none" x="302" y="39" style="普通说明" width="450" wordWrap="true" align="right" bold="false" height="20" var="txt_desc"/>
			  <List x="27" y="70" repeatY="2" spaceY="4" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" width="762" height="464" var="list_task">
			    <RecoHeroGroupRender name="render" runtime="game.ui.recommendHero.render.RecoHeroGroupRenderUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var tab_group:Tab = null;
      
      public var txt_desc:Label = null;
      
      public var list_task:List = null;
      
      public function RecommendHeroModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.recommendHero.render.RecoHeroGroupRenderUI"] = RecoHeroGroupRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
