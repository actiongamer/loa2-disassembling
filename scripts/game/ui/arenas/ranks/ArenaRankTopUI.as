package game.ui.arenas.ranks
{
   import morn.core.components.View;
   
   public class ArenaRankTopUI extends View
   {
      
      protected static var uiView:XML = <View width="418" height="150">
			  <Image skin="png.uiActRank.英雄榜背景图" x="34" y="0"/>
			  <Image skin="png.uiActRank.第一" x="119" y="-31" mouseEnabled="false" width="189" height="170"/>
			  <Image skin="png.uiActRank.第二" x="32" y="-28" mouseEnabled="false"/>
			  <Image skin="png.uiActRank.第三" x="261" y="-17" mouseEnabled="false"/>
			  <ArenaRankTopRender2 x="47" y="13" var="render2" runtime="game.ui.arenas.ranks.ArenaRankTopRender2UI"/>
			  <ArenaRankTopRender x="167" y="39" var="render1" runtime="game.ui.arenas.ranks.ArenaRankTopRenderUI"/>
			  <ArenaRankTopRender2 x="277" y="13" var="render3" runtime="game.ui.arenas.ranks.ArenaRankTopRender2UI"/>
			</View>;
       
      
      public var render2:game.ui.arenas.ranks.ArenaRankTopRender2UI = null;
      
      public var render1:game.ui.arenas.ranks.ArenaRankTopRenderUI = null;
      
      public var render3:game.ui.arenas.ranks.ArenaRankTopRender2UI = null;
      
      public function ArenaRankTopUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.arenas.ranks.ArenaRankTopRender2UI"] = game.ui.arenas.ranks.ArenaRankTopRender2UI;
         viewClassMap["game.ui.arenas.ranks.ArenaRankTopRenderUI"] = game.ui.arenas.ranks.ArenaRankTopRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
