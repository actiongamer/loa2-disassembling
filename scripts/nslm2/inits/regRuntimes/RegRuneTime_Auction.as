package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.auctionShopModule.render.AuctionListRenderUI;
   import nslm2.modules.foundations.auctionShop.view.render.AuctionListRender;
   import game.ui.auctionShopModule.render.AuctionItemListRenderUI;
   import nslm2.modules.foundations.auctionShop.view.render.AuctionItemListRender;
   import game.ui.auctionShopModule.render.SortLableUI;
   import nslm2.modules.foundations.auctionShop.view.render.SortLabelRender;
   import game.ui.auctionShopModule.render.MyOrderListRenderUI;
   import nslm2.modules.foundations.auctionShop.view.render.AuctionOrderListRender;
   import game.ui.auctionShopModule.AuctionSellListViewUI;
   import nslm2.modules.foundations.auctionShop.view.AuctionSellListView;
   
   public class RegRuneTime_Auction
   {
       
      
      public function RegRuneTime_Auction()
      {
         super();
         View.runtimeClassMap[AuctionListRenderUI] = AuctionListRender;
         View.runtimeClassMap[AuctionItemListRenderUI] = AuctionItemListRender;
         View.runtimeClassMap[SortLableUI] = SortLabelRender;
         View.runtimeClassMap[MyOrderListRenderUI] = AuctionOrderListRender;
         View.runtimeClassMap[AuctionSellListViewUI] = AuctionSellListView;
      }
   }
}
