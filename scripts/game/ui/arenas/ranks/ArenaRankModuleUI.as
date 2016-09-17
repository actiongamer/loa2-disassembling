package game.ui.arenas.ranks
{
   import morn.customs.components.PopModuleView;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.VBox;
   import morn.core.components.List;
   import morn.core.components.Label;
   
   public class ArenaRankModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="385" height="520">
			  <PanelBgS3 x="0" y="0" width="385" height="520" frameStyle="2"/>
			  <PageBarS2 x="127.5" y="475" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <VBox x="23" y="209" space="30" align="left" var="boxLines">
			    <Image skin="png.a5.commonImgs.img_splitLine" width="341"/>
			    <Image skin="png.a5.commonImgs.img_splitLine" x="10" y="10" width="341"/>
			    <Image skin="png.a5.commonImgs.img_splitLine" x="20" y="20" width="341"/>
			    <Image skin="png.a5.commonImgs.img_splitLine" x="30" y="30" width="341"/>
			    <Image skin="png.a5.commonImgs.img_splitLine" x="40" y="40" width="341"/>
			    <Image skin="png.a5.commonImgs.img_splitLine" x="50" y="50" width="341"/>
			    <Image skin="png.a5.commonImgs.img_splitLine" x="60" y="60" width="341"/>
			    <Image skin="png.a5.commonImgs.img_splitLine" x="70" y="70" width="341"/>
			    <Image skin="png.a5.commonImgs.img_splitLine" x="80" y="80" width="341"/>
			  </VBox>
			  <ArenaRankTop x="-17" y="36" var="topUI" runtime="game.ui.arenas.ranks.ArenaRankTopUI"/>
			  <List x="21" y="218" var="list" repeatY="8" spaceY="12">
			    <ArenaRankRender name="render" runtime="game.ui.arenas.ranks.ArenaRankRenderUI"/>
			  </List>
			  <Box x="13" y="190">
			    <Label text="\l50200007" autoSize="none" style="加底标题" align="center" width="80" height="18" var="l0"/>
			    <Label text="\l50200021" autoSize="none" x="101" style="加底标题" align="center" width="88" height="18" y="0" var="l1"/>
			    <Label text="\l2035" autoSize="none" x="193" style="加底标题" align="center" width="80" height="18" var="l2" y="0"/>
			    <Label text="\l50200022" autoSize="none" x="253" style="加底标题" align="center" width="112" height="18" var="l3" y="0"/>
			  </Box>
			  <Label text="我的排名：1220" autoSize="none" x="20" y="480" style="普通说明" var="txt_myRank"/>
			</PopModuleView>;
       
      
      public var pageBarUI:PageBarS2UI = null;
      
      public var boxLines:VBox = null;
      
      public var topUI:game.ui.arenas.ranks.ArenaRankTopUI = null;
      
      public var list:List = null;
      
      public var l0:Label = null;
      
      public var l1:Label = null;
      
      public var l2:Label = null;
      
      public var l3:Label = null;
      
      public var txt_myRank:Label = null;
      
      public function ArenaRankModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.arenas.ranks.ArenaRankRenderUI"] = ArenaRankRenderUI;
         viewClassMap["game.ui.arenas.ranks.ArenaRankTopUI"] = game.ui.arenas.ranks.ArenaRankTopUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
