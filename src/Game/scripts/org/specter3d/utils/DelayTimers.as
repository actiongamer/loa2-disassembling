package org.specter3d.utils
{
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import flash.events.TimerEvent;
   
   public class DelayTimers
   {
       
      
      protected var _timer:Timer;
      
      protected var _fuc:Function;
      
      protected var _isComplete:Boolean;
      
      protected var _initTime:int;
      
      public function DelayTimers(param1:int, param2:Function)
      {
         super();
         _fuc = param2;
         _timer = new Timer(param1,1);
         _timer.addEventListener("timerComplete",onCompleteHandler);
         _timer.start();
         _initTime = getTimer();
      }
      
      public function updateDelayTime(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(_timer != null && !_isComplete)
         {
            _loc2_ = getTimer() - _initTime;
            _loc3_ = param1 - _loc2_;
            if(_loc3_ > 0)
            {
               _timer.delay = _loc3_;
            }
            else
            {
               onCompleteHandler(null);
            }
            return _loc2_;
         }
         return 0;
      }
      
      private function onCompleteHandler(param1:TimerEvent) : void
      {
         _fuc();
         dispose();
      }
      
      private function delTimer() : void
      {
         _isComplete = true;
         if(_timer != null)
         {
            _timer.stop();
            _timer.removeEventListener("timerComplete",onCompleteHandler);
            _timer = null;
         }
      }
      
      public function dispose() : void
      {
         delTimer();
         _fuc = null;
      }
   }
}
