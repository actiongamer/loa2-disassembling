package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.teamGuajiScenes.changeChallenges.GuajiChangeChallengeRenderUI;
   import nslm2.modules.funnies.teamGuajiScenes.changeChallenges.GuajiChangeChallengeRender;
   import game.ui.teamGuajiScenes.mains.GuajiFightLogRenderUI;
   import nslm2.modules.funnies.teamGuajiScenes.mains.renders.GuajiFightLogRender;
   import game.ui.teamGuajiScenes.mains.MemberListRenderUI;
   import nslm2.modules.funnies.teamGuajiScenes.mains.renders.MemberListRender;
   import game.ui.teamGuajiScenes.mains.CurChallengePanelUI;
   import nslm2.modules.funnies.teamGuajiScenes.mains.CurChallengePanel;
   import game.ui.teamGuajiScenes.pvp.saodang.PvPSaoDangMainRenderUI;
   import nslm2.modules.funnies.teamGuajiScenes.pvp.autoRob.PvPSaodangMainRender;
   import game.ui.teamGuajiScenes.pvp.saodang.PvPSaoDangRenderUI;
   import nslm2.modules.funnies.teamGuajiScenes.pvp.autoRob.PvPSaodangRender;
   import game.ui.teamGuajiScenes.pvp.CanGetViewUI;
   import nslm2.modules.funnies.teamGuajiScenes.pvp.CanGetListRender;
   
   public class RegRunTime_TeamGuaji
   {
       
      
      public function RegRunTime_TeamGuaji()
      {
         super();
         View.runtimeClassMap[GuajiChangeChallengeRenderUI] = GuajiChangeChallengeRender;
         View.runtimeClassMap[GuajiFightLogRenderUI] = GuajiFightLogRender;
         View.runtimeClassMap[MemberListRenderUI] = MemberListRender;
         View.runtimeClassMap[CurChallengePanelUI] = CurChallengePanel;
         View.runtimeClassMap[PvPSaoDangMainRenderUI] = PvPSaodangMainRender;
         View.runtimeClassMap[PvPSaoDangRenderUI] = PvPSaodangRender;
         View.runtimeClassMap[CanGetViewUI] = CanGetListRender;
      }
   }
}
