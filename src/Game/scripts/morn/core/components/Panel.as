package morn.core.components
{
   import morn.editor.core.IContent;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.display.Graphics;
   import flash.geom.Rectangle;
   import flash.display.Sprite;
   
   public class Panel extends morn.core.components.Box implements IContent
   {
       
      
      protected var _content:morn.core.components.Box;
      
      protected var _vScrollBar:morn.core.components.VScrollBar;
      
      protected var _hScrollBar:morn.core.components.HScrollBar;
      
      public function Panel()
      {
         super();
         height = 100;
         width = 100;
      }
      
      override protected function createChildren() : void
      {
         _content = new morn.core.components.Box();
         super.addChild(new morn.core.components.Box());
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         param1.addEventListener("resize",child_onResize);
         callLater(changeScroll);
         return _content.addChild(param1);
      }
      
      private function child_onResize(param1:Event) : void
      {
         callLater(changeScroll);
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         param1.addEventListener("resize",child_onResize);
         callLater(changeScroll);
         return _content.addChildAt(param1,param2);
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         param1.removeEventListener("resize",child_onResize);
         callLater(changeScroll);
         return _content.removeChild(param1);
      }
      
      override public function removeChildAt(param1:int) : DisplayObject
      {
         getChildAt(param1).removeEventListener("resize",child_onResize);
         callLater(changeScroll);
         return _content.removeChildAt(param1);
      }
      
      override public function removeAllChild(param1:DisplayObject = null) : void
      {
         var _loc2_:int = 0;
         _loc2_ = _content.numChildren - 1;
         while(_loc2_ > -1)
         {
            if(param1 != _content.getChildAt(_loc2_))
            {
               _content.removeChildAt(_loc2_);
            }
            _loc2_--;
         }
         callLater(changeScroll);
      }
      
      override public function getChildAt(param1:int) : DisplayObject
      {
         return _content.getChildAt(param1);
      }
      
      override public function getChildByName(param1:String) : DisplayObject
      {
         return _content.getChildByName(param1);
      }
      
      override public function getChildIndex(param1:DisplayObject) : int
      {
         return _content.getChildIndex(param1);
      }
      
      override public function get numChildren() : int
      {
         return _content.numChildren;
      }
      
      private function changeScroll() : void
      {
         var _loc5_:Number = contentWidth;
         var _loc4_:Number = contentHeight;
         var _loc6_:Boolean = _vScrollBar && _loc4_ > _height;
         var _loc1_:Boolean = _hScrollBar && _loc5_ > _width;
         var _loc2_:Number = !!_loc6_?_width - _vScrollBar.width:Number(_width);
         var _loc3_:Number = !!_loc1_?_height - _hScrollBar.height:Number(_height);
         setContentSize(_loc2_,_loc3_);
         if(_vScrollBar)
         {
            _vScrollBar.x = _width - _vScrollBar.width;
            _vScrollBar.y = 0;
            _vScrollBar.height = _height - (!!_loc1_?_hScrollBar.height:0);
            _vScrollBar.scrollSize = Math.max(_height * 0.033,1);
            _vScrollBar.thumbPercent = _loc3_ / _loc4_;
            _vScrollBar.setScroll(0,_loc4_ - _loc3_,_vScrollBar.value);
         }
         if(_hScrollBar)
         {
            _hScrollBar.x = 0;
            _hScrollBar.y = _height - _hScrollBar.height;
            _hScrollBar.width = _width - (!!_loc6_?_vScrollBar.width:0);
            _hScrollBar.scrollSize = Math.max(_width * 0.033,1);
            _hScrollBar.thumbPercent = _loc2_ / _loc5_;
            _hScrollBar.setScroll(0,_loc5_ - _loc2_,_hScrollBar.value);
         }
      }
      
      private function get contentWidth() : Number
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:* = 0;
         _loc3_ = _content.numChildren - 1;
         while(_loc3_ > -1)
         {
            _loc1_ = _content.getChildAt(_loc3_);
            _loc2_ = Number(Math.max(_loc1_.x + _loc1_.width * _loc1_.scaleX,_loc2_));
            _loc3_--;
         }
         return _loc2_;
      }
      
      private function get contentHeight() : Number
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:* = 0;
         _loc3_ = _content.numChildren - 1;
         while(_loc3_ > -1)
         {
            _loc1_ = _content.getChildAt(_loc3_);
            _loc2_ = Number(Math.max(_loc1_.y + _loc1_.height * _loc1_.scaleY,_loc2_));
            _loc3_--;
         }
         return _loc2_;
      }
      
      private function setContentSize(param1:Number, param2:Number) : void
      {
         var _loc3_:Graphics = graphics;
         _loc3_.clear();
         _loc3_.beginFill(16776960,0);
         _loc3_.drawRect(0,0,param1,param2);
         _loc3_.endFill();
         _content.width = param1;
         _content.height = param2;
         _content.scrollRect = new Rectangle(0,0,param1,param2);
      }
      
      override public function set width(param1:Number) : void
      {
         .super.width = param1;
         callLater(changeScroll);
      }
      
      override public function set height(param1:Number) : void
      {
         .super.height = param1;
         callLater(changeScroll);
      }
      
      public function get vScrollBarSkin() : String
      {
         return _vScrollBar.skin;
      }
      
      public function set vScrollBarSkin(param1:String) : void
      {
         if(_vScrollBar == null)
         {
            _vScrollBar = new morn.core.components.VScrollBar();
            super.addChild(new morn.core.components.VScrollBar());
            _vScrollBar.addEventListener("change",onScrollBarChange);
            _vScrollBar.target = this;
            callLater(changeScroll);
         }
         _vScrollBar.skin = param1;
      }
      
      public function get hScrollBarSkin() : String
      {
         return _hScrollBar.skin;
      }
      
      public function set hScrollBarSkin(param1:String) : void
      {
         if(_hScrollBar == null)
         {
            _hScrollBar = new morn.core.components.HScrollBar();
            super.addChild(new morn.core.components.HScrollBar());
            _hScrollBar.addEventListener("change",onScrollBarChange);
            _hScrollBar.mouseWheelEnable = false;
            _hScrollBar.target = this;
            callLater(changeScroll);
         }
         _hScrollBar.skin = param1;
      }
      
      public function get vScrollBar() : ScrollBar
      {
         return _vScrollBar;
      }
      
      public function get hScrollBar() : ScrollBar
      {
         return _hScrollBar;
      }
      
      public function get content() : Sprite
      {
         return _content;
      }
      
      protected function onScrollBarChange(param1:Event) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         var _loc4_:Rectangle = _content.scrollRect;
         if(_loc4_)
         {
            _loc3_ = param1.currentTarget as ScrollBar;
            _loc2_ = Math.round(_loc3_.value);
            if(_loc3_.direction == "vertical")
            {
               var _loc5_:* = _loc2_;
               _loc4_.y = _loc5_;
               §§push(_loc5_);
            }
            else
            {
               _loc5_ = _loc2_;
               _loc4_.x = _loc5_;
               §§push(Number(_loc5_));
            }
            §§pop();
            _content.scrollRect = _loc4_;
         }
      }
      
      override public function commitMeasure() : void
      {
         exeCallLater(changeScroll);
         super.commitMeasure();
      }
      
      override public function cancelMeasure() : void
      {
         cancelCallLater(changeScroll);
         super.cancelMeasure();
      }
      
      public function scrollTo(param1:Number = 0, param2:Number = 0) : void
      {
         commitMeasure();
         if(vScrollBar)
         {
            vScrollBar.value = param2;
         }
         if(hScrollBar)
         {
            hScrollBar.value = param1;
         }
      }
      
      public function refresh() : void
      {
         changeScroll();
      }
   }
}
