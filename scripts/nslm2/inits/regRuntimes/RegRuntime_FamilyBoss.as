package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.familyBosses.FamilyBossHeaderUI;
   import nslm2.modules.funnies.families.familyBosses.view.render.FamilyBossHead;
   import game.ui.familyBosses.render.FamilyBossDmgRankRenderUI;
   import nslm2.modules.funnies.families.familyBosses.view.render.FamilyBossDmgRankRender;
   import game.ui.familyBosses.render.PropBaseRenderUI;
   import nslm2.modules.funnies.families.familyBosses.view.render.FamilyBossPorpRender;
   import game.ui.familyBosses.render.FamilyBossTimeRenderUI;
   import nslm2.modules.funnies.families.familyBosses.view.render.FamilyBossTimeListRender;
   import game.ui.familyBosses.render.FamilyBossDmgRewardRenderUI;
   import nslm2.modules.funnies.families.familyBosses.view.render.DamageRewardListRender;
   import game.ui.familyBosses.render.HornorRankRenderUI;
   import nslm2.modules.funnies.families.familyBosses.view.render.HornorRankListRender;
   import game.ui.familyBosses.render.HornorPlayerRenderUI;
   import nslm2.modules.funnies.families.familyBosses.view.render.HornorRankPlayerRender;
   import game.ui.familyBosses.render.FamilyBossRewardShowRenderUI;
   import nslm2.modules.funnies.families.familyBosses.view.render.DamageRewardShowListRender;
   import game.ui.familyBosses.DamageRewardShowPanelUI;
   import nslm2.modules.funnies.families.familyBosses.view.DamageRewardShowPanel;
   
   public class RegRuntime_FamilyBoss
   {
       
      
      public function RegRuntime_FamilyBoss()
      {
         super();
         View.runtimeClassMap[FamilyBossHeaderUI] = FamilyBossHead;
         View.runtimeClassMap[FamilyBossDmgRankRenderUI] = FamilyBossDmgRankRender;
         View.runtimeClassMap[PropBaseRenderUI] = FamilyBossPorpRender;
         View.runtimeClassMap[FamilyBossTimeRenderUI] = FamilyBossTimeListRender;
         View.runtimeClassMap[FamilyBossDmgRewardRenderUI] = DamageRewardListRender;
         View.runtimeClassMap[HornorRankRenderUI] = HornorRankListRender;
         View.runtimeClassMap[HornorPlayerRenderUI] = HornorRankPlayerRender;
         View.runtimeClassMap[FamilyBossRewardShowRenderUI] = DamageRewardShowListRender;
         View.runtimeClassMap[DamageRewardShowPanelUI] = DamageRewardShowPanel;
      }
   }
}
