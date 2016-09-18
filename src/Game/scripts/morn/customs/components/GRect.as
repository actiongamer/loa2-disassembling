package morn.customs.components
{
   public class GRect extends GPoly
   {
       
      
      protected var _radius:Array;
      
      public function GRect()
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
         _fillColor = 10092288;
         _fillAlpha = 0.5;
         _lineThickness = 1;
         _lineColor = 255;
         _lineAlpha = 1;
         _width = 100;
         _radius = [0,0,0,0];
         _height = 100;
         this.callLater(draw);
      }
      
      override public function draw() : void
      {
         this.graphics.clear();
         this.graphics.lineStyle(lineThickness,lineColor,lineAlpha,true,"none","square","bevel");
         this.graphics.beginFill(fillColor,fillAlpha);
         var _loc1_:Array = validateRadius();
         this.graphics.drawRoundRectComplex(startX,startY,width,height,_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3]);
         this.graphics.endFill();
      }
      
      protected function validateRadius() : Array
      {
         if(_radius == null)
         {
            return [0,0,0,0];
         }
         if(_radius.length == 0)
         {
            return [0,0,0,0];
         }
         if(_radius.length == 1)
         {
            return [_radius[0],_radius[0],_radius[0],_radius[0]];
         }
         if(_radius.length == 2)
         {
            return [_radius[0],_radius[1],_radius[0],_radius[1]];
         }
         if(_radius.length == 3)
         {
            return [_radius[0],_radius[1],_radius[2],_radius[2]];
         }
         return _radius;
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
      
      public function get radius() : String
      {
         return _radius.join(",");
      }
      
      public function set radius(param1:String) : void
      {
         if(param1 == null || param1 == "")
         {
            param1 = "0";
         }
         _radius = param1.split(",");
         callLater(draw);
      }
   }
}
