package nslm2.modules.foundations.shop.service
{
   import proto.ShopListReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ShopListRes;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import proto.ShopRefreshReq;
   import proto.ShopRefreshRes;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import proto.ShopBuyReq;
   import proto.BuyDoubleBuyReq;
   import proto.BuyDoubleBuyRes;
   import nslm2.modules.foundations.shop.model.ShopPlusModel;
   import proto.ShopBuyRes;
   import proto.ProtocolStatusRes;
   
   public class ShopService
   {
      
      private static var _ins:nslm2.modules.foundations.shop.service.ShopService;
       
      
      private var _buyShopId:int;
      
      private var _buyNum:int;
      
      public function ShopService()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.foundations.shop.service.ShopService
      {
         if(!_ins)
         {
            _ins = new nslm2.modules.foundations.shop.service.ShopService();
         }
         return _ins;
      }
      
      public function requestList(param1:int, param2:* = null) : void
      {
         var _loc3_:* = null;
         if(!(int(param1) - 11500))
         {
            trace("My Kind");
         }
         else
         {
            _loc3_ = new ShopListReq();
            _loc3_.kind = param1;
            ServerEngine.ins.send(3040,_loc3_,!!param2?param2:server_shopList);
         }
      }
      
      private function server_shopList(param1:ShopListRes) : void
      {
         ShopModel.ins.onDataChange(param1);
      }
      
      public function refresh(param1:int, param2:uint) : void
      {
         var _loc3_:ShopRefreshReq = new ShopRefreshReq();
         _loc3_.kind = param1;
         _loc3_.cost = param2;
         ServerEngine.ins.send(3042,_loc3_,server_shopRefresh);
      }
      
      private function server_shopRefresh(param1:ShopRefreshRes) : void
      {
         ShopModel.ins.refresh(param1);
      }
      
      public function buy(param1:int, param2:int, param3:* = null, param4:StcShopVo = null, param5:int = 0) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(param4 == null || param4.plusData == null)
         {
            _loc6_ = new ShopBuyReq();
            _loc6_.id = param1;
            _loc6_.num = param2;
            _loc6_.pos = param5;
            ServerEngine.ins.send(3041,_loc6_,server_shopBuy,param3);
         }
         else if(param4.plusData && param4.plusData.hasOwnProperty("kind") && param4.plusData.kind == 101)
         {
            _loc7_ = new BuyDoubleBuyReq();
            _loc7_.id = param1;
            _loc7_.num = param2;
            ServerEngine.ins.send(10031,_loc7_,server_shopDoubleBuy,param3);
         }
      }
      
      private function server_shopDoubleBuy(param1:BuyDoubleBuyRes) : void
      {
         ShopPlusModel.INS.onDataChangeOne(param1);
      }
      
      private function server_shopBuy(param1:ShopBuyRes) : void
      {
         ShopModel.ins.onDataChangeOne(param1);
      }
      
      private function mErrorHandler(param1:ProtocolStatusRes) : void
      {
      }
   }
}
