package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.recommendHero.render.RecoHeroGroupRenderUI;
   import nslm2.modules.cultivates.recommendHero.render.RecoHeroGroupRender;
   import game.ui.recommendHero.render.RecoTeamHeroRenderUI;
   import nslm2.modules.cultivates.recommendHero.render.RecoTeamHeroRender;
   import game.ui.recommendHero.render.RecoYuanjunHeroRenderUI;
   import nslm2.modules.cultivates.recommendHero.render.RecoYuanjunHeroRender;
   
   public class RegRuntime_RecommendHero
   {
       
      
      public function RegRuntime_RecommendHero()
      {
         super();
         View.runtimeClassMap[RecoHeroGroupRenderUI] = RecoHeroGroupRender;
         View.runtimeClassMap[RecoTeamHeroRenderUI] = RecoTeamHeroRender;
         View.runtimeClassMap[RecoYuanjunHeroRenderUI] = RecoYuanjunHeroRender;
      }
   }
}
