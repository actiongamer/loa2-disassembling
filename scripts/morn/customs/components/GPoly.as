package morn.customs.components
{
   import morn.core.components.Component;
   
   public class GPoly extends Component
   {
       
      
      protected var _fillColor:uint;
      
      protected var _fillAlpha:Number;
      
      protected var _lineColor:uint;
      
      protected var _lineAlpha:Number;
      
      protected var _lineThickness:Number;
      
      public function GPoly()
      {
         super();
      }
      
      override protected function preinitialize() : void
      {
         mouseEnabled = true;
         mouseChildren = true;
      }
      
      override protected function createChildren() : void
      {
      }
      
      override protected function initialize() : void
      {
         _fillColor = 10092288;
         _fillAlpha = 0.5;
         _lineThickness = 1;
         _lineColor = 65280;
         _lineAlpha = 0;
         _width = 100;
         _height = 100;
      }
      
      public function draw() : void
      {
      }
      
      protected function get startX() : int
      {
         return -Math.round(anchorX * width);
      }
      
      protected function get startY() : int
      {
         return -Math.round(anchorY * width);
      }
      
      override public function set width(param1:Number) : void
      {
         .super.width = param1;
         callLater(draw);
      }
      
      override public function set height(param1:Number) : void
      {
         .super.height = param1;
         callLater(draw);
      }
      
      public function get lineThickness() : Number
      {
         return _lineThickness;
      }
      
      public function set lineThickness(param1:Number) : void
      {
         _lineThickness = param1;
         callLater(draw);
      }
      
      public function get lineAlpha() : Number
      {
         return _lineAlpha;
      }
      
      public function set lineAlpha(param1:Number) : void
      {
         _lineAlpha = param1;
         callLater(draw);
      }
      
      public function get lineColor() : uint
      {
         return _lineColor;
      }
      
      public function set lineColor(param1:uint) : void
      {
         _lineColor = param1;
         callLater(draw);
      }
      
      public function get fillAlpha() : Number
      {
         return _fillAlpha;
      }
      
      public function set fillAlpha(param1:Number) : void
      {
         _fillAlpha = param1;
         callLater(draw);
      }
      
      public function get fillColor() : uint
      {
         return _fillColor;
      }
      
      public function set fillColor(param1:uint) : void
      {
         _fillColor = param1;
         callLater(draw);
      }
      
      override public function set anchorX(param1:Number) : void
      {
         .super.anchorX = param1;
         callLater(draw);
      }
      
      override public function set anchorY(param1:Number) : void
      {
         .super.anchorY = param1;
         callLater(draw);
      }
      
      override public function commitMeasure() : void
      {
         exeCallLater(draw);
         super.commitMeasure();
      }
      
      override public function cancelMeasure() : void
      {
         App.render.cancelCallLater(draw);
      }
   }
}
