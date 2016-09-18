package org.specter3d.utils
{
   public class Color
   {
       
      
      public var r:Number = 0;
      
      public var g:Number = 0;
      
      public var b:Number = 0;
      
      public var a:Number = 0;
      
      public function Color(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 0)
      {
         super();
         this.a = param1;
         this.r = param2;
         this.g = param3;
         this.b = param4;
      }
      
      public static function SetA(param1:uint, param2:uint) : uint
      {
         return (param1 & 16777215) + (uint(param2) << 24);
      }
      
      public static function SetR(param1:uint, param2:uint) : uint
      {
         return (param1 & 4278255615) + (uint(param2) << 16);
      }
      
      public static function SetG(param1:uint, param2:uint) : uint
      {
         return (param1 & 4294902015) + (uint(param2) << 8);
      }
      
      public static function SetB(param1:uint, param2:uint) : uint
      {
         return (param1 & 4294967040) + (uint(param2) << 0);
      }
      
      public static function GetA(param1:uint) : uint
      {
         return param1 >> 24 & 255;
      }
      
      public static function GetR(param1:uint) : uint
      {
         return param1 >> 16 & 255;
      }
      
      public static function GetG(param1:uint) : uint
      {
         return param1 >> 8 & 255;
      }
      
      public static function GetB(param1:uint) : uint
      {
         return param1 >> 0 & 255;
      }
      
      public static function ARGB(param1:uint, param2:uint, param3:uint, param4:uint) : uint
      {
         return (uint(param1) << 24) + (uint(param2) << 16) + (uint(param3) << 8) + uint(param4);
      }
      
      public function clone() : Color
      {
         var _loc1_:Color = new Color(a,r,g,b);
         return _loc1_;
      }
      
      public function SetHWColor(param1:uint) : void
      {
         a = (param1 >> 24 & 255) / 255;
         r = (param1 >> 16 & 255) / 255;
         g = (param1 >> 8 & 255) / 255;
         b = (param1 & 255) / 255;
      }
      
      public function GetHWColor() : uint
      {
         return (uint(a * 255) << 24) + (uint(r * 255) << 16) + (uint(g * 255) << 8) + uint(b * 255);
      }
      
      public function minu(param1:Color) : Color
      {
         return new Color(a - param1.a,r - param1.r,g - param1.g,b - param1.b);
      }
      
      public function minuEqual(param1:Color) : Color
      {
         a = a - param1.a;
         r = r - param1.r;
         g = g - param1.g;
         b = b - param1.b;
         return this;
      }
      
      public function plus(param1:Color) : Color
      {
         return new Color(a + param1.a,r + param1.r,g + param1.g,b + param1.b);
      }
      
      public function plusEqual(param1:Color) : Color
      {
         a = a + param1.a;
         r = r + param1.r;
         g = g + param1.g;
         b = b + param1.b;
         return this;
      }
      
      public function mult(param1:Number) : Color
      {
         return new Color(a * param1,r * param1,g * param1,b * param1);
      }
      
      public function multEqual(param1:Number) : Color
      {
         a = a * param1;
         r = r * param1;
         g = g * param1;
         b = b * param1;
         return this;
      }
   }
}
