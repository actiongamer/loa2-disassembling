package org.manager
{
   import flash.display.Sprite;
   import org.specter3d.utils.HashMap;
   import flash.events.Event;
   import flash.utils.getTimer;
   
   public class TimerManager
   {
      
      private static var _instance:org.manager.TimerManager = null;
       
      
      private var _driver:Sprite;
      
      private var _driverDeltaTime:int;
      
      private var _driverTime:int;
      
      private var _delayCallMap:HashMap;
      
      private var _timeoutMap:HashMap;
      
      private var _uid:uint = 0;
      
      public function TimerManager()
      {
         _driver = new Sprite();
         _delayCallMap = new HashMap();
         _timeoutMap = new HashMap();
         super();
         _driverTime = getTimer();
         _driver.addEventListener("enterFrame",update);
      }
      
      public static function getInstance() : org.manager.TimerManager
      {
         if(_instance == null)
         {
            _instance = new org.manager.TimerManager();
         }
         return _instance;
      }
      
      public function add(param1:int, param2:Function) : void
      {
         if(_delayCallMap.containsKey(param2))
         {
            return;
         }
         var _loc3_:TimerObject = new TimerObject();
         _loc3_.delay = param1;
         _loc3_.callback = param2;
         _delayCallMap.put(param2,_loc3_);
      }
      
      public function remove(param1:Function) : void
      {
         if(!_delayCallMap.containsKey(param1))
         {
            return;
         }
         _delayCallMap.remove(param1);
      }
      
      public function update(param1:Event) : void
      {
         e = param1;
         eachObj = function(param1:TimerObject):void
         {
            param1.deltaTime = param1.deltaTime + _driverDeltaTime;
            if(param1.deltaTime >= param1.delay)
            {
               param1.callback();
               param1.deltaTime = param1.deltaTime - param1.delay;
            }
         };
         eachTimeoutObj = function(param1:TimeoutObject):void
         {
            param1.deltaTime = param1.deltaTime + _driverDeltaTime;
            if(param1.deltaTime >= param1.delay)
            {
               param1.callback.apply(null,param1.arguments);
               param1.callback = null;
               param1.arguments = null;
               _timeoutMap.remove(param1.uid);
            }
         };
         var currentTime:int = getTimer();
         _driverDeltaTime = currentTime - _driverTime;
         _delayCallMap.forEach(eachObj);
         _driverTime = currentTime;
         _timeoutMap.forEach(eachTimeoutObj);
      }
      
      public function setTimeout(param1:Function, param2:int, ... rest) : uint
      {
         if(_uid < 4294967295)
         {
            _uid = Number(_uid) + 1;
         }
         else
         {
            _uid = 1;
         }
         var _loc4_:TimeoutObject = new TimeoutObject();
         _loc4_.uid = _uid;
         _loc4_.callback = param1;
         _loc4_.delay = param2;
         _loc4_.arguments = rest;
         _timeoutMap.put(_uid,_loc4_);
         return _uid;
      }
      
      public function clearTimeout(param1:uint) : void
      {
         var _loc2_:TimeoutObject = _timeoutMap.remove(param1);
         if(_loc2_)
         {
            _loc2_.callback = null;
            _loc2_.arguments = null;
         }
      }
   }
}

class TimerObject
{
    
   
   public var delay:int;
   
   public var callback:Function;
   
   public var deltaTime:int;
   
   function TimerObject()
   {
      super();
   }
}

class TimeoutObject
{
    
   
   public var uid:uint;
   
   public var delay:int;
   
   public var callback:Function;
   
   public var arguments:Array;
   
   public var deltaTime:int;
   
   function TimeoutObject()
   {
      super();
   }
}
