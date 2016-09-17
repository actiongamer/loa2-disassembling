package game.ui.guildModules.invite
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import game.ui.commons.comps.btns.BtnCancelUI;
   import game.ui.commons.comps.btns.BtnOkUI;
   
   public class GuildInviteFriendPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="344" height="471">
			  <PanelBgS3 y="0" width="344" height="471" x="0"/>
			  <List x="20" y="41" repeatY="5" var="list_friend" spaceY="2">
			    <InviteFirendlListRender name="render" runtime="game.ui.guildModules.invite.InviteFirendlListRenderUI"/>
			  </List>
			  <PageBarS2 x="98" y="365" var="pageBar" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <HBox x="65" y="422" space="25">
			    <BtnCancel var="btnCancel" runtime="game.ui.commons.comps.btns.BtnCancelUI"/>
			    <BtnOk x="129" var="btnOk" runtime="game.ui.commons.comps.btns.BtnOkUI"/>
			  </HBox>
			</PopModuleView>;
       
      
      public var list_friend:List = null;
      
      public var pageBar:PageBarS2UI = null;
      
      public var btnCancel:BtnCancelUI = null;
      
      public var btnOk:BtnOkUI = null;
      
      public function GuildInviteFriendPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.btns.BtnCancelUI"] = BtnCancelUI;
         viewClassMap["game.ui.commons.comps.btns.BtnOkUI"] = BtnOkUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.guildModules.invite.InviteFirendlListRenderUI"] = InviteFirendlListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
