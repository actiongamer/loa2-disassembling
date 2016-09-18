package morn.core.managers.timerMgrs
{
   import flash.display.Shape;
   import flash.utils.Dictionary;
   import flash.events.Event;
   import flash.utils.getTimer;
   import morn.core.handlers.Handler;
   import com.mz.core.errors.ArgClassError;
   import com.mz.core.logging.Log;
   import com.mz.core.utils.DictUtils;
   
   public class TimerManager
   {
      
      private static var _ins:morn.core.managers.timerMgrs.TimerManager;
      
      public static const TIME_OUT:int = 1000;
       
      
      private var _shape:Shape;
      
      private var _handlers:Dictionary;
      
      private var _currTimer:int;
      
      private var _currFrame:int = 0;
      
      private var _count:int = 0;
      
      private var _index:uint = 0;
      
      public var isBusy:Boolean = false;
      
      private var lastNoBusy:int;
      
      private var busyInterval:int = 21;
      
      public var overTimerMs:int;
      
      public function TimerManager()
      {
         _shape = new Shape();
         _handlers = new Dictionary();
         _currTimer = getTimer();
         super();
         _shape.addEventListener("enterFrame",onEnterFrame);
      }
      
      public static function get ins() : morn.core.managers.timerMgrs.TimerManager
      {
         if(_ins == null)
         {
            _ins = new morn.core.managers.timerMgrs.TimerManager();
         }
         return _ins;
      }
      
      public function get currFrame() : int
      {
         return _currFrame;
      }
      
      public function get currTimer() : int
      {
         return _currTimer;
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc4_:* = null;
         _currFrame = Number(_currFrame) + 1;
         var _loc2_:int = getTimer();
         if(_loc2_ - _currTimer > 1000)
         {
            overTimerMs = 0;
            _currTimer = _loc2_;
            return;
         }
         overTimerMs = _loc2_ - _currTimer;
         _currTimer = _loc2_;
         var _loc6_:int = 0;
         var _loc5_:* = _handlers;
         for(var _loc3_ in _handlers)
         {
            _loc4_ = _handlers[_loc3_];
            _loc4_.overFrame = Number(_loc4_.overFrame) + 1;
            if(_loc4_.useFrame == true)
            {
               if(_loc4_.overFrame >= _loc4_.delay)
               {
                  _loc4_.runTimes = Number(_loc4_.runTimes) + 1;
                  _loc4_.overFrame = 0;
                  _loc4_.overTimeMs = overTimerMs;
                  _loc4_.runTimeMs = _loc4_.runTimeMs + overTimerMs;
                  _loc4_.loopOrMs_leave = Number(_loc4_.loopOrMs_leave) - 1;
                  Handler.execute(_loc4_.method,[_loc4_]);
                  if(_loc4_.loopOrMs_total != 0 && _loc4_.loopOrMs_leave <= 0)
                  {
                     endHandlerVo(_loc3_,_loc4_);
                  }
               }
            }
            else
            {
               _loc4_.waitTimeMs = _loc4_.waitTimeMs + overTimerMs;
               while(_loc4_.waitTimeMs >= _loc4_.delay)
               {
                  if(!_loc4_.isDisposed)
                  {
                     _loc4_.runTimes = Number(_loc4_.runTimes) + 1;
                     _loc4_.overFrame = 0;
                     _loc4_.overTimeMs = _loc4_.delay;
                     _loc4_.runTimeMs = _loc4_.runTimeMs + _loc4_.delay;
                     _loc4_.waitTimeMs = _loc4_.waitTimeMs - _loc4_.delay;
                     _loc4_.loopOrMs_leave = _loc4_.loopOrMs_leave - _loc4_.delay;
                     Handler.execute(_loc4_.method,[_loc4_]);
                     if(_loc4_.loopOrMs_total != 0 && _loc4_.loopOrMs_leave <= 0)
                     {
                        endHandlerVo(_loc3_,_loc4_);
                        break;
                     }
                     continue;
                  }
                  break;
               }
            }
         }
      }
      
      private function endHandlerVo(param1:*, param2:TimerHandlerVo) : void
      {
         clearTimer(param1);
         if(param2.method_end)
         {
            Handler.execute(param2.method_end,[param2]);
         }
      }
      
      private function create(param1:Boolean, param2:int, param3:int, param4:*, param5:*, param6:Boolean = true) : Object
      {
         var _loc7_:* = null;
         if(param4 is Function)
         {
            _loc7_ = param4;
         }
         else if(param4 is Handler)
         {
            _loc7_ = (param4 as Handler).method;
         }
         else
         {
            throw new ArgClassError(param4,[Function,Handler]);
         }
         if(param6)
         {
            clearTimer(param4);
         }
         else
         {
            _index = Number(_index) + 1;
            _loc7_ = Number(_index);
         }
         if(param3 < 1)
         {
            Handler.execute(param4,null);
            return -1;
         }
         var _loc8_:TimerHandlerVo = new TimerHandlerVo();
         _loc8_.useFrame = param1;
         _loc8_.loopOrMs_total = param2;
         _loc8_.loopOrMs_leave = param2;
         _loc8_.delay = param3;
         _loc8_.method = param4;
         _loc8_.method_end = param5;
         _handlers[_loc7_] = _loc8_;
         _count = Number(_count) + 1;
         return _loc7_;
      }
      
      public function doOnce(param1:int, param2:*, param3:Boolean = true) : Object
      {
         return create(false,1,param1,param2,null,param3);
      }
      
      public function doLoop(param1:int, param2:*, param3:Boolean = true, param4:int = 0, param5:* = null) : Object
      {
         return create(false,param4,param1,param2,param5,param3);
      }
      
      public function doFrameOnce(param1:int, param2:*, param3:Boolean = true) : Object
      {
         return create(true,1,param1,param2,null,param3);
      }
      
      public function doFrameLoop(param1:int, param2:*, param3:Boolean = true, param4:int = 0, param5:* = null) : Object
      {
         return create(true,param4,param1,param2,param5,param3);
      }
      
      public function get count() : int
      {
         return _count;
      }
      
      public function clearTimer(param1:Object) : void
      {
         var _loc2_:* = undefined;
         if(param1 is Function)
         {
            _loc2_ = param1;
         }
         else if(param1 is Handler)
         {
            _loc2_ = (param1 as Handler).method;
         }
         else if(param1 is int)
         {
            _loc2_ = param1 as int;
         }
         else
         {
            throw new ArgClassError(param1,[Function,Handler,int]);
         }
         var _loc3_:TimerHandlerVo = _handlers[_loc2_];
         if(_loc3_ != null)
         {
            delete _handlers[_loc2_];
            _loc3_.dispose();
            _count = Number(_count) - 1;
         }
      }
      
      public function hasTimer(param1:Function) : Boolean
      {
         var _loc2_:TimerHandlerVo = _handlers[param1];
         if(_loc2_ != null)
         {
            return true;
         }
         return false;
      }
      
      public function test() : void
      {
         Log.debug(this,DictUtils.count(_handlers));
      }
   }
}
