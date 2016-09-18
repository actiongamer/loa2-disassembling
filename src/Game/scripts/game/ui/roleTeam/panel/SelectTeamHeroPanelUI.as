package game.ui.roleTeam.panel
{
   import morn.customs.components.PanelView;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS1UI;
   import game.ui.roleTeam.render.SelectTeamHeroRenderUI;
   
   public class SelectTeamHeroPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="374" height="461">
			  <GRect fillAlpha="0" radius="0,0,0,0" lineAlpha="0" x="-121" y="-42" width="792" height="551"/>
			  <PanelBgS3 width="374" height="461" frameStyle="2" x="0" y="0"/>
			  <List y="43" repeatY="4" spaceY="1" var="list_hero" left="21" right="21" x="18">
			    <SelectTeamHeroRender name="render" runtime="game.ui.roleTeam.render.SelectTeamHeroRenderUI"/>
			  </List>
			  <PageBarS1 x="143" y="415" var="pageBar" runtime="game.ui.commons.comps.pageBars.PageBarS1UI"/>
			</PanelView>;
       
      
      public var list_hero:List = null;
      
      public var pageBar:PageBarS1UI = null;
      
      public function SelectTeamHeroPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS1UI"] = PageBarS1UI;
         viewClassMap["game.ui.roleTeam.render.SelectTeamHeroRenderUI"] = SelectTeamHeroRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
