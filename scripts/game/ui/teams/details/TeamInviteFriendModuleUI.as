package game.ui.teams.details
{
   import morn.customs.components.PopModuleView;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import game.ui.commons.comps.btns.BtnOkUI;
   import game.ui.commons.comps.btns.BtnCancelUI;
   import morn.core.components.List;
   
   public class TeamInviteFriendModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="344" height="471">
			  <PanelBgS3 y="0" width="344" height="471" x="0"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="13" y="39" width="315" height="364" sizeGrid="20,20,20,20" left="13" right="13" top="33" bottom="60"/>
			  <PageBarS2 x="98" y="365" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <HBox y="425" space="25" centerX="0">
			    <BtnOk var="btnOk" runtime="game.ui.commons.comps.btns.BtnOkUI"/>
			    <BtnCancel var="btnCancel" x="127" runtime="game.ui.commons.comps.btns.BtnCancelUI"/>
			  </HBox>
			  <List x="18" y="49" repeatY="5" var="list_friend">
			    <TeamInviteFriendRender name="render" runtime="game.ui.teams.details.TeamInviteFriendRenderUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var pageBarUI:PageBarS2UI = null;
      
      public var btnOk:BtnOkUI = null;
      
      public var btnCancel:BtnCancelUI = null;
      
      public var list_friend:List = null;
      
      public function TeamInviteFriendModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.btns.BtnCancelUI"] = BtnCancelUI;
         viewClassMap["game.ui.commons.comps.btns.BtnOkUI"] = BtnOkUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.teams.details.TeamInviteFriendRenderUI"] = TeamInviteFriendRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
