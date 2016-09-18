package morn.customs.components
{
   import morn.core.components.HSlider;
   import morn.core.components.Image;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.handlers.Handler;
   
   public class HSliderS2 extends HSlider
   {
       
      
      public var _progress:Image;
      
      public function HSliderS2(param1:String = null)
      {
         super(param1);
      }
      
      override protected function onButtonMouseDown(param1:MouseEvent) : void
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
      }
      
      override protected function onStageMouseUp(param1:MouseEvent) : void
      {
         if(this.stage)
         {
            this.stage.removeEventListener("mouseUp",onStageMouseUp);
            this.stage.removeEventListener("mouseMove",onStageMouseMove);
         }
         _bar.stopDrag();
         hideValueText();
         changeValue();
         _progress.scaleX = _value / (_max - _min);
      }
      
      override public function set allowBackClick(param1:Boolean) : void
      {
         if(_allowBackClick != param1)
         {
            _allowBackClick = param1;
            if(_allowBackClick)
            {
               _back.addEventListener("mouseDown",onBackBoxMouseDown);
               _progress.addEventListener("mouseDown",onBackBoxMouseDown);
            }
            else
            {
               _back.removeEventListener("mouseDown",onBackBoxMouseDown);
               _progress.removeEventListener("mouseDown",onBackBoxMouseDown);
            }
         }
      }
      
      override public function set skin(param1:String) : void
      {
         if(_skin != param1)
         {
            _skin = param1;
            _back.url = _skin;
            _bar.skin = _skin + "$bar";
            _progress.skin = _skin + "$progress";
            _contentWidth = _back.width;
            _contentHeight = _back.height;
            setBarPoint();
         }
      }
      
      override protected function changeValue() : void
      {
         super.changeValue();
         _progress.scaleX = _value / (_max - _min);
      }
      
      override protected function changeSize() : void
      {
         super.changeSize();
         _back.width = width;
         _back.height = height;
         _progress.width = width;
         _progress.height = height;
         setBarPoint();
      }
      
      override protected function createChildren() : void
      {
         _back = new Image();
         addChild(new Image());
         _progress = new Image();
         addChild(new Image());
         _progress.scaleX = _value / (_max - _min);
         _progress.x = _progress.x + 1;
         _bar = new Button();
         addChild(new Button());
         _label = new Label();
         addChild(new Label());
         changeValue();
      }
      
      override protected function onStageMouseMove(param1:MouseEvent) : void
      {
         var _loc2_:Number = _value;
         if(_direction == "vertical")
         {
            _value = _bar.y / (height - _bar.height) * (_max - _min) + _min;
         }
         else
         {
            _value = _bar.x / (width - _bar.width) * (_max - _min) + _min;
            _progress.scaleX = _value / (_max - _min);
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
   }
}
