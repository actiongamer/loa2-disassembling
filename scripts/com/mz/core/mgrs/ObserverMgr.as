package com.mz.core.mgrs
{
   import com.mz.core.interFace.IObserver;
   import com.mz.core.utils.ArrayUtil;
   import com.mz.core.interFace.IDispose;
   import flash.events.IEventDispatcher;
   import com.mz.core.event.MzEvent;
   import com.mz.core.logging.Log;
   
   public class ObserverMgr
   {
      
      private static var _ins:com.mz.core.mgrs.ObserverMgr;
       
      
      private var _observers:Vector.<com.mz.core.mgrs.ObserverVo>;
      
      public function ObserverMgr()
      {
         _observers = new Vector.<com.mz.core.mgrs.ObserverVo>();
         super();
      }
      
      public static function get ins() : com.mz.core.mgrs.ObserverMgr
      {
         if(_ins == null)
         {
            _ins = new com.mz.core.mgrs.ObserverMgr();
         }
         return _ins;
      }
      
      public function regObserver(param1:IObserver) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:int = ArrayUtil.indexByAttr(_observers,"observer",param1);
         if(_loc2_ < 0)
         {
            _observers.push(new com.mz.core.mgrs.ObserverVo(param1,param1.getFocusNotices()));
            if(param1 is IDispose && param1 is IEventDispatcher)
            {
               IEventDispatcher(param1).addEventListener("dispose",onObsDispose);
            }
         }
      }
      
      private function onObsDispose(param1:MzEvent) : void
      {
         var _loc2_:IObserver = param1.currentTarget as IObserver;
         unregObserver(_loc2_);
      }
      
      public function createObserver(param1:Class, param2:Array) : IObserver
      {
         var _loc3_:IObserver = new param1() as IObserver;
         regObserver(_loc3_);
         return _loc3_;
      }
      
      public function unregObserver(param1:IObserver) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:int = ArrayUtil.indexByAttr(_observers,"observer",param1);
         if(_loc2_ >= 0)
         {
            _observers.splice(_loc2_,1);
            if(param1 is IDispose && param1 is IEventDispatcher)
            {
               if(IEventDispatcher(param1).hasEventListener("dispose"))
               {
                  IEventDispatcher(param1).removeEventListener("dispose",onObsDispose);
               }
            }
         }
      }
      
      public function sendNotice(param1:String, param2:* = null) : void
      {
         var _loc3_:* = null;
         var _loc7_:int = 0;
         var _loc6_:* = null;
         var _loc4_:Vector.<com.mz.core.mgrs.ObserverVo> = _observers.concat();
         var _loc5_:int = _loc4_.length;
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            _loc3_ = _loc4_[_loc7_];
            _loc6_ = _loc3_.notifyArr;
            if(_loc6_ && _loc6_.indexOf(param1) >= 0)
            {
               _loc3_.observer.handleNotices(param1,param2);
            }
            _loc7_++;
         }
      }
      
      public function test() : void
      {
         Log.debug(this,_observers.length);
      }
   }
}
