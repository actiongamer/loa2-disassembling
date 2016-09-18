package morn.core.utils
{
   import flash.geom.ColorTransform;
   
   public class ColorUtil
   {
       
      
      public function ColorUtil()
      {
         super();
      }
      
      public static function getColorTransform(param1:uint, param2:Number = 1.0) : ColorTransform
      {
         var _loc5_:Number = param1 >> 16 & 255;
         var _loc3_:Number = param1 >> 8 & 255;
         var _loc4_:Number = param1 & 255;
         return new ColorTransform(_loc5_ / 255,_loc3_ / 255,_loc4_ / 255,param2);
      }
      
      public static function toHTML(param1:uint) : String
      {
         return "#" + param1.toString(16);
      }
      
      public static function getAlpha(param1:uint) : uint
      {
         return param1 >> 24 & 255;
      }
      
      public static function getRed(param1:uint) : uint
      {
         return param1 >> 16 & 255;
      }
      
      public static function getGreen(param1:uint) : uint
      {
         return param1 >> 8 & 255;
      }
      
      public static function getBlue(param1:uint) : uint
      {
         return param1 >> 0 & 255;
      }
      
      public static function toColor(param1:uint, param2:uint, param3:uint) : uint
      {
         return (param1 << 16) + (param2 << 8) + param3;
      }
   }
}
