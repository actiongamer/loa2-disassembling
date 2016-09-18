package game.ui.battlefield.BattlefieldTeam.panel
{
   import morn.customs.components.PanelView;
   import morn.core.components.Tab;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.Button;
   import game.ui.battlefield.BattlefieldTeam.render.BattlefieldInvitePlayersRenderUI;
   
   public class BattlefieldInvitePlayersPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="410" height="310">
			  <Image skin="png.a5.bgs.panelBgs.左底" x="-1" y="43" width="409" height="275"/>
			  <List x="0" y="77" repeatY="3" spaceY="32">
			    <Box name="render">
			      <Image skin="png.uiBattlefields.battlefieldTeamModule.img_listBg"/>
			    </Box>
			  </List>
			  <List x="1.5" y="43" repeatY="8" spaceY="30">
			    <Box name="render">
			      <Image skin="png.a5.commonImgs.splitLines.线" width="407" x="0" y="0" height="2"/>
			    </Box>
			  </List>
			  <Tab labels="\l50500037,\l50500038" x="4" y="-4" style="TAB长" var="tab_players"/>
			  <List x="9" y="51" repeatY="7" var="list_players" spaceY="9">
			    <BattlefieldInvitePlayersRender name="render" runtime="game.ui.battlefield.BattlefieldTeam.render.BattlefieldInvitePlayersRenderUI"/>
			  </List>
			  <Image skin="png.uiBattlefields.battlefieldTeamModule.img_playersTitleBg" x="-1" y="20"/>
			  <Label autoSize="none" x="25" y="23" style="加底标题" align="left" text="\l50500039"/>
			  <Label text="\l50500040" autoSize="none" x="101" y="23" style="加底标题" width="63" align="left" height="20"/>
			  <PageBarS2 x="135" y="281" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <Label text="\l50500041" autoSize="none" x="163" y="23" style="加底标题" width="29" align="left" height="20"/>
			  <Label text="\l50500043" autoSize="none" x="284" y="23" style="加底标题" width="31" align="left" height="20"/>
			  <Label text="\l50500042" autoSize="none" x="223" y="23" style="加底标题" width="29" align="left" height="20"/>
			  <Label text="\l50500044" autoSize="none" x="360" y="23" style="加底标题" width="31" align="left" height="20"/>
			  <Button label="\l30610021" x="311" y="284" style="按钮小蓝" var="btn_refresh"/>
			</PanelView>;
       
      
      public var tab_players:Tab = null;
      
      public var list_players:List = null;
      
      public var pageBarUI:PageBarS2UI = null;
      
      public var btn_refresh:Button = null;
      
      public function BattlefieldInvitePlayersPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.battlefield.BattlefieldTeam.render.BattlefieldInvitePlayersRenderUI"] = BattlefieldInvitePlayersRenderUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
