package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.newYears.luckTrees.renders.LuckTreeCostRenderUI;
   import nslm2.modules.funnies.newYears.luckTrees.renders.LuckTreeCostRender;
   import game.ui.newYears.luckTrees.renders.LuckTreeShopRenderUI;
   import nslm2.modules.funnies.newYears.luckTrees.renders.LuckTreeShopRender;
   import game.ui.newYears.luckTrees.renders.PersonScoreRenderUI;
   import nslm2.modules.funnies.newYears.luckTrees.renders.PersonScoreRender;
   import game.ui.newYears.luckTrees.renders.PersonTreeBagRenderUI;
   import nslm2.modules.funnies.newYears.luckTrees.renders.PersonTreeBagRender;
   import game.ui.newYears.luckTrees.renders.PersonTreeRewardIconUI;
   import nslm2.modules.funnies.newYears.luckTrees.renders.PersonTreeRewardIcon;
   import game.ui.newYears.luckTrees.renders.WorldTreeRenderUI;
   import nslm2.modules.funnies.newYears.luckTrees.renders.WorldTreeRender;
   
   public class RegRuntime_LuckTree
   {
       
      
      public function RegRuntime_LuckTree()
      {
         super();
         View.runtimeClassMap[LuckTreeCostRenderUI] = LuckTreeCostRender;
         View.runtimeClassMap[LuckTreeShopRenderUI] = LuckTreeShopRender;
         View.runtimeClassMap[PersonScoreRenderUI] = PersonScoreRender;
         View.runtimeClassMap[PersonTreeBagRenderUI] = PersonTreeBagRender;
         View.runtimeClassMap[PersonTreeRewardIconUI] = PersonTreeRewardIcon;
         View.runtimeClassMap[WorldTreeRenderUI] = WorldTreeRender;
      }
   }
}
