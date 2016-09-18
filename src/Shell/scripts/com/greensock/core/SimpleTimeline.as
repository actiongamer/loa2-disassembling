package com.greensock.core
{
   public class SimpleTimeline extends com.greensock.core.Animation
   {
       
      
      public var autoRemoveChildren:Boolean;
      
      public var smoothChildTiming:Boolean;
      
      public var _sortChildren:Boolean;
      
      public var _first:com.greensock.core.Animation;
      
      public var _last:com.greensock.core.Animation;
      
      public function SimpleTimeline(param1:Object = null)
      {
         super(0,param1);
         var _loc2_:Boolean = true;
         this.smoothChildTiming = _loc2_;
         this.autoRemoveChildren = _loc2_;
      }
      
      public function insert(param1:*, param2:* = 0) : *
      {
         return add(param1,param2 || 0);
      }
      
      public function add(param1:*, param2:* = "+=0", param3:String = "normal", param4:Number = 0) : *
      {
         var _loc5_:Number = NaN;
         param1._startTime = (Number(param2 || 0)) + param1._delay;
         if(param1._paused)
         {
            if(this != param1._timeline)
            {
               param1._pauseTime = param1._startTime + (rawTime() - param1._startTime) / param1._timeScale;
            }
         }
         if(param1.timeline)
         {
            param1.timeline._remove(param1,true);
         }
         var _loc7_:* = this;
         param1._timeline = _loc7_;
         param1.timeline = _loc7_;
         if(param1._gc)
         {
            param1._enabled(true,true);
         }
         var _loc6_:com.greensock.core.Animation = _last;
         if(_sortChildren)
         {
            _loc5_ = param1._startTime;
            while(_loc6_ && _loc6_._startTime > _loc5_)
            {
               _loc6_ = _loc6_._prev;
            }
         }
         if(_loc6_)
         {
            param1._next = _loc6_._next;
            _loc6_._next = com.greensock.core.Animation(param1);
         }
         else
         {
            param1._next = _first;
            _first = com.greensock.core.Animation(param1);
         }
         if(param1._next)
         {
            param1._next._prev = param1;
         }
         else
         {
            _last = com.greensock.core.Animation(param1);
         }
         param1._prev = _loc6_;
         if(_timeline)
         {
            _uncache(true);
         }
         return this;
      }
      
      public function _remove(param1:com.greensock.core.Animation, param2:Boolean = false) : *
      {
         if(param1.timeline == this)
         {
            if(!param2)
            {
               param1._enabled(false,true);
            }
            if(param1._prev)
            {
               param1._prev._next = param1._next;
            }
            else if(_first === param1)
            {
               _first = param1._next;
            }
            if(param1._next)
            {
               param1._next._prev = param1._prev;
            }
            else if(_last === param1)
            {
               _last = param1._prev;
            }
            var _loc3_:* = null;
            param1.timeline = _loc3_;
            _loc3_ = _loc3_;
            param1._prev = _loc3_;
            param1._next = _loc3_;
            if(_timeline)
            {
               _uncache(true);
            }
         }
         return this;
      }
      
      override public function render(param1:Number, param2:Boolean = false, param3:Boolean = false) : void
      {
         var _loc5_:* = null;
         var _loc4_:* = _first;
         _rawPrevTime = param1;
         _time = param1;
         _totalTime = param1;
         while(_loc4_)
         {
            _loc5_ = _loc4_._next;
            if(_loc4_._active || param1 >= _loc4_._startTime && !_loc4_._paused)
            {
               if(!_loc4_._reversed)
               {
                  _loc4_.render((param1 - _loc4_._startTime) * _loc4_._timeScale,param2,param3);
               }
               else
               {
                  _loc4_.render((!_loc4_._dirty?_loc4_._totalDuration:_loc4_.totalDuration()) - (param1 - _loc4_._startTime) * _loc4_._timeScale,param2,param3);
               }
            }
            _loc4_ = _loc5_;
         }
      }
      
      public function rawTime() : Number
      {
         return _totalTime;
      }
   }
}
