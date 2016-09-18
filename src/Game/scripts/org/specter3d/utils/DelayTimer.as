package org.specter3d.utils
{
   import flash.utils.Timer;
   import flash.events.TimerEvent;
   
   public class DelayTimer
   {
       
      
      private var _timer:Timer;
      
      private var _fuc:Function;
      
      public function DelayTimer(param1:int, param2:Function)
      {
         super();
         _fuc = param2;
         _timer = new Timer(param1,1);
         _timer.addEventListener("timerComplete",_complete);
         _timer.start();
      }
      
      private function _complete(param1:TimerEvent) : void
      {
         _timer.stop();
         _timer.removeEventListener("timerComplete",_complete);
         _timer = null;
      }
      
      public function dispose() : void
      {
         _fuc = null;
         if(_timer)
         {
            _timer.stop();
            _timer.removeEventListener("timerComplete",_complete);
            _timer = null;
         }
      }
   }
}
