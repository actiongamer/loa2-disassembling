package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.shopModules.render.GeneralShopRenderUI;
   import nslm2.modules.foundations.shop.comp.GeneralShopRender;
   import game.ui.shopModules.render.MysteryShopRenderUI;
   import nslm2.modules.foundations.shop.comp.MysteryShopRender;
   import game.ui.shopModules.render.ShopRefreshRenderUI;
   import nslm2.modules.foundations.shop.comp.ShopRefreshRender;
   import game.ui.shopModules.render.ShopBuyRenderUI;
   import nslm2.modules.foundations.shop.comp.ShopBuyRender;
   import game.ui.shopModules.render.GeneralShopFakeRenderUI;
   
   public class RegRuntime_Shop
   {
       
      
      public function RegRuntime_Shop()
      {
         super();
         View.runtimeClassMap[GeneralShopRenderUI] = GeneralShopRender;
         View.runtimeClassMap[MysteryShopRenderUI] = MysteryShopRender;
         View.runtimeClassMap[ShopRefreshRenderUI] = ShopRefreshRender;
         View.runtimeClassMap[ShopBuyRenderUI] = ShopBuyRender;
         View.runtimeClassMap[GeneralShopFakeRenderUI] = GeneralShopRender;
      }
   }
}
