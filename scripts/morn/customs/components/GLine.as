package morn.customs.components
{
   import morn.core.components.Component;
   
   public class GLine extends Component
   {
       
      
      protected var _lineColor:uint;
      
      protected var _lineAlpha:Number;
      
      protected var _lineThickness:Number;
      
      public function GLine()
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
         _lineThickness = 1;
         _lineColor = 65280;
         _lineAlpha = 1;
         _width = 100;
         this.callLater(draw);
      }
      
      public function draw() : void
      {
         this.graphics.clear();
         this.graphics.lineStyle(this._lineThickness,this._lineColor,this._lineAlpha);
         this.graphics.moveTo(0,0);
         this.graphics.lineTo(this.width,0);
      }
      
      override public function set width(param1:Number) : void
      {
         .super.width = param1;
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
   }
}
