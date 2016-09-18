package game.ui.teams.listModules
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.HBox;
   import morn.core.components.Button;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   
   public class TeamListModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="490" height="512">
			  <PanelBg x="0" y="0" width="490" height="512"/>
			  <Image skin="png.a5.bgs.panelBgs.raw.底板一级二级底九宫格" left="15" right="15" top="40" bottom="60"/>
			  <HBox x="69" y="464" var="box_btns" space="36" align="top">
			    <Button label="新建队伍" style="按钮中绿" var="btn_newteam"/>
			    <Button label="快速加入" style="按钮中绿" var="btn_quickenter" x="121"/>
			    <Button label="指定队伍" x="246" style="按钮中黄" var="btn_enterteam"/>
			  </HBox>
			  <List x="23" y="45" repeatY="4" spaceY="5" var="list_teams" repeatX="2" spaceX="4">
			    <TeamListRender name="render" runtime="game.ui.teams.listModules.TeamListRenderUI"/>
			  </List>
			  <PageBarS2 x="172" y="415" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			</PopModuleView>;
       
      
      public var box_btns:HBox = null;
      
      public var btn_newteam:Button = null;
      
      public var btn_quickenter:Button = null;
      
      public var btn_enterteam:Button = null;
      
      public var list_teams:List = null;
      
      public var pageBarUI:PageBarS2UI = null;
      
      public function TeamListModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.teams.listModules.TeamListRenderUI"] = TeamListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
