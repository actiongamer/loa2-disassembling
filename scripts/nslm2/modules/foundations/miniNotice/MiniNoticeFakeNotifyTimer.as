package nslm2.modules.foundations.miniNotice
{
   import nslm2.utils.ServerTimer;
   import proto.FunctionActionInfo;
   import proto.FunctionActionNotify;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.nets.sockets.ServerEngine;
   
   public class MiniNoticeFakeNotifyTimer
   {
      
      private static var _timerArray:Array = [];
       
      
      public function MiniNoticeFakeNotifyTimer()
      {
         super();
      }
      
      public static function parseArrToFakeNotify(param1:Array) : void
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         _loc3_ = null;
         _loc3_ = null;
         _loc3_ = null;
         var _loc2_:* = null;
         _loc3_ = null;
         _loc3_ = null;
         _loc3_ = null;
         _loc2_ = null;
         var _loc4_:int = param1.length;
         _loc5_ = _loc4_ - 1;
         while(_loc5_ >= 0)
         {
            if(_loc5_ < _loc4_ - 1)
            {
               if(ServerTimer.ins.second <= (param1[_loc5_] as MiniNoticeOpenTimeVo).endTime)
               {
                  if(ServerTimer.ins.second >= (param1[_loc5_] as MiniNoticeOpenTimeVo).startTime)
                  {
                     _loc3_ = new FunctionActionInfo();
                     _loc3_.funcid = (param1[_loc5_] as MiniNoticeOpenTimeVo).funcId;
                     _loc3_.status = 1;
                     _loc3_.starttime = (param1[_loc5_] as MiniNoticeOpenTimeVo).startTime;
                     MiniNoticeModel.ins.eventDict.put(_loc3_.funcid,_loc3_);
                     MiniNoticeTimerManager.addTimerInfo(_loc3_);
                  }
                  else
                  {
                     _loc3_ = new FunctionActionInfo();
                     _loc3_.funcid = (param1[_loc5_] as MiniNoticeOpenTimeVo).funcId;
                     _loc3_.status = 0;
                     _loc3_.starttime = (param1[_loc5_] as MiniNoticeOpenTimeVo).startTime;
                     MiniNoticeModel.ins.eventDict.put(_loc3_.funcid,_loc3_);
                     MiniNoticeTimerManager.addTimerInfo(_loc3_);
                  }
               }
               else if(ServerTimer.ins.second < (param1[_loc5_ + 1] as MiniNoticeOpenTimeVo).startTime)
               {
                  _loc3_ = new FunctionActionInfo();
                  _loc3_.funcid = (param1[_loc5_] as MiniNoticeOpenTimeVo).funcId;
                  _loc3_.status = 0;
                  _loc3_.starttime = (param1[_loc5_ + 1] as MiniNoticeOpenTimeVo).startTime;
                  MiniNoticeModel.ins.eventDict.put(_loc3_.funcid,_loc3_);
                  MiniNoticeTimerManager.addTimerInfo(_loc3_);
               }
               _loc3_ = new FunctionActionInfo();
               _loc3_.funcid = (param1[_loc5_] as MiniNoticeOpenTimeVo).funcId;
               _loc3_.status = 0;
               _loc3_.starttime = (param1[_loc5_ + 1] as MiniNoticeOpenTimeVo).startTime;
               _loc2_ = new FunctionActionNotify();
               _loc2_.actionInfos.push(_loc3_);
               addFakeNotify(new MiniNoticeFakeNotifyVo((param1[_loc5_] as MiniNoticeOpenTimeVo).endTime,_loc2_));
            }
            else
            {
               if(ServerTimer.ins.second <= (param1[_loc5_] as MiniNoticeOpenTimeVo).endTime)
               {
                  if(ServerTimer.ins.second >= (param1[_loc5_] as MiniNoticeOpenTimeVo).startTime)
                  {
                     _loc3_ = new FunctionActionInfo();
                     _loc3_.funcid = (param1[_loc5_] as MiniNoticeOpenTimeVo).funcId;
                     _loc3_.status = 1;
                     _loc3_.starttime = (param1[_loc5_] as MiniNoticeOpenTimeVo).startTime;
                     MiniNoticeModel.ins.eventDict.put(_loc3_.funcid,_loc3_);
                     MiniNoticeTimerManager.addTimerInfo(_loc3_);
                  }
                  else
                  {
                     _loc3_ = new FunctionActionInfo();
                     _loc3_.funcid = (param1[_loc5_] as MiniNoticeOpenTimeVo).funcId;
                     _loc3_.status = 0;
                     _loc3_.starttime = (param1[_loc5_] as MiniNoticeOpenTimeVo).startTime;
                     MiniNoticeModel.ins.eventDict.put(_loc3_.funcid,_loc3_);
                     MiniNoticeTimerManager.addTimerInfo(_loc3_);
                  }
               }
               _loc3_ = new FunctionActionInfo();
               _loc3_.funcid = (param1[_loc5_] as MiniNoticeOpenTimeVo).funcId;
               _loc3_.status = 0;
               _loc3_.starttime = 0;
               _loc2_ = new FunctionActionNotify();
               _loc2_.actionInfos.push(_loc3_);
               addFakeNotify(new MiniNoticeFakeNotifyVo((param1[_loc5_] as MiniNoticeOpenTimeVo).endTime,_loc2_));
            }
            _loc5_--;
         }
      }
      
      public static function addFakeNotify(param1:MiniNoticeFakeNotifyVo) : void
      {
         if(ServerTimer.ins.second < param1.sendFakeNotifyTime)
         {
            _timerArray.push(param1);
         }
         if(_timerArray.length > 0)
         {
            initTimer();
         }
      }
      
      private static function initTimer() : void
      {
         TimerManager.ins.clearTimer(sendNotice);
         _timerArray.sortOn("sendFakeNotifyTime",16);
         var _loc1_:MiniNoticeFakeNotifyVo = _timerArray[0];
         var _loc2_:int = _loc1_.sendFakeNotifyTime - ServerTimer.ins.second;
         if(_loc2_ <= 0)
         {
            sendNotice();
         }
         else
         {
            TimerManager.ins.doOnce(_loc2_ * 1000,sendNotice,false);
         }
      }
      
      private static function sendNotice() : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc1_:* = null;
         _loc4_ = 0;
         if(_timerArray.length > 0)
         {
            _loc2_ = _timerArray.length;
            _loc3_ = [];
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc1_ = _timerArray[_loc4_];
               if(_loc1_.sendFakeNotifyTime - ServerTimer.ins.second < 0 || Math.abs(_loc1_.sendFakeNotifyTime - ServerTimer.ins.second) < 5)
               {
                  _loc3_.push(_loc1_);
               }
               _loc4_++;
            }
            if(_loc3_.length > 0)
            {
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  ServerEngine.ins.cplHandlerBatch.execute(7425,[(_loc3_[_loc4_] as MiniNoticeFakeNotifyVo).notify],false);
                  _loc4_++;
               }
               _timerArray.splice(0,_loc3_.length);
               if(_timerArray.length > 0)
               {
                  initTimer();
               }
            }
         }
      }
   }
}
