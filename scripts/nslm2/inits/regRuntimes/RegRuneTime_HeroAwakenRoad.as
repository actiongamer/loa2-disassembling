package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.heroAwakenRoad.HeroAwakenRoadRewardViwUI;
   import nslm2.modules.battles.heroAwakenRoad.view.HeroAwakenRewardView;
   import game.ui.heroAwakenRoad.HeroAwakenStarRenderUI;
   import nslm2.modules.battles.heroAwakenRoad.view.render.HeroAwakenStarRender;
   import game.ui.heroAwakenRoad.HeroAwakenChapterRenderUI;
   import nslm2.modules.battles.heroAwakenRoad.view.render.HeroAwakenChapterRender;
   import game.ui.heroAwakenRoad.saodang.HeroAwakenSaoDangRenderUI;
   import nslm2.modules.battles.heroAwakenRoad.view.saodang.HeroAwakenSaoDangMainRender;
   import game.ui.heroAwakenRoad.HeroAwakenItemRenderUI;
   import nslm2.modules.battles.heroAwakenRoad.view.render.HeroAwakenInfoRewardRender;
   
   public class RegRuneTime_HeroAwakenRoad
   {
       
      
      public function RegRuneTime_HeroAwakenRoad()
      {
         super();
         View.runtimeClassMap[HeroAwakenRoadRewardViwUI] = HeroAwakenRewardView;
         View.runtimeClassMap[HeroAwakenStarRenderUI] = HeroAwakenStarRender;
         View.runtimeClassMap[HeroAwakenChapterRenderUI] = HeroAwakenChapterRender;
         View.runtimeClassMap[HeroAwakenSaoDangRenderUI] = HeroAwakenSaoDangMainRender;
         View.runtimeClassMap[HeroAwakenItemRenderUI] = HeroAwakenInfoRewardRender;
      }
   }
}
