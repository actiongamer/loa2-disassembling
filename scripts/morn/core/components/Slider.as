package morn.core.components
{
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import morn.core.handlers.Handler;
   
   public class Slider extends Component
   {
      
      public static const HORIZONTAL:String = "horizontal";
      
      public static const VERTICAL:String = "vertical";
       
      
      protected var _allowBackClick:Boolean;
      
      protected var _max:Number = 100;
      
      protected var _min:Number = 0;
      
      protected var _tick:Number = 1;
      
      protected var _value:Number = 0;
      
      protected var _direction:String = "vertical";
      
      protected var _skin:String;
      
      protected var _back:morn.core.components.Image;
      
      protected var _bar:morn.core.components.Button;
      
      protected var _label:morn.core.components.Label;
      
      protected var _showLabel:Boolean = true;
      
      protected var _changeHandler;
      
      public var userChangeHandler;
      
      public function Slider(param1:String = null)
      {
         super();
         this.skin = param1;
      }
      
      override protected function preinitialize() : void
      {
         mouseChildren = true;
      }
      
      override protected function createChildren() : void
      {
         _back = new morn.core.components.Image();
         addChild(new morn.core.components.Image());
         _bar = new morn.core.components.Button();
         addChild(new morn.core.components.Button());
         _label = new morn.core.components.Label();
         addChild(new morn.core.components.Label());
      }
      
      override protected function initialize() : void
      {
         _bar.addEventListener("mouseDown",onButtonMouseDown);
         var _loc1_:String = "4,4,4,4";
         _bar.sizeGrid = _loc1_;
         _back.sizeGrid = _loc1_;
         allowBackClick = true;
      }
      
      protected function onButtonMouseDown(param1:MouseEvent) : void
      {
         if(this.stage)
         {
            this.stage.addEventListener("mouseUp",onStageMouseUp);
            this.stage.addEventListener("mouseMove",onStageMouseMove);
         }
         if(_direction == "vertical")
         {
            _bar.startDrag(false,new Rectangle(_bar.x,0,0,height - _bar.height));
         }
         else
         {
            _bar.startDrag(false,new Rectangle(0,_bar.y,width - _bar.width,0));
         }
         showValueText();
      }
      
      protected function showValueText() : void
      {
         if(_showLabel)
         {
            _label.text = _value + "";
            if(_direction == "vertical")
            {
               _label.x = _bar.x + 20;
               _label.y = (_bar.height - _label.height) * 0.5 + _bar.y;
            }
            else
            {
               _label.y = _bar.y - 20;
               _label.x = (_bar.width - _label.width) * 0.5 + _bar.x;
            }
         }
      }
      
      protected function hideValueText() : void
      {
         _label.text = "";
      }
      
      protected function onStageMouseUp(param1:MouseEvent) : void
      {
         if(this.stage)
         {
            this.stage.removeEventListener("mouseUp",onStageMouseUp);
            this.stage.removeEventListener("mouseMove",onStageMouseMove);
         }
         _bar.stopDrag();
         hideValueText();
      }
      
      protected function onStageMouseMove(param1:MouseEvent) : void
      {
         var _loc2_:Number = _value;
         if(_direction == "vertical")
         {
            _value = _bar.y / (height - _bar.height) * (_max - _min) + _min;
         }
         else
         {
            _value = _bar.x / (width - _bar.width) * (_max - _min) + _min;
         }
         _value = Math.round(_value / _tick) * _tick;
         if(_value != _loc2_)
         {
            showValueText();
            sendChangeEvent();
            if(userChangeHandler)
            {
               Handler.execute(userChangeHandler,[_value]);
            }
         }
      }
      
      protected function sendChangeEvent() : void
      {
         sendEvent("change");
         if(_changeHandler != null)
         {
            Handler.execute(_changeHandler,[value]);
         }
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
            _back.url = _skin;
            _bar.skin = _skin + "$bar";
            _contentWidth = _back.width;
            _contentHeight = _back.height;
            setBarPoint();
         }
      }
      
      override protected function changeSize() : void
      {
         super.changeSize();
         _back.width = width;
         _back.height = height;
         setBarPoint();
      }
      
      protected function setBarPoint() : void
      {
         if(_direction == "vertical")
         {
            _bar.x = (_back.width - _bar.width) * 0.5;
         }
         else
         {
            _bar.y = (_back.height - _bar.height) * 0.5;
         }
      }
      
      public function get sizeGrid() : String
      {
         return _back.sizeGrid;
      }
      
      public function set sizeGrid(param1:String) : void
      {
         _back.sizeGrid = param1;
         _bar.sizeGrid = param1;
      }
      
      protected function changeValue() : void
      {
         _value = Math.round(_value / _tick) * _tick;
         _value = _value > _max?_max:Number(_value < _min?_min:Number(_value));
         if(_direction == "vertical")
         {
            _bar.y = (_value - _min) / (_max - _min) * (height - _bar.height);
         }
         else
         {
            _bar.x = (_value - _min) / (_max - _min) * (width - _bar.width);
         }
      }
      
      override public function set height(param1:Number) : void
      {
         .super.height = param1;
      }
      
      public function setSlider(param1:Number, param2:Number, param3:Number) : void
      {
         _value = -1;
         _min = param1;
         _max = param2 > param1?param2:Number(param1);
         this.value = param3 < param1?param1:Number(param3 > param2?param2:Number(param3));
      }
      
      public function get tick() : Number
      {
         return _tick;
      }
      
      public function set tick(param1:Number) : void
      {
         _tick = param1;
         callLater(changeValue);
      }
      
      override public function cancelMeasure() : void
      {
         cancelCallLater(changeValue);
         super.cancelMeasure();
      }
      
      override public function commitMeasure() : void
      {
         exeCallLater(changeValue);
         super.commitMeasure();
      }
      
      public function get max() : Number
      {
         return _max;
      }
      
      public function set max(param1:Number) : void
      {
         if(_max != param1)
         {
            _max = param1;
            callLater(changeValue);
         }
      }
      
      public function get min() : Number
      {
         return _min;
      }
      
      public function set min(param1:Number) : void
      {
         if(_min != param1)
         {
            _min = param1;
            callLater(changeValue);
         }
      }
      
      public function get value() : Number
      {
         return _value;
      }
      
      public function set value(param1:Number) : void
      {
         if(_value != param1)
         {
            _value = param1;
            changeValue();
            sendChangeEvent();
         }
      }
      
      public function get direction() : String
      {
         return _direction;
      }
      
      public function set direction(param1:String) : void
      {
         _direction = param1;
      }
      
      public function get showLabel() : Boolean
      {
         return _showLabel;
      }
      
      public function set showLabel(param1:Boolean) : void
      {
         _showLabel = param1;
      }
      
      public function get allowBackClick() : Boolean
      {
         return _allowBackClick;
      }
      
      public function set allowBackClick(param1:Boolean) : void
      {
         if(_allowBackClick != param1)
         {
            _allowBackClick = param1;
            if(_allowBackClick)
            {
               _back.addEventListener("mouseDown",onBackBoxMouseDown);
            }
            else
            {
               _back.removeEventListener("mouseDown",onBackBoxMouseDown);
            }
         }
      }
      
      protected function onBackBoxMouseDown(param1:MouseEvent) : void
      {
         if(_direction == "vertical")
         {
            value = _back.mouseY / (height - _bar.height) * (_max - _min) + _min;
         }
         else
         {
            value = _back.mouseX / (width - _bar.width) * (_max - _min) + _min;
         }
         if(userChangeHandler)
         {
            Handler.execute(userChangeHandler,[_value]);
         }
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
      
      public function get bar() : morn.core.components.Button
      {
         return _bar;
      }
      
      public function get changeHandler() : *
      {
         return _changeHandler;
      }
      
      public function set changeHandler(param1:*) : void
      {
         _changeHandler = param1;
      }
   }
}
