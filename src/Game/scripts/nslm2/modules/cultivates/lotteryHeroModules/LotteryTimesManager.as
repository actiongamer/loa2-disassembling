package nslm2.modules.cultivates.lotteryHeroModules
{
   import proto.LotteryInfoRes;
   import proto.LotteryInfoReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import morn.core.managers.timerMgrs.TimerManager;
   
   public class LotteryTimesManager
   {
      
      private static var _timeStamps:Vector.<int> = new Vector.<int>();
      
      private static var _lastLotteryInfoRes:LotteryInfoRes;
       
      
      public function LotteryTimesManager()
      {
         super();
      }
      
      public static function startCountDown() : void
      {
         var _loc1_:LotteryInfoReq = new LotteryInfoReq();
         ServerEngine.ins.send(4000,_loc1_,server_cpl);
      }
      
      public static function server_cpl(param1:LotteryInfoRes) : void
      {
         var _loc2_:int = 0;
         _timeStamps = new Vector.<int>();
         _lastLotteryInfoRes = param1;
         if(param1.oneCd <= 0 && param1.oneFreeTimes > 0)
         {
            _loc2_ = _loc2_ + 1;
         }
         if(param1.oneCashCd <= 0 && param1.oneCashFreeTimes > 0)
         {
            _loc2_ = _loc2_ + 1;
         }
         NpcFuncService.ins.changeCount(11900,_loc2_);
         TimerManager.ins.clearTimer(countDownCpl);
         checkFreeTimes();
      }
      
      private static function checkFreeTimes() : void
      {
         if(_lastLotteryInfoRes.oneCd > 0 && _lastLotteryInfoRes.oneFreeTimes > 0)
         {
            _timeStamps.push(_lastLotteryInfoRes.oneCd);
         }
         if(_lastLotteryInfoRes.oneCashCd > 0 && _lastLotteryInfoRes.oneCashFreeTimes > 0)
         {
            _timeStamps.push(_lastLotteryInfoRes.oneCashCd);
         }
         startTimer();
      }
      
      private static function startTimer() : void
      {
         var _loc1_:int = _timeStamps.shift();
         if(_loc1_ != 0)
         {
            TimerManager.ins.doOnce(_loc1_ * 1000,countDownCpl);
         }
      }
      
      private static function countDownCpl() : void
      {
         NpcFuncService.ins.countPlusOne(11900);
         startTimer();
      }
   }
}
