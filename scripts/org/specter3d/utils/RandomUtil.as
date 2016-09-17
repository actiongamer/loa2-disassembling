package org.specter3d.utils
{
   public class RandomUtil
   {
       
      
      public function RandomUtil()
      {
         super();
      }
      
      public static function getNotRepeat() : Number
      {
         return Number(String(new Date().time).slice(5)) + Math.random();
      }
      
      public static function getBetween(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = param2 - param1;
         return Math.random() * _loc3_ + param1;
      }
      
      public static function get boolean() : Boolean
      {
         return Math.random() < 0.5;
      }
      
      public static function get wave() : int
      {
         return Math.random() < 0.5?-1:1;
      }
      
      public static function get color() : uint
      {
         return Math.random() * 16777216;
      }
      
      public static function integet(param1:int) : int
      {
         return Math.random() * param1;
      }
      
      public static function number(param1:int) : Number
      {
         return Math.random() * param1;
      }
      
      public static function char(... rest) : String
      {
         return rest[int(Math.random() * rest.length)];
      }
      
      public static function string(param1:int) : String
      {
         var _loc3_:* = 0;
         var _loc2_:* = null;
         _loc3_ = uint(0);
         _loc2_ = "";
         while(_loc3_ < param1)
         {
            _loc2_ = _loc2_ + charRanges("0","9","A","Z","a","z");
            _loc3_++;
         }
         return _loc2_;
      }
      
      public static function intRange(param1:uint, param2:uint) : uint
      {
         return Math.random() * (param2 - param1) + param1;
      }
      
      public static function numRange(param1:Number, param2:Number) : Number
      {
         if(param1 < 0 || param2 < 0)
         {
            throw new Error("参数错误：不可为负数。");
         }
         return Math.random() * (param2 - param1) + param1;
      }
      
      public static function charRange(param1:String, param2:String) : String
      {
         var _loc3_:uint = param1.charCodeAt(0);
         var _loc4_:uint = param2.charCodeAt(0);
         return String.fromCharCode(int(Math.random() * (_loc4_ - _loc3_)) + _loc3_);
      }
      
      public static function intRanges(... rest) : int
      {
         var _loc8_:* = 0;
         var _loc6_:Array = [];
         var _loc4_:Array = [];
         while(rest.length)
         {
            _loc6_.push(rest.shift());
            _loc4_.push(rest.shift());
         }
         var _loc7_:uint = _loc6_.length;
         var _loc3_:uint = 0;
         var _loc2_:uint = 0;
         _loc8_ = uint(0);
         while(_loc8_ < _loc7_)
         {
            _loc3_ = _loc3_ + _loc6_[_loc8_];
            _loc2_ = _loc2_ + _loc4_[_loc8_];
            _loc8_++;
         }
         var _loc5_:int = Math.random() * (_loc2_ - _loc3_) + _loc6_[0];
         _loc8_ = uint(0);
         while(_loc5_ >= _loc4_[_loc8_++])
         {
            _loc5_ = _loc5_ + (_loc6_[_loc8_] - _loc4_[_loc8_ - 1]);
         }
         return _loc5_;
      }
      
      public static function numRanges(... rest) : Number
      {
         var _loc8_:* = 0;
         var _loc5_:Number = NaN;
         var _loc6_:Array = [];
         var _loc4_:Array = [];
         while(rest.length)
         {
            _loc6_.push(rest.shift());
            _loc4_.push(rest.shift());
         }
         var _loc7_:uint = _loc6_.length;
         var _loc3_:uint = 0;
         var _loc2_:uint = 0;
         _loc8_ = uint(0);
         while(_loc8_ < _loc7_)
         {
            _loc3_ = _loc3_ + _loc6_[_loc8_];
            _loc2_ = _loc2_ + _loc4_[_loc8_];
            _loc8_++;
         }
         do
         {
            _loc5_ = Math.random() * (_loc2_ - _loc3_) + _loc6_[0];
            _loc8_ = uint(0);
            while(_loc5_ >= _loc4_[_loc8_++])
            {
               _loc5_ = _loc5_ + (_loc6_[_loc8_] - _loc4_[_loc8_ - 1]);
            }
         }
         while(isNaN(_loc5_));
         
         return _loc5_;
      }
      
      public static function charRanges(... rest) : String
      {
         var _loc8_:* = 0;
         var _loc6_:Array = [];
         var _loc4_:Array = [];
         while(rest.length)
         {
            _loc6_.push(rest.shift().charCodeAt(0));
            _loc4_.push(rest.shift().charCodeAt(0) + 1);
         }
         var _loc7_:uint = _loc6_.length;
         var _loc3_:uint = 0;
         var _loc2_:uint = 0;
         _loc8_ = uint(0);
         while(_loc8_ < _loc7_)
         {
            _loc3_ = _loc3_ + _loc6_[_loc8_];
            _loc2_ = _loc2_ + _loc4_[_loc8_];
            _loc8_++;
         }
         var _loc5_:int = Math.random() * (_loc2_ - _loc3_) + _loc6_[0];
         _loc8_ = uint(0);
         while(_loc5_ >= _loc4_[_loc8_++])
         {
            _loc5_ = _loc5_ + (_loc6_[_loc8_] - _loc4_[_loc8_ - 1]);
         }
         return String.fromCharCode(_loc5_);
      }
      
      public static function strRanges(param1:uint, ... rest) : String
      {
         var _loc10_:* = 0;
         var _loc6_:int = 0;
         var _loc7_:Array = [];
         var _loc5_:Array = [];
         while(rest.length)
         {
            _loc7_.push(rest.shift().charCodeAt(0));
            _loc5_.push(rest.shift().charCodeAt(0) + 1);
         }
         var _loc9_:uint = _loc7_.length;
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         _loc10_ = uint(0);
         while(_loc10_ < _loc9_)
         {
            _loc4_ = _loc4_ + _loc7_[_loc10_];
            _loc3_ = _loc3_ + _loc5_[_loc10_];
            _loc10_++;
         }
         var _loc8_:String = "";
         while(param1-- > 0)
         {
            _loc6_ = Math.random() * (_loc3_ - _loc4_) + _loc7_[0];
            _loc10_ = uint(0);
            while(_loc6_ >= _loc5_[_loc10_++])
            {
               _loc6_ = _loc6_ + (_loc7_[_loc10_] - _loc5_[_loc10_ - 1]);
            }
            _loc8_ = _loc8_ + String.fromCharCode(_loc6_);
         }
         return _loc8_;
      }
      
      public static function colorRanges(... rest) : uint
      {
         return intRange(rest[0],rest[1] + 1) << 16 + intRange(rest[2],rest[3] + 1) << 8 + intRange(rest[4],rest[5] + 1);
      }
      
      public static function randomArr(param1:Array) : Array
      {
         var _loc6_:* = 0;
         var _loc4_:int = 0;
         var _loc3_:Array = param1.concat();
         var _loc5_:uint = _loc3_.length;
         var _loc2_:Array = [];
         _loc6_ = uint(0);
         while(_loc6_ < _loc5_)
         {
            _loc4_ = Math.floor(Math.random() * _loc3_.length);
            _loc2_.push(_loc3_[_loc4_]);
            _loc3_.splice(_loc4_,1);
            _loc6_++;
         }
         return _loc2_;
      }
   }
}
