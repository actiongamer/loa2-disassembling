package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.xunleiGiftModule.XunleiGiftModuleUI;
   import nslm2.modules.funnies.xunleiGifts.XunleiGiftModule;
   import game.ui.xunleiGiftModule.render.XunLeiLeftTabRenderUI;
   import nslm2.modules.funnies.xunleiGifts.render.XunLeiLeftTabRender;
   import game.ui.xunleiGiftModule.render.XunleiLvlUpGiftRenderUI;
   import nslm2.modules.funnies.xunleiGifts.render.XunleiLvlUpGiftRender;
   import game.ui.xunleiGiftModule.view.XunLeiVipLvViewUI;
   import nslm2.modules.funnies.xunleiGifts.view.XunLeiVipLvView;
   
   public class RegRuntime_XunLeiGift
   {
       
      
      public function RegRuntime_XunLeiGift()
      {
         super();
         View.runtimeClassMap[XunleiGiftModuleUI] = XunleiGiftModule;
         View.runtimeClassMap[XunLeiLeftTabRenderUI] = XunLeiLeftTabRender;
         View.runtimeClassMap[XunleiLvlUpGiftRenderUI] = XunleiLvlUpGiftRender;
         View.runtimeClassMap[XunLeiVipLvViewUI] = XunLeiVipLvView;
      }
   }
}
