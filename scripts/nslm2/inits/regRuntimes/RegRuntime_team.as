package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.teams.listModules.TeamListRenderUI;
   import nslm2.modules.funnies.teams.listModules.TeamListRender;
   import game.ui.teams.details.TeamDetailModuleUI;
   import nslm2.modules.funnies.teams.details.TeamDetailModule;
   import game.ui.teams.details.TeamDetailRenderUI;
   import nslm2.modules.funnies.teams.details.TeamDetailRender;
   import game.ui.teams.details.TeamApplyListUI;
   import nslm2.modules.funnies.teams.details.TeamApplyList;
   import game.ui.teams.details.TeamApplyRenderUI;
   import nslm2.modules.funnies.teams.details.TeamApplyRender;
   import game.ui.teams.details.TeamInviteFriendRenderUI;
   import nslm2.modules.funnies.teams.details.TeamInviteFriendRender;
   import game.ui.teamGuajiScenes.mains.CurChallengePanelUI;
   import nslm2.modules.funnies.teamGuajiScenes.mains.CurChallengePanel;
   import game.ui.teamGuajiScenes.mains.InfoPanelUI;
   import nslm2.modules.funnies.teamGuajiScenes.mains.InfoPanel;
   import game.ui.teamGuajiScenes.mains.RulePanelUI;
   import nslm2.modules.funnies.teamGuajiScenes.mains.RulePanel;
   import game.ui.teamGuajiScenes.changeChallenges.GuajiChangeChallengeRenderUI;
   import nslm2.modules.funnies.teamGuajiScenes.changeChallenges.GuajiChangeChallengeRender;
   import game.ui.teams.details.TeamDetailSmallRenderUI;
   import nslm2.modules.funnies.teams.details.TeamDetailSmallRender;
   import game.ui.teamGuajiScenes.rank.guajiRankingRenderUI;
   import nslm2.modules.funnies.teamGuajiScenes.pvp.rank.GuajiRankListRender;
   import game.ui.teamGuajiScenes.rank.guajiRewardListRenderUI;
   import nslm2.modules.funnies.teamGuajiScenes.pvp.rank.GuajiRewardListRender;
   
   public class RegRuntime_team
   {
       
      
      public function RegRuntime_team()
      {
         super();
         View.runtimeClassMap[TeamListRenderUI] = TeamListRender;
         View.runtimeClassMap[TeamDetailModuleUI] = TeamDetailModule;
         View.runtimeClassMap[TeamDetailRenderUI] = TeamDetailRender;
         View.runtimeClassMap[TeamApplyListUI] = TeamApplyList;
         View.runtimeClassMap[TeamApplyRenderUI] = TeamApplyRender;
         View.runtimeClassMap[TeamInviteFriendRenderUI] = TeamInviteFriendRender;
         View.runtimeClassMap[CurChallengePanelUI] = CurChallengePanel;
         View.runtimeClassMap[InfoPanelUI] = InfoPanel;
         View.runtimeClassMap[RulePanelUI] = RulePanel;
         View.runtimeClassMap[GuajiChangeChallengeRenderUI] = GuajiChangeChallengeRender;
         View.runtimeClassMap[TeamDetailSmallRenderUI] = TeamDetailSmallRender;
         View.runtimeClassMap[guajiRankingRenderUI] = GuajiRankListRender;
         View.runtimeClassMap[guajiRewardListRenderUI] = GuajiRewardListRender;
      }
   }
}
