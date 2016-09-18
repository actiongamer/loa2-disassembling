package com.mz.core.utils
{
   import flash.utils.Dictionary;
   import morn.core.handlers.Handler;
   
   public final class ArrayUtil
   {
       
      
      public function ArrayUtil()
      {
         super();
      }
      
      public static function equal(param1:Array, param2:Array) : Boolean
      {
         var _loc4_:int = 0;
         var _loc3_:int = param1.length;
         if(_loc3_ != param2.length)
         {
            return false;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if(param1[_loc4_] != param2[_loc4_])
            {
               return false;
            }
            _loc4_++;
         }
         return true;
      }
      
      public static function append(param1:Array, param2:Array) : void
      {
         param1.push.apply(null,param2);
      }
      
      public static function insert(param1:Array, param2:int, param3:*) : void
      {
         param1.splice(param2,0,param3);
      }
      
      public static function hasShare(param1:Array, param2:Array) : Array
      {
         var _loc3_:Array = [];
         var _loc6_:int = 0;
         var _loc5_:* = param1;
         for each(var _loc4_ in param1)
         {
            if(param2.indexOf(_loc4_) != -1)
            {
               _loc3_.push(_loc4_);
            }
         }
         return _loc3_;
      }
      
      public static function getMapping(param1:Array, param2:*, param3:* = 0) : Object
      {
         var _loc5_:int = 0;
         var _loc4_:* = undefined;
         _loc5_ = 0;
         while(_loc5_ < param1.length)
         {
            _loc4_ = param1[_loc5_];
            if(_loc4_[param3] == param2)
            {
               return _loc4_[_loc5_];
            }
            _loc5_++;
         }
         return null;
      }
      
      public static function getFieldValues(param1:Array, param2:*) : Array
      {
         var _loc5_:int = 0;
         var _loc4_:* = undefined;
         var _loc3_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < param1.length)
         {
            _loc4_ = param1[_loc5_];
            _loc3_.push(_loc4_[param2]);
            _loc5_++;
         }
         return _loc3_;
      }
      
      public static function getDictLen(param1:Dictionary) : int
      {
         if(param1 == null)
         {
            return 0;
         }
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc2_ in param1)
         {
            _loc3_++;
         }
         return _loc3_;
      }
      
      public static function fillBySameItem(param1:Array, param2:int, param3:*) : Array
      {
         if(param2 > 0)
         {
            while(true)
            {
               param2--;
               if(!param2)
               {
                  break;
               }
               param1.push(param3);
            }
         }
         return param1;
      }
      
      public static function fillVectorFromArr(param1:*, param2:Array) : *
      {
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = undefined;
         _loc4_ = param2.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param2[_loc5_];
            param1.push(_loc3_);
            _loc5_++;
         }
         return param1;
      }
      
      public static function vectorToArr(param1:*) : Array
      {
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = undefined;
         var _loc2_:Array = [];
         _loc4_ = param1.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_.push(param1[_loc5_]);
            _loc5_++;
         }
         return _loc2_;
      }
      
      public static function isEmpty(param1:Array) : Boolean
      {
         if(param1 == null || param1.length == 0)
         {
            return true;
         }
         return false;
      }
      
      public static function concat(... rest) : Array
      {
         var _loc2_:* = null;
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = rest.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = rest[_loc5_];
            if(_loc3_ != null)
            {
               if(_loc2_ == null)
               {
                  _loc2_ = _loc3_.concat();
               }
               else
               {
                  _loc2_ = _loc2_.concat(_loc3_);
               }
            }
            _loc5_++;
         }
         return _loc2_;
      }
      
      public static function intersectionBetweenArrs(param1:Array, param2:Array, param3:Function = null) : Array
      {
         var _loc7_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:* = undefined;
         var _loc4_:Array = [];
         _loc6_ = param1.length;
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc5_ = param1[_loc7_];
            if(indexOf(param2,_loc5_,param3) != -1)
            {
               _loc4_.push(_loc5_);
            }
            _loc7_++;
         }
         return _loc4_;
      }
      
      public static function differenceBetweenArrs(param1:Array, param2:Array, param3:Function = null) : Array
      {
         var _loc5_:* = undefined;
         var _loc7_:int = 0;
         var _loc4_:Array = [];
         var _loc6_:int = param1.length;
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc5_ = param1[_loc7_];
            if(indexOf(param2,_loc5_,param3) == -1)
            {
               _loc4_.push(_loc5_);
            }
            _loc7_++;
         }
         return _loc4_;
      }
      
      public static function randomArr(param1:*, param2:Number = 10) : void
      {
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:int = param1.length;
         while(true)
         {
            param2--;
            if(!param2)
            {
               break;
            }
            _loc5_ = MathUtil.randomInt(0,_loc3_ - 1);
            _loc4_ = MathUtil.randomInt(0,_loc3_ - 1);
            swap(param1,_loc5_,_loc4_);
         }
      }
      
      public static function itemAtRandom(param1:Array) : *
      {
         return param1[MathUtil.randomInt(param1.length - 1,0)];
      }
      
      public static function replaceItem(param1:Array, param2:Object, param3:Object) : void
      {
         var _loc4_:int = param1.indexOf(param2);
         if(_loc4_ != -1)
         {
            param1[_loc4_] = param3;
         }
      }
      
      public static function swap(param1:*, param2:int, param3:int) : void
      {
         var _loc4_:Object = param1[param2];
         param1[param2] = param1[param3];
         param1[param3] = _loc4_;
      }
      
      public static function copy(param1:Array) : Array
      {
         var _loc3_:* = NaN;
         var _loc4_:Array = [];
         var _loc2_:uint = param1.length;
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            if(param1[_loc3_] is Array)
            {
               _loc4_.push(copy(param1[_loc3_]));
            }
            else
            {
               _loc4_.push(param1[_loc3_]);
            }
            _loc3_++;
         }
         return _loc4_;
      }
      
      public static function removeRepeat(param1:*, param2:Function = null) : Array
      {
         var _loc6_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = undefined;
         var _loc3_:Array = [];
         _loc5_ = param1.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = param1[_loc6_];
            if(indexOf(_loc3_,_loc4_,param2) == -1)
            {
               _loc3_.push(_loc4_);
            }
            _loc6_++;
         }
         return _loc3_;
      }
      
      public static function removeItemAt(param1:*, param2:int) : void
      {
         param1.splice(param2,1);
      }
      
      public static function removeItem(param1:*, param2:*) : int
      {
         var _loc3_:int = param1.indexOf(param2);
         if(_loc3_ == -1)
         {
            return -1;
         }
         param1.splice(_loc3_,1);
         return _loc3_;
      }
      
      public static function removeItemByAttr(param1:*, param2:String, param3:*) : int
      {
         var _loc4_:int = indexByAttr(param1,param2,param3);
         if(_loc4_ == -1)
         {
            return -1;
         }
         param1.splice(_loc4_,1);
         return _loc4_;
      }
      
      public static function removeItemFromArray(param1:*, param2:Object) : Boolean
      {
         var _loc4_:Number = NaN;
         var _loc3_:uint = param1.length;
         _loc4_ = _loc3_ - 1;
         while(_loc4_ > -1)
         {
            if(param1[_loc4_] === param2)
            {
               param1.splice(_loc4_,1);
               return true;
            }
            _loc4_--;
         }
         return false;
      }
      
      public static function findArrByAttrArr(param1:Array, param2:String, param3:Array) : Array
      {
         var _loc8_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:* = null;
         var _loc7_:* = null;
         var _loc4_:Array = [];
         _loc6_ = param3.length;
         _loc8_ = 0;
         while(_loc8_ < _loc6_)
         {
            _loc5_ = param3[_loc8_];
            _loc7_ = findByAttr(param1,param2,_loc5_);
            if(_loc7_ != null)
            {
               _loc4_.push(_loc7_);
            }
            _loc8_++;
         }
         return _loc4_;
      }
      
      public static function findArrByAttr(param1:Array, param2:String, param3:*) : Array
      {
         var _loc7_:int = 0;
         var _loc5_:* = undefined;
         var _loc4_:Array = [];
         var _loc6_:int = param1.length;
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc5_ = param1[_loc7_][param2];
            if(_loc5_ == param3)
            {
               _loc4_.push(param1[_loc7_]);
            }
            _loc7_++;
         }
         return _loc4_;
      }
      
      public static function findByAttr(param1:*, param2:String, param3:*) : *
      {
         var _loc4_:int = indexByAttr(param1,param2,param3);
         if(_loc4_ != -1)
         {
            return param1[_loc4_];
         }
         return null;
      }
      
      public static function indexOf(param1:*, param2:*, param3:Function = null) : int
      {
         var _loc6_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = undefined;
         _loc5_ = param1.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = param1[_loc6_];
            if(param3 == null)
            {
               if(_loc4_ == param2)
               {
                  return _loc6_;
               }
            }
            else if(param3.call(null,param1,param2,_loc6_,_loc4_))
            {
               return _loc6_;
            }
            _loc6_++;
         }
         return -1;
      }
      
      public static function indexByAttr(param1:*, param2:String, param3:*) : int
      {
         var _loc4_:int = 0;
         _loc4_ = 0;
         while(_loc4_ < param1.length)
         {
            if(param1[_loc4_][param2] == param3)
            {
               return _loc4_;
            }
            _loc4_++;
         }
         return -1;
      }
      
      public static function distill(param1:*, param2:String) : Array
      {
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:* = null;
         _loc4_ = param1.length;
         var _loc5_:Array = [];
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc3_ = param1[_loc6_];
            _loc5_.push(_loc3_[param2]);
            _loc6_++;
         }
         return _loc5_;
      }
      
      public static function createArrBySameItem(param1:int, param2:Object) : Array
      {
         var _loc3_:Array = [];
         while(true)
         {
            param1--;
            if(!param1)
            {
               break;
            }
            _loc3_.push(param2);
         }
         return _loc3_;
      }
      
      public static function createArrByFunc(param1:int, param2:Function, param3:Array = null) : Array
      {
         var _loc4_:Array = [];
         while(true)
         {
            param1--;
            if(!param1)
            {
               break;
            }
            _loc4_.push(param2.apply(null,param3));
         }
         return _loc4_;
      }
      
      public static function bottomValueInArr(param1:Array, param2:int) : int
      {
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         _loc4_ = param1.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            if(param2 <= _loc3_)
            {
               return param2;
            }
            _loc5_++;
         }
         return param1[_loc4_ - 1];
      }
      
      public static function obToArray(param1:Object) : Array
      {
         var _loc2_:Array = [];
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            _loc2_.push(_loc3_);
         }
         return _loc2_;
      }
      
      public static function itemToInt(param1:*) : Array
      {
         var _loc5_:int = 0;
         var _loc3_:* = undefined;
         var _loc2_:Array = [];
         var _loc4_:int = param1.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            _loc2_.push(int(_loc3_));
            _loc5_++;
         }
         return _loc2_;
      }
      
      public static function spreadArray2D(param1:Array) : Array
      {
         var _loc4_:int = 0;
         var _loc2_:Array = [];
         var _loc3_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = _loc2_.concat(param1[_loc4_]);
            _loc4_++;
         }
         return _loc2_;
      }
      
      public static function compareArrIsSame(param1:Array, param2:Array, param3:* = null) : Boolean
      {
         var _loc8_:int = 0;
         var _loc7_:int = 0;
         var _loc6_:* = undefined;
         var _loc5_:* = undefined;
         var _loc4_:Boolean = false;
         if(param1.length != param2.length)
         {
            return false;
         }
         _loc7_ = param1.length;
         _loc8_ = 0;
         while(_loc8_ < _loc7_)
         {
            _loc6_ = param1[_loc8_];
            _loc5_ = param2[_loc8_];
            if(param3 != null)
            {
               _loc4_ = Handler.executeAndReturn(param3,[_loc6_,_loc5_]);
               if(!_loc4_)
               {
                  return false;
               }
            }
            else if(_loc6_ != _loc5_)
            {
               return false;
            }
            _loc8_++;
         }
         return true;
      }
      
      public static function packItem(param1:Array, param2:int) : Array
      {
         var _loc5_:int = 0;
         var _loc3_:Array = [];
         var _loc4_:int = param1.length;
         var _loc6_:Array = [];
         while(_loc5_ < _loc4_)
         {
            if(_loc6_ == null)
            {
               _loc6_ = [];
            }
            _loc6_.push(param1[_loc5_]);
            if(_loc6_.length >= param2 || _loc5_ == _loc4_ - 1)
            {
               _loc3_.push(_loc6_);
               _loc6_ = null;
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      public static function removeAllItemEqualValue(param1:*, param2:*) : Array
      {
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            if(param1[_loc3_] == param2)
            {
               param1.splice(_loc3_,1);
               _loc3_--;
            }
            _loc3_++;
         }
         return param1;
      }
      
      public static function findByAttrValueArr(param1:Array, param2:Array, param3:Array) : *
      {
         var _loc10_:int = 0;
         var _loc6_:* = undefined;
         var _loc9_:int = 0;
         var _loc5_:Boolean = false;
         var _loc8_:int = 0;
         var _loc4_:* = null;
         var _loc7_:int = param1.length;
         _loc10_ = 0;
         while(true)
         {
            if(_loc10_ >= _loc7_)
            {
               return;
            }
            _loc6_ = param1[_loc10_];
            _loc9_ = param2.length;
            _loc5_ = true;
            _loc8_ = 0;
            while(_loc8_ < _loc9_)
            {
               _loc4_ = param2[_loc8_];
               if(_loc6_[_loc4_] != param3[_loc8_])
               {
                  _loc5_ = false;
                  break;
               }
               _loc8_++;
            }
            if(_loc5_)
            {
               break;
            }
            _loc10_++;
         }
         return _loc6_;
      }
   }
}
