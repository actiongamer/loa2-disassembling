package com.junkbyte.console.view
{
   import com.junkbyte.console.Console;
   import flash.text.TextField;
   import flash.geom.Rectangle;
   import com.junkbyte.console.vos.GraphGroup;
   import flash.events.Event;
   import flash.text.TextFieldAutoSize;
   
   public class PanelsManager
   {
       
      
      private var console:Console;
      
      private var _mainPanel:com.junkbyte.console.view.MainPanel;
      
      private var _ruler:com.junkbyte.console.view.Ruler;
      
      private var _chsPanel:com.junkbyte.console.view.ChannelsPanel;
      
      private var _fpsPanel:com.junkbyte.console.view.FPSPanel;
      
      private var _memPanel:com.junkbyte.console.view.MemoryPanel;
      
      private var _graphsMap:Object;
      
      private var _graphPlaced:uint = 0;
      
      private var _tooltipField:TextField;
      
      public function PanelsManager(param1:Console)
      {
         this._graphsMap = {};
         super();
         this.console = param1;
         this._mainPanel = new com.junkbyte.console.view.MainPanel(this.console);
         this._tooltipField = this.mainPanel.makeTF("tooltip",true);
         this._tooltipField.mouseEnabled = false;
         this._tooltipField.autoSize = TextFieldAutoSize.CENTER;
         this._tooltipField.multiline = true;
         this.addPanel(this._mainPanel);
      }
      
      public function addPanel(param1:AbstractPanel) : void
      {
         if(this.console.contains(this._tooltipField))
         {
            this.console.addChildAt(param1,this.console.getChildIndex(this._tooltipField));
         }
         else
         {
            this.console.addChild(param1);
         }
         param1.addEventListener(AbstractPanel.DRAGGING,this.onPanelStartDragScale,false,0,true);
         param1.addEventListener(AbstractPanel.SCALING,this.onPanelStartDragScale,false,0,true);
      }
      
      public function removePanel(param1:String) : void
      {
         var _loc2_:AbstractPanel = this.console.getChildByName(param1) as AbstractPanel;
         if(_loc2_)
         {
            _loc2_.close();
         }
      }
      
      public function getPanel(param1:String) : AbstractPanel
      {
         return this.console.getChildByName(param1) as AbstractPanel;
      }
      
      public function get mainPanel() : com.junkbyte.console.view.MainPanel
      {
         return this._mainPanel;
      }
      
      public function panelExists(param1:String) : Boolean
      {
         return !!(this.console.getChildByName(param1) as AbstractPanel)?true:false;
      }
      
      public function setPanelArea(param1:String, param2:Rectangle) : void
      {
         var _loc3_:AbstractPanel = this.getPanel(param1);
         if(_loc3_)
         {
            if(param2.x)
            {
               _loc3_.x = param2.x;
            }
            if(param2.y)
            {
               _loc3_.y = param2.y;
            }
            if(param2.width)
            {
               _loc3_.width = param2.width;
            }
            if(param2.height)
            {
               _loc3_.height = param2.height;
            }
         }
      }
      
      public function updateMenu() : void
      {
         this._mainPanel.updateMenu();
         var _loc1_:com.junkbyte.console.view.ChannelsPanel = this.getPanel(com.junkbyte.console.view.ChannelsPanel.NAME) as com.junkbyte.console.view.ChannelsPanel;
         if(_loc1_)
         {
            _loc1_.update();
         }
      }
      
      public function update(param1:Boolean, param2:Boolean) : void
      {
         this._mainPanel.update(!param1 && param2);
         if(!param1)
         {
            if(param2 && this._chsPanel != null)
            {
               this._chsPanel.update();
            }
         }
      }
      
      public function updateGraphs(param1:Array, param2:Boolean = true) : void
      {
         var _loc4_:GraphGroup = null;
         var _loc5_:GraphGroup = null;
         var _loc6_:GraphGroup = null;
         var _loc7_:* = null;
         var _loc8_:String = null;
         var _loc9_:GraphingPanel = null;
         var _loc10_:Rectangle = null;
         var _loc11_:* = NaN;
         var _loc12_:* = NaN;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc3_:Object = {};
         for each(_loc6_ in param1)
         {
            if(_loc6_.type == GraphGroup.FPS)
            {
               _loc4_ = _loc6_;
            }
            else if(_loc6_.type == GraphGroup.MEM)
            {
               _loc5_ = _loc6_;
            }
            else
            {
               _loc8_ = _loc6_.name;
               _loc9_ = this._graphsMap[_loc8_] as GraphingPanel;
               if(!_loc9_)
               {
                  _loc10_ = _loc6_.rect;
                  if(_loc10_ == null)
                  {
                     _loc10_ = new Rectangle(NaN,NaN,0,0);
                  }
                  _loc11_ = 100;
                  if(isNaN(_loc10_.x) || isNaN(_loc10_.y))
                  {
                     if(this._mainPanel.width < 150)
                     {
                        _loc11_ = 50;
                     }
                     _loc12_ = Number(Math.floor(this._mainPanel.width / _loc11_) - 1);
                     if(_loc12_ <= 1)
                     {
                        _loc12_ = 2;
                     }
                     _loc13_ = this._graphPlaced % _loc12_;
                     _loc14_ = Math.floor(this._graphPlaced / _loc12_);
                     _loc10_.x = this._mainPanel.x + _loc11_ + _loc13_ * _loc11_;
                     _loc10_.y = this._mainPanel.y + _loc11_ * 0.6 + _loc14_ * _loc11_;
                     this._graphPlaced++;
                  }
                  if(_loc10_.width <= 0 || isNaN(_loc10_.width))
                  {
                     _loc10_.width = _loc11_;
                  }
                  if(_loc10_.height <= 0 || isNaN(_loc10_.height))
                  {
                     _loc10_.height = _loc11_;
                  }
                  _loc9_ = new GraphingPanel(this.console,_loc10_.width,_loc10_.height);
                  _loc9_.x = _loc10_.x;
                  _loc9_.y = _loc10_.y;
                  _loc9_.name = "graph_" + _loc8_;
                  this._graphsMap[_loc8_] = _loc9_;
                  this.addPanel(_loc9_);
               }
               _loc9_.update(_loc6_,param2);
            }
            _loc3_[_loc6_.name] = true;
         }
         for(_loc7_ in this._graphsMap)
         {
            if(!_loc3_[_loc7_])
            {
               this._graphsMap[_loc7_].close();
               delete this._graphsMap[_loc7_];
            }
         }
         if(_loc4_ != null)
         {
            if(this._fpsPanel == null)
            {
               this._fpsPanel = new com.junkbyte.console.view.FPSPanel(this.console);
               this._fpsPanel.x = this._mainPanel.x + this._mainPanel.width - 160;
               this._fpsPanel.y = this._mainPanel.y + 15;
               this.addPanel(this._fpsPanel);
               this._mainPanel.updateMenu();
            }
            this._fpsPanel.update(_loc4_);
         }
         else if(this._fpsPanel != null)
         {
            this.removePanel(com.junkbyte.console.view.FPSPanel.NAME);
            this._fpsPanel = null;
         }
         if(_loc5_ != null)
         {
            if(this._memPanel == null)
            {
               this._memPanel = new com.junkbyte.console.view.MemoryPanel(this.console);
               this._memPanel.x = this._mainPanel.x + this._mainPanel.width - 80;
               this._memPanel.y = this._mainPanel.y + 15;
               this.addPanel(this._memPanel);
               this._mainPanel.updateMenu();
            }
            this._memPanel.update(_loc5_);
         }
         else if(this._memPanel != null)
         {
            this.removePanel(com.junkbyte.console.view.MemoryPanel.NAME);
            this._memPanel = null;
         }
      }
      
      public function get displayRoller() : Boolean
      {
         return !!(this.getPanel(RollerPanel.NAME) as RollerPanel)?true:false;
      }
      
      public function set displayRoller(param1:Boolean) : void
      {
         var _loc2_:RollerPanel = null;
         if(this.displayRoller != param1)
         {
            if(param1)
            {
               _loc2_ = new RollerPanel(this.console);
               _loc2_.x = this._mainPanel.x + this._mainPanel.width - 180;
               _loc2_.y = this._mainPanel.y + 55;
               this.addPanel(_loc2_);
               _loc2_.start();
            }
            else
            {
               this.removePanel(RollerPanel.NAME);
            }
            this._mainPanel.updateMenu();
         }
      }
      
      public function get channelsPanel() : Boolean
      {
         return this._chsPanel != null;
      }
      
      public function set channelsPanel(param1:Boolean) : void
      {
         if(this.channelsPanel != param1)
         {
            this.console.logs.cleanChannels();
            if(param1)
            {
               this._chsPanel = new com.junkbyte.console.view.ChannelsPanel(this.console);
               this._chsPanel.x = this._mainPanel.x + this._mainPanel.width - 332;
               this._chsPanel.y = this._mainPanel.y - 2;
               this.addPanel(this._chsPanel);
               this._chsPanel.update();
               this.updateMenu();
            }
            else
            {
               this.removePanel(com.junkbyte.console.view.ChannelsPanel.NAME);
               this._chsPanel = null;
            }
            this.updateMenu();
         }
      }
      
      public function get memoryMonitor() : Boolean
      {
         return this._memPanel != null;
      }
      
      public function get fpsMonitor() : Boolean
      {
         return this._fpsPanel != null;
      }
      
      public function tooltip(param1:String = null, param2:AbstractPanel = null) : void
      {
         var _loc3_:Rectangle = null;
         var _loc4_:Rectangle = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(param1 && !this.rulerActive)
         {
            param1 = param1.replace(/\:\:(.*)/,"<br/><s>$1</s>");
            this.console.addChild(this._tooltipField);
            this._tooltipField.wordWrap = false;
            this._tooltipField.htmlText = "<tt>" + param1 + "</tt>";
            if(this._tooltipField.width > 120)
            {
               this._tooltipField.width = 120;
               this._tooltipField.wordWrap = true;
            }
            this._tooltipField.x = this.console.mouseX - this._tooltipField.width / 2;
            this._tooltipField.y = this.console.mouseY + 20;
            if(param2)
            {
               _loc3_ = this._tooltipField.getBounds(this.console);
               _loc4_ = new Rectangle(param2.x,param2.y,param2.width,param2.height);
               _loc5_ = _loc3_.bottom - _loc4_.bottom;
               if(_loc5_ > 0)
               {
                  if(this._tooltipField.y - _loc5_ > this.console.mouseY + 15)
                  {
                     this._tooltipField.y = this._tooltipField.y - _loc5_;
                  }
                  else if(_loc4_.y < this.console.mouseY - 24 && _loc3_.y > _loc4_.bottom)
                  {
                     this._tooltipField.y = this.console.mouseY - this._tooltipField.height - 15;
                  }
               }
               _loc6_ = _loc3_.left - _loc4_.left;
               _loc7_ = _loc3_.right - _loc4_.right;
               if(_loc6_ < 0)
               {
                  this._tooltipField.x = this._tooltipField.x - _loc6_;
               }
               else if(_loc7_ > 0)
               {
                  this._tooltipField.x = this._tooltipField.x - _loc7_;
               }
            }
         }
         else if(this.console.contains(this._tooltipField))
         {
            this.console.removeChild(this._tooltipField);
         }
      }
      
      public function startRuler() : void
      {
         if(this.rulerActive)
         {
            return;
         }
         this._ruler = new com.junkbyte.console.view.Ruler();
         this._ruler.addEventListener(Event.COMPLETE,this.onRulerExit,false,0,true);
         this.console.addChild(this._ruler);
         this._ruler.start(this.console);
         this._mainPanel.updateMenu();
      }
      
      public function get rulerActive() : Boolean
      {
         return this._ruler && this.console.contains(this._ruler)?true:false;
      }
      
      private function onRulerExit(param1:Event) : void
      {
         if(this._ruler && this.console.contains(this._ruler))
         {
            this.console.removeChild(this._ruler);
         }
         this._ruler = null;
         this._mainPanel.updateMenu();
      }
      
      private function onPanelStartDragScale(param1:Event) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:AbstractPanel = null;
         var _loc2_:AbstractPanel = param1.currentTarget as AbstractPanel;
         if(this.console.config.style.panelSnapping)
         {
            _loc3_ = [0];
            _loc4_ = [0];
            if(this.console.stage)
            {
               _loc3_.push(this.console.stage.stageWidth);
               _loc4_.push(this.console.stage.stageHeight);
            }
            _loc5_ = this.console.numChildren;
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc7_ = this.console.getChildAt(_loc6_) as AbstractPanel;
               if(_loc7_ && _loc7_.visible)
               {
                  _loc3_.push(_loc7_.x);
                  _loc3_.push(_loc7_.x + _loc7_.width);
                  _loc4_.push(_loc7_.y);
                  _loc4_.push(_loc7_.y + _loc7_.height);
               }
               _loc6_++;
            }
            _loc2_.registerSnaps(_loc3_,_loc4_);
         }
      }
   }
}
