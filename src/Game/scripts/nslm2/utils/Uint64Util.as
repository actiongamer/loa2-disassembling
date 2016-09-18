package nslm2.utils
{
   import com.netease.protobuf.UInt64;
   import flash.utils.ByteArray;
   import com.mz.core.interFace.IDispose;
   
   public class Uint64Util
   {
       
      
      public function Uint64Util()
      {
         super();
      }
      
      public static function equal(param1:UInt64, param2:UInt64) : Boolean
      {
         if(!param1 && !param2)
         {
            return true;
         }
         if(!param1 || !param2)
         {
            return false;
         }
         return param1.high == param2.high && param1.low == param2.low;
      }
      
      public static function compare(param1:UInt64, param2:UInt64) : int
      {
         if(param1.high < param2.high)
         {
            return -1;
         }
         if(param1.high > param2.high)
         {
            return 1;
         }
         if(param1.low < param2.low)
         {
            return -1;
         }
         if(param1.low > param2.low)
         {
            return 1;
         }
         return 0;
      }
      
      public static function fromNumber(param1:Number) : UInt64
      {
         if(isNaN(param1))
         {
            param1 = 0;
         }
         return fromString(String(param1));
      }
      
      public static function isZero(param1:UInt64) : Boolean
      {
         return param1 == null || param1.high == 0 && param1.low == 0;
      }
      
      public static function compareValue(param1:UInt64, param2:UInt64) : int
      {
         return compare(param1,param2);
      }
      
      public static function fromString(param1:String, param2:uint = 10) : UInt64
      {
         var _loc8_:int = 0;
         var _loc3_:int = 0;
         var _loc7_:UInt64 = new UInt64();
         if(!param1)
         {
            return new UInt64();
         }
         param1 = param1.toLowerCase();
         var _loc4_:* = 4294967296;
         var _loc6_:* = 0;
         var _loc5_:* = 0;
         _loc8_ = 0;
         while(_loc8_ < param1.length)
         {
            _loc3_ = param1.charCodeAt(_loc8_) - 48;
            if(_loc3_ > 9)
            {
               _loc3_ = _loc3_ - 39;
            }
            _loc6_ = Number(_loc6_ * param2 + _loc3_);
            _loc5_ = Number(_loc5_ * param2 + int(_loc6_ / _loc4_));
            _loc6_ = Number(_loc6_ % _loc4_);
            _loc8_++;
         }
         return new UInt64(_loc6_,_loc5_);
      }
      
      public static function fromBytes(param1:ByteArray, param2:uint = 0) : UInt64
      {
         var _loc4_:* = 0;
         var _loc3_:* = 0;
         try
         {
            param1.position = param2;
            if(param1.endian == "littleEndian")
            {
               _loc4_ = Number(param1.readUnsignedInt());
               _loc3_ = Number(param1.readUnsignedInt());
            }
            else
            {
               _loc3_ = Number(param1.readUnsignedInt());
               _loc4_ = Number(param1.readUnsignedInt());
            }
         }
         catch(e:Error)
         {
            var _loc6_:* = new UInt64();
            return _loc6_;
         }
         return new UInt64(_loc4_,_loc3_);
      }
      
      public static function clone(param1:UInt64) : UInt64
      {
         return new UInt64(param1.low,param1.high);
      }
      
      public static function toByteArray(param1:UInt64) : ByteArray
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.endian = "littleEndian";
         _loc2_.writeUnsignedInt(param1.low);
         _loc2_.writeUnsignedInt(param1.high);
         return _loc2_;
      }
      
      public static function toString(param1:UInt64, param2:uint = 10) : String
      {
         if(param1 == null)
         {
            return "";
         }
         return param1.toString(param2);
      }
      
      public static function toNumber(param1:UInt64) : Number
      {
         return param1.high * (4294967295 + 1) + param1.low;
      }
      
      public static function toInt(param1:UInt64) : Number
      {
         return int(param1.low);
      }
      
      public static function toUint(param1:UInt64) : Number
      {
         return uint(param1.low);
      }
      
      public static function indexByAttr(param1:*, param2:String, param3:UInt64) : int
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         _loc5_ = 0;
         while(_loc5_ < param1.length)
         {
            _loc4_ = param1[_loc5_][param2];
            if(equal(_loc4_,param3))
            {
               return _loc5_;
            }
            _loc5_++;
         }
         return -1;
      }
      
      public static function findItemByAttr(param1:*, param2:String, param3:UInt64) : *
      {
         var _loc4_:int = indexByAttr(param1,param2,param3);
         if(_loc4_ != -1)
         {
            return param1[_loc4_];
         }
         return null;
      }
      
      public static function removeItemByAttr(param1:*, param2:String, param3:UInt64) : int
      {
         var _loc4_:int = indexByAttr(param1,param2,param3);
         if(_loc4_ == -1)
         {
            return -1;
         }
         param1.splice(_loc4_,1);
         return _loc4_;
      }
      
      public static function indexOfArray(param1:*, param2:UInt64) : int
      {
         var _loc4_:Number = NaN;
         var _loc3_:uint = param1.length;
         _loc4_ = _loc3_ - 1;
         while(_loc4_ > -1)
         {
            if(equal(param1[_loc4_],param2))
            {
               return _loc4_;
            }
            _loc4_--;
         }
         return -1;
      }
      
      public static function removeItemFromArray(param1:*, param2:UInt64) : Boolean
      {
         var _loc4_:Number = NaN;
         var _loc3_:uint = param1.length;
         _loc4_ = _loc3_ - 1;
         while(_loc4_ > -1)
         {
            if(equal(param1[_loc4_],param2))
            {
               param1.splice(_loc4_,1);
               return true;
            }
            _loc4_--;
         }
         return false;
      }
      
      public static function disposeAndRemoveItemByAttr(param1:*, param2:String, param3:*) : *
      {
         var _loc5_:* = null;
         var _loc4_:int = indexByAttr(param1,param2,param3);
         if(_loc4_ == -1)
         {
            return null;
         }
         _loc5_ = param1[_loc4_];
         _loc5_.dispose();
         param1.splice(_loc4_,1);
         return _loc5_;
      }
   }
}
