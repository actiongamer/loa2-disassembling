package morn.core.components
{
   import morn.core.handlers.Handler;
   import flash.display.InteractiveObject;
   import flash.geom.Point;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.display.DisplayObject;
   
   public class ScrollBar extends Component
   {
      
      public static const HORIZONTAL:String = "horizontal";
      
      public static const VERTICAL:String = "vertical";
       
      
      protected var _scrollSize:Number = 1;
      
      protected var _skin:String;
      
      protected var _upButton:morn.core.components.Button;
      
      protected var _downButton:morn.core.components.Button;
      
      protected var _slider:morn.core.components.Slider;
      
      protected var _changeHandler:Handler;
      
      protected var _thumbPercent:Number = 1;
      
      protected var _target:InteractiveObject;
      
      protected var _touchScrollEnable:Boolean;
      
      protected var _mouseWheelEnable:Boolean;
      
      protected var _lastPoint:Point;
      
      protected var _lastOffset:Number = 0;
      
      protected var _autoHide:Boolean = true;
      
      protected var _showButtons:Boolean = true;
      
      private var _changeThumbSize:Boolean = false;
      
      public var dragContentEnabled:Boolean = true;
      
      public function ScrollBar(param1:String = null)
      {
         _touchScrollEnable = Config.touchScrollEnable;
         _mouseWheelEnable = Config.mouseWheelEnable;
         super();
         this.skin = param1;
      }
      
      override protected function preinitialize() : void
      {
         mouseChildren = true;
      }
      
      override protected function createChildren() : void
      {
         _slider = new morn.core.components.Slider();
         addChild(new morn.core.components.Slider());
         _upButton = new morn.core.components.Button();
         addChild(new morn.core.components.Button());
         _downButton = new morn.core.components.Button();
         addChild(new morn.core.components.Button());
      }
      
      override protected function initialize() : void
      {
         _slider.showLabel = false;
         _slider.addEventListener("change",onSliderChange);
         _slider.setSlider(0,0,0);
         _upButton.addEventListener("mouseDown",onButtonMouseDown);
         _downButton.addEventListener("mouseDown",onButtonMouseDown);
      }
      
      protected function onSliderChange(param1:Event) : void
      {
         sendEvent("change");
         if(_changeHandler != null)
         {
            _changeHandler.executeWith([value]);
         }
      }
      
      protected function onButtonMouseDown(param1:MouseEvent) : void
      {
         var _loc2_:* = param1.currentTarget == _upButton;
         slide(_loc2_);
         App.timer.doOnce(Styles.scrollBarDelayTime,new Handler(startLoop,[_loc2_]));
         this.stage.addEventListener("mouseUp",onStageMouseUp);
      }
      
      protected function startLoop(param1:Boolean) : void
      {
         App.timer.doFrameLoop(1,new Handler(slide,[param1]));
      }
      
      protected function slide(param1:Boolean) : void
      {
         if(param1)
         {
            value = value - _scrollSize;
         }
         else
         {
            value = value + _scrollSize;
         }
      }
      
      protected function onStageMouseUp(param1:MouseEvent) : void
      {
         this.stage.removeEventListener("mouseUp",onStageMouseUp);
         App.timer.clearTimer(startLoop);
         App.timer.clearTimer(slide);
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
            _slider.skin = _skin;
            callLater(changeScrollBar);
         }
      }
      
      override public function commitMeasure() : void
      {
         exeCallLater(changeScrollBar);
         super.commitMeasure();
      }
      
      override public function cancelMeasure() : void
      {
         cancelCallLater(changeScrollBar);
         super.cancelMeasure();
      }
      
      protected function changeScrollBar() : void
      {
         _upButton.visible = _showButtons;
         _downButton.visible = _showButtons;
         if(_showButtons)
         {
            _upButton.skin = _skin + "$up";
            _downButton.skin = _skin + "$down";
         }
         if(_slider.direction == "vertical")
         {
            _upButton.commitMeasure();
            _slider.y = _upButton.height;
         }
         else
         {
            _slider.x = _upButton.width;
         }
         resetPositions();
      }
      
      protected function resetButtonPosition() : void
      {
         if(_slider.direction == "vertical")
         {
            _downButton.y = _slider.y + _slider.height;
            _contentWidth = _slider.width;
            _contentHeight = _downButton.y + _downButton.height;
         }
         else
         {
            _downButton.x = _slider.x + _slider.width;
            _contentWidth = _downButton.x + _downButton.width;
            _contentHeight = _slider.height;
         }
      }
      
      override protected function changeSize() : void
      {
         super.changeSize();
         resetPositions();
      }
      
      private function resetPositions() : void
      {
         if(_slider.direction == "vertical")
         {
            _slider.height = height - _upButton.height - _downButton.height;
         }
         else
         {
            _slider.width = width - _upButton.width - _downButton.width;
         }
         resetButtonPosition();
      }
      
      public function setScroll(param1:Number, param2:Number, param3:Number) : void
      {
         exeCallLater(changeSize);
         _slider.setSlider(param1,param2,param3);
         _upButton.disabled = param2 <= 0;
         _downButton.disabled = param2 <= 0;
         _slider.bar.visible = param2 > 0;
         visible = !(_autoHide && param2 <= param1);
      }
      
      public function get max() : Number
      {
         return _slider.max;
      }
      
      public function set max(param1:Number) : void
      {
         _slider.max = param1;
      }
      
      public function get min() : Number
      {
         return _slider.min;
      }
      
      public function set min(param1:Number) : void
      {
         _slider.min = param1;
      }
      
      public function get value() : Number
      {
         return _slider.value;
      }
      
      public function set value(param1:Number) : void
      {
         _slider.value = param1;
      }
      
      public function get direction() : String
      {
         return _slider.direction;
      }
      
      public function set direction(param1:String) : void
      {
         _slider.direction = param1;
      }
      
      public function get sizeGrid() : String
      {
         return _slider.sizeGrid;
      }
      
      public function set sizeGrid(param1:String) : void
      {
         _slider.sizeGrid = param1;
      }
      
      public function get scrollSize() : Number
      {
         return _scrollSize;
      }
      
      public function set scrollSize(param1:Number) : void
      {
         _scrollSize = param1;
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
      
      public function get changeThumbSize() : Boolean
      {
         return _changeThumbSize;
      }
      
      public function set changeThumbSize(param1:Boolean) : void
      {
         if(_changeThumbSize != param1)
         {
            _changeThumbSize = param1;
            this.thumbPercent = this.thumbPercent;
         }
      }
      
      public function get thumbPercent() : Number
      {
         return _thumbPercent;
      }
      
      public function set thumbPercent(param1:Number) : void
      {
         exeCallLater(changeSize);
         _thumbPercent = param1;
         if(changeThumbSize)
         {
            if(_slider.direction == "vertical")
            {
               _slider.bar.height = Math.max(int(_slider.height * param1),Styles.scrollBarMinNum);
            }
            else
            {
               _slider.bar.width = Math.max(int(_slider.width * param1),Styles.scrollBarMinNum);
            }
         }
         else if(_slider.direction == "vertical")
         {
            _slider.bar.scaleY = 1;
         }
         else
         {
            _slider.bar.scaleX = 1;
         }
      }
      
      public function get target() : InteractiveObject
      {
         return _target;
      }
      
      public function set target(param1:InteractiveObject) : void
      {
         if(_target)
         {
            _target.removeEventListener("mouseWheel",onMouseWheel);
            _target.removeEventListener("mouseDown",onTargetMouseDown);
         }
         _target = param1;
         if(param1)
         {
            if(_mouseWheelEnable)
            {
               _target.addEventListener("mouseWheel",onMouseWheel);
            }
            if(_touchScrollEnable)
            {
               _target.addEventListener("mouseDown",onTargetMouseDown);
            }
         }
      }
      
      public function get touchScrollEnable() : Boolean
      {
         return _touchScrollEnable;
      }
      
      public function set touchScrollEnable(param1:Boolean) : void
      {
         _touchScrollEnable = param1;
         target = _target;
      }
      
      public function get mouseWheelEnable() : Boolean
      {
         return _mouseWheelEnable;
      }
      
      public function set mouseWheelEnable(param1:Boolean) : void
      {
         _mouseWheelEnable = param1;
         target = _target;
      }
      
      public function get autoHide() : Boolean
      {
         return _autoHide;
      }
      
      public function set autoHide(param1:Boolean) : void
      {
         _autoHide = param1;
      }
      
      public function get showButtons() : Boolean
      {
         return _showButtons;
      }
      
      public function set showButtons(param1:Boolean) : void
      {
         _showButtons = param1;
      }
      
      public function get changeHandler() : Handler
      {
         return _changeHandler;
      }
      
      public function set changeHandler(param1:Handler) : void
      {
         _changeHandler = param1;
      }
      
      protected function onTargetMouseDown(param1:MouseEvent) : void
      {
         if(this.dragContentEnabled == false)
         {
            return;
         }
         App.timer.clearTimer(tweenMove);
         if(!this.contains(param1.target as DisplayObject))
         {
            this.stage.addEventListener("mouseUp",onStageMouseUp2);
            this.stage.addEventListener("enterFrame",onStageEnterFrame);
            _lastPoint = new Point(this.stage.mouseX,this.stage.mouseY);
         }
      }
      
      protected function onStageEnterFrame(param1:Event) : void
      {
         _lastOffset = _slider.direction == "vertical"?this.stage.mouseY - _lastPoint.y:Number(this.stage.mouseX - _lastPoint.x);
         if(Math.abs(_lastOffset) >= 1)
         {
            _lastPoint.x = this.stage.mouseX;
            _lastPoint.y = this.stage.mouseY;
            value = value - _lastOffset;
         }
      }
      
      protected function onStageMouseUp2(param1:MouseEvent) : void
      {
         this.stage.removeEventListener("mouseUp",onStageMouseUp2);
         this.stage.removeEventListener("enterFrame",onStageEnterFrame);
         _lastOffset = _slider.direction == "vertical"?this.stage.mouseY - _lastPoint.y:Number(this.stage.mouseX - _lastPoint.x);
         if(Math.abs(_lastOffset) > 50)
         {
            _lastOffset = 50 * (_lastOffset > 0?1:-1);
         }
         App.timer.doFrameLoop(1,tweenMove);
      }
      
      private function tweenMove() : void
      {
         _lastOffset = _lastOffset * 0.92;
         value = value - _lastOffset;
         if(Math.abs(_lastOffset) < 0.5)
         {
            App.timer.clearTimer(tweenMove);
         }
      }
      
      protected function onMouseWheel(param1:MouseEvent) : void
      {
         value = value - param1.delta * 3;
         if(value < max && value > min)
         {
            param1.stopPropagation();
         }
      }
      
      public function get slider() : morn.core.components.Slider
      {
         return _slider;
      }
   }
}
