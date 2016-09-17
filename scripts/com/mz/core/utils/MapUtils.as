package com.mz.core.utils
{
   import flash.geom.Point;
   
   public class MapUtils
   {
       
      
      public function MapUtils()
      {
         super();
      }
      
      public static function pointToBlock(param1:Number, param2:Number, param3:int, param4:int, param5:int, param6:int) : Point
      {
         var _loc8_:Point = new Point();
         param1 = param1 + param5;
         param2 = param2 - 0.5 * param5;
         var _loc7_:uint = param4 * param3;
         _loc8_.x = int((param1 * param4 + param2 * param3) / _loc7_);
         _loc8_.y = int((param1 * param4 - param2 * param3) / _loc7_);
         return _loc8_;
      }
      
      public static function blockToPoint(param1:uint, param2:uint, param3:int, param4:int, param5:int, param6:int) : Point
      {
         var _loc7_:Point = new Point();
         _loc7_.x = param1 * param3 * 0.5 + param2 * param3 * 0.5;
         _loc7_.y = param1 * param4 * 0.5 - param2 * param4 * 0.5;
         _loc7_.x = _loc7_.x - param5;
         _loc7_.y = _loc7_.y + 0.5 * param5;
         return _loc7_;
      }
      
      public static function indexToXY(param1:int, param2:int) : Point
      {
         return new Point(param1 % param2,Math.floor(param1 / param2));
      }
      
      public static function xyToIndex(param1:int, param2:int, param3:int) : int
      {
         return param2 * param3 + param1;
      }
   }
}
