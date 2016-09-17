package com.mz.core.components.comp2d
{
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   
   public class BlackRim extends Sprite
   {
       
      
      public var fileColor:uint = 0;
      
      public var fileAlpha:Number = 1;
      
      public var hole:Rectangle;
      
      protected var _w:int = 200;
      
      protected var _h:int = 200;
      
      public function BlackRim()
      {
         hole = new Rectangle(50,50,100,100);
         super();
         draw();
      }
      
      public static function clone(param1:BlackRim) : BlackRim
      {
         var _loc2_:BlackRim = new BlackRim();
         if(param1)
         {
            _loc2_.x = param1.x;
            _loc2_.y = param1.y;
            _loc2_.width = param1.width;
            _loc2_.height = param1.height;
            _loc2_.fileAlpha = param1.fileAlpha;
            _loc2_.fileColor = param1.fileColor;
            _loc2_.hole = param1.hole;
         }
         return _loc2_;
      }
      
      public function draw() : void
      {
         this.graphics.clear();
         this.graphics.beginFill(fileColor,fileAlpha);
         this.graphics.drawRect(0,0,_w,_h);
         if(hole)
         {
            this.graphics.drawRect(hole.x,hole.y,hole.width,hole.height);
         }
         this.graphics.endFill();
      }
      
      override public function get width() : Number
      {
         return _w;
      }
      
      override public function set width(param1:Number) : void
      {
         _w = param1;
      }
      
      override public function get height() : Number
      {
         return _h;
      }
      
      override public function set height(param1:Number) : void
      {
         _h = param1;
      }
   }
}
