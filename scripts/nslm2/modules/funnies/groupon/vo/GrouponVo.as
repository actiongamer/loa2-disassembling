package nslm2.modules.funnies.groupon.vo
{
   import proto.StaticTuanGouModel;
   import nslm2.modules.funnies.groupon.model.GrouponModel;
   import proto.MapKey32Value32;
   import proto.TuanGouInfo;
   import nslm2.common.vo.WealthVo;
   import nslm2.utils.WealthUtil;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.ServerTimer;
   
   public class GrouponVo
   {
      
      public static const BACK_COUPON_RATE:Number = 0.1;
      
      public static const BACK_SCORE_RATE:Number = 0.1;
      
      public static const STATUS_OPEN:int = 1;
      
      public static const STATUS_PRE_OPEN:int = 2;
      
      public static const STATUS_END:int = 3;
      
      public static const ID:String = "id";
       
      
      public var id:int;
      
      private var _discount:int = 100;
      
      private var _getCouponCnt:int;
      
      private var _discountArr:Array;
      
      private var _buyCount:int;
      
      public var hasBuyCnt:int;
      
      public var staticData:StaticTuanGouModel;
      
      public var _status:int;
      
      public function GrouponVo()
      {
         super();
      }
      
      public function updateStaticData() : void
      {
         var _loc3_:* = null;
         staticData = GrouponModel.ins.getGrouponStatic(id);
         staticData.vip.sortOn(MapKey32Value32.KEY.name,16);
         var _loc2_:Array = staticData.discountRule.split("|");
         _discountArr = [];
         var _loc5_:int = 0;
         var _loc4_:* = _loc2_;
         for each(var _loc1_ in _loc2_)
         {
            _loc3_ = new DiscountVo();
            _loc3_.discount = _loc1_.split(":")[0];
            _loc3_.activateCount = _loc1_.split(":")[1];
            _discountArr.push(_loc3_);
         }
         _discountArr.sortOn("discount",16 | 2);
         updateCurrentDiscount();
      }
      
      public function updateInfo(param1:TuanGouInfo) : void
      {
         buyCount = param1.totalBuyCount;
         hasBuyCnt = param1.buyCount;
      }
      
      public function get nowPrice() : int
      {
         return oriPrice * discount / 100;
      }
      
      public function get maxUseCouponCnt() : int
      {
         return nowPrice * staticData.ticketLimit;
      }
      
      public function get openStamp() : uint
      {
         return staticData.buyStartTm;
      }
      
      public function get endStamp() : uint
      {
         return staticData.buyEndTm;
      }
      
      public function get sellItem() : WealthVo
      {
         return WealthUtil.parseCostStr(staticData.sellRes);
      }
      
      public function get oriPrice() : int
      {
         return WealthUtil.parseCostStr(staticData.costRes,false).count;
      }
      
      public function get discountArr() : Array
      {
         return _discountArr;
      }
      
      public function get discount() : Number
      {
         return _discount;
      }
      
      public function get buyCount() : int
      {
         return _buyCount;
      }
      
      public function set buyCount(param1:int) : void
      {
         if(_buyCount != param1)
         {
            _buyCount = param1;
            updateCurrentDiscount();
         }
      }
      
      private function updateCurrentDiscount() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         _discount = 100;
         var _loc2_:int = _discountArr.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = _discountArr[_loc3_];
            if(_loc1_.activateCount <= _buyCount)
            {
               _discount = _loc1_.discount;
               _loc3_++;
               continue;
            }
            break;
         }
      }
      
      public function get canBuyCnt() : int
      {
         var _loc1_:int = maxBuyCnt;
         return Math.max(0,_loc1_ - hasBuyCnt);
      }
      
      public function get maxBuyCnt() : int
      {
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = staticData.vip.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = staticData.vip[_loc4_];
            if(_loc2_.key <= PlayerModel.ins.vip)
            {
               _loc1_ = _loc2_.value;
               _loc4_++;
               continue;
            }
            break;
         }
         return _loc1_;
      }
      
      public function get nextVipBuyCnt() : MapKey32Value32
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = staticData.vip.length;
         var _loc1_:int = maxBuyCnt;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = staticData.vip[_loc4_];
            if(_loc2_.key > PlayerModel.ins.vip && _loc2_.value > _loc1_)
            {
               return _loc2_;
            }
            _loc4_++;
         }
         return null;
      }
      
      public function get pos() : int
      {
         return staticData.pos;
      }
      
      public function get status() : int
      {
         if(ServerTimer.ins.second >= staticData.buyEndTm)
         {
            return 3;
         }
         if(ServerTimer.ins.second >= staticData.buyStartTm && ServerTimer.ins.second < staticData.buyEndTm)
         {
            return 1;
         }
         return 2;
      }
   }
}
