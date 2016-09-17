package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.newYears.day38s.Day38ModuleUI;
   import nslm2.modules.funnies.newYears.day38s.Day38Module;
   import game.ui.newYears.day38s.Day38_GiftPanelUI;
   import nslm2.modules.funnies.newYears.day38s.Day38_GiftPanel;
   import game.ui.newYears.day38s.Day38_GiftPanelRenderUI;
   import nslm2.modules.funnies.newYears.day38s.Day38_GiftPanelRender;
   import game.ui.newYears.day38s.Day38_VotePanelUI;
   import nslm2.modules.funnies.newYears.day38s.Day38_VotePanel;
   import game.ui.newYears.day38s.Day38_VoteRenderUI;
   import nslm2.modules.funnies.newYears.day38s.Day38_VoteRender;
   
   public class RegRunTime_Day38
   {
       
      
      public function RegRunTime_Day38()
      {
         super();
         View.runtimeClassMap[Day38ModuleUI] = Day38Module;
         View.runtimeClassMap[Day38_GiftPanelUI] = Day38_GiftPanel;
         View.runtimeClassMap[Day38_GiftPanelRenderUI] = Day38_GiftPanelRender;
         View.runtimeClassMap[Day38_VotePanelUI] = Day38_VotePanel;
         View.runtimeClassMap[Day38_VoteRenderUI] = Day38_VoteRender;
      }
   }
}
