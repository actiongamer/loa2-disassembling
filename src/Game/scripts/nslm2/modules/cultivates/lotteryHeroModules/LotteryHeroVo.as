package nslm2.modules.cultivates.lotteryHeroModules
{
   public class LotteryHeroVo
   {
       
      
      public var lotteryId:int;
      
      public var isFree:Boolean;
      
      public function LotteryHeroVo(param1:int, param2:Boolean = false)
      {
         super();
         lotteryId = param1;
         isFree = param2;
      }
   }
}
