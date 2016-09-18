package com.junkbyte.console
{
   import flash.display.Sprite;
   import com.junkbyte.console.view.PanelsManager;
   import com.junkbyte.console.core.CommandLine;
   import com.junkbyte.console.core.UserData;
   import com.junkbyte.console.core.KeyBinder;
   import com.junkbyte.console.core.LogReferences;
   import com.junkbyte.console.core.MemoryMonitor;
   import com.junkbyte.console.core.Graphing;
   import com.junkbyte.console.core.Remoting;
   import com.junkbyte.console.core.DisplayMapper;
   import com.junkbyte.console.core.Logs;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.display.LoaderInfo;
   import flash.events.IEventDispatcher;
   import flash.events.ErrorEvent;
   import flash.geom.Rectangle;
   import com.junkbyte.console.view.RollerPanel;
   import flash.display.DisplayObjectContainer;
   import com.junkbyte.console.vos.Log;
   import flash.utils.getQualifiedClassName;
   
   public class Console extends Sprite
   {
      
      public static const VERSION:Number = 2.5;
      
      public static const VERSION_STAGE:String = "beta2";
      
      public static const BUILD:int = 551;
      
      public static const BUILD_DATE:String = "2010/11/24 23:39";
      
      public static const LOG:uint = 1;
      
      public static const INFO:uint = 3;
      
      public static const DEBUG:uint = 6;
      
      public static const WARN:uint = 8;
      
      public static const ERROR:uint = 9;
      
      public static const FATAL:uint = 10;
      
      public static const GLOBAL_CHANNEL:String = " * ";
      
      public static const DEFAULT_CHANNEL:String = "-";
      
      public static const CONSOLE_CHANNEL:String = "C";
      
      public static const FILTER_CHANNEL:String = "~";
       
      
      private var _config:com.junkbyte.console.ConsoleConfig;
      
      private var _panels:PanelsManager;
      
      private var _cl:CommandLine;
      
      private var _ud:UserData;
      
      private var _kb:KeyBinder;
      
      private var _links:LogReferences;
      
      private var _mm:MemoryMonitor;
      
      private var _graphing:Graphing;
      
      private var _remoter:Remoting;
      
      private var _mapper:DisplayMapper;
      
      private var _topTries:int = 50;
      
      private var _paused:Boolean;
      
      private var _rollerKey:com.junkbyte.console.KeyBind;
      
      private var _logs:Logs;
      
      private var _lineAdded:Boolean;
      
      public function Console(param1:String = "", param2:com.junkbyte.console.ConsoleConfig = null)
      {
         super();
         name = "Console";
         tabChildren = false;
         this._config = !!param2?param2:new com.junkbyte.console.ConsoleConfig();
         this._remoter = new Remoting(this,param1);
         this._logs = new Logs(this);
         this._ud = new UserData(this);
         this._links = new LogReferences(this);
         this._cl = new CommandLine(this);
         this._mapper = new DisplayMapper(this);
         this._graphing = new Graphing(this);
         this._mm = new MemoryMonitor(this);
         this._kb = new KeyBinder(this,param1);
         this._config.style.updateStyleSheet();
         this._panels = new PanelsManager(this);
         this.report("<b>Console v" + VERSION + VERSION_STAGE + " b" + BUILD + ". Happy coding!</b>",-2);
         addEventListener(Event.ADDED_TO_STAGE,this.stageAddedHandle);
         if(param1)
         {
            visible = false;
         }
         addEventListener(Event.ENTER_FRAME,this._onEnterFrame);
      }
      
      private function stageAddedHandle(param1:Event = null) : void
      {
         if(this._cl.base == null)
         {
            this._cl.base = parent;
         }
         if(loaderInfo)
         {
            this.listenUncaughtErrors(loaderInfo);
         }
         removeEventListener(Event.ADDED_TO_STAGE,this.stageAddedHandle);
         addEventListener(Event.REMOVED_FROM_STAGE,this.stageRemovedHandle);
         stage.addEventListener(Event.MOUSE_LEAVE,this.onStageMouseLeave,false,0,true);
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this._kb.keyDownHandler,false,0,true);
      }
      
      private function stageRemovedHandle(param1:Event = null) : void
      {
         this._cl.base = null;
         removeEventListener(Event.REMOVED_FROM_STAGE,this.stageRemovedHandle);
         addEventListener(Event.ADDED_TO_STAGE,this.stageAddedHandle);
         stage.removeEventListener(Event.MOUSE_LEAVE,this.onStageMouseLeave);
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,this._kb.keyDownHandler);
      }
      
      private function onStageMouseLeave(param1:Event) : void
      {
         this._panels.tooltip(null);
      }
      
      public function listenUncaughtErrors(param1:LoaderInfo) : void
      {
         var uncaughtErrorEvents:IEventDispatcher = null;
         var loaderinfo:LoaderInfo = param1;
         try
         {
            uncaughtErrorEvents = loaderinfo["uncaughtErrorEvents"];
            if(uncaughtErrorEvents)
            {
               uncaughtErrorEvents.addEventListener("uncaughtError",this.uncaughtErrorHandle,false,0,true);
            }
            return;
         }
         catch(err:Error)
         {
            return;
         }
      }
      
      private function uncaughtErrorHandle(param1:Event) : void
      {
         var _loc3_:String = null;
         var _loc2_:* = !!param1.hasOwnProperty("error")?param1["error"]:param1;
         if(_loc2_ is Error)
         {
            _loc3_ = this._links.makeString(_loc2_);
         }
         else if(_loc2_ is ErrorEvent)
         {
            _loc3_ = ErrorEvent(_loc2_).text;
         }
         if(!_loc3_)
         {
            _loc3_ = String(_loc2_);
         }
         this.report(_loc3_,FATAL,false);
      }
      
      public function addGraph(param1:String, param2:Object, param3:String, param4:Number = -1, param5:String = null, param6:Rectangle = null, param7:Boolean = false) : void
      {
         if(param2 == null)
         {
            this.report("ERROR: Graph [" + param1 + "] received a null object to graph property [" + param3 + "].",10);
            return;
         }
         this._graphing.add(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function fixGraphRange(param1:String, param2:Number = NaN, param3:Number = NaN) : void
      {
         this._graphing.fixRange(param1,param2,param3);
      }
      
      public function removeGraph(param1:String, param2:Object = null, param3:String = null) : void
      {
         this._graphing.remove(param1,param2,param3);
      }
      
      public function bindKey(param1:com.junkbyte.console.KeyBind, param2:Function, param3:Array = null) : void
      {
         if(param1)
         {
            this._kb.bindKey(param1,param2,param3);
         }
      }
      
      public function addMenu(param1:String, param2:Function, param3:Array = null, param4:String = null) : void
      {
         this.panels.mainPanel.addMenu(param1,param2,param3,param4);
      }
      
      public function get displayRoller() : Boolean
      {
         return this._panels.displayRoller;
      }
      
      public function set displayRoller(param1:Boolean) : void
      {
         this._panels.displayRoller = param1;
      }
      
      public function setRollerCaptureKey(param1:String, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false) : void
      {
         if(this._rollerKey)
         {
            this.bindKey(this._rollerKey,null);
            this._rollerKey = null;
         }
         if(param1 && param1.length == 1)
         {
            this._rollerKey = new com.junkbyte.console.KeyBind(param1,param2,param3,param4);
            this.bindKey(this._rollerKey,this.onRollerCaptureKey);
         }
      }
      
      public function get rollerCaptureKey() : com.junkbyte.console.KeyBind
      {
         return this._rollerKey;
      }
      
      private function onRollerCaptureKey() : void
      {
         if(this.displayRoller)
         {
            this.report("Display Roller Capture:<br/>" + RollerPanel(this._panels.getPanel(RollerPanel.NAME)).getMapString(true),-1);
         }
      }
      
      public function get fpsMonitor() : Boolean
      {
         return this._graphing.fpsMonitor;
      }
      
      public function set fpsMonitor(param1:Boolean) : void
      {
         this._graphing.fpsMonitor = param1;
      }
      
      public function get memoryMonitor() : Boolean
      {
         return this._graphing.memoryMonitor;
      }
      
      public function set memoryMonitor(param1:Boolean) : void
      {
         this._graphing.memoryMonitor = param1;
      }
      
      public function watch(param1:Object, param2:String = null) : String
      {
         return this._mm.watch(param1,param2);
      }
      
      public function unwatch(param1:String) : void
      {
         this._mm.unwatch(param1);
      }
      
      public function gc() : void
      {
         this._mm.gc();
      }
      
      public function store(param1:String, param2:Object, param3:Boolean = false) : void
      {
         this._cl.store(param1,param2,param3);
      }
      
      public function map(param1:DisplayObjectContainer, param2:uint = 0) : void
      {
         this._mapper.map(param1,param2);
      }
      
      public function inspect(param1:Object, param2:Boolean = true) : void
      {
         this._links.inspect(param1,param2);
      }
      
      public function explode(param1:Object, param2:int = 3) : void
      {
         this.report(this._links.explode(param1,param2),1);
      }
      
      public function get paused() : Boolean
      {
         return this._paused;
      }
      
      public function set paused(param1:Boolean) : void
      {
         if(this._paused == param1)
         {
            return;
         }
         if(param1)
         {
            this.report("Paused",10);
         }
         else
         {
            this.report("Resumed",-1);
         }
         this._paused = param1;
         this._panels.mainPanel.setPaused(param1);
      }
      
      override public function get width() : Number
      {
         return this._panels.mainPanel.width;
      }
      
      override public function set width(param1:Number) : void
      {
         this._panels.mainPanel.width = param1;
      }
      
      override public function set height(param1:Number) : void
      {
         this._panels.mainPanel.height = param1;
      }
      
      override public function get height() : Number
      {
         return this._panels.mainPanel.height;
      }
      
      override public function get x() : Number
      {
         return this._panels.mainPanel.x;
      }
      
      override public function set x(param1:Number) : void
      {
         this._panels.mainPanel.x = param1;
      }
      
      override public function set y(param1:Number) : void
      {
         this._panels.mainPanel.y = param1;
      }
      
      override public function get y() : Number
      {
         return this._panels.mainPanel.y;
      }
      
      private function _onEnterFrame(param1:Event) : void
      {
         var _loc2_:Array = null;
         this._logs.tick();
         this._mm.update();
         if(this.remoter.remoting != Remoting.RECIEVER)
         {
            _loc2_ = this._graphing.update(!!stage?Number(stage.frameRate):0);
         }
         this._remoter.update(_loc2_);
         if(visible && parent)
         {
            if(this.config.alwaysOnTop && parent.getChildAt(parent.numChildren - 1) != this && this._topTries > 0)
            {
               this._topTries--;
               parent.addChild(this);
               if(!this.config.quiet)
               {
                  this.report("Moved console on top (alwaysOnTop enabled), " + this._topTries + " attempts left.",-1);
               }
            }
            this._panels.update(this._paused,this._lineAdded);
            if(_loc2_)
            {
               this._panels.updateGraphs(_loc2_,!this._paused);
            }
            this._lineAdded = false;
         }
      }
      
      public function get remoting() : Boolean
      {
         return this._remoter.remoting == Remoting.SENDER;
      }
      
      public function set remoting(param1:Boolean) : void
      {
         this._remoter.remoting = !!param1?uint(Remoting.SENDER):uint(Remoting.NONE);
      }
      
      public function set remotingPassword(param1:String) : void
      {
         this._remoter.remotingPassword = param1;
      }
      
      public function get viewingChannels() : Array
      {
         return this._panels.mainPanel.viewingChannels;
      }
      
      public function setViewingChannels(... rest) : void
      {
         var _loc3_:Object = null;
         var _loc2_:Array = new Array();
         for each(_loc3_ in rest)
         {
            _loc2_.push(this.makeChannelName(_loc3_));
         }
         this._panels.mainPanel.viewingChannels = _loc2_;
      }
      
      public function report(param1:*, param2:int = 0, param3:Boolean = true) : void
      {
         var _loc4_:String = this.viewingChannels.length == 1?this.viewingChannels[0]:Console.CONSOLE_CHANNEL;
         this.addLine([param1],param2,_loc4_,false,param3);
      }
      
      public function addLine(param1:Array, param2:int = 0, param3:String = null, param4:Boolean = false, param5:Boolean = false, param6:int = -1) : void
      {
         var _loc7_:String = "";
         var _loc8_:int = param1.length;
         var _loc9_:int = 0;
         while(_loc9_ < _loc8_)
         {
            _loc7_ = _loc7_ + ((!!_loc9_?" ":"") + this._links.makeString(param1[_loc9_],null,param5));
            _loc9_++;
         }
         if(param2 >= this._config.autoStackPriority && param6 < 0)
         {
            param6 = this._config.defaultStackDepth;
         }
         if(!param3 || param3 == GLOBAL_CHANNEL)
         {
            param3 = Console.DEFAULT_CHANNEL;
         }
         if(!param5 && param6 > 0)
         {
            _loc7_ = _loc7_ + this.getStack(param6,param2);
         }
         var _loc10_:Log = new Log(_loc7_,param3,param2,param4,param5);
         var _loc11_:Boolean = this._logs.add(_loc10_,param4);
         if(this._config.tracing && _loc11_ && this._config.traceCall != null)
         {
            this._config.traceCall(param3,_loc10_.plainText(),param2);
         }
         this._lineAdded = true;
         this._remoter.queueLog(_loc10_);
      }
      
      private function getStack(param1:int, param2:int) : String
      {
         var _loc3_:Error = new Error();
         var _loc4_:String = !!_loc3_.hasOwnProperty("getStackTrace")?_loc3_.getStackTrace():null;
         if(!_loc4_)
         {
            return "";
         }
         var _loc5_:String = "";
         var _loc6_:Array = _loc4_.split(/\n\sat\s/);
         var _loc7_:int = _loc6_.length;
         var _loc8_:RegExp = new RegExp("Function|" + getQualifiedClassName(this) + "|" + getQualifiedClassName(Cc));
         var _loc9_:Boolean = false;
         var _loc10_:int = 2;
         while(_loc10_ < _loc7_)
         {
            if(!_loc9_ && _loc6_[_loc10_].search(_loc8_) != 0)
            {
               _loc9_ = true;
            }
            if(_loc9_)
            {
               _loc5_ = _loc5_ + ("\n<p" + param2 + "> @ " + _loc6_[_loc10_] + "</p" + param2 + ">");
               if(param2 > 0)
               {
                  param2--;
               }
               param1--;
               if(param1 <= 0)
               {
                  break;
               }
            }
            _loc10_++;
         }
         return _loc5_;
      }
      
      public function set commandLine(param1:Boolean) : void
      {
         this._panels.mainPanel.commandLine = param1;
      }
      
      public function get commandLine() : Boolean
      {
         return this._panels.mainPanel.commandLine;
      }
      
      public function addSlashCommand(param1:String, param2:Function, param3:String = "", param4:Boolean = true) : void
      {
         this._cl.addSlashCommand(param1,param2,param3,param4);
      }
      
      public function add(param1:*, param2:int = 2, param3:Boolean = false) : void
      {
         this.addLine(new Array(param1),param2,DEFAULT_CHANNEL,param3);
      }
      
      public function stack(param1:*, param2:int = -1, param3:int = 5) : void
      {
         this.addLine(new Array(param1),param3,DEFAULT_CHANNEL,false,false,param2 >= 0?int(param2):int(this._config.defaultStackDepth));
      }
      
      public function stackch(param1:String, param2:*, param3:int = -1, param4:int = 5) : void
      {
         this.addLine(new Array(param2),param4,param1,false,false,param3 >= 0?int(param3):int(this._config.defaultStackDepth));
      }
      
      public function log(... rest) : void
      {
         this.addLine(rest,LOG);
      }
      
      public function info(... rest) : void
      {
         this.addLine(rest,INFO);
      }
      
      public function debug(... rest) : void
      {
         this.addLine(rest,DEBUG);
      }
      
      public function warn(... rest) : void
      {
         this.addLine(rest,WARN);
      }
      
      public function error(... rest) : void
      {
         this.addLine(rest,ERROR);
      }
      
      public function fatal(... rest) : void
      {
         this.addLine(rest,FATAL);
      }
      
      public function ch(param1:*, param2:*, param3:Number = 2, param4:Boolean = false) : void
      {
         this.addLine(new Array(param2),param3,this.makeChannelName(param1),param4);
      }
      
      public function logch(param1:*, ... rest) : void
      {
         this.addLine(rest,LOG,this.makeChannelName(param1));
      }
      
      public function infoch(param1:*, ... rest) : void
      {
         this.addLine(rest,INFO,this.makeChannelName(param1));
      }
      
      public function debugch(param1:*, ... rest) : void
      {
         this.addLine(rest,DEBUG,this.makeChannelName(param1));
      }
      
      public function warnch(param1:*, ... rest) : void
      {
         this.addLine(rest,WARN,this.makeChannelName(param1));
      }
      
      public function errorch(param1:*, ... rest) : void
      {
         this.addLine(rest,ERROR,this.makeChannelName(param1));
      }
      
      public function fatalch(param1:*, ... rest) : void
      {
         this.addLine(rest,FATAL,this.makeChannelName(param1));
      }
      
      public function addCh(param1:*, param2:Array, param3:int = 2, param4:Boolean = false) : void
      {
         this.addLine(param2,param3,this.makeChannelName(param1),param4);
      }
      
      private function makeChannelName(param1:*) : String
      {
         if(param1 is String)
         {
            return param1 as String;
         }
         if(param1 is ConsoleChannel)
         {
            return ConsoleChannel(param1).name;
         }
         if(param1)
         {
            return LogReferences.ShortClassName(param1);
         }
         return DEFAULT_CHANNEL;
      }
      
      public function clear(param1:String = null) : void
      {
         this._logs.clear(param1);
         if(!this._paused)
         {
            this._panels.mainPanel.updateToBottom();
         }
         this._panels.updateMenu();
      }
      
      public function getAllLog(param1:String = "\r\n") : String
      {
         return this._logs.getLogsAsString(param1);
      }
      
      public function get config() : com.junkbyte.console.ConsoleConfig
      {
         return this._config;
      }
      
      public function get panels() : PanelsManager
      {
         return this._panels;
      }
      
      public function get cl() : CommandLine
      {
         return this._cl;
      }
      
      public function get ud() : UserData
      {
         return this._ud;
      }
      
      public function get remoter() : Remoting
      {
         return this._remoter;
      }
      
      public function get graphing() : Graphing
      {
         return this._graphing;
      }
      
      public function get links() : LogReferences
      {
         return this._links;
      }
      
      public function get logs() : Logs
      {
         return this._logs;
      }
      
      public function get mapper() : DisplayMapper
      {
         return this._mapper;
      }
   }
}
