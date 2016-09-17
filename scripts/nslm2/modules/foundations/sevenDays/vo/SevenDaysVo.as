package nslm2.modules.foundations.sevenDays.vo
{
   import nslm2.mgrs.stcMgrs.vos.StcSevendayRewardVo;
   import proto.SevenDayLoginInfo;
   import proto.SevenDayShopInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   
   public class SevenDaysVo
   {
       
      
      public var id:int;
      
      public var titleId:int;
      
      public var content:int;
      
      public var loginBonusStatus:int;
      
      public var halfPriceBought:int;
      
      public var myHalfPriceBought:int;
      
      public var halfPriceLimit:int;
      
      public var halfPriceStatus:int;
      
      private var _sdStcVO:StcSevendayRewardVo;
      
      public function SevenDaysVo(param1:int)
      {
         super();
         id = param1;
      }
      
      public function updateInfo(param1:*) : void
      {
         if(param1 as SevenDayLoginInfo)
         {
            loginBonusStatus = (param1 as SevenDayLoginInfo).status;
         }
         else if(param1 as SevenDayShopInfo)
         {
            halfPriceBought = (param1 as SevenDayShopInfo).buyCount;
            myHalfPriceBought = (param1 as SevenDayShopInfo).myBuyCount;
            halfPriceLimit = (param1 as SevenDayShopInfo).limitNum;
            halfPriceStatus = (param1 as SevenDayShopInfo).status;
         }
      }
      
      public function get sdStcVO() : StcSevendayRewardVo
      {
         if(!_sdStcVO)
         {
            _sdStcVO = StcMgr.ins.getSevendayRewardVo(id + 1);
         }
         return _sdStcVO;
      }
   }
}
