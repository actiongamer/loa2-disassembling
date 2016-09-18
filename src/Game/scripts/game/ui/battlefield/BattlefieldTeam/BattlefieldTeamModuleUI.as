package game.ui.battlefield.BattlefieldTeam
{
   import morn.customs.components.PopModuleView;
   import game.ui.battlefield.BattlefieldTeam.render.BattlefieldMapInfoRenderUI;
   import game.ui.battlefield.BattlefieldTeam.panel.BattlefieldTeamInfoPanelUI;
   import game.ui.battlefield.BattlefieldTeam.panel.BattlefieldInvitePlayersPanelUI;
   
   public class BattlefieldTeamModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="800" height="550">
			  <PanelBg width="804" height="551" x="0" y="0"/>
			  <BattlefieldMapInfoRender x="375" y="39" var="render_mapInfo" runtime="game.ui.battlefield.BattlefieldTeam.render.BattlefieldMapInfoRenderUI"/>
			  <BattlefieldTeamInfoPanel x="20" y="39" var="ref_panel_teamInfo" runtime="game.ui.battlefield.BattlefieldTeam.panel.BattlefieldTeamInfoPanelUI"/>
			  <BattlefieldInvitePlayersPanel x="377" y="219" var="ref_panel_invitePlayers" runtime="game.ui.battlefield.BattlefieldTeam.panel.BattlefieldInvitePlayersPanelUI"/>
			  <Image skin="png.a5.bgs.panelBgs.img_frameS1" x="16" y="36" sizeGrid="14,18,14,14" width="773" height="503" mouseEnabled="false" mouseChildren="false"/>
			</PopModuleView>;
       
      
      public var render_mapInfo:BattlefieldMapInfoRenderUI = null;
      
      public var ref_panel_teamInfo:BattlefieldTeamInfoPanelUI = null;
      
      public var ref_panel_invitePlayers:BattlefieldInvitePlayersPanelUI = null;
      
      public function BattlefieldTeamModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.battlefield.BattlefieldTeam.panel.BattlefieldInvitePlayersPanelUI"] = BattlefieldInvitePlayersPanelUI;
         viewClassMap["game.ui.battlefield.BattlefieldTeam.panel.BattlefieldTeamInfoPanelUI"] = BattlefieldTeamInfoPanelUI;
         viewClassMap["game.ui.battlefield.BattlefieldTeam.render.BattlefieldMapInfoRenderUI"] = BattlefieldMapInfoRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
