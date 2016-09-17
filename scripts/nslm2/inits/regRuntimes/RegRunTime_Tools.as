package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.logModules.Object3DParamsUI;
   import nslm2.common.ui.components.debug3d.Object3DParams;
   import game.ui.logModules.Param3DRenderUI;
   import nslm2.common.ui.components.debug3d.Param3DRender;
   
   public class RegRunTime_Tools
   {
       
      
      public function RegRunTime_Tools()
      {
         super();
         View.runtimeClassMap[Object3DParamsUI] = Object3DParams;
         View.runtimeClassMap[Param3DRenderUI] = Param3DRender;
      }
   }
}
