package com.junkbyte.console.view
{
   import flash.text.TextField;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import flash.geom.ColorTransform;
   import com.junkbyte.console.vos.Log;
   import com.junkbyte.console.Console;
   import com.junkbyte.console.core.LogReferences;
   import flash.geom.Rectangle;
   import com.junkbyte.console.core.Remoting;
   import flash.events.TextEvent;
   import flash.system.System;
   import flash.system.Security;
   import flash.system.SecurityPanel;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFieldType;
   import flash.events.FocusEvent;
   
   public class MainPanel extends AbstractPanel
   {
      
      public static const NAME:String = "mainPanel";
       
      
      private var _traceField:TextField;
      
      private var _cmdPrefx:TextField;
      
      private var _cmdField:TextField;
      
      private var _hintField:TextField;
      
      private var _cmdBG:Shape;
      
      private var _bottomLine:Shape;
      
      private var _mini:Boolean;
      
      private var _shift:Boolean;
      
      private var _scroll:Sprite;
      
      private var _scroller:Sprite;
      
      private var _scrolldelay:uint;
      
      private var _scrolldir:int;
      
      private var _scrolling:Boolean;
      
      private var _scrollHeight:Number;
      
      private var _selectionStart:int;
      
      private var _selectionEnd:int;
      
      private var _viewingChannels:Array;
      
      private var _extraMenus:Object;
      
      private var _cmdsInd:int = -1;
      
      private var _priority:int;
      
      private var _filterText:String;
      
      private var _filterRegExp:RegExp;
      
      private var _needUpdateMenu:Boolean;
      
      private var _needUpdateTrace:Boolean;
      
      private var _lockScrollUpdate:Boolean;
      
      private var _atBottom:Boolean = true;
      
      private var _enteringLogin:Boolean;
      
      private var _hint:String;
      
      public function MainPanel(param1:Console)
      {
         var _loc2_:int = 0;
         this._extraMenus = new Object();
         super(param1);
         _loc2_ = style.menuFontSize;
         this._viewingChannels = new Array();
         console.cl.addCLCmd("filter",this.setFilterText,"Filter console logs to matching string. When done, click on the * (global channel) at top.",true);
         console.cl.addCLCmd("filterexp",this.setFilterRegExp,"Filter console logs to matching regular expression",true);
         console.cl.addCLCmd("clearhistory",this.clearCommandLineHistory,"Clear history of commands you have entered.",true);
         name = NAME;
         minWidth = 50;
         minHeight = 18;
         this._traceField = makeTF("traceField");
         this._traceField.wordWrap = true;
         this._traceField.multiline = true;
         this._traceField.y = _loc2_;
         this._traceField.addEventListener(Event.SCROLL,this.onTraceScroll);
         addChild(this._traceField);
         txtField = makeTF("menuField");
         txtField.height = _loc2_ + 6;
         txtField.y = -2;
         registerTFRoller(txtField,this.onMenuRollOver);
         addChild(txtField);
         this._cmdBG = new Shape();
         this._cmdBG.name = "commandBackground";
         this._cmdBG.graphics.beginFill(style.commandLineColor,0.1);
         this._cmdBG.graphics.drawRoundRect(0,0,100,18,_loc2_,_loc2_);
         this._cmdBG.scale9Grid = new Rectangle(9,9,80,1);
         addChild(this._cmdBG);
         var _loc3_:TextFormat = new TextFormat(style.menuFont,style.menuFontSize,style.highColor);
         this._cmdField = new TextField();
         this._cmdField.name = "commandField";
         this._cmdField.type = TextFieldType.INPUT;
         this._cmdField.x = 40;
         this._cmdField.height = _loc2_ + 6;
         this._cmdField.addEventListener(KeyboardEvent.KEY_DOWN,this.commandKeyDown);
         this._cmdField.addEventListener(KeyboardEvent.KEY_UP,this.commandKeyUp);
         this._cmdField.addEventListener(FocusEvent.FOCUS_IN,this.updateCmdHint);
         this._cmdField.addEventListener(FocusEvent.FOCUS_OUT,this.onCmdFocusOut);
         this._cmdField.defaultTextFormat = _loc3_;
         addChild(this._cmdField);
         this._hintField = new TextField();
         this._hintField.name = "commandField";
         this._hintField.mouseEnabled = false;
         this._hintField.background = true;
         this._hintField.backgroundColor = style.backgroundColor;
         this._hintField.defaultTextFormat = new TextFormat(style.menuFont,style.menuFontSize - 1,style.lowColor);
         this._hintField.x = this._cmdField.x;
         this._hintField.width = 300;
         this._hintField.autoSize = TextFieldAutoSize.LEFT;
         addChild(this._hintField);
         this.setHints();
         _loc3_.color = style.commandLineColor;
         this._cmdPrefx = new TextField();
         this._cmdPrefx.name = "commandPrefx";
         this._cmdPrefx.type = TextFieldType.DYNAMIC;
         this._cmdPrefx.x = 2;
         this._cmdPrefx.height = _loc2_ + 6;
         this._cmdPrefx.selectable = false;
         this._cmdPrefx.defaultTextFormat = _loc3_;
         this._cmdPrefx.text = " ";
         this._cmdPrefx.addEventListener(MouseEvent.MOUSE_DOWN,this.onCmdPrefMouseDown);
         this._cmdPrefx.addEventListener(MouseEvent.MOUSE_MOVE,this.onCmdPrefRollOverOut);
         this._cmdPrefx.addEventListener(MouseEvent.ROLL_OUT,this.onCmdPrefRollOverOut);
         addChild(this._cmdPrefx);
         this._bottomLine = new Shape();
         this._bottomLine.name = "blinkLine";
         this._bottomLine.alpha = 0.2;
         addChild(this._bottomLine);
         this._scroll = new Sprite();
         this._scroll.y = _loc2_ + 4;
         this._scroll.name = "scroller";
         this._scroll.buttonMode = true;
         this._scroll.addEventListener(MouseEvent.MOUSE_DOWN,this.onScrollbarDown,false,0,true);
         this._scroller = new Sprite();
         this._scroller.name = "scrollbar";
         this._scroller.y = 5;
         this._scroller.graphics.beginFill(style.controlColor,1);
         this._scroller.graphics.drawRect(-5,0,5,30);
         this._scroller.graphics.beginFill(0,0);
         this._scroller.graphics.drawRect(-10,0,10,30);
         this._scroller.graphics.endFill();
         this._scroller.addEventListener(MouseEvent.MOUSE_DOWN,this.onScrollerDown,false,0,true);
         this._scroll.addChild(this._scroller);
         addChild(this._scroll);
         this._cmdField.visible = false;
         this._cmdPrefx.visible = false;
         this._cmdBG.visible = false;
         init(640,100,true);
         registerDragger(txtField);
         addEventListener(TextEvent.LINK,this.linkHandler,false,0,true);
         addEventListener(Event.ADDED_TO_STAGE,this.stageAddedHandle,false,0,true);
         addEventListener(Event.REMOVED_FROM_STAGE,this.stageRemovedHandle,false,0,true);
      }
      
      public function addMenu(param1:String, param2:Function, param3:Array, param4:String) : void
      {
         if(param1)
         {
            param1 = param1.replace(/[^\w]*/g,"");
            if(param2 == null)
            {
               delete this._extraMenus[param1];
            }
            else
            {
               this._extraMenus[param1] = new Array(param2,param3,param4);
            }
            this._needUpdateMenu = true;
         }
         else
         {
            console.report("ERROR: Invalid add menu params.",9);
         }
      }
      
      private function stageAddedHandle(param1:Event = null) : void
      {
         stage.addEventListener(KeyboardEvent.KEY_UP,this.keyUpHandler,false,0,true);
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this.keyDownHandler,false,0,true);
      }
      
      private function stageRemovedHandle(param1:Event = null) : void
      {
         stage.removeEventListener(KeyboardEvent.KEY_UP,this.keyUpHandler);
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.keyDownHandler);
      }
      
      private function onCmdPrefRollOverOut(param1:MouseEvent) : void
      {
         console.panels.tooltip(param1.type == MouseEvent.MOUSE_MOVE?"Current scope::(CommandLine)":"",this);
      }
      
      private function onCmdPrefMouseDown(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         try
         {
            stage.focus = this._cmdField;
            this._cmdField.setSelection(this._cmdField.text.length,this._cmdField.text.length);
            return;
         }
         catch(err:Error)
         {
            return;
         }
      }
      
      private function keyDownHandler(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.SHIFT)
         {
            this._shift = true;
         }
      }
      
      private function keyUpHandler(param1:KeyboardEvent) : void
      {
         var e:KeyboardEvent = param1;
         if(e.keyCode == Keyboard.SHIFT)
         {
            this._shift = false;
         }
         else if(e.keyCode == Keyboard.ENTER && parent.visible && visible && this._cmdField.visible)
         {
            try
            {
               stage.focus = this._cmdField;
               this._cmdField.setSelection(0,this._cmdField.text.length);
               return;
            }
            catch(err:Error)
            {
               return;
            }
         }
      }
      
      public function requestLogin(param1:Boolean = true) : void
      {
         var _loc2_:ColorTransform = new ColorTransform();
         if(param1)
         {
            console.commandLine = true;
            console.report("//",-2);
            console.report("// <b>Enter remoting password</b> in CommandLine below...",-2);
            this.updateCLScope("Password");
            _loc2_.color = style.controlColor;
            this._cmdBG.transform.colorTransform = _loc2_;
            this._traceField.transform.colorTransform = new ColorTransform(0.7,0.7,0.7);
         }
         else
         {
            this.updateCLScope("?");
            this._cmdBG.transform.colorTransform = _loc2_;
            this._traceField.transform.colorTransform = _loc2_;
         }
         this._cmdField.displayAsPassword = param1;
         this._enteringLogin = param1;
      }
      
      public function update(param1:Boolean) : void
      {
         if(this._bottomLine.alpha > 0)
         {
            this._bottomLine.alpha = this._bottomLine.alpha - 0.25;
         }
         if(param1)
         {
            this._bottomLine.alpha = 1;
            this._needUpdateMenu = true;
            this._needUpdateTrace = true;
         }
         if(this._needUpdateTrace)
         {
            this._needUpdateTrace = false;
            this._updateTraces(true);
         }
         if(this._needUpdateMenu)
         {
            this._needUpdateMenu = false;
            this._updateMenu();
         }
      }
      
      public function updateToBottom() : void
      {
         this._atBottom = true;
         this._needUpdateTrace = true;
      }
      
      private function _updateTraces(param1:Boolean = false) : void
      {
         if(this._atBottom)
         {
            this.updateBottom();
         }
         else if(!param1)
         {
            this.updateFull();
         }
         if(this._selectionStart != this._selectionEnd)
         {
            if(this._atBottom)
            {
               this._traceField.setSelection(this._traceField.text.length - this._selectionStart,this._traceField.text.length - this._selectionEnd);
            }
            else
            {
               this._traceField.setSelection(this._traceField.text.length - this._selectionEnd,this._traceField.text.length - this._selectionStart);
            }
            this._selectionEnd = -1;
            this._selectionStart = -1;
         }
      }
      
      private function updateFull() : void
      {
         var _loc1_:String = "";
         var _loc2_:Log = console.logs.last;
         while(_loc2_)
         {
            if(this.lineShouldShow(_loc2_))
            {
               _loc1_ = this.makeLine(_loc2_) + _loc1_;
            }
            _loc2_ = _loc2_.prev;
         }
         this._lockScrollUpdate = true;
         this._traceField.htmlText = _loc1_;
         this._lockScrollUpdate = false;
         this.updateScroller();
      }
      
      public function setPaused(param1:Boolean) : void
      {
         if(param1 && this._atBottom)
         {
            this._atBottom = false;
            this._updateTraces();
            this._traceField.scrollV = this._traceField.maxScrollV;
         }
         else if(!param1)
         {
            this._atBottom = true;
            this.updateBottom();
         }
         this.updateMenu();
      }
      
      private function updateBottom() : void
      {
         var _loc5_:int = 0;
         var _loc1_:Array = new Array();
         var _loc2_:int = Math.round(this._traceField.height / style.traceFontSize);
         var _loc3_:int = Math.round(this._traceField.width * 5 / style.traceFontSize);
         var _loc4_:Log = console.logs.last;
         while(_loc4_)
         {
            if(this.lineShouldShow(_loc4_))
            {
               _loc5_ = Math.ceil(_loc4_.text.length / _loc3_);
               if(_loc4_.html || _loc2_ >= _loc5_)
               {
                  _loc1_.push(this.makeLine(_loc4_));
                  _loc2_ = _loc2_ - _loc5_;
                  if(_loc2_ <= 0)
                  {
                     break;
                  }
               }
               else
               {
                  _loc4_ = _loc4_.clone();
                  _loc4_.text = _loc4_.text.substring(Math.max(0,_loc4_.text.length - _loc3_ * _loc2_));
                  _loc1_.push(this.makeLine(_loc4_));
                  break;
               }
            }
            _loc4_ = _loc4_.prev;
         }
         this._lockScrollUpdate = true;
         this._traceField.htmlText = _loc1_.reverse().join("");
         this._traceField.scrollV = this._traceField.maxScrollV;
         this._lockScrollUpdate = false;
         this.updateScroller();
      }
      
      private function lineShouldShow(param1:Log) : Boolean
      {
         return (this._viewingChannels.length == 0 || this._viewingChannels.indexOf(param1.ch) >= 0 || this._filterText && this._viewingChannels.indexOf(Console.FILTER_CHANNEL) >= 0 && param1.text.toLowerCase().indexOf(this._filterText) >= 0 || this._filterRegExp && this._viewingChannels.indexOf(Console.FILTER_CHANNEL) >= 0 && param1.text.search(this._filterRegExp) >= 0) && (this._priority <= 0 || param1.priority >= this._priority);
      }
      
      public function get viewingChannels() : Array
      {
         return this._viewingChannels;
      }
      
      public function set viewingChannels(param1:Array) : void
      {
         var _loc2_:String = null;
         if(this._viewingChannels[0] == LogReferences.INSPECTING_CHANNEL && (!param1 || param1[0] != this._viewingChannels[0]))
         {
            console.links.exitFocus();
         }
         this._viewingChannels.splice(0);
         if(param1.indexOf(Console.GLOBAL_CHANNEL) < 0 && param1.indexOf(null) < 0)
         {
            for each(_loc2_ in param1)
            {
               this._viewingChannels.push(_loc2_);
            }
         }
         this.updateToBottom();
         console.panels.updateMenu();
      }
      
      private function setFilterText(param1:String = "") : void
      {
         if(param1)
         {
            this._filterRegExp = null;
            this._filterText = LogReferences.EscHTML(param1.toLowerCase());
            this.startFilter();
         }
         else
         {
            this.endFilter();
         }
      }
      
      private function setFilterRegExp(param1:String = "") : void
      {
         if(param1)
         {
            this._filterText = null;
            this._filterRegExp = new RegExp(LogReferences.EscHTML(param1),"gi");
            this.startFilter();
         }
         else
         {
            this.endFilter();
         }
      }
      
      private function startFilter() : void
      {
         console.clear(Console.FILTER_CHANNEL);
         console.logs.addChannel(Console.FILTER_CHANNEL);
         this.viewingChannels = [Console.FILTER_CHANNEL];
      }
      
      private function endFilter() : void
      {
         this._filterRegExp = null;
         this._filterText = null;
         if(this._viewingChannels.length == 1 && this._viewingChannels[0] == Console.FILTER_CHANNEL)
         {
            this.viewingChannels = [Console.GLOBAL_CHANNEL];
         }
      }
      
      private function makeLine(param1:Log) : String
      {
         var _loc4_:int = 0;
         var _loc6_:Object = null;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc2_:String = "";
         var _loc3_:String = param1.text;
         if(param1.ch != Console.DEFAULT_CHANNEL && (this._viewingChannels.length == 0 || this._viewingChannels.length > 1))
         {
            _loc3_ = "[<a href=\"event:channel_" + param1.ch + "\">" + param1.ch + "</a>] " + _loc3_;
         }
         if(this._filterRegExp)
         {
            this._filterRegExp.lastIndex = 0;
            _loc6_ = this._filterRegExp.exec(_loc3_);
            while(_loc6_ != null)
            {
               _loc4_ = _loc6_.index;
               _loc7_ = _loc6_[0];
               if(_loc7_.search("<|>") >= 0)
               {
                  this._filterRegExp.lastIndex = this._filterRegExp.lastIndex - (_loc7_.length - _loc7_.search("<|>"));
               }
               else if(_loc3_.lastIndexOf("<",_loc4_) <= _loc3_.lastIndexOf(">",_loc4_))
               {
                  _loc3_ = _loc3_.substring(0,_loc4_) + "<u>" + _loc3_.substring(_loc4_,_loc4_ + _loc7_.length) + "</u>" + _loc3_.substring(_loc4_ + _loc7_.length);
                  this._filterRegExp.lastIndex = this._filterRegExp.lastIndex + 7;
               }
               _loc6_ = this._filterRegExp.exec(_loc3_);
            }
         }
         else if(this._filterText)
         {
            _loc8_ = _loc3_.toLowerCase();
            _loc4_ = _loc8_.lastIndexOf(this._filterText);
            while(_loc4_ >= 0)
            {
               _loc3_ = _loc3_.substring(0,_loc4_) + "<u>" + _loc3_.substring(_loc4_,_loc4_ + this._filterText.length) + "</u>" + _loc3_.substring(_loc4_ + this._filterText.length);
               _loc4_ = _loc8_.lastIndexOf(this._filterText,_loc4_ - 2);
            }
         }
         var _loc5_:String = "p" + param1.priority;
         _loc2_ = _loc2_ + ("<p><" + _loc5_ + ">" + _loc3_ + "</" + _loc5_ + "></p>");
         return _loc2_;
      }
      
      private function onTraceScroll(param1:Event = null) : void
      {
         var _loc3_:int = 0;
         if(this._lockScrollUpdate)
         {
            return;
         }
         var _loc2_:* = this._traceField.scrollV >= this._traceField.maxScrollV;
         if(!console.paused && this._atBottom != _loc2_)
         {
            _loc3_ = this._traceField.maxScrollV - this._traceField.scrollV;
            this._selectionStart = this._traceField.text.length - this._traceField.selectionBeginIndex;
            this._selectionEnd = this._traceField.text.length - this._traceField.selectionEndIndex;
            this._atBottom = _loc2_;
            this._updateTraces();
            this._traceField.scrollV = this._traceField.maxScrollV - _loc3_;
         }
         this.updateScroller();
      }
      
      private function updateScroller() : void
      {
         if(this._traceField.maxScrollV <= 1)
         {
            this._scroll.visible = false;
         }
         else
         {
            this._scroll.visible = true;
            if(this._atBottom)
            {
               this.scrollPercent = 1;
            }
            else
            {
               this.scrollPercent = (this._traceField.scrollV - 1) / (this._traceField.maxScrollV - 1);
            }
         }
      }
      
      private function onScrollbarDown(param1:MouseEvent) : void
      {
         if(this._scroller.visible && this._scroller.mouseY > 0 || !this._scroller.visible && this._scroll.mouseY > this._scrollHeight / 2)
         {
            this._scrolldir = 3;
         }
         else
         {
            this._scrolldir = -3;
         }
         this._traceField.scrollV = this._traceField.scrollV + this._scrolldir;
         this._scrolldelay = 0;
         addEventListener(Event.ENTER_FRAME,this.onScrollBarFrame,false,0,true);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onScrollBarUp,false,0,true);
      }
      
      private function onScrollBarFrame(param1:Event) : void
      {
         this._scrolldelay++;
         if(this._scrolldelay > 10)
         {
            this._scrolldelay = 9;
            if(this._scrolldir < 0 && this._scroller.y > this._scroll.mouseY || this._scrolldir > 0 && this._scroller.y + this._scroller.height < this._scroll.mouseY)
            {
               this._traceField.scrollV = this._traceField.scrollV + this._scrolldir;
            }
         }
      }
      
      private function onScrollBarUp(param1:Event) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.onScrollBarFrame);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onScrollBarUp);
      }
      
      private function get scrollPercent() : Number
      {
         return (this._scroller.y - 5) / (this._scrollHeight - 40);
      }
      
      private function set scrollPercent(param1:Number) : void
      {
         this._scroller.y = 5 + (this._scrollHeight - 40) * param1;
      }
      
      private function onScrollerDown(param1:MouseEvent) : void
      {
         var _loc2_:Number = NaN;
         this._scrolling = true;
         if(!console.paused && this._atBottom)
         {
            this._atBottom = false;
            _loc2_ = this.scrollPercent;
            this._updateTraces();
            this.scrollPercent = _loc2_;
         }
         this._scroller.startDrag(false,new Rectangle(0,5,0,this._scrollHeight - 40));
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onScrollerMove,false,0,true);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onScrollerUp,false,0,true);
         param1.stopPropagation();
      }
      
      private function onScrollerMove(param1:MouseEvent) : void
      {
         this._lockScrollUpdate = true;
         this._traceField.scrollV = Math.round(this.scrollPercent * (this._traceField.maxScrollV - 1) + 1);
         this._lockScrollUpdate = false;
      }
      
      private function onScrollerUp(param1:MouseEvent) : void
      {
         this._scroller.stopDrag();
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onScrollerMove);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onScrollerUp);
         this._scrolling = false;
         this.onTraceScroll();
      }
      
      override public function set width(param1:Number) : void
      {
         this._lockScrollUpdate = true;
         super.width = param1;
         this._traceField.width = param1 - 4;
         txtField.width = param1 - 4;
         this._cmdField.width = width - 15 - this._cmdField.x;
         this._cmdBG.width = param1;
         this._bottomLine.graphics.clear();
         this._bottomLine.graphics.lineStyle(1,style.controlColor);
         this._bottomLine.graphics.moveTo(10,-1);
         this._bottomLine.graphics.lineTo(param1 - 10,-1);
         this._scroll.x = param1;
         if(console.remoter.remoting != Remoting.RECIEVER)
         {
            this.updateCLScope(console.cl.scopeString);
         }
         this._atBottom = true;
         this._needUpdateMenu = true;
         this._needUpdateTrace = true;
         this._lockScrollUpdate = false;
      }
      
      override public function set height(param1:Number) : void
      {
         this._lockScrollUpdate = true;
         var _loc2_:int = style.menuFontSize;
         var _loc3_:Number = _loc2_ + 6 + style.traceFontSize;
         if(super.height != param1)
         {
            this._mini = param1 < (!!this._cmdField.visible?_loc3_ + _loc2_ + 4:_loc3_);
         }
         super.height = param1;
         var _loc4_:Boolean = this._mini || !style.topMenu;
         this._traceField.y = !!_loc4_?0:Number(_loc2_);
         this._traceField.height = param1 - (!!this._cmdField.visible?_loc2_ + 4:0) - (!!_loc4_?0:_loc2_);
         var _loc5_:Number = param1 - (_loc2_ + 6);
         this._cmdField.y = _loc5_;
         this._cmdPrefx.y = _loc5_;
         this._hintField.y = this._cmdField.y - this._hintField.height;
         this._cmdBG.y = _loc5_;
         this._bottomLine.y = !!this._cmdField.visible?Number(_loc5_):Number(param1);
         this._scroll.y = !!_loc4_?6:Number(_loc2_ + 4);
         this._scrollHeight = this._bottomLine.y - (!!this._cmdField.visible?0:10) - this._scroll.y;
         this._scroller.visible = this._scrollHeight > 40;
         this._scroll.graphics.clear();
         if(this._scrollHeight >= 10)
         {
            this._scroll.graphics.beginFill(style.controlColor,0.7);
            this._scroll.graphics.drawRect(-5,0,5,5);
            this._scroll.graphics.drawRect(-5,this._scrollHeight - 5,5,5);
            this._scroll.graphics.beginFill(style.controlColor,0.25);
            this._scroll.graphics.drawRect(-5,5,5,this._scrollHeight - 10);
            this._scroll.graphics.beginFill(0,0);
            this._scroll.graphics.drawRect(-10,10,10,this._scrollHeight - 10);
            this._scroll.graphics.endFill();
         }
         this._atBottom = true;
         this._needUpdateTrace = true;
         this._lockScrollUpdate = false;
      }
      
      public function updateMenu(param1:Boolean = false) : void
      {
         if(param1)
         {
            this._updateMenu();
         }
         else
         {
            this._needUpdateMenu = true;
         }
      }
      
      private function _updateMenu() : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:* = null;
         var _loc1_:String = "<r><w>";
         if(this._mini || !style.topMenu)
         {
            _loc1_ = _loc1_ + "<menu><b> <a href=\"event:show\">‹</a> </b></menu>";
         }
         else
         {
            if(!console.panels.channelsPanel)
            {
               _loc1_ = _loc1_ + this.getChannelsLink(true);
            }
            _loc1_ = _loc1_ + "<menu> <b>";
            for(_loc3_ in this._extraMenus)
            {
               _loc1_ = _loc1_ + ("<a href=\"event:external_" + _loc3_ + "\">" + _loc3_ + "</a> ");
               _loc2_ = true;
            }
            if(_loc2_)
            {
               _loc1_ = _loc1_ + "¦ ";
            }
            _loc1_ = _loc1_ + this.doActive("<a href=\"event:fps\">F</a>",console.fpsMonitor > 0);
            _loc1_ = _loc1_ + this.doActive(" <a href=\"event:mm\">M</a>",console.memoryMonitor > 0);
            _loc1_ = _loc1_ + this.doActive(" <a href=\"event:command\">CL</a>",this.commandLine);
            if(console.remoter.remoting != Remoting.RECIEVER)
            {
               _loc1_ = _loc1_ + this.doActive(" <a href=\"event:roller\">Ro</a>",console.displayRoller);
               _loc1_ = _loc1_ + this.doActive(" <a href=\"event:ruler\">RL</a>",console.panels.rulerActive);
            }
            _loc1_ = _loc1_ + " ¦</b>";
            _loc1_ = _loc1_ + " <a href=\"event:copy\">Cc</a>";
            _loc1_ = _loc1_ + (" <a href=\"event:priority\">P" + this._priority + "</a>");
            _loc1_ = _loc1_ + this.doActive(" <a href=\"event:pause\">P</a>",console.paused);
            _loc1_ = _loc1_ + " <a href=\"event:clear\">C</a> <a href=\"event:close\">X</a> <a href=\"event:hide\">›</a> </b></menu>";
         }
         _loc1_ = _loc1_ + "</w></r>";
         txtField.htmlText = _loc1_;
         txtField.scrollH = txtField.maxScrollH;
      }
      
      public function getChannelsLink(param1:Boolean = false) : String
      {
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc2_:String = "<chs>";
         var _loc3_:Array = console.logs.getChannels();
         var _loc4_:int = _loc3_.length;
         if(param1 && _loc4_ > style.maxChannelsInMenu)
         {
            _loc4_ = style.maxChannelsInMenu;
         }
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = _loc3_[_loc5_];
            _loc7_ = _loc5_ == 0 && this._viewingChannels.length == 0 || this._viewingChannels.indexOf(_loc6_) >= 0?"<ch><b>" + _loc6_ + "</b></ch>":_loc6_;
            _loc2_ = _loc2_ + ("<a href=\"event:channel_" + _loc6_ + "\">[" + _loc7_ + "]</a> ");
            _loc5_++;
         }
         if(param1)
         {
            _loc2_ = _loc2_ + ("<ch><a href=\"event:channels\"><b>" + (_loc3_.length > _loc4_?"...":"") + "</b>^^ </a></ch>");
         }
         _loc2_ = _loc2_ + "</chs> ";
         return _loc2_;
      }
      
      private function doActive(param1:String, param2:Boolean) : String
      {
         if(param2)
         {
            return "<hi>" + param1 + "</hi>";
         }
         return param1;
      }
      
      public function onMenuRollOver(param1:TextEvent, param2:AbstractPanel = null) : void
      {
         var _loc4_:Array = null;
         var _loc5_:Object = null;
         if(param2 == null)
         {
            param2 = this;
         }
         var _loc3_:String = !!param1.text?param1.text.replace("event:",""):"";
         if(_loc3_ == "channel_" + Console.GLOBAL_CHANNEL)
         {
            _loc3_ = "View all channels";
         }
         else if(_loc3_ == "channel_" + Console.DEFAULT_CHANNEL)
         {
            _loc3_ = "Default channel::Logs with no channel";
         }
         else if(_loc3_ == "channel_" + Console.CONSOLE_CHANNEL)
         {
            _loc3_ = "Console\'s channel::Logs generated from Console";
         }
         else if(_loc3_ == "channel_" + Console.FILTER_CHANNEL)
         {
            _loc3_ = !!this._filterRegExp?String(this._filterRegExp):this._filterText;
            _loc3_ = "Filtering channel" + "::*" + _loc3_ + "*";
         }
         else if(_loc3_ == "channel_" + LogReferences.INSPECTING_CHANNEL)
         {
            _loc3_ = "Inspecting channel";
         }
         else if(_loc3_.indexOf("channel_") == 0)
         {
            _loc3_ = "Change channel::Hold shift to select multiple channels";
         }
         else if(_loc3_ == "pause")
         {
            if(console.paused)
            {
               _loc3_ = "Resume updates";
            }
            else
            {
               _loc3_ = "Pause updates";
            }
         }
         else if(_loc3_ == "close" && param2 == this)
         {
            _loc3_ = "Close::Type password to show again";
         }
         else if(_loc3_.indexOf("external_") == 0)
         {
            _loc4_ = this._extraMenus[_loc3_.substring(9)];
            if(_loc4_)
            {
               _loc3_ = _loc4_[2];
            }
         }
         else
         {
            _loc5_ = {
               "fps":"Frames Per Second",
               "mm":"Memory Monitor",
               "roller":"Display Roller::Map the display list under your mouse",
               "ruler":"Screen Ruler::Measure the distance and angle between two points on screen.",
               "command":"Command Line",
               "copy":"Copy to clipboard",
               "clear":"Clear log",
               "priority":"Toggle priority filter::auto skips unused priorites.\nshift click to reverse",
               "channels":"Expand channels",
               "close":"Close"
            };
            _loc3_ = _loc5_[_loc3_];
         }
         console.panels.tooltip(_loc3_,param2);
      }
      
      private function linkHandler(param1:TextEvent) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         txtField.setSelection(0,0);
         stopDrag();
         var _loc2_:String = param1.text;
         if(_loc2_ == "pause")
         {
            if(console.paused)
            {
               console.paused = false;
            }
            else
            {
               console.paused = true;
            }
            console.panels.tooltip(null);
         }
         else if(_loc2_ == "hide")
         {
            console.panels.tooltip();
            this._mini = true;
            console.config.style.topMenu = false;
            this.height = height;
            this.updateMenu();
         }
         else if(_loc2_ == "show")
         {
            console.panels.tooltip();
            this._mini = false;
            console.config.style.topMenu = true;
            this.height = height;
            this.updateMenu();
         }
         else if(_loc2_ == "close")
         {
            console.panels.tooltip();
            visible = false;
            dispatchEvent(new Event(Event.CLOSE));
         }
         else if(_loc2_ == "channels")
         {
            console.panels.channelsPanel = !console.panels.channelsPanel;
         }
         else if(_loc2_ == "fps")
         {
            console.fpsMonitor = !console.fpsMonitor;
         }
         else if(_loc2_ == "priority")
         {
            this.incPriority(this._shift);
         }
         else if(_loc2_ == "mm")
         {
            console.memoryMonitor = !console.memoryMonitor;
         }
         else if(_loc2_ == "roller")
         {
            console.displayRoller = !console.displayRoller;
         }
         else if(_loc2_ == "ruler")
         {
            console.panels.tooltip();
            console.panels.startRuler();
         }
         else if(_loc2_ == "command")
         {
            this.commandLine = !this.commandLine;
         }
         else if(_loc2_ == "copy")
         {
            System.setClipboard(console.getAllLog());
            console.report("Copied log to clipboard.",-1);
         }
         else if(_loc2_ == "clear")
         {
            console.clear();
         }
         else if(_loc2_ == "settings")
         {
            console.report("A new window should open in browser. If not, try searching for \'Flash Player Global Security Settings panel\' online :)",-1);
            Security.showSettings(SecurityPanel.SETTINGS_MANAGER);
         }
         else if(_loc2_ == "remote")
         {
            console.remoter.remoting = Remoting.RECIEVER;
         }
         else if(_loc2_.indexOf("ref") == 0)
         {
            console.links.handleRefEvent(_loc2_);
         }
         else if(_loc2_.indexOf("channel_") == 0)
         {
            this.onChannelPressed(_loc2_.substring(8));
         }
         else if(_loc2_.indexOf("cl_") == 0)
         {
            _loc3_ = _loc2_.indexOf("_",3);
            console.cl.handleScopeEvent(uint(_loc2_.substring(3,_loc3_ < 0?Number(_loc2_.length):Number(_loc3_))));
            if(_loc3_ >= 0)
            {
               this._cmdField.text = _loc2_.substring(_loc3_ + 1);
            }
         }
         else if(_loc2_.indexOf("external_") == 0)
         {
            _loc4_ = this._extraMenus[_loc2_.substring(9)];
            if(_loc4_)
            {
               _loc4_[0].apply(null,_loc4_[1]);
            }
         }
         txtField.setSelection(0,0);
         param1.stopPropagation();
      }
      
      public function onChannelPressed(param1:String) : void
      {
         var _loc3_:int = 0;
         var _loc2_:Array = this._viewingChannels.concat();
         if(this._shift && param1 != Console.GLOBAL_CHANNEL && _loc2_[0] != LogReferences.INSPECTING_CHANNEL)
         {
            _loc3_ = _loc2_.indexOf(param1);
            if(_loc3_ >= 0)
            {
               _loc2_.splice(_loc3_,1);
               if(_loc2_.length == 0)
               {
                  _loc2_.push(Console.GLOBAL_CHANNEL);
               }
            }
            else
            {
               _loc2_.push(param1);
            }
            this.viewingChannels = _loc2_;
         }
         else
         {
            console.setViewingChannels(param1);
         }
      }
      
      public function set priority(param1:int) : void
      {
         this._priority = param1;
         this.updateToBottom();
         this.updateMenu();
      }
      
      public function get priority() : int
      {
         return this._priority;
      }
      
      private function incPriority(param1:Boolean) : void
      {
         var _loc3_:uint = 0;
         var _loc2_:uint = 10;
         var _loc4_:Log = console.logs.last;
         var _loc5_:int = this._priority;
         this._priority = 0;
         var _loc6_:uint = 32000;
         while(_loc4_ && _loc6_ > 0)
         {
            _loc6_--;
            if(this.lineShouldShow(_loc4_))
            {
               if(_loc4_.priority > _loc5_ && _loc2_ > _loc4_.priority)
               {
                  _loc2_ = _loc4_.priority;
               }
               if(_loc4_.priority < _loc5_ && _loc3_ < _loc4_.priority)
               {
                  _loc3_ = _loc4_.priority;
               }
            }
            _loc4_ = _loc4_.prev;
         }
         if(param1)
         {
            if(_loc3_ == _loc5_)
            {
               _loc5_ = 10;
            }
            else
            {
               _loc5_ = _loc3_;
            }
         }
         else if(_loc2_ == _loc5_)
         {
            _loc5_ = 0;
         }
         else
         {
            _loc5_ = _loc2_;
         }
         this.priority = _loc5_;
      }
      
      private function clearCommandLineHistory(... rest) : void
      {
         console.ud.commandLineHistory.splice(0);
         this._cmdsInd = -1;
         console.ud.commandLineHistoryChanged();
      }
      
      private function commandKeyDown(param1:KeyboardEvent) : void
      {
         param1.stopPropagation();
      }
      
      private function commandKeyUp(param1:KeyboardEvent) : void
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc2_:Array = console.ud.commandLineHistory;
         if(param1.keyCode == Keyboard.ENTER)
         {
            this.updateToBottom();
            this.setHints();
            if(this._enteringLogin)
            {
               console.remoter.login(this._cmdField.text);
               this._cmdField.text = "";
               this.requestLogin(false);
            }
            else
            {
               _loc3_ = this._cmdField.text;
               if(_loc3_.length > 2)
               {
                  _loc4_ = _loc2_.indexOf(_loc3_);
                  while(_loc4_ >= 0)
                  {
                     _loc2_.splice(_loc4_,1);
                     _loc4_ = _loc2_.indexOf(_loc3_);
                  }
                  _loc2_.unshift(_loc3_);
                  this._cmdsInd = -1;
                  if(_loc2_.length > 20)
                  {
                     _loc2_.splice(20);
                  }
                  console.ud.commandLineHistoryChanged();
               }
               this._cmdField.text = "";
               console.cl.run(_loc3_);
            }
         }
         else if(param1.keyCode == Keyboard.ESCAPE)
         {
            if(stage)
            {
               stage.focus = null;
            }
         }
         else if(param1.keyCode == Keyboard.UP)
         {
            this.setHints();
            if(this._cmdField.text && this._cmdsInd < 0)
            {
               _loc2_.unshift(this._cmdField.text);
               this._cmdsInd++;
            }
            if(this._cmdsInd < _loc2_.length - 1)
            {
               this._cmdsInd++;
               this._cmdField.text = _loc2_[this._cmdsInd];
               this._cmdField.setSelection(this._cmdField.text.length,this._cmdField.text.length);
            }
            else
            {
               this._cmdsInd = _loc2_.length;
               this._cmdField.text = "";
            }
         }
         else if(param1.keyCode == Keyboard.DOWN)
         {
            this.setHints();
            if(this._cmdsInd > 0)
            {
               this._cmdsInd--;
               this._cmdField.text = _loc2_[this._cmdsInd];
               this._cmdField.setSelection(this._cmdField.text.length,this._cmdField.text.length);
            }
            else
            {
               this._cmdsInd = -1;
               this._cmdField.text = "";
            }
         }
         else if(param1.keyCode == Keyboard.SPACE)
         {
            if(this._hint)
            {
               this._cmdField.text = this._hint;
               this._cmdField.setSelection(this._cmdField.text.length,this._cmdField.text.length);
               this.setHints();
            }
         }
         else if(!this._enteringLogin)
         {
            this.updateCmdHint();
         }
         param1.stopPropagation();
      }
      
      private function updateCmdHint(param1:Event = null) : void
      {
         var _loc2_:Array = null;
         var _loc3_:String = this._cmdField.text;
         if(_loc3_ && console.remoter.remoting != Remoting.RECIEVER)
         {
            _loc2_ = console.cl.getHintsFor(_loc3_);
            if(_loc2_.length > 3)
            {
               _loc2_.splice(3);
               _loc2_.push("...");
            }
         }
         this.setHints(_loc2_);
      }
      
      private function onCmdFocusOut(param1:Event) : void
      {
         this.setHints();
      }
      
      private function setHints(param1:Array = null) : void
      {
         var _loc2_:Rectangle = null;
         if(param1 && param1.length)
         {
            this._hint = param1[0];
            param1 = param1.reverse();
            this._hintField.text = param1.join("\n");
            this._hintField.visible = true;
            _loc2_ = this._cmdField.getCharBoundaries(this._cmdField.text.length - 1);
            if(!_loc2_)
            {
               _loc2_ = new Rectangle();
            }
            this._hintField.x = this._cmdField.x + _loc2_.x + _loc2_.width + 20;
            this._hintField.y = height - this._hintField.height;
         }
         else
         {
            this._hintField.visible = false;
            this._hint = null;
         }
      }
      
      public function updateCLScope(param1:String) : void
      {
         if(this._enteringLogin)
         {
            this._enteringLogin = false;
            this.requestLogin(false);
         }
         this._cmdPrefx.autoSize = TextFieldAutoSize.LEFT;
         this._cmdPrefx.text = param1;
         var _loc2_:Number = width - 48;
         if(this._cmdPrefx.width > 120 || this._cmdPrefx.width > _loc2_)
         {
            this._cmdPrefx.autoSize = TextFieldAutoSize.NONE;
            this._cmdPrefx.width = _loc2_ > 120?120:Number(_loc2_);
            this._cmdPrefx.scrollH = this._cmdPrefx.maxScrollH;
         }
         this._cmdField.x = this._cmdPrefx.width + 2;
         this._cmdField.width = width - 15 - this._cmdField.x;
         this._hintField.x = this._cmdField.x;
      }
      
      public function set commandLine(param1:Boolean) : void
      {
         if(param1)
         {
            this._cmdField.visible = true;
            this._cmdPrefx.visible = true;
            this._cmdBG.visible = true;
         }
         else
         {
            this._cmdField.visible = false;
            this._cmdPrefx.visible = false;
            this._cmdBG.visible = false;
         }
         this._needUpdateMenu = true;
         this.height = height;
      }
      
      public function get commandLine() : Boolean
      {
         return this._cmdField.visible;
      }
   }
}
