package morn.core.components
{
   import flash.events.Event;
   
   public class TextArea extends TextInput
   {
       
      
      protected var _vScrollBar:morn.core.components.VScrollBar;
      
      protected var _hScrollBar:morn.core.components.HScrollBar;
      
      public function TextArea(param1:String = "")
      {
         super(param1);
      }
      
      override protected function initialize() : void
      {
         super.initialize();
         width = 180;
         height = 150;
         this.isHtml = false;
         _textField.wordWrap = true;
         _textField.multiline = true;
         _textField.addEventListener("scroll",onTextFieldScroll);
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
      
      protected function onTextFieldScroll(param1:Event) : void
      {
         changeScroll();
         sendEvent("scroll");
      }
      
      public function get scrollBarSkin() : String
      {
         return _vScrollBar.skin;
      }
      
      public function set scrollBarSkin(param1:String) : void
      {
         vScrollBarSkin = param1;
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
            addChild(new morn.core.components.VScrollBar());
            _vScrollBar.addEventListener("change",onScrollBarChange);
            _vScrollBar.target = _textField;
            callLater(changeScroll);
         }
         _vScrollBar.skin = param1;
      }
      
      override public function cancelMeasure() : void
      {
         exeCallLater(changeScroll);
         super.cancelMeasure();
      }
      
      override public function commitMeasure() : void
      {
         cancelCallLater(changeScroll);
         super.commitMeasure();
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
            addChild(new morn.core.components.HScrollBar());
            _hScrollBar.addEventListener("change",onScrollBarChange);
            _hScrollBar.mouseWheelEnable = false;
            _hScrollBar.target = _textField;
            callLater(changeScroll);
         }
         _hScrollBar.skin = param1;
      }
      
      public function get scrollBar() : morn.core.components.VScrollBar
      {
         return _vScrollBar;
      }
      
      public function get vScrollBar() : morn.core.components.VScrollBar
      {
         return _vScrollBar;
      }
      
      public function get hScrollBar() : morn.core.components.HScrollBar
      {
         return _hScrollBar;
      }
      
      public function get maxScrollV() : int
      {
         return _textField.maxScrollV;
      }
      
      public function get scrollV() : int
      {
         return _textField.scrollV;
      }
      
      public function get maxScrollH() : int
      {
         return _textField.maxScrollH;
      }
      
      public function get scrollH() : int
      {
         return _textField.scrollH;
      }
      
      protected function onScrollBarChange(param1:Event) : void
      {
         if(param1.currentTarget == _vScrollBar)
         {
            if(_textField.scrollV != _vScrollBar.value)
            {
               _textField.removeEventListener("scroll",onTextFieldScroll);
               _textField.scrollV = _vScrollBar.value;
               _textField.addEventListener("scroll",onTextFieldScroll);
               sendEvent("scroll");
            }
         }
         else if(_textField.scrollH != _hScrollBar.value)
         {
            _textField.removeEventListener("scroll",onTextFieldScroll);
            _textField.scrollH = _hScrollBar.value;
            _textField.addEventListener("scroll",onTextFieldScroll);
            sendEvent("scroll");
         }
      }
      
      private function changeScroll() : void
      {
         var _loc4_:Boolean = _vScrollBar && _textField.maxScrollV > 1;
         var _loc1_:Boolean = _hScrollBar && _textField.maxScrollH > 0;
         var _loc2_:Number = !!_loc4_?_width - _vScrollBar.width:Number(_width);
         var _loc3_:Number = !!_loc1_?_height - _hScrollBar.height:Number(_height);
         _textField.width = _loc2_ - _margin[0] - _margin[2];
         _textField.height = _loc3_ - _margin[1] - _margin[3];
         if(_vScrollBar)
         {
            _vScrollBar.x = _width - _vScrollBar.width - _margin[2];
            _vScrollBar.y = _margin[1];
            _vScrollBar.height = _height - (!!_loc1_?_hScrollBar.height:0) - _margin[1] - _margin[3];
            _vScrollBar.scrollSize = 1;
            _vScrollBar.thumbPercent = (_textField.numLines - _textField.maxScrollV + 1) / _textField.numLines;
            _vScrollBar.setScroll(1,_textField.maxScrollV,_textField.scrollV);
         }
         if(_hScrollBar)
         {
            _hScrollBar.x = _margin[0];
            _hScrollBar.y = _height - _hScrollBar.height - _margin[3];
            _hScrollBar.width = _width - (!!_loc4_?_vScrollBar.width:0) - _margin[0] - _margin[2];
            _hScrollBar.scrollSize = Math.max(_loc2_ * 0.033,1);
            _hScrollBar.thumbPercent = _loc2_ / Math.max(_textField.textWidth,_loc2_);
            _hScrollBar.setScroll(0,maxScrollH,scrollH);
         }
      }
      
      public function scrollTo(param1:int) : void
      {
         commitMeasure();
         _textField.scrollV = param1;
      }
   }
}
