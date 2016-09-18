package com.game.plot.script
{
   import flash.utils.Timer;
   import flash.events.TimerEvent;
   import com.mz.core.interFace.IDispose;
   
   public class Scripts extends BaseScript
   {
      
      public static const MEAN_WHILE:String = "mean_while";
      
      public static const QUEUE:String = "queue";
      
      public static const GAP:String = "gap";
      
      public static const CUSTOM:String = "custom";
       
      
      public var _playMode:Object;
      
      private var _currentIndex:uint;
      
      private var _timerFinishNum:uint;
      
      private var _vos:Vector.<com.game.plot.script.IScript>;
      
      private var _callBack:Function;
      
      private var _callBackParams:Array;
      
      public var _gapTime:Number;
      
      private var _gapTimer:Timer;
      
      public function Scripts(param1:Object = null, param2:Function = null, param3:Array = null, param4:Object = "queue")
      {
         super();
         _callBack = param2;
         _callBackParams = param3;
         if(param4 is Number || param4 is uint || param4 is int)
         {
            _playMode = "gap";
            _gapTime = Number(param4);
         }
         else
         {
            _playMode = param4;
         }
         pushScript(param1);
      }
      
      public function get currentIndex() : uint
      {
         return _currentIndex;
      }
      
      public function get totalIndex() : uint
      {
         if(_vos)
         {
            return _vos.length;
         }
         return 0;
      }
      
      public function pushScript(param1:Object) : void
      {
         if(!_vos)
         {
            _vos = new Vector.<com.game.plot.script.IScript>();
         }
         if(param1 is Vector.<com.game.plot.script.IScript>)
         {
            _vos = _vos.concat(param1 as Vector.<com.game.plot.script.IScript>);
         }
         else if(param1 is com.game.plot.script.IScript)
         {
            _vos.push(param1);
         }
         else if(param1 is Array)
         {
            var _loc4_:int = 0;
            var _loc3_:* = param1 as Array;
            for each(var _loc2_ in param1 as Array)
            {
               if(_loc2_ != null)
               {
                  _vos.push(_loc2_);
               }
            }
         }
      }
      
      override protected function playHandle() : void
      {
         _currentIndex = 0;
         if(_playMode == "mean_while")
         {
            if(_debug != null)
            {
            }
            var _loc3_:int = 0;
            var _loc2_:* = _vos;
            for each(var _loc1_ in _vos)
            {
               _loc1_.addEventListener("script_over",scriptOver);
               if(_debug != null)
               {
               }
               _loc1_.play();
            }
         }
         else if(_playMode == "queue")
         {
            if(_debug != null)
            {
            }
            getCurScript().addEventListener("script_over",scriptOver);
            getCurScript().play();
         }
         else if(_playMode == "gap")
         {
            _timerFinishNum = 0;
            if(!_gapTimer)
            {
               _gapTimer = new Timer(_gapTime * 1000);
            }
            _gapTimer.addEventListener("timer",timerHandle);
            _gapTimer.start();
            getCurScript().addEventListener("script_over",timerScriptOver);
            getCurScript().play();
         }
      }
      
      override protected function canPlay() : Boolean
      {
         return _vos && _vos.length > 0;
      }
      
      private function disposeTimer() : void
      {
         if(_gapTimer)
         {
            _gapTimer.removeEventListener("timer",timerHandle);
            _gapTimer.stop();
            _gapTimer = null;
         }
      }
      
      private function timerHandle(param1:TimerEvent) : void
      {
         if(_currentIndex < _vos.length - 1)
         {
            _currentIndex = Number(_currentIndex) + 1;
            getCurScript().addEventListener("script_over",timerScriptOver);
            getCurScript().play();
         }
         else
         {
            disposeTimer();
         }
      }
      
      private function timerScriptOver(param1:ScriptEvent) : void
      {
         (param1.target as com.game.plot.script.IScript).removeEventListener("script_over",scriptOver);
         (param1.target as com.game.plot.script.IScript).stop();
         _timerFinishNum = Number(_timerFinishNum) + 1;
         if(_timerFinishNum == _vos.length - 1)
         {
            if(_callBack != null)
            {
               _callBack.apply(null,_callBackParams);
            }
            finish();
         }
      }
      
      override protected function stopHandle() : void
      {
         if(_playMode == "mean_while")
         {
            var _loc3_:int = 0;
            var _loc2_:* = _vos;
            for each(var _loc1_ in _vos)
            {
               _loc1_.removeEventListener("script_over",scriptOver);
               _loc1_.stop();
            }
         }
         else if(_playMode == "queue")
         {
            getCurScript().removeEventListener("script_over",scriptOver);
            getCurScript().stop();
         }
      }
      
      private function scriptOver(param1:ScriptEvent) : void
      {
         if(_debug != null)
         {
         }
         (param1.target as com.game.plot.script.IScript).removeEventListener("script_over",scriptOver);
         (param1.target as com.game.plot.script.IScript).stop();
         if(_currentIndex == _vos.length - 1)
         {
            if(_callBack != null)
            {
               _callBack.apply(null,_callBackParams);
            }
            finish();
         }
         else
         {
            _currentIndex = Number(_currentIndex) + 1;
            if(_playMode == "queue")
            {
               if(_debug != null)
               {
               }
               getCurScript().addEventListener("script_over",scriptOver);
               getCurScript().play();
            }
         }
      }
      
      private function getCurScript() : com.game.plot.script.IScript
      {
         return _vos[_currentIndex];
      }
      
      override protected function free() : void
      {
         disposeTimer();
         _callBack = null;
         _callBackParams = null;
         _playMode = null;
         var _loc3_:int = 0;
         var _loc2_:* = _vos;
         for each(var _loc1_ in _vos)
         {
            if(_loc1_ is IDispose)
            {
               (_loc1_ as IDispose).dispose();
            }
         }
         _vos = null;
      }
      
      override public function toString() : String
      {
         var _loc1_:String = !!_debug?_debug:"";
         return _loc1_ + ":" + "Script组:{\n" + _vos.join(",\n") + "\n}";
      }
   }
}
