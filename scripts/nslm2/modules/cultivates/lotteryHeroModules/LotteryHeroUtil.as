package nslm2.modules.cultivates.lotteryHeroModules
{
   import proto.LotteryInfoRes;
   import proto.LotteryRandRes;
   
   public class LotteryHeroUtil
   {
       
      
      public function LotteryHeroUtil()
      {
         super();
      }
      
      public static function ptRandToInfo(param1:LotteryRandRes, param2:LotteryInfoRes) : LotteryInfoRes
      {
         var _loc3_:* = param2;
         _loc3_.oneCd = param1.oneCd;
         _loc3_.oneTime = param1.oneTime;
         _loc3_.oneFreeTimes = param1.oneFreeTimes;
         _loc3_.oneCashCd = param1.oneCashCd;
         _loc3_.oneCashTime = param1.oneCashTime;
         _loc3_.oneCashFreeTimes = param1.oneCashFreeTimes;
         _loc3_.hasfirst = param1.hasfirst;
         if(param1.hasIsFirstOne)
         {
            _loc3_.isFirstOne = param1.isFirstOne;
         }
         if(param1.hasIsFirstCashOne)
         {
            _loc3_.isFirstCashOne = param1.isFirstCashOne;
         }
         if(param1.hasIsFirstCashTen)
         {
            _loc3_.isFirstCashTen = param1.isFirstCashTen;
         }
         if(param1.hasCashYuLiang)
         {
            _loc3_.cashYuLiang = param1.cashYuLiang;
         }
         if(param1.hasPoint)
         {
            _loc3_.point = param1.point;
         }
         if(param1.hasQuality)
         {
            _loc3_.quality = param1.quality;
         }
         return _loc3_;
      }
   }
}
