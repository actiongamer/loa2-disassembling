package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.worldBoss.WorldBossHeaderUI;
   import nslm2.modules.funnies.worldBoss.view.render.WorldBossHead;
   import game.ui.worldBoss.render.WorldBossDmgRankRenderUI;
   import nslm2.modules.funnies.worldBoss.view.render.WorldBossDmgRankRender;
   import game.ui.worldBoss.render.WorldBossRankRenderUI;
   import nslm2.modules.funnies.worldBoss.view.render.WorldBossRankListRender;
   import game.ui.worldBoss.render.HornorRankRewardRenderUI;
   import nslm2.modules.funnies.worldBoss.view.render.RankRewardRender;
   
   public class RegRunTime_WorldBoss
   {
       
      
      public function RegRunTime_WorldBoss()
      {
         super();
         View.runtimeClassMap[WorldBossHeaderUI] = WorldBossHead;
         View.runtimeClassMap[WorldBossDmgRankRenderUI] = WorldBossDmgRankRender;
         View.runtimeClassMap[WorldBossRankRenderUI] = WorldBossRankListRender;
         View.runtimeClassMap[HornorRankRewardRenderUI] = RankRewardRender;
      }
   }
}
