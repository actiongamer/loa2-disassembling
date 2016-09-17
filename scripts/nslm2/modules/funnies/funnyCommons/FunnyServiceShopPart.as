package nslm2.modules.funnies.funnyCommons
{
   import flash.events.EventDispatcher;
   import com.mz.core.utils.DictHash;
   import nslm2.utils.ProtoUtils;
   import proto.MineSweepShopInfo;
   import proto.StaticLuckTreeShopModel;
   import nslm2.utils.WealthUtil;
   import nslm2.common.model.PlayerModel;
   
   public class FunnyServiceShopPart extends EventDispatcher
   {
      
      public static const EVT_SHOP_BUY_CPL:String = "EVT_SHOP_BUY_CPL";
       
      
      public var shopBuyInfoDict:DictHash;
      
      public var shopModelGetted:Boolean;
      
      public var shopDict:DictHash;
      
      public function FunnyServiceShopPart()
      {
         shopBuyInfoDict = new DictHash();
         shopDict = new DictHash();
         super();
      }
      
      public function initShopBuyInfo(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         shopBuyInfoDict = new DictHash();
         var _loc2_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = ProtoUtils.toMineSweepShopInfo(param1[_loc4_]);
            shopBuyInfoDict.put(_loc3_.itemId,_loc3_);
            _loc4_++;
         }
      }
      
      public function initShop(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         shopDict = new DictHash();
         param1.sortOn(StaticLuckTreeShopModel.ID.name,16);
         var _loc2_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = param1[_loc4_];
            shopDict.put(_loc3_.id,_loc3_);
            _loc4_++;
         }
         shopModelGetted = _loc2_ > 0;
      }
      
      public function getShopModel(param1:int) : StaticLuckTreeShopModel
      {
         if(shopDict)
         {
            return shopDict.getValue(param1);
         }
         return null;
      }
      
      public function getBuyedTimes(param1:int) : int
      {
         var _loc2_:MineSweepShopInfo = shopBuyInfoDict.getValue(param1);
         if(_loc2_)
         {
            return _loc2_.buyNum;
         }
         return 0;
      }
      
      public function hasLeftToBuy(param1:int) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:StaticLuckTreeShopModel = shopDict.getValue(param1);
         if(_loc3_.limit == 0)
         {
            return true;
         }
         _loc2_ = shopBuyInfoDict.getValue(param1);
         if(_loc2_ && _loc2_.buyNum >= _loc3_.limit)
         {
            return false;
         }
         return true;
      }
      
      public function getCanBuyMaxCount(param1:int) : int
      {
         var _loc3_:int = 0;
         var _loc6_:int = 0;
         var _loc4_:StaticLuckTreeShopModel = shopDict.getValue(param1);
         var _loc5_:Array = WealthUtil.costStrToArr(_loc4_.cost);
         var _loc2_:int = 999;
         _loc6_ = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc2_ = Math.min(_loc2_,PlayerModel.ins.getCountByWealthVo(_loc5_[_loc6_]) / _loc5_[_loc6_].count);
            _loc6_++;
         }
         if(_loc4_.limit != 0)
         {
            _loc3_ = _loc4_.limit - this.getBuyedTimes(param1);
            return Math.min(_loc2_,_loc3_);
         }
         return _loc2_;
      }
      
      public function hasItemCanBuy() : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:Array = shopDict.array;
         var _loc1_:int = _loc2_.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(getCanBuyMaxCount((_loc2_[_loc3_] as StaticLuckTreeShopModel).id) > 0)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
   }
}
