package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.groupon.GrouponDetialViewUI;
   import nslm2.modules.funnies.groupon.view.GrouponDetialPanel;
   import game.ui.groupon.render.GrouponListRenderUI;
   import nslm2.modules.funnies.groupon.view.render.GrouponListRender;
   import game.ui.groupon.render.GrouponProgressBarUI;
   import nslm2.modules.funnies.groupon.view.render.GrouponProgressBar;
   import game.ui.groupon.render.ProgressSplitViewUI;
   import nslm2.modules.funnies.groupon.view.render.ProgressSpliteView;
   import game.ui.groupon.rank.GrouponRewardListRenderUI;
   import nslm2.modules.funnies.groupon.view.rank.GrouponRewardListRender;
   
   public class RegRunTime_Groupon
   {
       
      
      public function RegRunTime_Groupon()
      {
         super();
         View.runtimeClassMap[GrouponDetialViewUI] = GrouponDetialPanel;
         View.runtimeClassMap[GrouponListRenderUI] = GrouponListRender;
         View.runtimeClassMap[GrouponProgressBarUI] = GrouponProgressBar;
         View.runtimeClassMap[ProgressSplitViewUI] = ProgressSpliteView;
         View.runtimeClassMap[GrouponRewardListRenderUI] = GrouponRewardListRender;
      }
   }
}
