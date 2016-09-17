package nslm2.utils
{
   import com.mz.core.configs.ClientConfig;
   import org.manager.DateUtils;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.nets.sockets.ServerEngine;
   import proto.SystemTimeNotify;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class ServerTimer
   {
      
      private static var _ins:nslm2.utils.ServerTimer;
      
      private static var dateStrDic:Object = {};
       
      
      public var openServerTimeZero:uint;
      
      private var _openServerTime:uint;
      
      private var _second:uint;
      
      public function ServerTimer()
      {
         super();
      }
      
      public static function get ins() : nslm2.utils.ServerTimer
      {
         if(_ins == null)
         {
            _ins = new nslm2.utils.ServerTimer();
         }
         return _ins;
      }
      
      public static function isDuLiRi() : Boolean
      {
         if(ClientConfig.gameId == "160" && nslm2.utils.ServerTimer.ins.date.date == 4 && nslm2.utils.ServerTimer.ins.date.month == 6)
         {
            return true;
         }
         return false;
      }
      
      public static function getDateFormStr(param1:String, param2:Boolean = false) : Number
      {
         var _loc3_:* = NaN;
         var _loc11_:* = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc7_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:Number = NaN;
         if(dateStrDic[param1])
         {
            _loc3_ = Number(dateStrDic[param1]);
         }
         else
         {
            _loc11_ = param1.split(/ |-|:/);
            _loc8_ = _loc11_[0];
            _loc9_ = _loc11_[1];
            _loc10_ = _loc11_[2];
            _loc7_ = _loc11_[3];
            _loc4_ = _loc11_[4];
            _loc6_ = _loc11_[5];
            _loc5_ = RTools.getTimestamp(_loc8_,_loc9_,_loc10_,_loc7_,_loc4_,_loc6_,0);
            dateStrDic[param1] = _loc5_;
            _loc3_ = _loc5_;
         }
         if(param2)
         {
            return _loc3_ / 1000;
         }
         return _loc3_;
      }
      
      public function get openServerTime() : uint
      {
         return _openServerTime;
      }
      
      public function set openServerTime(param1:uint) : void
      {
         var _loc2_:* = null;
         if(_openServerTime != param1)
         {
            _openServerTime = param1;
            _loc2_ = new DateUtils(_openServerTime * 1000);
            _loc2_.hours = 0;
            _loc2_.minutes = 0;
            _loc2_.seconds = 0;
            _loc2_.milliseconds = 0;
            openServerTimeZero = _loc2_.getTime() / 1000;
            openServerTimeZero = RTools.getTimestamp(_loc2_.fullYear,_loc2_.month + 1,_loc2_.date,0,0,0) / 1000;
         }
      }
      
      public function init() : void
      {
         this.second = new Date().time / 1000;
         TimerManager.ins.doLoop(1000,onLoop);
         ServerEngine.ins.addAlwayHandler(2007,server_systemTimeNotify);
      }
      
      public function server_systemTimeNotify(param1:SystemTimeNotify) : void
      {
         DateUtils.timeZone = param1.timeZone;
         TimerManager.ins.doLoop(1000,onLoop);
         this.second = param1.timeStamp;
      }
      
      private function onLoop() : void
      {
         this.second++;
         if(second % 3600 == 0)
         {
            ObserverMgr.ins.sendNotice("time_notice_hour",second);
            if(date.hours == 5)
            {
               ObserverMgr.ins.sendNotice("server_time_notice_5");
            }
         }
      }
      
      public function get curtimeZero() : uint
      {
         var _loc1_:DateUtils = date;
         return RTools.getTimestamp(_loc1_.fullYear,_loc1_.month + 1,_loc1_.date,0,0,0) / 1000;
      }
      
      public function get date() : DateUtils
      {
         var _loc1_:DateUtils = new DateUtils();
         _loc1_.time = second * 1000;
         return _loc1_;
      }
      
      public function get second() : uint
      {
         return _second;
      }
      
      public function set second(param1:uint) : void
      {
         this._second = param1;
      }
      
      public function serverTimeTooltip() : String
      {
         return LocaleMgr.ins.getStr(999000536) + TimeUtils.getFullTimeStrDate(nslm2.utils.ServerTimer.ins.date);
      }
      
      public function isNowInFormStr(param1:String, param2:String) : Boolean
      {
         var _loc3_:Number = getDateFormStr(param1);
         var _loc4_:Number = getDateFormStr(param2);
         return _loc3_ <= second * 1000 && second * 1000 < _loc4_;
      }
      
      public function get openServerDate() : int
      {
         var _loc1_:DateUtils = new DateUtils();
         _loc1_.time = openServerTime * 1000;
         return _loc1_.date;
      }
   }
}
