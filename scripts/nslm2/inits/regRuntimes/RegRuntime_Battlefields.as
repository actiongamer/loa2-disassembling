package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.battlefield.render.BattlefieldApplyRenderUI;
   import nslm2.modules.battles.battlefields.renders.BattlefieldApplyRender;
   import game.ui.battlefield.BattlefieldTeam.render.BattlefieldMemberRenderUI;
   import nslm2.modules.battles.battlefields.renders.BattlefieldMemberRender;
   import game.ui.battlefield.BattlefieldTeam.render.BattlefieldMapInfoRenderUI;
   import nslm2.modules.battles.battlefields.renders.BattlefieldMapInfoRender;
   import game.ui.battlefield.BattlefieldTeam.render.BattlefieldInvitePlayersRenderUI;
   import nslm2.modules.battles.battlefields.renders.BattlefieldInvitePlayersRender;
   import game.ui.battlefield.BattlefieldTeam.panel.BattlefieldTeamInfoPanelUI;
   import nslm2.modules.battles.battlefields.panels.BattlefieldTeamInfoPanel;
   import game.ui.battlefield.BattlefieldTeam.panel.BattlefieldInvitePlayersPanelUI;
   import nslm2.modules.battles.battlefields.panels.BattlefieldInvitePlayersPanel;
   import game.ui.battlefield.BattlefieldInvited.render.BattlefieldInvitedRenderUI;
   import nslm2.modules.battles.battlefields.renders.BattlefieldInvitedRender;
   import game.ui.battlefield.render.BattlefieldFunBtnRenderUI;
   import nslm2.modules.battles.battlefields.renders.BattlefieldFunBtnRender;
   import game.ui.battlefield.BattlefieldScene.render.BattlefieldGatherProgressBarUI;
   import nslm2.modules.battles.battlefields.scene.BattlefieldGatherProgressBar;
   import game.ui.battlefield.BattlefieldScene.panel.BattlefieldSceneTopPanelUI;
   import nslm2.modules.battles.battlefields.scene.BattlefieldSceneTopPanel;
   import game.ui.battlefield.BattlefieldScene.panel.BattlefieldMyInfoPanelUI;
   import nslm2.modules.battles.battlefields.scene.BattlefieldMyInfoPanel;
   import game.ui.battlefield.BattlefieldReport.render.BattlefieldReportRenderUI;
   import nslm2.modules.battles.battlefields.renders.BattlefieldReportRender;
   import game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeroRenderUI;
   import nslm2.modules.battles.battlefields.renders.BattlefieldFightResultHeroRender;
   import game.ui.battlefield.BattlefieldReport.render.BattlefieldReportTabRenderUI;
   import nslm2.modules.battles.battlefields.renders.BattlefieldReportTabRender;
   import game.ui.battlefield.BattlefieldScene.panel.BattlefieldCryInfoPanelUI;
   import nslm2.modules.battles.battlefields.panels.BattlefieldCryInfoPanel;
   import game.ui.battlefield.BattlefieldTodayReward.BattlefieldTodayRewardRenderUI;
   import nslm2.modules.battles.battlefields.renders.BattlefieldTodayRewardRender;
   import game.ui.battlefield.BattlefieldRank.render.BattlefieldTabRenderUI;
   import nslm2.modules.battles.battlefields.renders.BattlefieldTabRender;
   import game.ui.battlefield.BattlefieldRank.render.BattlefieldSeasonRenderUI;
   import nslm2.modules.battles.battlefields.renders.BattlefieldSeasonRender;
   import game.ui.battlefield.BattlefieldRankReward.render.BattlefieldRankRewardRenderUI;
   import nslm2.modules.battles.battlefields.renders.BattlefieldRankRewardRender;
   import game.ui.battlefield.BattlefieldRank.render.BattlefieldLocalRankRenderUI;
   import nslm2.modules.battles.battlefields.renders.BattlefieldLocalRankRender;
   import game.ui.battlefield.BattlefieldRank.render.BattlefieldCrossServerRankRenderUI;
   import nslm2.modules.battles.battlefields.renders.BattlefieldCrossServerRankRender;
   import game.ui.battlefield.BattlefieldScene.panel.FlagInfoViewUI;
   import nslm2.modules.battles.battlefields.panels.BattleFieldFlagInfoView;
   import game.ui.battlefield.BattlefieldScene.panel.BattleFieldFlagInfoPanelUI;
   import nslm2.modules.battles.battlefields.panels.BattleFlagInfoPanel;
   
   public class RegRuntime_Battlefields
   {
       
      
      public function RegRuntime_Battlefields()
      {
         super();
         View.runtimeClassMap[BattlefieldApplyRenderUI] = BattlefieldApplyRender;
         View.runtimeClassMap[BattlefieldMemberRenderUI] = BattlefieldMemberRender;
         View.runtimeClassMap[BattlefieldMapInfoRenderUI] = BattlefieldMapInfoRender;
         View.runtimeClassMap[BattlefieldInvitePlayersRenderUI] = BattlefieldInvitePlayersRender;
         View.runtimeClassMap[BattlefieldTeamInfoPanelUI] = BattlefieldTeamInfoPanel;
         View.runtimeClassMap[BattlefieldInvitePlayersPanelUI] = BattlefieldInvitePlayersPanel;
         View.runtimeClassMap[BattlefieldInvitedRenderUI] = BattlefieldInvitedRender;
         View.runtimeClassMap[BattlefieldFunBtnRenderUI] = BattlefieldFunBtnRender;
         View.runtimeClassMap[BattlefieldGatherProgressBarUI] = BattlefieldGatherProgressBar;
         View.runtimeClassMap[BattlefieldSceneTopPanelUI] = BattlefieldSceneTopPanel;
         View.runtimeClassMap[BattlefieldMyInfoPanelUI] = BattlefieldMyInfoPanel;
         View.runtimeClassMap[BattlefieldReportRenderUI] = BattlefieldReportRender;
         View.runtimeClassMap[BattlefieldFightResultHeroRenderUI] = BattlefieldFightResultHeroRender;
         View.runtimeClassMap[BattlefieldReportTabRenderUI] = BattlefieldReportTabRender;
         View.runtimeClassMap[BattlefieldCryInfoPanelUI] = BattlefieldCryInfoPanel;
         View.runtimeClassMap[BattlefieldTodayRewardRenderUI] = BattlefieldTodayRewardRender;
         View.runtimeClassMap[BattlefieldTabRenderUI] = BattlefieldTabRender;
         View.runtimeClassMap[BattlefieldSeasonRenderUI] = BattlefieldSeasonRender;
         View.runtimeClassMap[BattlefieldRankRewardRenderUI] = BattlefieldRankRewardRender;
         View.runtimeClassMap[BattlefieldLocalRankRenderUI] = BattlefieldLocalRankRender;
         View.runtimeClassMap[BattlefieldCrossServerRankRenderUI] = BattlefieldCrossServerRankRender;
         View.runtimeClassMap[FlagInfoViewUI] = BattleFieldFlagInfoView;
         View.runtimeClassMap[BattleFieldFlagInfoPanelUI] = BattleFlagInfoPanel;
      }
   }
}
