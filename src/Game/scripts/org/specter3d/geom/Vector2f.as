package org.specter3d.geom
{
   import flash.geom.Point;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   import flash.text.TextField;
   
   public class Vector2f
   {
       
      
      public var x:Number;
      
      public var y:Number;
      
      public function Vector2f(param1:Number = 0, param2:Number = 0)
      {
         super();
         this.x = param1;
         this.y = param2;
      }
      
      public function setVector2f(param1:Vector2f) : void
      {
         x = param1.x;
         y = param1.y;
      }
      
      public function getAngle() : Number
      {
         return -Math.atan2(y,x);
      }
      
      public function get length() : Number
      {
         return Math.sqrt(lengthSquared());
      }
      
      public function get angle() : Number
      {
         return Math.atan2(y,x);
      }
      
      public function lengthSquared() : Number
      {
         return x * x + y * y;
      }
      
      public function distanceSquared(param1:Vector2f) : Number
      {
         var _loc2_:Number = x - param1.x;
         var _loc3_:Number = y - param1.y;
         return _loc2_ * _loc2_ + _loc3_ * _loc3_;
      }
      
      public function negate() : Vector2f
      {
         return new Vector2f(-x,-y);
      }
      
      public function negateLocal() : Vector2f
      {
         x = -x;
         y = -y;
         return this;
      }
      
      public function add(param1:Vector2f) : Vector2f
      {
         if(null == param1)
         {
            return null;
         }
         return new Vector2f(x + param1.x,y + param1.y);
      }
      
      public function addLocal(param1:Vector2f) : Vector2f
      {
         if(null == param1)
         {
            return null;
         }
         x = x + param1.x;
         y = y + param1.y;
         return this;
      }
      
      public function subtract(param1:Vector2f) : Vector2f
      {
         return new Vector2f(x - param1.x,y - param1.y);
      }
      
      public function subtractLocal(param1:Vector2f) : Vector2f
      {
         if(null == param1)
         {
            return null;
         }
         x = x - param1.x;
         y = y - param1.y;
         return this;
      }
      
      public function dot(param1:Vector2f) : Number
      {
         if(null == param1)
         {
            return 0;
         }
         return x * param1.x + y * param1.y;
      }
      
      public function mult(param1:Number) : Vector2f
      {
         return new Vector2f(x * param1,y * param1);
      }
      
      public function multLocal(param1:Number) : Vector2f
      {
         x = x * param1;
         y = y * param1;
         return this;
      }
      
      public function multLocalV(param1:Vector2f) : Vector2f
      {
         if(null == param1)
         {
            return null;
         }
         x = x * param1.x;
         y = y * param1.y;
         return this;
      }
      
      public function multV(param1:Number, param2:Vector2f) : Vector2f
      {
         if(null == param2)
         {
            param2 = new Vector2f();
         }
         param2.x = x * param1;
         param2.y = y * param1;
         return param2;
      }
      
      public function divide(param1:Number) : Vector2f
      {
         return new Vector2f(x / param1,y / param1);
      }
      
      public function divideLocal(param1:Number) : Vector2f
      {
         x = x / param1;
         y = y / param1;
         return this;
      }
      
      public function normalize() : Vector2f
      {
         var _loc1_:Number = length;
         if(_loc1_ != 0)
         {
            return divide(_loc1_);
         }
         return divide(1);
      }
      
      public function normalizeLocal() : Vector2f
      {
         var _loc1_:Number = length;
         if(_loc1_ != 0)
         {
            return divideLocal(_loc1_);
         }
         return divideLocal(1);
      }
      
      public function smallestAngleBetween(param1:Vector2f) : Number
      {
         var _loc2_:Number = dot(param1);
         var _loc3_:Number = Math.acos(_loc2_);
         return _loc3_;
      }
      
      public function angleBetween(param1:Vector2f) : Number
      {
         var _loc2_:Number = Math.atan2(param1.y,param1.x) - Math.atan2(y,x);
         return _loc2_;
      }
      
      public function interpolate(param1:Vector2f, param2:Number) : void
      {
         x = (1 - param2) * x + param2 * param1.x;
         y = (1 - param2) * y + param2 * param1.y;
      }
      
      public function zero() : void
      {
         y = 0;
         x = 0;
      }
      
      public function toArray(param1:Vector.<Number>) : Vector.<Number>
      {
         if(param1 == null)
         {
            param1 = new Vector.<Number>();
         }
         param1[0] = x;
         param1[1] = y;
         return param1;
      }
      
      public function rotateAroundOrigin(param1:Number, param2:Boolean) : void
      {
         if(param2)
         {
            param1 = -param1;
         }
         var _loc3_:Number = Math.cos(param1) * x - Math.sin(param1) * y;
         var _loc4_:Number = Math.sin(param1) * x + Math.cos(param1) * y;
         x = _loc3_;
         y = _loc4_;
      }
      
      public final function equals(param1:Vector2f, param2:Number = 1.0E-6) : Boolean
      {
         return Math.abs(x - param1.x) < param2 && Math.abs(y - param1.y) < param2;
      }
      
      public function clone() : Vector2f
      {
         return new Vector2f(x,y);
      }
      
      public function toPoint() : Point
      {
         return new Point(x,y);
      }
      
      public function draw(param1:Sprite) : void
      {
         var _loc2_:TextFormat = new TextFormat();
         _loc2_.color = 0;
         _loc2_.size = 10;
         var _loc3_:TextField = new TextField();
         _loc3_.mouseEnabled = false;
         _loc3_.defaultTextFormat = _loc2_;
         _loc3_.autoSize = "left";
         _loc3_.x = x;
         _loc3_.y = y;
         _loc3_.text = toString();
         param1.addChild(_loc3_);
      }
      
      public function getSaveData() : Object
      {
         return {
            "x":x,
            "y":y
         };
      }
      
      public function toString() : String
      {
         return "(" + x + "," + y + ")";
      }
   }
}
