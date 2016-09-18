package morn.customs.components
{
   public class GCircle extends GPoly
   {
       
      
      public function GCircle()
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
         super.initialize();
         _fillColor = 16711833;
         _fillAlpha = 0.5;
         _lineThickness = 1;
         _lineColor = 255;
         _lineAlpha = 1;
         _width = 100;
         _height = 100;
         this.callLater(draw);
      }
      
      override public function draw() : void
      {
         this.graphics.clear();
         this.graphics.lineStyle(lineThickness,lineColor,lineAlpha,true,"none","square","bevel");
         this.graphics.beginFill(fillColor,fillAlpha);
         this.graphics.drawEllipse(startX,startY,width,height);
         this.graphics.endFill();
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
   }
}
