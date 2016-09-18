package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.recycleModules.heroMirror.HeroHeadItemViewUI;
   import nslm2.modules.foundations.recycle.view.panel.heroMirror.HeroHeadItemView;
   
   public class RegRuntime_Recycle
   {
       
      
      public function RegRuntime_Recycle()
      {
         super();
         View.runtimeClassMap[HeroHeadItemViewUI] = HeroHeadItemView;
      }
   }
}
