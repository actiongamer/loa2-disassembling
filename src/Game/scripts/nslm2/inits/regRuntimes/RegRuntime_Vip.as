package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.vipModule.render.QQChargeRenderUI;
   import nslm2.modules.foundations.vip.render.QQChargeRender;
   
   public class RegRuntime_Vip
   {
       
      
      public function RegRuntime_Vip()
      {
         super();
         View.runtimeClassMap[QQChargeRenderUI] = QQChargeRender;
      }
   }
}
