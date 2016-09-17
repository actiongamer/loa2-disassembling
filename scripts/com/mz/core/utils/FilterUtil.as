package com.mz.core.utils
{
   import flash.filters.ColorMatrixFilter;
   
   public class FilterUtil
   {
       
      
      public function FilterUtil()
      {
         super();
      }
      
      public static function highLightFilter(param1:int) : ColorMatrixFilter
      {
         param1 = 2.55 * param1;
         return new ColorMatrixFilter([1,0,0,0,param1,0,1,0,0,param1,0,0,1,0,param1,0,0,0,1,0]);
      }
      
      public static function blackWhiteFilter() : ColorMatrixFilter
      {
         return new ColorMatrixFilter([1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,1,0]);
      }
      
      public static function grayFilter() : ColorMatrixFilter
      {
         var _loc1_:Array = [0.3,0.6,0,0,0,0.3,0.6,0,0,0,0.3,0.6,0,0,0,0,0,0,0.8,0];
         var _loc2_:ColorMatrixFilter = new ColorMatrixFilter(_loc1_);
         return _loc2_;
      }
      
      public static function getLightFilter(param1:Number = 0.1) : ColorMatrixFilter
      {
         if(param1 > 1)
         {
            param1 = 1;
         }
         else if(param1 < -1)
         {
            param1 = -1;
         }
         return getColorMatrixFilter(255,255,255,param1 * 255,param1 * 255,param1 * 255);
      }
      
      public static function getColorMatrixFilter(param1:uint = 255, param2:uint = 255, param3:uint = 255, param4:int = 0, param5:int = 0, param6:int = 0) : ColorMatrixFilter
      {
         var _loc16_:* = param1;
         var _loc12_:* = param2;
         var _loc11_:* = param3;
         var _loc10_:* = param4;
         var _loc9_:* = param5;
         var _loc15_:* = param6;
         var _loc13_:Number = (255 - _loc16_) / 255 * 0.33;
         var _loc14_:Number = (255 - _loc12_) / 255 * 0.33;
         var _loc8_:Number = (255 - _loc11_) / 255 * 0.33;
         var _loc7_:Array = [1 - 2 * _loc13_,_loc14_,_loc8_,0,_loc10_,_loc13_,1 - 2 * _loc14_,_loc8_,0,_loc9_,_loc13_,_loc14_,1 - 2 * _loc8_,0,_loc15_,0,0,0,1,0];
         return new ColorMatrixFilter(_loc7_);
      }
   }
}
