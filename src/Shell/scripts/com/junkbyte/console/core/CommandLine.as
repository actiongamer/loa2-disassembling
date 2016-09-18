package com.junkbyte.console.core
{
   import com.junkbyte.console.vos.WeakObject;
   import com.junkbyte.console.vos.WeakRef;
   import flash.events.Event;
   import flash.utils.getQualifiedClassName;
   import flash.display.DisplayObjectContainer;
   import com.junkbyte.console.Console;
   
   public class CommandLine extends ConsoleCore
   {
      
      private static const DISABLED:String = "<b>Advanced CommandLine is disabled.</b>\nEnable by setting `Cc.config.commandLineAllowed = true;´\nType <b>/commands</b> for permitted commands.";
      
      private static const RESERVED:Array = [Executer.RETURNED,"base","C"];
       
      
      private var _saved:WeakObject;
      
      private var _scope;
      
      private var _prevScope:WeakRef;
      
      private var _slashCmds:Object;
      
      public function CommandLine(param1:Console)
      {
         super(param1);
         this._saved = new WeakObject();
         this._scope = param1;
         this._slashCmds = new Object();
         this._prevScope = new WeakRef(param1);
         this._saved.set("C",param1);
         console.remoter.registerClient("cmd",this.run);
         console.remoter.registerClient("scope",this.handleScopeEvent);
         this.addCLCmd("help",this.printHelp,"How to use command line");
         this.addCLCmd("save|store",this.saveCmd,"Save current scope as weak reference. (same as Cc.store(...))");
         this.addCLCmd("savestrong|storestrong",this.saveStrongCmd,"Save current scope as strong reference");
         this.addCLCmd("saved|stored",this.savedCmd,"Show a list of all saved references");
         this.addCLCmd("string",this.stringCmd,"Create String, useful to paste complex strings without worrying about \" or \'");
         this.addCLCmd("commands",this.cmdsCmd,"Show a list of all slash commands",true);
         this.addCLCmd("inspect",this.inspectCmd,"Inspect current scope");
         this.addCLCmd("explode",this.explodeCmd,"Explode current scope to its properties and values (similar to JSON)");
         this.addCLCmd("map",this.mapCmd,"Get display list map starting from current scope");
         this.addCLCmd("function",this.funCmd,"Create function. param is the commandline string to create as function. (experimental)");
         this.addCLCmd("autoscope",this.autoscopeCmd,"Toggle autoscoping.");
         this.addCLCmd("base",this.baseCmd,"Return to base scope");
         this.addCLCmd("/",this.prevCmd,"Return to previous scope");
      }
      
      public function set base(param1:Object) : void
      {
         if(this.base)
         {
            report("Set new commandLine base from " + this.base + " to " + param1,10);
         }
         else
         {
            this._prevScope.reference = this._scope;
            this._scope = param1;
            console.panels.mainPanel.updateCLScope(this.scopeString);
         }
         this._saved.set("base",param1);
      }
      
      public function get base() : Object
      {
         return this._saved.get("base");
      }
      
      public function destory() : void
      {
         this._saved = null;
         this._scope = null;
      }
      
      public function handleScopeEvent(param1:uint) : void
      {
         var _loc2_:* = undefined;
         if(remoter.remoting == Remoting.RECIEVER)
         {
            remoter.send("scope",param1);
         }
         else
         {
            _loc2_ = console.links.getRefById(param1);
            if(_loc2_)
            {
               console.cl.setReturned(_loc2_,true,false);
            }
            else
            {
               console.report("Reference no longer exist.",-2);
            }
         }
      }
      
      public function store(param1:String, param2:Object, param3:Boolean = false) : void
      {
         var _loc4_:String = null;
         if(!param1)
         {
            report("ERROR: Give a name to save.",10);
            return;
         }
         if(param2 is Function)
         {
            param3 = true;
         }
         param1 = param1.replace(/[^\w]*/g,"");
         if(RESERVED.indexOf(param1) >= 0)
         {
            report("ERROR: The name [" + param1 + "] is reserved",10);
            return;
         }
         this._saved.set(param1,param2,param3);
         if(!config.quiet)
         {
            _loc4_ = !!param3?"STRONG":"WEAK";
            report("Stored <p5>$" + param1 + "</p5> for <b>" + console.links.makeRefTyped(param2) + "</b> using <b>" + _loc4_ + "</b> reference.",-1);
         }
      }
      
      public function getHintsFor(param1:String) : Array
      {
         var X:String = null;
         var Y:String = null;
         var canadate:String = null;
         var str:String = param1;
         var all:Array = new Array();
         for(X in this._slashCmds)
         {
            all.push("/" + X + " ");
         }
         for(Y in this._saved)
         {
            all.push("$" + Y);
         }
         if(this._scope)
         {
            all.push("this");
            all = all.concat(console.links.getPossibleCalls(this._scope));
         }
         str = str.toLowerCase();
         var hints:Array = new Array();
         for each(canadate in all)
         {
            if(canadate.toLowerCase().indexOf(str) == 0)
            {
               hints.push(canadate);
            }
         }
         hints = hints.sort(function(param1:String, param2:String):int
         {
            if(param1.length < param2.length)
            {
               return -1;
            }
            if(param1.length > param2.length)
            {
               return 1;
            }
            return 0;
         });
         return hints;
      }
      
      public function get scopeString() : String
      {
         return LogReferences.ShortClassName(this._scope,false);
      }
      
      public function addCLCmd(param1:String, param2:Function, param3:String, param4:Boolean = false) : void
      {
         var _loc5_:Array = param1.split("|");
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            param1 = _loc5_[_loc6_];
            this._slashCmds[param1] = new SlashCommand(param1,param2,param3,false,param4);
            if(_loc6_ > 0)
            {
               this._slashCmds.setPropertyIsEnumerable(param1,false);
            }
            _loc6_++;
         }
      }
      
      public function addSlashCommand(param1:String, param2:Function, param3:String = "", param4:Boolean = true) : void
      {
         var _loc5_:SlashCommand = null;
         if(this._slashCmds[param1] != null)
         {
            _loc5_ = this._slashCmds[param1];
            if(!_loc5_.user)
            {
               throw new Error("Can not alter build-in slash command [" + param1 + "]");
            }
         }
         if(param2 == null)
         {
            delete this._slashCmds[param1];
         }
         else
         {
            this._slashCmds[param1] = new SlashCommand(param1,param2,param3,true,param4);
         }
      }
      
      public function run(param1:String) : *
      {
         var exe:Executer = null;
         var str:String = param1;
         if(remoter.remoting == Remoting.RECIEVER)
         {
            if(str && str.charAt(0) == "~")
            {
               str = str.substring(1);
            }
            else
            {
               report("Run command at remote: " + str,-2);
               if(!console.remoter.send("cmd",str))
               {
                  report("Command could not be sent to client.",10);
               }
               return null;
            }
         }
         report("&gt; " + str,4,false);
         var v:* = null;
         try
         {
            if(str.charAt(0) == "/")
            {
               this.execCommand(str);
            }
            else
            {
               if(!config.commandLineAllowed)
               {
                  report(DISABLED,9);
                  return null;
               }
               exe = new Executer();
               exe.addEventListener(Event.COMPLETE,this.onExecLineComplete,false,0,true);
               exe.setStored(this._saved);
               exe.setReserved(RESERVED);
               exe.autoScope = config.commandLineAutoScope;
               v = exe.exec(this._scope,str);
            }
         }
         catch(e:Error)
         {
            reportError(e);
         }
         return v;
      }
      
      private function onExecLineComplete(param1:Event) : void
      {
         var _loc2_:Executer = param1.currentTarget as Executer;
         if(this._scope == _loc2_.scope)
         {
            this.setReturned(_loc2_.returned);
         }
         else if(_loc2_.scope == _loc2_.returned)
         {
            this.setReturned(_loc2_.scope,true);
         }
         else
         {
            this.setReturned(_loc2_.returned);
            this.setReturned(_loc2_.scope,true);
         }
      }
      
      private function execCommand(param1:String) : void
      {
         var slashcmd:SlashCommand = null;
         var str:String = param1;
         var brk:int = str.indexOf(" ");
         var cmd:String = str.substring(1,brk > 0?Number(brk):Number(str.length));
         if(cmd == "")
         {
            this.setReturned(this._saved.get(Executer.RETURNED),true);
            return;
         }
         var param:String = brk > 0?str.substring(brk + 1):"";
         if(this._slashCmds[cmd] != null)
         {
            try
            {
               slashcmd = this._slashCmds[cmd];
               if(!config.commandLineAllowed && !slashcmd.allow)
               {
                  report(DISABLED,9);
                  return;
               }
               if(param.length == 0)
               {
                  slashcmd.f();
               }
               else
               {
                  slashcmd.f(param);
               }
            }
            catch(err:Error)
            {
               reportError(err);
            }
         }
         else
         {
            report("Undefined command <b>/commands</b> for list of all commands.",10);
         }
      }
      
      public function setReturned(param1:*, param2:Boolean = false, param3:Boolean = true) : void
      {
         if(!config.commandLineAllowed)
         {
            report(DISABLED,9);
            return;
         }
         if(param1 !== undefined)
         {
            this._saved.set(Executer.RETURNED,param1,true);
            if(param2 && param1 !== this._scope)
            {
               this._prevScope.reference = this._scope;
               this._scope = param1;
               report("Changed to " + console.links.makeRefTyped(param1),-1);
               console.panels.mainPanel.updateCLScope(this.scopeString);
            }
            else if(param3)
            {
               report("Returned " + console.links.makeString(param1),-1);
            }
         }
         else if(param3)
         {
            report("Exec successful, undefined return.",-1);
         }
      }
      
      private function reportError(param1:Error) : void
      {
         var _loc10_:String = null;
         var _loc2_:String = console.links.makeString(param1);
         var _loc3_:Array = _loc2_.split(/\n\s*/);
         var _loc4_:int = 10;
         var _loc5_:int = 0;
         var _loc6_:int = _loc3_.length;
         var _loc7_:Array = [];
         var _loc8_:RegExp = new RegExp("\\s*at\\s+(" + Executer.CLASSES + "|" + getQualifiedClassName(this) + ")");
         var _loc9_:int = 0;
         while(_loc9_ < _loc6_)
         {
            _loc10_ = _loc3_[_loc9_];
            if(_loc10_.search(_loc8_) == 0)
            {
               if(!(_loc5_ > 0 && _loc9_ > 0))
               {
                  _loc5_++;
               }
               else
               {
                  break;
               }
            }
            _loc7_.push("<p" + _loc4_ + ">&gt;&nbsp;" + _loc10_.replace(/\s/,"&nbsp;") + "</p" + _loc4_ + ">");
            if(_loc4_ > 6)
            {
               _loc4_--;
            }
            _loc9_++;
         }
         report(_loc7_.join("\n"),9);
      }
      
      private function saveCmd(param1:String = null) : void
      {
         this.store(param1,this._scope,false);
      }
      
      private function saveStrongCmd(param1:String = null) : void
      {
         this.store(param1,this._scope,true);
      }
      
      private function savedCmd(... rest) : void
      {
         var _loc4_:* = null;
         var _loc5_:WeakRef = null;
         report("Saved vars: ",-1);
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         for(_loc4_ in this._saved)
         {
            _loc5_ = this._saved.getWeakRef(_loc4_);
            _loc2_++;
            if(_loc5_.reference == null)
            {
               _loc3_++;
            }
            report((!!_loc5_.strong?"strong":"weak") + " <b>$" + _loc4_ + "</b> = " + console.links.makeString(_loc5_.reference),-2);
         }
         report("Found " + _loc2_ + " item(s), " + _loc3_ + " empty.",-1);
      }
      
      private function stringCmd(param1:String) : void
      {
         report("String with " + param1.length + " chars entered. Use /save <i>(name)</i> to save.",-2);
         this.setReturned(param1,true);
      }
      
      private function cmdsCmd(... rest) : void
      {
         var _loc4_:SlashCommand = null;
         var _loc2_:Array = [];
         var _loc3_:Array = [];
         for each(_loc4_ in this._slashCmds)
         {
            if(config.commandLineAllowed || _loc4_.allow)
            {
               if(_loc4_.user)
               {
                  _loc3_.push(_loc4_);
               }
               else
               {
                  _loc2_.push(_loc4_);
               }
            }
         }
         _loc2_ = _loc2_.sortOn("n");
         report("Build-in commands:" + (!config.commandLineAllowed?" (limited permission)":""),4);
         for each(_loc4_ in _loc2_)
         {
            report("<b>/" + _loc4_.n + "</b> <p-1>" + _loc4_.d + "</p-1>",-2);
         }
         if(_loc3_.length)
         {
            _loc3_ = _loc3_.sortOn("n");
            report("User commands:",4);
            for each(_loc4_ in _loc3_)
            {
               report("<b>/" + _loc4_.n + "</b> <p-1>" + _loc4_.d + "</p-1>",-2);
            }
         }
      }
      
      private function inspectCmd(... rest) : void
      {
         console.links.focus(this._scope);
      }
      
      private function explodeCmd(param1:String = "0") : void
      {
         var _loc2_:int = int(param1);
         console.explode(this._scope,_loc2_ <= 0?3:int(_loc2_));
      }
      
      private function mapCmd(param1:String = "0") : void
      {
         console.map(this._scope as DisplayObjectContainer,int(param1));
      }
      
      private function funCmd(param1:String = "") : void
      {
         var _loc2_:FakeFunction = new FakeFunction(this.run,param1);
         this.setReturned(_loc2_.exec);
      }
      
      private function autoscopeCmd(... rest) : void
      {
         config.commandLineAutoScope = !config.commandLineAutoScope;
         report("Auto-scoping <b>" + (!!config.commandLineAutoScope?"enabled":"disabled") + "</b>.",10);
      }
      
      private function baseCmd(... rest) : void
      {
         this.setReturned(this.base,true);
      }
      
      private function prevCmd(... rest) : void
      {
         this.setReturned(this._prevScope.reference,true);
      }
      
      private function printHelp() : void
      {
         report("____Command Line Help___",10);
         report("/filter (text) = filter/search logs for matching text",5);
         report("/commands to see all slash commands",5);
         report("Press up/down arrow keys to recall previous line",2);
         report("__Examples:",10);
         report("<b>stage.stageWidth</b>",5);
         report("<b>stage.scaleMode = flash.display.StageScaleMode.NO_SCALE</b>",5);
         report("<b>stage.frameRate = 12</b>",5);
         report("__________",10);
      }
   }
}

class FakeFunction
{
    
   
   private var line:String;
   
   private var run:Function;
   
   function FakeFunction(param1:Function, param2:String)
   {
      super();
      this.run = param1;
      this.line = param2;
   }
   
   public function exec(... rest) : *
   {
      return this.run(this.line);
   }
}

class SlashCommand
{
    
   
   public var n:String;
   
   public var f:Function;
   
   public var d:String;
   
   public var user:Boolean;
   
   public var allow:Boolean;
   
   function SlashCommand(param1:String, param2:Function, param3:String = "", param4:Boolean = true, param5:Boolean = false)
   {
      super();
      this.n = param1;
      this.f = param2;
      this.d = !!param3?param3:"";
      this.user = param4;
      this.allow = param5;
   }
}
