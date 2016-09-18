package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.arenas.mains.ArenaInfoPanelUI;
   import nslm2.modules.funnies.arenas.mains.ArenaInfoPanel;
   import game.ui.arenas.ranks.ArenaRankModuleUI;
   import nslm2.modules.funnies.arenas.ranks.ArenaRankModule;
   import game.ui.arenas.ranks.ArenaRankRenderUI;
   import nslm2.modules.funnies.arenas.ranks.ArenaRankRender;
   import game.ui.arenas.ranks.ArenaRankTopUI;
   import nslm2.modules.funnies.arenas.ranks.ArenaRankTop;
   import game.ui.arenas.ranks.ArenaRankTopRenderUI;
   import nslm2.modules.funnies.arenas.ranks.ArenaRankTopRender;
   import game.ui.arenas.ranks.ArenaRankTopRender2UI;
   import nslm2.modules.funnies.arenas.ranks.ArenaRankTopRender2;
   import game.ui.arenas.rewards.ArenaRewardModuleUI;
   import nslm2.modules.funnies.arenas.rewards.ArenaRewardModule;
   import game.ui.arenas.rewards.ArenaRewardRenderUI;
   import nslm2.modules.funnies.arenas.rewards.ArenaRewardRender;
   import game.ui.arenas.rewards.ArenaRewardRenderFakeUI;
   import game.ui.arenas.scores.ArenaScoreModuleUI;
   import nslm2.modules.funnies.arenas.scores.ArenaScoreModule;
   import game.ui.arenas.scores.ArenaScoreRenderUI;
   import nslm2.modules.funnies.arenas.scores.ArenaScoreRender;
   import game.ui.arenas.scores.ArenaScoreRenderFakeUI;
   import game.ui.arenas.mains.ArenaReportTipUI;
   import nslm2.modules.funnies.arenas.mains.ArenaReportTip;
   import game.ui.arenas.mains.ArenaReportTipRenderUI;
   import nslm2.modules.funnies.arenas.mains.ArenaReportTipRender;
   
   public class RegRuntime_Arena
   {
       
      
      public function RegRuntime_Arena()
      {
         super();
         View.runtimeClassMap[ArenaInfoPanelUI] = ArenaInfoPanel;
         View.runtimeClassMap[ArenaRankModuleUI] = ArenaRankModule;
         View.runtimeClassMap[ArenaRankRenderUI] = ArenaRankRender;
         View.runtimeClassMap[ArenaRankTopUI] = ArenaRankTop;
         View.runtimeClassMap[ArenaRankTopRenderUI] = ArenaRankTopRender;
         View.runtimeClassMap[ArenaRankTopRender2UI] = ArenaRankTopRender2;
         View.runtimeClassMap[ArenaRewardModuleUI] = ArenaRewardModule;
         View.runtimeClassMap[ArenaRewardRenderUI] = ArenaRewardRender;
         View.runtimeClassMap[ArenaRewardRenderFakeUI] = ArenaRewardRender;
         View.runtimeClassMap[ArenaScoreModuleUI] = ArenaScoreModule;
         View.runtimeClassMap[ArenaScoreRenderUI] = ArenaScoreRender;
         View.runtimeClassMap[ArenaScoreRenderFakeUI] = ArenaScoreRender;
         View.runtimeClassMap[ArenaReportTipUI] = ArenaReportTip;
         View.runtimeClassMap[ArenaReportTipRenderUI] = ArenaReportTipRender;
      }
   }
}
