package nslm2.modules.foundations.activities.utils
{
   import nslm2.modules.foundations.activities.model.ActivityModel;
   import proto.StaticActivity;
   import proto.StaticActivityReward;
   import nslm2.utils.ServerTimer;
   import org.manager.DateUtils;
   import nslm2.utils.Uint64Util;
   import morn.core.managers.timerMgrs.TimerManager;
   
   public class ActivityTimeManager
   {
      
      private static var _ins:nslm2.modules.foundations.activities.utils.ActivityTimeManager;
       
      
      private var _timeStampArr:Array;
      
      public function ActivityTimeManager()
      {
         _timeStampArr = [];
         super();
      }
      
      public static function get ins() : nslm2.modules.foundations.activities.utils.ActivityTimeManager
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.activities.utils.ActivityTimeManager();
         }
         return _ins;
      }
      
      private function get model() : ActivityModel
      {
         return ActivityModel.ins;
      }
      
      public function init() : void
      {
         var _loc6_:* = null;
         var _loc3_:* = null;
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         if(_timeStampArr.length == 0)
         {
            _loc6_ = model.staticActivityMainInfoDict.array;
            var _loc14_:int = 0;
            var _loc13_:* = _loc6_;
            for each(var _loc8_ in _loc6_)
            {
               var _loc12_:int = 0;
               var _loc11_:* = _loc8_.ar;
               for each(var _loc7_ in _loc8_.ar)
               {
                  var _loc10_:int = 0;
                  var _loc9_:* = _loc7_.__function;
                  for each(var _loc5_ in _loc7_.__function)
                  {
                     if(_loc5_.id == 1001)
                     {
                        _loc3_ = ServerTimer.ins.date;
                        _loc2_ = new Date(_loc3_.fullYear,_loc3_.month,_loc3_.date).time / 1000 + Uint64Util.toInt(_loc5_.para1);
                        _loc1_ = new Date(_loc3_.fullYear,_loc3_.month,_loc3_.date).time / 1000 + Uint64Util.toInt(_loc5_.para2);
                        _loc4_ = ServerTimer.ins.second;
                        if(_loc2_ >= _loc4_)
                        {
                           _timeStampArr.push(new Date().time / 1000 + 60);
                        }
                        if(_loc1_ > _loc4_)
                        {
                           _timeStampArr.push(_loc1_);
                        }
                     }
                  }
               }
            }
            _timeStampArr.sort(16);
            timerStart();
         }
      }
      
      public function timerStart() : void
      {
         if(_timeStampArr.length > 0)
         {
            TimerManager.ins.doOnce((_timeStampArr[0] - ServerTimer.ins.second) * 1000,doNext);
         }
      }
      
      public function clear() : void
      {
         _timeStampArr = [];
         TimerManager.ins.clearTimer(doNext);
      }
      
      private function doNext() : void
      {
         _timeStampArr.shift();
         ActivityModel.ins.changeEventTimeRangeState();
         ActivityModel.ins.checkHasCanReward();
         timerStart();
      }
   }
}
