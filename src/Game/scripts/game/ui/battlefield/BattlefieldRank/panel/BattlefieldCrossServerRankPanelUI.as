package game.ui.battlefield.BattlefieldRank.panel
{
   import morn.customs.components.PanelView;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.List;
   import game.ui.battlefield.BattlefieldRank.render.BattlefieldCrossServerRankRenderUI;
   
   public class BattlefieldCrossServerRankPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="800" height="550">
			  <Image skin="png.uiBattlefields.battlefieldRankModule.img_rankTop" x="232" y="139"/>
			  <List x="233" y="197" repeatY="5" spaceY="32">
			    <Box name="render">
			      <Image skin="png.uiBattlefields.battlefieldTeamModule.img_listBg" x="0" y="0" width="552" height="32"/>
			    </Box>
			  </List>
			  <List x="231" y="196" repeatY="10" spaceY="30.5">
			    <Box name="render">
			      <Image skin="png.a5.commonImgs.splitLines.线" width="552" x="0" y="0" height="2"/>
			    </Box>
			  </List>
			  <PageBarS2 x="440" y="507" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <Label autoSize="none" x="329" y="142" style="加底标题" align="left" text="姓名"/>
			  <Label text="所在服" autoSize="none" x="407" y="142" style="加底标题" align="left"/>
			  <Label text="战力" autoSize="none" x="495" y="142" style="加底标题" align="left"/>
			  <Label text="胜率" autoSize="none" x="646" y="142" style="加底标题" align="left"/>
			  <Label text="胜利" autoSize="none" x="570" y="142" style="加底标题" align="left"/>
			  <Label text="积分" autoSize="none" x="722" y="142" style="加底标题" align="left"/>
			  <Label autoSize="none" x="254" y="142" style="加底标题" align="left" text="排名"/>
			  <List x="233" y="164" repeatY="10" var="list_task">
			    <BattlefieldCrossServerRankRender name="render" runtime="game.ui.battlefield.BattlefieldRank.render.BattlefieldCrossServerRankRenderUI"/>
			  </List>
			  <BattlefieldRankTopPanel x="234" y="41" var="topUI" runtime="game.ui.battlefield.BattlefieldRank.panel.BattlefieldRankTopPanelUI"/>
			</PanelView>;
       
      
      public var pageBarUI:PageBarS2UI = null;
      
      public var list_task:List = null;
      
      public var topUI:game.ui.battlefield.BattlefieldRank.panel.BattlefieldRankTopPanelUI = null;
      
      public function BattlefieldCrossServerRankPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.battlefield.BattlefieldRank.panel.BattlefieldRankTopPanelUI"] = game.ui.battlefield.BattlefieldRank.panel.BattlefieldRankTopPanelUI;
         viewClassMap["game.ui.battlefield.BattlefieldRank.render.BattlefieldCrossServerRankRenderUI"] = BattlefieldCrossServerRankRenderUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
