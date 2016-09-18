package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.mallModule.render.MallListItemRenderUI;
   import nslm2.modules.foundations.mall.view.render.MallListItemRender;
   import game.ui.mallModule.BannerViewUI;
   import nslm2.modules.foundations.mall.view.MallBannerView;
   import game.ui.mallModule.render.BannerViewRenderUI;
   import nslm2.modules.foundations.mall.view.render.BannerViewRender;
   import game.ui.mallModule.render.MallItemRenderUI;
   import nslm2.modules.foundations.mall.view.render.MallItemWealthRender;
   import game.ui.mallModule.render.MallBannelItemRenderUI;
   import nslm2.modules.foundations.mall.view.render.MallBannelItemRender;
   import game.ui.mallModule.render.MallBuyConfirmItemRenderUI;
   import nslm2.modules.foundations.mall.view.render.MallBuyComfrimItemRender;
   import game.ui.mallModule.render.MallAlertWealthRenderUI;
   import nslm2.modules.foundations.mall.view.render.MallAlertWealthRender;
   
   public class RegRuntime_Mall
   {
       
      
      public function RegRuntime_Mall()
      {
         super();
         View.runtimeClassMap[MallListItemRenderUI] = MallListItemRender;
         View.runtimeClassMap[BannerViewUI] = MallBannerView;
         View.runtimeClassMap[BannerViewRenderUI] = BannerViewRender;
         View.runtimeClassMap[MallItemRenderUI] = MallItemWealthRender;
         View.runtimeClassMap[MallBannelItemRenderUI] = MallBannelItemRender;
         View.runtimeClassMap[MallBuyConfirmItemRenderUI] = MallBuyComfrimItemRender;
         View.runtimeClassMap[MallAlertWealthRenderUI] = MallAlertWealthRender;
      }
   }
}
