package game.ui.roleTeam.panel
{
   import morn.customs.components.PanelView;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS1UI;
   import morn.core.components.Label;
   import game.ui.roleTeam.render.SelectYuanJunHeroRenderUI;
   
   public class SelectYuanJunPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="476" height="450">
			  <PanelBgS3 width="476" height="450"/>
			  <List x="21" y="53" repeatY="3" var="list_hero" spaceY="2">
			    <SelectYuanJunHeroRender name="render" runtime="game.ui.roleTeam.render.SelectYuanJunHeroRenderUI"/>
			  </List>
			  <PageBarS1 x="191" y="396" var="pageBar" runtime="game.ui.commons.comps.pageBars.PageBarS1UI"/>
			  <Label text="只显示可以激活缘分的英雄" autoSize="left" x="20" y="36" style="重要提示橘黄" width="374" height="18" var="txt_tip"/>
			</PanelView>;
       
      
      public var list_hero:List = null;
      
      public var pageBar:PageBarS1UI = null;
      
      public var txt_tip:Label = null;
      
      public function SelectYuanJunPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS1UI"] = PageBarS1UI;
         viewClassMap["game.ui.roleTeam.render.SelectYuanJunHeroRenderUI"] = SelectYuanJunHeroRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
