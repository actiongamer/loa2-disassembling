package nslm2.modules.foundations.auctionShop
{
   import game.ui.auctionShopModule.AuctionShopModuleViewUI;
   import morn.core.components.ViewStack;
   import nslm2.modules.foundations.auctionShop.model.AuctionShopModel;
   import nslm2.modules.foundations.auctionShop.service.AuctionShopService;
   import proto.AuctionMyOrderRes;
   import proto.GetAuctionListRes;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.auctionShop.view.AuctionBuyView;
   import nslm2.modules.foundations.auctionShop.view.AuctionSellView;
   import nslm2.modules.foundations.auctionShop.view.AuctionOrderView;
   
   public class AuctionShopModule extends AuctionShopModuleViewUI
   {
       
      
      private var vs:ViewStack;
      
      private var model:AuctionShopModel;
      
      private var service:AuctionShopService;
      
      public function AuctionShopModule()
      {
         model = AuctionShopModel.ins;
         service = AuctionShopService.ins;
         super();
         tabBar.labels = [LocaleMgr.ins.getStr(30610001),LocaleMgr.ins.getStr(30610002),LocaleMgr.ins.getStr(30610003)].join(",");
         tabBar.selectHandler = changeTabHandler;
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         AuctionShopService.ins.reqMyOrderList(getMyOderList);
         AuctionShopService.ins.reqAuctionList(1,getItemsSuccess);
      }
      
      private function getMyOderList(param1:AuctionMyOrderRes) : void
      {
         if(param1)
         {
            model.myOrderArr = param1.items;
         }
         else
         {
            model.myOrderArr = [];
         }
      }
      
      private function getItemsSuccess(param1:GetAuctionListRes) : void
      {
         if(param1)
         {
            model.allTreausreArr = param1.items;
         }
         else
         {
            model.allTreausreArr = [];
         }
         moduleServerCpl();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         panelBg.txt_titleName.text = LocaleMgr.ins.getStr(30610000);
         super.preShow(param1);
      }
      
      override public function show(param1:Object = null) : void
      {
         if(param1)
         {
            AuctionShopModel.ins.buyFilterType = int(param1);
         }
         addVs();
         super.show(param1);
      }
      
      private function addVs() : void
      {
         vs = new ViewStack();
         vs.subViewClasses = [AuctionBuyView,AuctionSellView,AuctionOrderView];
         vs.y = 74;
         addChild(vs);
         vs.selectedIndex = 0;
      }
      
      private function changeTabHandler() : void
      {
         vs.selectedIndex = tabBar.selectedIndex;
      }
      
      override public function dispose() : void
      {
         model.dispose();
         super.dispose();
      }
   }
}
