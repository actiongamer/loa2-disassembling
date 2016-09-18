package com.mz.core.utils
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class MathUtil
   {
       
      
      public function MathUtil()
      {
         super();
      }
      
      public static function limitIn(param1:Number, param2:Number, param3:Number) : Number
      {
         return Math.min(Math.max(param1,param2),param3);
      }
      
      public static function sum(param1:Array) : Number
      {
         var _loc2_:* = 0;
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            _loc2_ = Number(_loc2_ + _loc3_);
         }
         return _loc2_;
      }
      
      public static function avg(param1:Array) : Number
      {
         return sum(param1) / param1.length;
      }
      
      public static function max(param1:Array) : Number
      {
         var _loc3_:int = 0;
         var _loc2_:Number = NaN;
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            if(isNaN(_loc2_) || param1[_loc3_] > _loc2_)
            {
               _loc2_ = param1[_loc3_];
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public static function min(param1:Array) : Number
      {
         var _loc3_:int = 0;
         var _loc2_:Number = NaN;
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            if(isNaN(_loc2_) || param1[_loc3_] < _loc2_)
            {
               _loc2_ = param1[_loc3_];
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public static function inRect(param1:Point, param2:Rectangle) : Boolean
      {
         if(param1.x >= param2.left && param1.x <= param2.right && param1.y >= param2.top && param1.y <= param2.bottom)
         {
            return true;
         }
         return false;
      }
      
      public static function toInt(param1:String = "NaN", param2:int = 0) : Number
      {
         param1 = param1.replace("#","0x");
         return parseInt(param1,param2);
      }
      
      public static function inCenter(param1:Number, param2:Number, param3:Number, param4:Boolean = true) : Boolean
      {
         if(param4)
         {
            if(param1 >= param2 - param3 && param1 <= param2 + param3)
            {
               return true;
            }
            return false;
         }
         if(param1 > param2 - param3 && param1 < param2 + param3)
         {
            return true;
         }
         return false;
      }
      
      public static function inRange(param1:Number, param2:Number, param3:Number = 0) : Number
      {
         var _loc6_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc4_:Number = NaN;
         if(param1 < param3 || param1 > param2)
         {
            _loc6_ = param2 - param3 + 1;
            _loc5_ = param1 - param2;
            _loc4_ = Math.ceil(_loc5_ / _loc6_);
            return param1 - _loc4_ * _loc6_;
         }
         return param1;
      }
      
      public static function distanceInRange(param1:Number, param2:Number, param3:Number) : Number
      {
         var _loc4_:Number = Math.abs(param1 - param2);
         _loc4_ = Math.min(_loc4_,param3 - _loc4_);
         return _loc4_;
      }
      
      public static function rowByIndex(param1:int, param2:int) : int
      {
         return int(param1 / param2);
      }
      
      public static function colByIndex(param1:int, param2:int) : int
      {
         return param1 % param2;
      }
      
      public static function abs(param1:Number) : Number
      {
         return Math.abs(param1);
      }
      
      public static function abs360(param1:Number) : Number
      {
         if(param1 >= 0 && param1 < 360)
         {
            return param1;
         }
         if(param1 < 0)
         {
            param1 = param1 + 360;
            return abs360(param1);
         }
         param1 = param1 - 360;
         return abs360(param1);
      }
      
      public static function floor(param1:Number, param2:Number = 0) : Number
      {
         var _loc5_:int = 0;
         var _loc4_:String = "1";
         _loc5_ = 0;
         while(_loc5_ < param2)
         {
            _loc4_ = _loc4_ + "0";
            _loc5_++;
         }
         var _loc3_:int = Number(_loc4_);
         return Math.floor(param1 * _loc3_) / _loc3_;
      }
      
      public static function round(param1:Number, param2:Number = 0) : Number
      {
         var _loc5_:int = 0;
         var _loc4_:String = "1";
         _loc5_ = 0;
         while(_loc5_ < param2)
         {
            _loc4_ = _loc4_ + "0";
            _loc5_++;
         }
         var _loc3_:int = Number(_loc4_);
         return Math.round(param1 * _loc3_) / _loc3_;
      }
      
      public static function near(param1:Number, param2:Array) : Number
      {
         var _loc3_:* = NaN;
         var _loc6_:int = 0;
         var _loc5_:Number = NaN;
         var _loc4_:* = -1;
         _loc6_ = 0;
         while(_loc6_ < param2.length)
         {
            _loc5_ = Math.abs(param1 - param2[_loc6_]);
            if(_loc6_ == 0)
            {
               _loc3_ = _loc5_;
               _loc4_ = _loc6_;
            }
            else if(_loc3_ >= _loc5_)
            {
               _loc3_ = _loc5_;
            }
            _loc6_++;
         }
         return param2[_loc4_];
      }
      
      public static function randomBoolean() : Boolean
      {
         return Math.random() >= 0.5;
      }
      
      public static function randomInt(param1:int = 10, param2:int = 0) : int
      {
         var _loc3_:int = 0;
         _loc3_ = Math.round((param1 - param2) * Math.random() + param2);
         return _loc3_;
      }
      
      public static function random(param1:Number = 1, param2:Number = 0) : Number
      {
         return (param1 - param2) * Math.random() + param2;
      }
      
      public static function randomRadii(param1:Number, param2:Number) : Number
      {
         return random(param1 + param2,param1 - param2);
      }
      
      public static function asin() : Number
      {
         return Math.asin(1);
      }
      
      public static function sin(param1:Number) : Number
      {
         return Math.sin(ro2pi(param1));
      }
      
      public static function cos(param1:Number) : Number
      {
         return Math.cos(ro2pi(param1));
      }
      
      public static function tan(param1:Number) : Number
      {
         return Math.tan(ro2pi(param1));
      }
      
      public static function atan(param1:Number) : Number
      {
         return Math.atan(ro2pi(param1));
      }
      
      public static function atan2(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = NaN;
         if(param1 == 0)
         {
            _loc3_ = 3.14159265358979 / 2;
         }
         else if(param1 > 0)
         {
            _loc3_ = Math.atan(Math.abs(param2 / param1));
         }
         else
         {
            _loc3_ = 3.14159265358979 - Math.atan(Math.abs(param2 / param1));
         }
         if(param2 >= 0)
         {
            return _loc3_;
         }
         return -_loc3_;
      }
      
      public static function getCenterFromOriginPoint() : void
      {
      }
      
      public static function getOriginFromCenterPoint() : void
      {
      }
      
      public static function isOdd(param1:int) : Boolean
      {
         if(param1 % 2 == 0)
         {
            return false;
         }
         return true;
      }
      
      public static function forceSum(param1:Number, param2:Number, param3:Number) : Number
      {
         return param1 * cos(param3) + param2 * sin(param3);
      }
      
      public static function forceCent(param1:Number, param2:Number) : Point
      {
         return new Point(param1 * cos(param2),param1 * sin(param2));
      }
      
      public static function isInRange(param1:Number, param2:Number, param3:Number, param4:Boolean = true) : Boolean
      {
         var _loc5_:* = NaN;
         if(param2 <= param3)
         {
            _loc5_ = param3;
            param3 = param2;
            param2 = _loc5_;
         }
         if(param4)
         {
            if(param1 >= param3 && param1 <= param2)
            {
               return true;
            }
            return false;
         }
         if(param1 > param3 && param1 < param2)
         {
            return true;
         }
         return false;
      }
      
      public static function maxMin(param1:Number, param2:Number, param3:Number = 0) : Number
      {
         var _loc4_:* = NaN;
         if(isNaN(param1))
         {
            param1 = 0;
         }
         if(param2 <= param3)
         {
            _loc4_ = param3;
            param3 = param2;
            param2 = _loc4_;
         }
         return Math.min(param2,Math.max(param3,param1));
      }
      
      public static function disWith2Point(param1:Point, param2:Point) : Number
      {
         return dis(param2.x - param1.x,param2.y - param1.y);
      }
      
      public static function dis(param1:Number, param2:Number) : Number
      {
         return Math.sqrt(param1 * param1 + param2 * param2);
      }
      
      public static function ro2pi(param1:Number) : Number
      {
         return 3.14159265358979 / 180 * param1;
      }
      
      public static function pi2ro(param1:Number) : Number
      {
         return param1 / 3.14159265358979 * 180;
      }
      
      public static function nextPoint2(param1:Point, param2:Point, param3:Number) : Point
      {
         var _loc4_:Number = MathUtil.roWith2Point(param1,param2);
         return nextPoint(param1,_loc4_,param3);
      }
      
      public static function nextPoint(param1:Point, param2:Number, param3:Number) : Point
      {
         var _loc4_:Number = param3 * MathUtil.cos(param2);
         var _loc5_:Number = param3 * MathUtil.sin(param2);
         return new Point(param1.x + _loc4_,param1.y + _loc5_);
      }
      
      public static function projection(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Boolean = true) : Number
      {
         var _loc7_:* = NaN;
         if(param3 < param2)
         {
            _loc7_ = param2;
            param2 = param3;
            param3 = _loc7_;
         }
         if(param5 < param4)
         {
            _loc7_ = param4;
            param4 = param5;
            param5 = _loc7_;
         }
         if(param6)
         {
            if(param1 > param3)
            {
               return param5;
            }
            if(param1 < param2)
            {
               return param4;
            }
         }
         return (param1 - param2) * ((param5 - param4) / (param3 - param2)) + param4;
      }
      
      public static function roWith2Point(param1:Point, param2:Point) : Number
      {
         return ro(param2.x - param1.x,param2.y - param1.y);
      }
      
      public static function ro(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = Math.atan2(param2,param1);
         if(_loc3_ < 0)
         {
            _loc3_ = _loc3_ + 3.14159265358979 * 2;
         }
         return _loc3_ * 180 / 3.14159265358979;
      }
      
      public static function circle(param1:Number, param2:Number, param3:Number, param4:Boolean = true, param5:Boolean = true) : Number
      {
         if(param1 < param2)
         {
            return circle(param1 + (param3 - param2),param2,param3,param4,param5);
         }
         if(param1 > param3)
         {
            return circle(param1 - (param3 - param2),param2,param3,param4,param5);
         }
         if(param1 == param2)
         {
            if(param4 == false)
            {
               return param3;
            }
            return param2;
         }
         if(param1 == param3)
         {
            if(param5 == false)
            {
               return param2;
            }
            return param3;
         }
         return param1;
      }
      
      public static function pointInCircle(param1:Number, param2:Number) : Point
      {
         var _loc3_:Point = new Point();
         _loc3_.x = param2 * MathUtil.cos(param1);
         _loc3_.y = param2 * MathUtil.sin(param1);
         return _loc3_;
      }
      
      public static function isInt(param1:Number) : Boolean
      {
         return param1 == int(param1);
      }
      
      public static function formatStr(param1:String) : String
      {
         var _loc3_:* = null;
         var _loc2_:Number = param1;
         if(isNaN(_loc2_))
         {
            return "0";
         }
         if(_loc2_ >= 0)
         {
            if(_loc2_ >= 1000000000000)
            {
               _loc3_ = int(_loc2_ / 1000000000000) + "T";
            }
            else if(_loc2_ >= 1000000000)
            {
               _loc3_ = int(_loc2_ / 1000000000) + "G";
            }
            else if(_loc2_ >= 1000000)
            {
               _loc3_ = int(_loc2_ / 1000000) + "M";
            }
            else if(_loc2_ >= 10000)
            {
               _loc3_ = int(_loc2_ / 1000) + "K";
            }
            else
            {
               _loc3_ = String(_loc2_);
            }
         }
         else if(_loc2_ < -99999)
         {
            _loc3_ = "-99K";
         }
         else
         {
            _loc2_ = -_loc2_;
            if(_loc2_ < 1000)
            {
               _loc3_ = "-" + String(_loc2_);
            }
            else
            {
               _loc3_ = "-" + int(_loc2_ / 1000) + "K";
            }
         }
         if(_loc3_ == null)
         {
            _loc3_ = "";
         }
         return _loc3_;
      }
      
      public static function equalScale(param1:Number, param2:Number, param3:Number, param4:Boolean = true) : Rectangle
      {
         var _loc7_:Number = param1 / param3;
         var _loc6_:Number = _loc7_ * param3;
         var _loc5_:Number = param2 * param3;
         var _loc8_:Number = _loc5_ / param3;
         if(param4 == true && _loc7_ < _loc8_ || param4 == false && _loc7_ > _loc8_)
         {
            return new Rectangle((param1 - _loc5_) / 2,(param2 - _loc8_) / 2,_loc5_,_loc8_);
         }
         return new Rectangle((param1 - _loc6_) / 2,(param2 - _loc7_) / 2,_loc6_,_loc7_);
      }
      
      public static function num1toFF(param1:Number) : int
      {
         return Math.round(projection(param1,0,1,0,255));
      }
      
      public static function getNearByPoint3D(param1:Point, param2:int, param3:Number) : Point
      {
         var _loc4_:int = param1.x + param2 * Math.cos(param3);
         var _loc5_:int = param1.y + param2 * Math.sin(param3);
         return new Point(_loc4_,_loc5_);
      }
      
      public static function angelToRadian(param1:Number) : Number
      {
         return param1 * 3.14159265358979 / 180;
      }
      
      public static function radianToAngle(param1:Number) : Number
      {
         return param1 * 180 / 3.14159265358979;
      }
   }
}
