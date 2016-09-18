package com.junkbyte.console
{
   public class ConsoleConfig
   {
       
      
      public var maxLines:uint = 1000;
      
      public var maxRepeats:uint = 75;
      
      public var autoStackPriority:int;
      
      public var defaultStackDepth:int = 2;
      
      public var useObjectLinking:Boolean = true;
      
      public var tracing:Boolean;
      
      public var traceCall:Function;
      
      public var remotingConnectionName:String = "_Console";
      
      public var allowedRemoteDomain:String = "*";
      
      public var commandLineAllowed:Boolean;
      
      public var commandLineAutoScope:Boolean;
      
      public var rulerHidesMouse:Boolean = true;
      
      public var sharedObjectName:String = "com.junkbyte/Console/UserData";
      
      public var sharedObjectPath:String = "/";
      
      public var quiet:Boolean;
      
      public var alwaysOnTop:Boolean = true;
      
      private var _style:com.junkbyte.console.ConsoleStyle;
      
      public function ConsoleConfig()
      {
         this.autoStackPriority = Console.FATAL;
         this.traceCall = defaultTrace;
         super();
         this._style = new com.junkbyte.console.ConsoleStyle();
      }
      
      private static function defaultTrace(param1:String, param2:String, ... rest) : void
      {
         trace("[" + param1 + "] " + param2);
      }
      
      public function get style() : com.junkbyte.console.ConsoleStyle
      {
         return this._style;
      }
   }
}
