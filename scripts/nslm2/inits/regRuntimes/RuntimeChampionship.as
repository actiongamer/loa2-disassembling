package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.championship.comp.ProgressLine1UI;
   import nslm2.modules.funnies.championShip.view.comp.ProgressLine1;
   import game.ui.championship.comp.ProgressLine2UI;
   import nslm2.modules.funnies.championShip.view.comp.ProgressLine2;
   import game.ui.championship.comp.ProgressLine3UI;
   import nslm2.modules.funnies.championShip.view.comp.ProgressLine3;
   import game.ui.championship.comp.ProgressLine4UI;
   import nslm2.modules.funnies.championShip.view.comp.ProgressLine4;
   import game.ui.championship.comp.ProgressLine5UI;
   import nslm2.modules.funnies.championShip.view.comp.ProgressLine5;
   import game.ui.championship.comp.GroupListRenderUI;
   import nslm2.modules.funnies.championShip.view.comp.GroupListRender;
   import game.ui.championship.comp.PlayerListRenderUI;
   import nslm2.modules.funnies.championShip.view.comp.PlayerListRender;
   import game.ui.championship.comp.CompePlayerShowViewUI;
   import nslm2.modules.funnies.championShip.view.comp.CompePlayerShowRender;
   import game.ui.championship.comp.FightReportListRenderUI;
   import nslm2.modules.funnies.championShip.view.comp.FightReportListRender;
   import game.ui.championship.comp.RewardListRenderUI;
   import nslm2.modules.funnies.championShip.view.comp.ChampionRewardListRender;
   import game.ui.championship.comp.GambleRecordListRenderUI;
   import nslm2.modules.funnies.championShip.view.comp.ChampionGambleRecordListRender;
   import game.ui.championship.comp.CompeteRecordListRenderUI;
   import nslm2.modules.funnies.championShip.view.comp.ChampionComepteRecordListRender;
   
   public class RuntimeChampionship
   {
       
      
      public function RuntimeChampionship()
      {
         super();
         View.runtimeClassMap[ProgressLine1UI] = ProgressLine1;
         View.runtimeClassMap[ProgressLine2UI] = ProgressLine2;
         View.runtimeClassMap[ProgressLine3UI] = ProgressLine3;
         View.runtimeClassMap[ProgressLine4UI] = ProgressLine4;
         View.runtimeClassMap[ProgressLine5UI] = ProgressLine5;
         View.runtimeClassMap[GroupListRenderUI] = GroupListRender;
         View.runtimeClassMap[PlayerListRenderUI] = PlayerListRender;
         View.runtimeClassMap[CompePlayerShowViewUI] = CompePlayerShowRender;
         View.runtimeClassMap[FightReportListRenderUI] = FightReportListRender;
         View.runtimeClassMap[RewardListRenderUI] = ChampionRewardListRender;
         View.runtimeClassMap[GambleRecordListRenderUI] = ChampionGambleRecordListRender;
         View.runtimeClassMap[CompeteRecordListRenderUI] = ChampionComepteRecordListRender;
      }
   }
}
