package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.militaryRankInfos.render.MilitaryRenderUI;
   import nslm2.modules.cultivates.militaryInfos.render.MilitaryRender;
   
   public class RegRuntime_Military
   {
       
      
      public function RegRuntime_Military()
      {
         super();
         View.runtimeClassMap[MilitaryRenderUI] = MilitaryRender;
      }
   }
}
