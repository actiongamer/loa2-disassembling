package game.ui.worldBoss
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.List;
   import game.ui.worldBoss.render.WorldBossRankRenderUI;
   
   public class WorldBossRankUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="812" height="550">
			  <PanelBg x="4" y="-2" width="805" height="550"/>
			  <Image skin="jpg.uiWorldBoss.rankBg" x="19" y="37"/>
			  <Label text="\l41700001" autoSize="none" x="23" style="加底标题" width="96" height="18" align="center" y="47"/>
			  <Label text="\l41700002 " autoSize="none" x="172" style="加底标题" width="117" height="18" align="center" y="47"/>
			  <Label text="\l41700003" autoSize="none" x="356" style="加底标题" width="117" height="18" align="center" y="47"/>
			  <Label text="\l41700004" autoSize="none" x="558" style="加底标题" width="117" height="18" align="center" y="47"/>
			  <Label text="\l41700008 " autoSize="none" x="25" style="普通说明" width="117" align="right" y="502"/>
			  <Label text="2000000" autoSize="none" x="140" style="普通说明" width="117" height="18" align="left" y="502" var="txt_needDamage"/>
			  <Label text="\l41700003 " autoSize="none" x="236" style="普通说明" width="117" align="right" y="502"/>
			  <Label text="200000000" autoSize="none" x="354" style="普通说明" width="117" height="18" align="left" y="502" var="txt_myDamage"/>
			  <Button label="按钮" x="622" style="按钮中绿" y="498" var="btn_getReward"/>
			  <PageBarS2 x="335" y="458" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <List x="24" y="74" repeatY="9" spaceY="2" var="list_rank">
			    <WorldBossRankRender name="render" runtime="game.ui.worldBoss.render.WorldBossRankRenderUI"/>
			  </List>
			  <Label text="\l41700007 " autoSize="none" x="401" style="普通说明" width="117" align="right" y="502"/>
			  <Label text="1234" autoSize="none" x="519" style="普通说明" width="117" height="18" align="left" y="502" var="txt_myRank"/>
			</PopModuleView>;
       
      
      public var txt_needDamage:Label = null;
      
      public var txt_myDamage:Label = null;
      
      public var btn_getReward:Button = null;
      
      public var pageBarUI:PageBarS2UI = null;
      
      public var list_rank:List = null;
      
      public var txt_myRank:Label = null;
      
      public function WorldBossRankUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.worldBoss.render.WorldBossRankRenderUI"] = WorldBossRankRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
