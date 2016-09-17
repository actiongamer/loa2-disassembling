package nslm2.modules.funnies.groupon.vo
{
   import nslm2.common.vo.WealthVo;
   
   public class GrouponBuyInfo
   {
       
      
      public var id:int;
      
      public var diamond:int;
      
      public var coupon:int;
      
      public var item:WealthVo;
      
      public var canBuyCnt:int;
      
      public var wealthKind:int;
      
      public var canGetCouponCnt:int;
      
      public var canGetScoreCnt:int;
      
      public function GrouponBuyInfo()
      {
         super();
      }
   }
}
