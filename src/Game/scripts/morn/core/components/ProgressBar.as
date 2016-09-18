package morn.core.components
{
   import morn.core.handlers.Handler;
   import morn.customs.expands.MornExpandUtil;
   
   public class ProgressBar extends Component
   {
       
      
      protected var _bg:morn.core.components.Image;
      
      protected var _bar:morn.core.components.Image;
      
      protected var _skin:String;
      
      protected var _value:Number = 0.5;
      
      protected var _label:String;
      
      protected var _barLabel:morn.core.components.Label;
      
      protected var _changeHandler:Handler;
      
      protected var _marginGrid:String;
      
      private var _alignRight:Boolean;
      
      public function ProgressBar(param1:String = null)
      {
         super();
         this.skin = param1;
      }
      
      override protected function createChildren() : void
      {
         _bg = new morn.core.components.Image();
         addChild(new morn.core.components.Image());
         _bar = new morn.core.components.Image();
         addChild(new morn.core.components.Image());
         _barLabel = new morn.core.components.Label();
         addChild(new morn.core.components.Label());
      }
      
      override protected function initialize() : void
      {
         _barLabel.width = 200;
         _barLabel.height = 18;
         _barLabel.align = "center";
         _barLabel.stroke = "0x004080";
         _barLabel.color = 16777215;
      }
      
      public function get skin() : String
      {
         return _skin;
      }
      
      public function set skin(param1:String) : void
      {
         if(_skin != param1)
         {
            _skin = param1;
            _bg.url = _skin;
            _bar.url = _skin + "$bar";
            _contentWidth = _bg.width;
            _contentHeight = _bg.height;
            callLater(changeLabelPoint);
            callLater(changeValue);
         }
      }
      
      public function get contentWidth() : Number
      {
         return _contentWidth;
      }
      
      public function get contentHeight() : Number
      {
         return _contentHeight;
      }
      
      protected function changeLabelPoint() : void
      {
         _barLabel.x = (width - _barLabel.width) * 0.5;
         _barLabel.y = (height - _barLabel.height) * 0.5 - 2;
      }
      
      public function get value() : Number
      {
         return _value;
      }
      
      public function set value(param1:Number) : void
      {
         if(_value != param1)
         {
            param1 = param1 > 1?1:Number(param1 < 0?0:Number(param1));
            _value = param1;
            callLater(changeValue);
            sendEvent("change");
            if(_changeHandler != null)
            {
               _changeHandler.executeWith([param1]);
            }
         }
      }
      
      public function setChangeHandler(param1:Handler) : ProgressBar
      {
         _changeHandler = param1;
         return this;
      }
      
      override public function commitMeasure() : void
      {
         this.exeCallLater(changeLabelPoint);
         this.exeCallLater(changeValue);
         super.commitMeasure();
      }
      
      override public function cancelMeasure() : void
      {
         this.cancelCallLater(changeLabelPoint);
         this.cancelCallLater(changeValue);
         super.cancelMeasure();
      }
      
      protected function changeValue() : void
      {
         MornExpandUtil.countProgressBarWidth(this,_value,this.bar);
      }
      
      public function get label() : String
      {
         return _label;
      }
      
      public function set label(param1:String) : void
      {
         if(_label != param1)
         {
            _label = param1;
            _barLabel.text = _label;
         }
      }
      
      public function get bg() : morn.core.components.Image
      {
         return _bg;
      }
      
      public function get bar() : morn.core.components.Image
      {
         return _bar;
      }
      
      public function get barLabel() : morn.core.components.Label
      {
         return _barLabel;
      }
      
      public function get sizeGrid() : String
      {
         return _bg.sizeGrid;
      }
      
      public function set sizeGrid(param1:String) : void
      {
         var _loc2_:* = param1;
         _bar.sizeGrid = _loc2_;
         _bg.sizeGrid = _loc2_;
      }
      
      public function get marginGrid() : String
      {
         return _marginGrid;
      }
      
      public function set marginGrid(param1:String) : void
      {
         _marginGrid = param1;
         callLater(changeValue);
      }
      
      public function get alignRight() : Boolean
      {
         return _alignRight;
      }
      
      public function set alignRight(param1:Boolean) : void
      {
         if(_alignRight != param1)
         {
            _alignRight = param1;
            callLater(changeValue);
         }
      }
      
      override public function set width(param1:Number) : void
      {
         .super.width = param1;
         _bg.width = _width;
         _barLabel.width = _width;
         callLater(changeLabelPoint);
         callLater(changeValue);
      }
      
      override public function set height(param1:Number) : void
      {
         .super.height = param1;
         _bg.height = _height;
         _bar.height = _height;
         callLater(changeLabelPoint);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _dataSource = param1;
         if(param1 is Number || param1 is String)
         {
            this.value = Number(param1);
         }
         else
         {
            .super.dataSource = param1;
         }
      }
   }
}
