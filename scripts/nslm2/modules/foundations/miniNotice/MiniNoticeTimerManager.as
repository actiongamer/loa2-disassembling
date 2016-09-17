package nslm2.modules.foundations.miniNotice
{
   import proto.FunctionActionNotify;
   import proto.FunctionActionInfo;
   import nslm2.utils.ServerTimer;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.common.globals.GlobalRef;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class MiniNoticeTimerManager
   {
      
      public static var timerArray:Array = [];
       
      
      public function MiniNoticeTimerManager()
      {
         super();
      }
      
      public static function parseFuncActionNotify(param1:FunctionActionNotify) : void
      {
         if(param1)
         {
            var _loc4_:int = 0;
            var _loc3_:* = param1.actionInfos;
            for each(var _loc2_ in param1.actionInfos)
            {
               if(!(_loc2_.status == 1 || _loc2_.status == 0 && _loc2_.starttime == 0))
               {
                  addTimerInfo(_loc2_);
               }
            }
            if(timerArray.length > 0)
            {
               initTimer();
            }
         }
      }
      
      public static function addTimerInfo(param1:FunctionActionInfo) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(ServerTimer.ins.second < param1.starttime)
         {
            _loc2_ = new FunctionActionInfo();
            _loc2_.funcid = param1.funcid;
            _loc2_.starttime = param1.starttime;
            _loc2_.status = 1;
            timerArray.push(new MiniNoticeTimerVo(param1.starttime,_loc2_));
         }
         if(ServerTimer.ins.second < param1.starttime - 3600)
         {
            _loc3_ = new FunctionActionInfo();
            _loc3_.funcid = param1.funcid;
            _loc3_.starttime = param1.starttime;
            _loc3_.status = 0;
            timerArray.push(new MiniNoticeTimerVo(param1.starttime - 3600,_loc3_));
         }
      }
      
      public static function initTimer() : void
      {
         var _loc1_:int = 0;
         TimerManager.ins.clearTimer(sendNotice);
         timerArray.sortOn("showNoticeTime",16);
         var _loc2_:MiniNoticeTimerVo = timerArray[0];
         var _loc3_:int = _loc2_.showNoticeTime - ServerTimer.ins.second;
         if(_loc3_ <= 0)
         {
            sendNotice();
         }
         else
         {
            _loc1_ = _loc3_ * 1000;
            if(_loc1_ < 0)
            {
               return;
            }
            TimerManager.ins.doOnce(_loc3_ * 1000,sendNotice);
         }
      }
      
      private static function sendNotice() : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc1_:* = null;
         if(timerArray.length > 0)
         {
            if(GlobalRef.mainCityReshowParam.miniNoticeFirstShowed == true)
            {
               _loc2_ = timerArray.length;
               _loc3_ = [];
               _loc4_ = 0;
               while(_loc4_ < _loc2_)
               {
                  _loc1_ = timerArray[_loc4_];
                  if(_loc1_.showNoticeTime - ServerTimer.ins.second < 0 || Math.abs(_loc1_.showNoticeTime - ServerTimer.ins.second) < 5)
                  {
                     MiniNoticeModel.ins.changeStatus(_loc1_.funcActionInfo.funcid,_loc1_.funcActionInfo.status);
                     _loc3_.push(_loc1_.funcActionInfo);
                     _loc4_++;
                     continue;
                  }
                  if(_loc4_ != 0)
                  {
                     timerArray.splice(0,_loc4_);
                  }
                  ObserverMgr.ins.sendNotice("MSG_FUNCTION_ACTION_CHANGED",_loc3_);
                  initTimer();
                  return;
               }
            }
         }
      }
   }
}
