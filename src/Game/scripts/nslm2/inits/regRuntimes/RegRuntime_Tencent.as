package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.TencentModule.TencentActivityModuleUI;
   import nslm2.modules.funnies.tencent.TencentActivityModule;
   import game.ui.TencentModule.view.TencentFriendPanelUI;
   import nslm2.modules.funnies.tencent.view.TencentFriendPanel;
   import game.ui.TencentModule.render.TencentActivityLeftTabRenderUI;
   import nslm2.modules.funnies.tencent.render.TencentActivityLeftTabRender;
   import game.ui.TencentModule.render.TencentFriendProgressRenderUI;
   import nslm2.modules.funnies.tencent.render.TencentFriendProgressRender;
   import game.ui.TencentModule.render.TencentFriendProgressRenderFakeUI;
   
   public class RegRuntime_Tencent
   {
       
      
      public function RegRuntime_Tencent()
      {
         super();
         View.runtimeClassMap[TencentActivityModuleUI] = TencentActivityModule;
         View.runtimeClassMap[TencentFriendPanelUI] = TencentFriendPanel;
         View.runtimeClassMap[TencentActivityLeftTabRenderUI] = TencentActivityLeftTabRender;
         View.runtimeClassMap[TencentFriendProgressRenderUI] = TencentFriendProgressRender;
         View.runtimeClassMap[TencentFriendProgressRenderFakeUI] = TencentFriendProgressRender;
      }
   }
}
