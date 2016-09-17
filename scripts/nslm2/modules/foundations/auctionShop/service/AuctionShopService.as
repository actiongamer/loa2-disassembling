package nslm2.modules.foundations.auctionShop.service
{
   import nslm2.modules.foundations.auctionShop.model.AuctionShopModel;
   import proto.GetAuctionListReq;
   import nslm2.nets.sockets.ServerEngine;
   import com.netease.protobuf.UInt64;
   import proto.AuctionSellItemReq;
   import proto.ProtocolStatusRes;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import proto.AuctionUnsellItemReq;
   import proto.AuctionBuyItemReq;
   import proto.AuctionSetAutoBidReq;
   import proto.AuctionMyListStatNotify;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class AuctionShopService
   {
      
      private static var _ins:nslm2.modules.foundations.auctionShop.service.AuctionShopService;
      
      private static const AUCTION_SELLBWCNT_LIMIT:int = 300008511;
      
      private static const AUCTION_SELLITEMCNT_LIMIT:int = 300008512;
       
      
      private var model:AuctionShopModel;
      
      public function AuctionShopService()
      {
         model = AuctionShopModel.ins;
         super();
         ServerEngine.ins.addAlwayHandler(8507,AuctionMyListStatNotifyHandler);
      }
      
      public static function get ins() : nslm2.modules.foundations.auctionShop.service.AuctionShopService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.auctionShop.service.AuctionShopService();
         }
         return _ins;
      }
      
      public function reqAuctionList(param1:int, param2:Function) : void
      {
         var _loc3_:GetAuctionListReq = new GetAuctionListReq();
         _loc3_.kind = param1;
         ServerEngine.ins.send(8500,_loc3_,param2);
      }
      
      public function reqMySellList(param1:*) : void
      {
         ServerEngine.ins.send(8505,null,param1);
      }
      
      public function reqMyOrderList(param1:Function) : void
      {
         ServerEngine.ins.send(8504,null,param1);
      }
      
      public function sellItem(param1:UInt64, param2:int, param3:*, param4:int, param5:int, param6:Function, param7:int = 1) : void
      {
         var _loc8_:AuctionSellItemReq = new AuctionSellItemReq();
         _loc8_.id = param1;
         _loc8_.price = param2;
         _loc8_.tmKind = param4;
         _loc8_.sellKind = param5;
         _loc8_.count = param7;
         _loc8_.oncePrice = param3;
         ServerEngine.ins.send(8501,_loc8_,param6,sellErrorHandler);
      }
      
      private function sellErrorHandler(param1:ProtocolStatusRes) : void
      {
         switch(int(param1.errCode) - 300008511)
         {
            case 0:
               AlertUtil.float(LocaleMgr.ins.getStr(300008511,[DefindConsts.treasure_AH_1day_maxSellShengwu]));
               break;
            case 1:
               AlertUtil.float(LocaleMgr.ins.getStr(300008512,[DefindConsts.treasure_AH_1day_maxSellDaoju]));
         }
      }
      
      public function unSellItem(param1:*, param2:*) : void
      {
         var _loc3_:AuctionUnsellItemReq = new AuctionUnsellItemReq();
         _loc3_.id = param1;
         ServerEngine.ins.send(8502,_loc3_,param2);
      }
      
      public function buyItem(param1:UInt64, param2:Boolean, param3:int, param4:*) : void
      {
         var _loc5_:AuctionBuyItemReq = new AuctionBuyItemReq();
         _loc5_.id = param1;
         _loc5_.isAutoBuy = param2;
         _loc5_.priceSetting = param3;
         ServerEngine.ins.send(8503,_loc5_,param4);
      }
      
      public function setOrder(param1:UInt64, param2:int, param3:*) : void
      {
         var _loc4_:AuctionSetAutoBidReq = new AuctionSetAutoBidReq();
         _loc4_.auctionId = param1;
         _loc4_.price = param2;
         ServerEngine.ins.send(8506,_loc4_,param3);
      }
      
      private function AuctionMyListStatNotifyHandler(param1:AuctionMyListStatNotify) : void
      {
         ObserverMgr.ins.sendNotice("auction_notice_refresh_list",param1.kind);
      }
   }
}
