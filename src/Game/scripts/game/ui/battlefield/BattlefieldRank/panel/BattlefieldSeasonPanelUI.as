package game.ui.battlefield.BattlefieldRank.panel
{
   import morn.customs.components.PanelView;
   import morn.core.components.List;
   import game.ui.battlefield.BattlefieldRank.render.BattlefieldSeasonRenderUI;
   
   public class BattlefieldSeasonPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="800" height="550">
			  <List x="238" y="130" repeatY="5" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" width="547" var="list_task" spaceY="-4">
			    <BattlefieldSeasonRender name="render" runtime="game.ui.battlefield.BattlefieldRank.render.BattlefieldSeasonRenderUI"/>
			  </List>
			  <BattlefieldRankTopPanel x="234" y="41" var="topUI" runtime="game.ui.battlefield.BattlefieldRank.panel.BattlefieldRankTopPanelUI"/>
			</PanelView>;
       
      
      public var list_task:List = null;
      
      public var topUI:game.ui.battlefield.BattlefieldRank.panel.BattlefieldRankTopPanelUI = null;
      
      public function BattlefieldSeasonPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.battlefield.BattlefieldRank.panel.BattlefieldRankTopPanelUI"] = game.ui.battlefield.BattlefieldRank.panel.BattlefieldRankTopPanelUI;
         viewClassMap["game.ui.battlefield.BattlefieldRank.render.BattlefieldSeasonRenderUI"] = BattlefieldSeasonRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
