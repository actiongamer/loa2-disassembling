package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.heroChooseModules.HeroGroupRenderUI;
   import nslm2.modules.foundations.heroChoose.HeroGroupRender;
   import game.ui.heroChooseModules.HeroChooseRenderUI;
   import nslm2.modules.foundations.heroChoose.HeroChooseRender;
   
   public class RegRunTime_HeroChoose
   {
       
      
      public function RegRunTime_HeroChoose()
      {
         super();
         View.runtimeClassMap[HeroGroupRenderUI] = HeroGroupRender;
         View.runtimeClassMap[HeroChooseRenderUI] = HeroChooseRender;
      }
   }
}
