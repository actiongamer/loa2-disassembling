package morn.core.components
{
   import com.mz.core.display.MzSprite;
   import morn.editor.core.IComponent;
   import com.mz.core.interFace.IDispose;
   import morn.core.events.UIEvent;
   import flash.display.DisplayObject;
   import morn.customs.expands.ICommitMeasure;
   import morn.core.utils.ObjectUtils;
   import flash.display.Shape;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import flash.events.Event;
   import flash.display.InteractiveObject;
   import morn.customs.StyleLib;
   import com.mz.core.configs.EnvConfig;
   import com.mz.core.utils.ArrayUtil;
   import morn.customs.tests.TestInsCollect;
   
   public class Component extends MzSprite implements IComponent
   {
      
      public static const VISIBLE_KEY_DEFAULT:String = "VISIBLE_KEY_DEFAULT";
       
      
      public var xmlVar:String;
      
      public var parts:Vector.<IDispose>;
      
      protected var _width:Number;
      
      protected var _height:Number;
      
      protected var _contentWidth:Number = 0;
      
      protected var _contentHeight:Number = 0;
      
      protected var _disabled:Boolean;
      
      protected var _tag:Object;
      
      protected var _comXml:XML;
      
      protected var _dataSource:Object;
      
      protected var _toolTip:Object;
      
      protected var _mouseChildren:Boolean;
      
      protected var _top:Number;
      
      protected var _bottom:Number;
      
      protected var _left:Number;
      
      protected var _right:Number;
      
      protected var _centerX:Number;
      
      protected var _centerY:Number;
      
      protected var _layOutEabled:Boolean;
      
      protected var _language:String = "";
      
      protected var _lgx:String = "";
      
      protected var _lgy:String = "";
      
      protected var _lgIndex:int = -1;
      
      protected var _visibleList:Object;
      
      public var useResetPosition:Boolean = true;
      
      private var _anchorX:Number;
      
      private var _anchorY:Number;
      
      protected var _style:String;
      
      public function Component()
      {
         parts = new Vector.<IDispose>();
         _visibleList = {};
         if(EnvConfig.ins.showDebugModule)
         {
            TestInsCollect.ins.insArr.push(this);
         }
         super(true);
         tabChildren = false;
         tabEnabled = false;
         _lgIndex = App.languageAry.indexOf(App.language);
         preinitialize();
         createChildren();
         initialize();
      }
      
      protected function preinitialize() : void
      {
      }
      
      protected function createChildren() : void
      {
      }
      
      protected function initialize() : void
      {
      }
      
      public function callLater(param1:Function, param2:Array = null) : void
      {
         App.render.callLater(param1,param2);
      }
      
      public function exeCallLater(param1:Function) : void
      {
         App.render.exeCallLater(param1);
      }
      
      public function cancelCallLater(param1:Function) : void
      {
         App.render.cancelCallLater(param1);
      }
      
      public function sendEvent(param1:String, param2:* = null) : void
      {
         if(hasEventListener(param1))
         {
            dispatchEvent(new UIEvent(param1,param2));
         }
      }
      
      public function remove() : void
      {
         if(parent)
         {
            parent.removeChild(this);
         }
      }
      
      public function removeChildByName(param1:String) : void
      {
         var _loc2_:DisplayObject = getChildByName(param1);
         if(_loc2_)
         {
            if(_loc2_ is IDispose)
            {
               (_loc2_ as IDispose).dispose();
            }
            else
            {
               removeChild(_loc2_);
            }
         }
      }
      
      public function setPosition(param1:Number, param2:Number) : void
      {
         this.x = param1;
         this.y = param2;
      }
      
      override public function set x(param1:Number) : void
      {
         if(_lgx != "" && _lgIndex != -1)
         {
            return;
         }
         .super.x = param1;
         callLater(sendEvent,["move"]);
      }
      
      override public function set y(param1:Number) : void
      {
         if(_lgy != "" && _lgIndex != -1)
         {
            return;
         }
         .super.y = param1;
         callLater(sendEvent,["move"]);
      }
      
      public function set lgx(param1:String) : void
      {
         _lgx = param1;
         var _loc2_:Array = param1.split(",");
         if(_lgIndex != -1)
         {
            if(_loc2_[_lgIndex] != null)
            {
               .super.x = _loc2_[_lgIndex];
            }
            else
            {
               .super.x = _loc2_[0];
            }
         }
         callLater(sendEvent,["move"]);
      }
      
      public function set lgy(param1:String) : void
      {
         _lgy = param1;
         var _loc2_:Array = param1.split(",");
         if(_lgIndex != -1)
         {
            if(_loc2_[_lgIndex] != null)
            {
               .super.y = _loc2_[_lgIndex];
            }
            else
            {
               .super.y = _loc2_[0];
            }
         }
         callLater(sendEvent,["move"]);
      }
      
      public function get lgx() : String
      {
         return this._lgx;
      }
      
      public function get lgy() : String
      {
         return this._lgy;
      }
      
      public function set language(param1:String) : void
      {
      }
      
      public function get language() : String
      {
         return _language;
      }
      
      override public function get width() : Number
      {
         exeCallLater(resetPosition);
         if(!isNaN(_width))
         {
            return _width;
         }
         if(_contentWidth != 0)
         {
            return _contentWidth;
         }
         return measureWidth;
      }
      
      public function get displayWidth() : Number
      {
         return width * scaleX;
      }
      
      protected function get measureWidth() : Number
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         commitMeasure();
         var _loc2_:* = 0;
         _loc3_ = numChildren - 1;
         while(_loc3_ > -1)
         {
            _loc1_ = getChildAt(_loc3_);
            if(_loc1_.visible)
            {
               _loc2_ = Number(Math.max(_loc1_.x + _loc1_.width * _loc1_.scaleX,_loc2_));
            }
            _loc3_--;
         }
         return _loc2_;
      }
      
      override public function get visible() : Boolean
      {
         return super.visible;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         setVisibleList("VISIBLE_KEY_DEFAULT",param1);
      }
      
      public function setVisibleList(param1:String, param2:Boolean) : void
      {
         _visibleList[param1] = param2;
         this.validateVisible();
      }
      
      public function getVisibleList(param1:String) : Boolean
      {
         if(_visibleList.hasOwnProperty(param1))
         {
            return _visibleList[param1];
         }
         return true;
      }
      
      protected function validateVisible() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = this._visibleList;
         for each(var _loc1_ in this._visibleList)
         {
            if(_loc1_ == false)
            {
               .super.visible = false;
               return;
            }
         }
         .super.visible = true;
      }
      
      override public function set width(param1:Number) : void
      {
         if(_width != param1)
         {
            _width = param1;
            callLater(changeSize);
            if(_layOutEabled)
            {
               callLater(resetPosition);
            }
         }
      }
      
      override public function get height() : Number
      {
         exeCallLater(resetPosition);
         if(!isNaN(_height))
         {
            return _height;
         }
         if(_contentHeight != 0)
         {
            return _contentHeight;
         }
         return measureHeight;
      }
      
      public function get displayHeight() : Number
      {
         return height * scaleY;
      }
      
      protected function get measureHeight() : Number
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         commitMeasure();
         var _loc2_:* = 0;
         _loc3_ = numChildren - 1;
         while(_loc3_ > -1)
         {
            _loc1_ = getChildAt(_loc3_);
            if(_loc1_.visible)
            {
               _loc2_ = Number(Math.max(_loc1_.y + _loc1_.height * _loc1_.scaleY,_loc2_));
            }
            _loc3_--;
         }
         return _loc2_;
      }
      
      override public function set height(param1:Number) : void
      {
         if(_height != param1)
         {
            _height = param1;
            callLater(changeSize);
            if(_layOutEabled)
            {
               callLater(resetPosition);
            }
         }
      }
      
      override public function get x() : Number
      {
         exeCallLater(resetPosition);
         return super.x;
      }
      
      override public function get y() : Number
      {
         exeCallLater(resetPosition);
         return super.y;
      }
      
      override public function set scaleX(param1:Number) : void
      {
         .super.scaleX = param1;
         callLater(changeSize);
      }
      
      override public function set scaleY(param1:Number) : void
      {
         .super.scaleY = param1;
         callLater(changeSize);
      }
      
      public function commitMeasure() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         exeCallLater(changeSize);
         exeCallLater(resetPosition);
         exeCallLater(sendEvent);
         var _loc2_:int = this.numChildren;
         _loc3_ = _loc2_ - 1;
         while(_loc3_ >= 0)
         {
            _loc1_ = this.getChildAt(_loc3_);
            if(_loc1_ is ICommitMeasure)
            {
               (_loc1_ as ICommitMeasure).commitMeasure();
            }
            _loc3_--;
         }
      }
      
      public function cancelMeasure() : void
      {
         cancelCallLater(changeSize);
         cancelCallLater(resetPosition);
         cancelCallLater(sendEvent);
      }
      
      protected function changeSize() : void
      {
         sendEvent("resize");
      }
      
      public function setSize(param1:Number, param2:Number) : void
      {
         this.width = param1;
         this.height = param2;
      }
      
      override public function set scale(param1:Number) : void
      {
         scaleY = param1;
         scaleX = param1;
      }
      
      override public function get scale() : Number
      {
         return scaleX;
      }
      
      public function get disabled() : Boolean
      {
         return _disabled;
      }
      
      public function set disabled(param1:Boolean) : void
      {
         if(_disabled != param1)
         {
            _disabled = param1;
            mouseEnabled = !param1;
            .super.mouseChildren = !!param1?false:Boolean(_mouseChildren);
            ObjectUtils.gray(this,_disabled);
         }
      }
      
      override public function set mouseChildren(param1:Boolean) : void
      {
         .super.mouseChildren = param1;
         _mouseChildren = param1;
      }
      
      public function get tag() : Object
      {
         return _tag;
      }
      
      public function set tag(param1:Object) : void
      {
         _tag = param1;
      }
      
      public function showBorder(param1:uint = 16711680) : void
      {
         removeChildByName("border");
         var _loc2_:Shape = new Shape();
         _loc2_.name = "border";
         _loc2_.graphics.lineStyle(1,param1);
         _loc2_.graphics.drawRect(0,0,width,height);
         addChild(_loc2_);
      }
      
      public function get comXml() : XML
      {
         return _comXml;
      }
      
      public function set comXml(param1:XML) : void
      {
         _comXml = param1;
      }
      
      public function get dataSource() : Object
      {
         return _dataSource;
      }
      
      public function set dataSource(param1:Object) : void
      {
         _dataSource = param1;
         var _loc4_:int = 0;
         var _loc3_:* = _dataSource;
         for(var _loc2_ in _dataSource)
         {
            if(hasOwnProperty(_loc2_))
            {
               this[_loc2_] = _dataSource[_loc2_];
            }
         }
      }
      
      public function get toolTip() : Object
      {
         return _toolTip;
      }
      
      public function set toolTip(param1:Object) : void
      {
         if(_toolTip != param1)
         {
            _toolTip = param1;
            if(param1)
            {
               addEventListener("rollOver",onTooltipRollMouse);
               addEventListener("rollOut",onTooltipRollMouse);
            }
            else
            {
               removeEventListener("rollOver",onTooltipRollMouse);
               removeEventListener("rollOut",onTooltipRollMouse);
            }
         }
      }
      
      private function onTooltipRollMouse(param1:MouseEvent) : void
      {
         ObserverMgr.ins.sendNotice(param1.type == "rollOver"?"msg_tooltip_show":"msg_tooltip_hide",this._toolTip);
      }
      
      public function get top() : Number
      {
         return _top;
      }
      
      public function set top(param1:Number) : void
      {
         _top = param1;
         layOutEabled = true;
      }
      
      public function get bottom() : Number
      {
         return _bottom;
      }
      
      public function set bottom(param1:Number) : void
      {
         _bottom = param1;
         layOutEabled = true;
      }
      
      public function get left() : Number
      {
         return _left;
      }
      
      public function set left(param1:Number) : void
      {
         _left = param1;
         layOutEabled = true;
      }
      
      public function get right() : Number
      {
         return _right;
      }
      
      public function set right(param1:Number) : void
      {
         _right = param1;
         layOutEabled = true;
      }
      
      public function get centerX() : Number
      {
         return _centerX;
      }
      
      public function set centerX(param1:Number) : void
      {
         _centerX = param1;
         layOutEabled = true;
      }
      
      public function get centerY() : Number
      {
         return _centerY;
      }
      
      public function set centerY(param1:Number) : void
      {
         _centerY = param1;
         layOutEabled = true;
      }
      
      private function set layOutEabled(param1:Boolean) : void
      {
         if(_layOutEabled != param1)
         {
            _layOutEabled = param1;
            addEventListener("added",onAdded);
            addEventListener("removed",onRemoved);
            if(this.parent)
            {
               parent.addEventListener("resize",onResize);
            }
         }
         callLater(resetPosition);
      }
      
      private function onRemoved(param1:Event) : void
      {
         if(param1.target == this)
         {
            parent.removeEventListener("resize",onResize);
         }
      }
      
      private function onAdded(param1:Event) : void
      {
         if(param1.target == this)
         {
            parent.addEventListener("resize",onResize);
            callLater(resetPosition);
         }
      }
      
      public function doResize() : void
      {
         this.onResize(null);
      }
      
      protected function onResize(param1:Event) : void
      {
         callLater(resetPosition);
      }
      
      protected function resetPosition() : void
      {
         if(parent && useResetPosition)
         {
            if(!isNaN(_centerX))
            {
               x = (parent.width - displayWidth) * 0.5 + _centerX;
            }
            else if(!isNaN(_left))
            {
               x = _left;
               if(!isNaN(_right))
               {
                  width = (parent.width - _left - _right) / scaleX;
               }
            }
            else if(!isNaN(_right))
            {
               x = parent.width - displayWidth - _right;
            }
            if(!isNaN(_centerY))
            {
               y = (parent.height - displayHeight) * 0.5 + _centerY;
            }
            else if(!isNaN(_top))
            {
               y = _top;
               if(!isNaN(_bottom))
               {
                  height = (parent.height - _top - _bottom) / scaleY;
               }
            }
            else if(!isNaN(_bottom))
            {
               y = parent.height - displayHeight - _bottom;
            }
         }
      }
      
      override public function set doubleClickEnabled(param1:Boolean) : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         .super.doubleClickEnabled = param1;
         _loc3_ = numChildren - 1;
         while(_loc3_ > -1)
         {
            _loc2_ = getChildAt(_loc3_) as InteractiveObject;
            if(_loc2_)
            {
               _loc2_.doubleClickEnabled = param1;
            }
            _loc3_--;
         }
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         if(doubleClickEnabled && param1 is InteractiveObject)
         {
            InteractiveObject(param1).doubleClickEnabled = true;
         }
         return super.addChild(param1);
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         if(doubleClickEnabled && param1 is InteractiveObject)
         {
            InteractiveObject(param1).doubleClickEnabled = true;
         }
         return super.addChildAt(param1,param2);
      }
      
      public function get anchorX() : Number
      {
         return _anchorX;
      }
      
      public function set anchorX(param1:Number) : void
      {
         _anchorX = param1;
      }
      
      public function get anchorY() : Number
      {
         return _anchorY;
      }
      
      public function set anchorY(param1:Number) : void
      {
         _anchorY = param1;
      }
      
      public function copyParamsNumber(param1:Component, param2:Array) : void
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = param2.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param2[_loc5_];
            if(!isNaN(this["_" + _loc3_]))
            {
               param1[_loc3_] = this["_" + _loc3_];
            }
            _loc5_++;
         }
      }
      
      public function get style() : String
      {
         return _style;
      }
      
      public function set style(param1:String) : void
      {
         if(_style != param1)
         {
            _style = param1;
            StyleLib.ins.setStyle(this,_style);
         }
      }
      
      override public function dispose() : void
      {
         cancelMeasure();
         if(EnvConfig.ins.showDebugModule)
         {
            ArrayUtil.removeItem(TestInsCollect.ins.insArr,this);
         }
         if(this.parts != null)
         {
            this.parts.forEach(function(param1:IDispose, ... rest):void
            {
               param1.dispose();
            });
            this.parts = null;
         }
         super.dispose();
      }
   }
}
