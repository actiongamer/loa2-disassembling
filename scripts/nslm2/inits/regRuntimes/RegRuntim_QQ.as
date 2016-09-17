package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.TencentModule.render.QQWeiDuanGiftRenderUI;
   import nslm2.modules.funnies.tencent.render.QQWeiDuanGiftRender;
   import game.ui.TencentModule.render.QQWeiDuanGiftRenderFakeUI;
   
   public class RegRuntim_QQ
   {
       
      
      public function RegRuntim_QQ()
      {
         super();
         View.runtimeClassMap[QQWeiDuanGiftRenderUI] = QQWeiDuanGiftRender;
         View.runtimeClassMap[QQWeiDuanGiftRenderFakeUI] = QQWeiDuanGiftRender;
      }
   }
}
