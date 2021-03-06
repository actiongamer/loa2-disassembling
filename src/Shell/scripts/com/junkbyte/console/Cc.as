package com.junkbyte.console
{
   import flash.display.DisplayObjectContainer;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.display.LoaderInfo;
   import flash.geom.Rectangle;
   
   public class Cc
   {
      
      private static var _console:com.junkbyte.console.Console;
      
      private static var _config:com.junkbyte.console.ConsoleConfig;
       
      
      public function Cc()
      {
         super();
      }
      
      public static function get config() : com.junkbyte.console.ConsoleConfig
      {
         if(!_config)
         {
            _config = new com.junkbyte.console.ConsoleConfig();
         }
         return _config;
      }
      
      public static function start(param1:DisplayObjectContainer, param2:String = "") : void
      {
         if(_console)
         {
            if(!_console.parent)
            {
               param1.addChild(_console);
            }
         }
         else
         {
            _console = new com.junkbyte.console.Console(param2,config);
            if(param1)
            {
               param1.addChild(_console);
            }
         }
      }
      
      public static function startOnStage(param1:DisplayObject, param2:String = "") : void
      {
         if(_console)
         {
            if(param1 && param1.stage && _console.parent != param1.stage)
            {
               param1.stage.addChild(_console);
            }
         }
         else if(param1 && param1.stage)
         {
            start(param1.stage,param2);
         }
         else
         {
            _console = new com.junkbyte.console.Console(param2,config);
            if(param1)
            {
               param1.addEventListener(Event.ADDED_TO_STAGE,addedToStageHandle);
            }
         }
      }
      
      public static function add(param1:*, param2:int = 2, param3:Boolean = false) : void
      {
         if(_console)
         {
            _console.add(param1,param2,param3);
         }
      }
      
      public static function ch(param1:*, param2:*, param3:int = 2, param4:Boolean = false) : void
      {
         if(_console)
         {
            _console.ch(param1,param2,param3,param4);
         }
      }
      
      public static function log(... rest) : void
      {
         if(_console)
         {
            _console.log.apply(null,rest);
         }
      }
      
      public static function info(... rest) : void
      {
         if(_console)
         {
            _console.info.apply(null,rest);
         }
      }
      
      public static function debug(... rest) : void
      {
         if(_console)
         {
            _console.debug.apply(null,rest);
         }
      }
      
      public static function warn(... rest) : void
      {
         if(_console)
         {
            _console.warn.apply(null,rest);
         }
      }
      
      public static function error(... rest) : void
      {
         if(_console)
         {
            _console.error.apply(null,rest);
         }
      }
      
      public static function fatal(... rest) : void
      {
         if(_console)
         {
            _console.fatal.apply(null,rest);
         }
      }
      
      public static function logch(param1:*, ... rest) : void
      {
         if(_console)
         {
            _console.addCh(param1,rest,com.junkbyte.console.Console.LOG);
         }
      }
      
      public static function infoch(param1:*, ... rest) : void
      {
         if(_console)
         {
            _console.addCh(param1,rest,com.junkbyte.console.Console.INFO);
         }
      }
      
      public static function debugch(param1:*, ... rest) : void
      {
         if(_console)
         {
            _console.addCh(param1,rest,com.junkbyte.console.Console.DEBUG);
         }
      }
      
      public static function warnch(param1:*, ... rest) : void
      {
         if(_console)
         {
            _console.addCh(param1,rest,com.junkbyte.console.Console.WARN);
         }
      }
      
      public static function errorch(param1:*, ... rest) : void
      {
         if(_console)
         {
            _console.addCh(param1,rest,com.junkbyte.console.Console.ERROR);
         }
      }
      
      public static function fatalch(param1:*, ... rest) : void
      {
         if(_console)
         {
            _console.addCh(param1,rest,com.junkbyte.console.Console.FATAL);
         }
      }
      
      public static function stack(param1:*, param2:int = -1, param3:int = 5) : void
      {
         if(_console)
         {
            _console.stack(param1,param2,param3);
         }
      }
      
      public static function stackch(param1:String, param2:*, param3:int = -1, param4:int = 5) : void
      {
         if(_console)
         {
            _console.stackch(param1,param2,param3,param4);
         }
      }
      
      public static function inspect(param1:Object, param2:Boolean = true) : void
      {
         if(_console)
         {
            _console.inspect(param1,param2);
         }
      }
      
      public static function explode(param1:Object, param2:int = 3) : void
      {
         if(_console)
         {
            _console.explode(param1,param2);
         }
      }
      
      public static function map(param1:DisplayObjectContainer, param2:uint = 0) : void
      {
         if(_console)
         {
            _console.map(param1,param2);
         }
      }
      
      public static function clear(param1:String = null) : void
      {
         if(_console)
         {
            _console.clear(param1);
         }
      }
      
      public static function bindKey(param1:KeyBind, param2:Function = null, param3:Array = null) : void
      {
         if(_console)
         {
            _console.bindKey(param1,param2,param3);
         }
      }
      
      public static function addMenu(param1:String, param2:Function, param3:Array = null, param4:String = null) : void
      {
         if(_console)
         {
            _console.addMenu(param1,param2,param3,param4);
         }
      }
      
      public static function listenUncaughtErrors(param1:LoaderInfo) : void
      {
         if(_console)
         {
            _console.listenUncaughtErrors(param1);
         }
      }
      
      public static function store(param1:String, param2:Object, param3:Boolean = false) : void
      {
         if(_console)
         {
            _console.store(param1,param2,param3);
         }
      }
      
      public static function addSlashCommand(param1:String, param2:Function, param3:String = "", param4:Boolean = true) : void
      {
         if(_console)
         {
            _console.addSlashCommand(param1,param2,param3,param4);
         }
      }
      
      public static function watch(param1:Object, param2:String = null) : String
      {
         if(_console)
         {
            return _console.watch(param1,param2);
         }
         return null;
      }
      
      public static function unwatch(param1:String) : void
      {
         if(_console)
         {
            _console.unwatch(param1);
         }
      }
      
      public static function addGraph(param1:String, param2:Object, param3:String, param4:Number = -1, param5:String = null, param6:Rectangle = null, param7:Boolean = false) : void
      {
         if(_console)
         {
            _console.addGraph(param1,param2,param3,param4,param5,param6,param7);
         }
      }
      
      public static function fixGraphRange(param1:String, param2:Number = NaN, param3:Number = NaN) : void
      {
         if(_console)
         {
            _console.fixGraphRange(param1,param2,param3);
         }
      }
      
      public static function removeGraph(param1:String, param2:Object = null, param3:String = null) : void
      {
         if(_console)
         {
            _console.removeGraph(param1,param2,param3);
         }
      }
      
      public static function setViewingChannels(... rest) : void
      {
         if(_console)
         {
            _console.setViewingChannels.apply(null,rest);
         }
      }
      
      public static function get width() : Number
      {
         if(_console)
         {
            return _console.width;
         }
         return 0;
      }
      
      public static function set width(param1:Number) : void
      {
         if(_console)
         {
            _console.width = param1;
         }
      }
      
      public static function get height() : Number
      {
         if(_console)
         {
            return _console.height;
         }
         return 0;
      }
      
      public static function set height(param1:Number) : void
      {
         if(_console)
         {
            _console.height = param1;
         }
      }
      
      public static function get x() : Number
      {
         if(_console)
         {
            return _console.x;
         }
         return 0;
      }
      
      public static function set x(param1:Number) : void
      {
         if(_console)
         {
            _console.x = param1;
         }
      }
      
      public static function get y() : Number
      {
         if(_console)
         {
            return _console.y;
         }
         return 0;
      }
      
      public static function set y(param1:Number) : void
      {
         if(_console)
         {
            _console.y = param1;
         }
      }
      
      public static function get visible() : Boolean
      {
         if(_console)
         {
            return _console.visible;
         }
         return false;
      }
      
      public static function set visible(param1:Boolean) : void
      {
         if(_console)
         {
            _console.visible = param1;
         }
      }
      
      public static function get fpsMonitor() : Boolean
      {
         if(_console)
         {
            return _console.fpsMonitor;
         }
         return false;
      }
      
      public static function set fpsMonitor(param1:Boolean) : void
      {
         if(_console)
         {
            _console.fpsMonitor = param1;
         }
      }
      
      public static function get memoryMonitor() : Boolean
      {
         if(_console)
         {
            return _console.memoryMonitor;
         }
         return false;
      }
      
      public static function set memoryMonitor(param1:Boolean) : void
      {
         if(_console)
         {
            _console.memoryMonitor = param1;
         }
      }
      
      public static function get commandLine() : Boolean
      {
         if(_console)
         {
            return _console.commandLine;
         }
         return false;
      }
      
      public static function set commandLine(param1:Boolean) : void
      {
         if(_console)
         {
            _console.commandLine = param1;
         }
      }
      
      public static function get displayRoller() : Boolean
      {
         if(_console)
         {
            return _console.displayRoller;
         }
         return false;
      }
      
      public static function set displayRoller(param1:Boolean) : void
      {
         if(_console)
         {
            _console.displayRoller = param1;
         }
      }
      
      public static function setRollerCaptureKey(param1:String, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false) : void
      {
         if(_console)
         {
            _console.setRollerCaptureKey(param1,param4,param2,param3);
         }
      }
      
      public static function get remoting() : Boolean
      {
         if(_console)
         {
            return _console.remoting;
         }
         return false;
      }
      
      public static function set remoting(param1:Boolean) : void
      {
         if(_console)
         {
            _console.remoting = param1;
         }
      }
      
      public static function set remotingPassword(param1:String) : void
      {
         if(_console)
         {
            _console.remotingPassword = param1;
         }
      }
      
      public static function remove() : void
      {
         if(_console)
         {
            if(_console.parent)
            {
               _console.parent.removeChild(_console);
            }
            _console = null;
         }
      }
      
      public static function getAllLog(param1:String = "\r\n") : String
      {
         if(_console)
         {
            return _console.getAllLog(param1);
         }
         return "";
      }
      
      public static function get instance() : com.junkbyte.console.Console
      {
         return _console;
      }
      
      private static function addedToStageHandle(param1:Event) : void
      {
         var _loc2_:DisplayObjectContainer = param1.currentTarget as DisplayObjectContainer;
         _loc2_.removeEventListener(Event.ADDED_TO_STAGE,addedToStageHandle);
         if(_console && _console.parent == null)
         {
            _loc2_.stage.addChild(_console);
         }
      }
   }
}
