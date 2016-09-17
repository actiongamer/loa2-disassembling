package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.activities.render.ActivityRenderUI;
   import nslm2.modules.foundations.activities.ActivityRender;
   import game.ui.activities.render.ActivityProgressRenderUI;
   import nslm2.modules.foundations.activities.ActivityProgressRender;
   
   public class RegRuntime_Activities
   {
       
      
      public function RegRuntime_Activities()
      {
         super();
         View.runtimeClassMap[ActivityRenderUI] = ActivityRender;
         View.runtimeClassMap[ActivityProgressRenderUI] = ActivityProgressRender;
      }
   }
}
