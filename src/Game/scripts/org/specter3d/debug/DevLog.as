package org.specter3d.debug
{
   import flash.events.EventDispatcher;
   import org.specter3d.events.LogEvent;
   import com.mz.core.logging.Log;
   
   public final class DevLog extends EventDispatcher
   {
      
      public static const ALL:String = "all_log";
      
      public static const ENGINE:String = "engine";
      
      public static const ASYNC_LOAD:String = "async_load";
      
      private static var _developers:String;
      
      public static var version:Number = 1.1;
      
      private static var _instance:org.specter3d.debug.DevLog;
      
      private static var _debugERROR:Function;
      
      private static var _debugNet:Function;
      
      private static var _debugLog:Function;
       
      
      private const SINGLETON_MSG:String = "Log Singleton already constructed!";
      
      public function DevLog()
      {
         super();
         if(_instance)
         {
            throw Error("Log Singleton already constructed!");
         }
      }
      
      public static function set debugERROR(param1:Function) : void
      {
         _debugERROR = param1;
      }
      
      public static function sendDebugError(param1:String, param2:Boolean = false) : void
      {
         if(_debugERROR != null)
         {
            _debugERROR(param1,param2);
         }
      }
      
      public static function set debugNet(param1:Function) : void
      {
         _debugNet = param1;
      }
      
      public static function sendDebugNet(param1:String, param2:Boolean = false) : void
      {
         if(_debugNet != null)
         {
            _debugNet(param1,param2);
         }
      }
      
      public static function set debugLog(param1:Function) : void
      {
         _debugLog = param1;
      }
      
      public static function sendDebugLog(param1:String, param2:Boolean = false) : void
      {
         if(_debugLog != null)
         {
            _debugLog(param1,param2);
         }
      }
      
      public static function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         instance.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public static function debug(param1:String, param2:* = null) : void
      {
         if(developers == param1 || developers == "all_log")
         {
            trace("[debug]",param2.toString());
            if(hasEventListener("debug"))
            {
               instance.dispatchEvent(new LogEvent("debug",param2));
            }
         }
      }
      
      public static function get developers() : String
      {
         return _developers;
      }
      
      public static function set developers(param1:String) : void
      {
         if(!_developers)
         {
            _developers = param1;
         }
      }
      
      public static function warning(param1:Object) : void
      {
         Log.warn(org.specter3d.debug.DevLog,param1);
      }
      
      public static function error(param1:*) : void
      {
         Log.error(org.specter3d.debug.DevLog,param1);
      }
      
      private static function throwError(param1:String) : void
      {
         Log.fatal(org.specter3d.debug.DevLog,param1);
      }
      
      public static function hasEventListener(param1:String) : Boolean
      {
         return instance.hasEventListener(param1);
      }
      
      public static function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         instance.removeEventListener(param1,param2,param3);
      }
      
      private static function get instance() : org.specter3d.debug.DevLog
      {
         if(!_instance)
         {
            _instance = new org.specter3d.debug.DevLog();
         }
         return _instance;
      }
   }
}
