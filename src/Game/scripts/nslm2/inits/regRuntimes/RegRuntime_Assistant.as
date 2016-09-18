package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.assistantModules.renders.AssisFuncRenderUI;
   import nslm2.modules.footstones.assistantModules.renders.AssisFuncRender;
   import game.ui.assistantModules.renders.AssisShenyuanAddRenderUI;
   import nslm2.modules.footstones.assistantModules.subAssistants.shenyuan.renders.AssisShenyuanAddRender;
   import game.ui.assistantModules.renders.AssisShenyuanDelRenderUI;
   import nslm2.modules.footstones.assistantModules.subAssistants.shenyuan.renders.AssisShenyuanDelRender;
   import game.ui.assistantModules.renders.AssisMysShopRenderUI;
   import nslm2.modules.footstones.assistantModules.subAssistants.mysteryshop.renders.AssisMysShopRender;
   
   public class RegRuntime_Assistant
   {
       
      
      public function RegRuntime_Assistant()
      {
         super();
         View.runtimeClassMap[AssisFuncRenderUI] = AssisFuncRender;
         View.runtimeClassMap[AssisShenyuanAddRenderUI] = AssisShenyuanAddRender;
         View.runtimeClassMap[AssisShenyuanDelRenderUI] = AssisShenyuanDelRender;
         View.runtimeClassMap[AssisMysShopRenderUI] = AssisMysShopRender;
      }
   }
}
