package com.mz.core.logging
{
   import com.mz.core.interFace.IAppender;
   import com.mz.core.utils.ArrayUtil;
   import com.mz.core.utils2.reflects.ReflectUtil;
   import com.mz.core.interFace.ILogger;
   import flash.display.LoaderInfo;
   import flash.events.UncaughtErrorEvent;
   import flash.events.ErrorEvent;
   
   public class Log
   {
      
      private static var _uid:String = "";
      
      private static var appenders:Array = [];
       
      
      public function Log()
      {
         super();
      }
      
      public static function get uid() : String
      {
         return _uid;
      }
      
      public static function set uid(param1:String) : void
      {
         _uid = param1;
      }
      
      public static function removeApender(param1:IAppender) : void
      {
         ArrayUtil.removeItem(appenders,param1);
      }
      
      public static function addApender(param1:IAppender) : void
      {
         if(appenders.indexOf(param1) == -1)
         {
            appenders.push(param1);
         }
      }
      
      public static function append(param1:int, param2:String, param3:Array) : void
      {
         var _loc6_:int = 0;
         var _loc5_:* = appenders;
         for each(var _loc4_ in appenders)
         {
            _loc4_.write(param1,param2 + "[" + uid + "]",param3);
         }
      }
      
      public static function getClassName(param1:Object) : String
      {
         return ReflectUtil.getShortClassName(param1);
      }
      
      public static function getClassLogger(param1:Object) : ILogger
      {
         return new Logger(getClassName(param1));
      }
      
      public static function match(param1:int, param2:int) : Boolean
      {
         return (param1 & param2) == param1;
      }
      
      public static function debug(param1:*, ... rest) : void
      {
         Log.append(1,Log.getClassName(param1),rest);
      }
      
      public static function info(param1:*, ... rest) : void
      {
         Log.append(2,Log.getClassName(param1),rest);
      }
      
      public static function warn(param1:*, ... rest) : void
      {
         Log.append(4,Log.getClassName(param1),rest);
      }
      
      public static function error(param1:*, ... rest) : void
      {
         Log.append(8,Log.getClassName(param1),rest);
      }
      
      public static function fatal(param1:*, ... rest) : void
      {
         Log.append(16,Log.getClassName(param1),rest);
      }
      
      public static function regUncatchError(param1:LoaderInfo) : void
      {
         param1.uncaughtErrorEvents.addEventListener("uncaughtError",Log.onUncaughtError);
      }
      
      private static function onUncaughtError(param1:UncaughtErrorEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(param1.error is Error)
         {
            _loc3_ = param1.error as Error;
            _loc3_.getStackTrace();
            Log.fatal(Log,"Uncaught Error ",_loc3_.message,_loc3_,param1,"\n","getStackTrace",_loc3_.getStackTrace());
         }
         else
         {
            _loc2_ = param1.error as ErrorEvent;
            Log.fatal(Log,"Uncaught ErrorEvent",_loc2_.errorID,_loc2_.text,_loc2_,param1);
         }
      }
   }
}
