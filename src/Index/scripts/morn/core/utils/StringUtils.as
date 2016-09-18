package morn.core.utils
{
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   
   public class StringUtils
   {
       
      
      public function StringUtils()
      {
         super();
      }
      
      public static function boolVal(param1:String) : Boolean
      {
         var _loc2_:* = param1;
         if("true" !== _loc2_)
         {
            return false;
         }
         return true;
      }
      
      public static function fillArray(param1:Array, param2:String, param3:Class = null) : Array
      {
         var _loc4_:* = null;
         var _loc8_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:* = null;
         var _loc7_:Array = ObjectUtils.clone(param1);
         if(param2)
         {
            _loc4_ = param2.split(",");
            _loc8_ = 0;
            _loc6_ = Math.min(_loc7_.length,_loc4_.length);
            while(_loc8_ < _loc6_)
            {
               _loc5_ = _loc4_[_loc8_];
               _loc7_[_loc8_] = _loc5_ == "true"?true:_loc5_ == "false"?false:_loc5_;
               if(param3 != null)
               {
                  _loc7_[_loc8_] = param3(_loc5_);
               }
               _loc8_++;
            }
         }
         return _loc7_;
      }
      
      public static function fillArray2(param1:Array, param2:String, param3:Class = null) : Array
      {
         var _loc5_:* = undefined;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc4_:Array = [];
         if(param2)
         {
            _loc6_ = param2.split(",");
            _loc7_ = Math.max(param2.length,_loc6_.length);
            _loc8_ = 0;
            while(_loc8_ < _loc7_)
            {
               if(_loc8_ < _loc6_.length)
               {
                  _loc5_ = String(_loc6_[_loc8_]);
                  _loc5_ = _loc5_ == "true"?true:_loc5_ == "false"?false:_loc5_;
                  if(param3 != null)
                  {
                     _loc5_ = param3(_loc5_);
                  }
               }
               _loc4_.push(_loc5_);
               _loc8_++;
            }
            return _loc4_;
         }
         return ObjectUtils.clone(param1);
      }
      
      public static function rectToString(param1:Rectangle) : String
      {
         if(param1)
         {
            return param1.x + "," + param1.y + "," + param1.width + "," + param1.height;
         }
         return null;
      }
      
      public static function addZeorFront(param1:*, param2:int) : String
      {
         var _loc3_:String = String(param1);
         var _loc5_:int = param2 - _loc3_.length;
         var _loc4_:Array = _loc3_.split();
         if(_loc5_ >= 0)
         {
            while(true)
            {
               _loc5_--;
               if(!_loc5_)
               {
                  break;
               }
               _loc4_.unshift("0");
            }
         }
         return _loc4_.join("");
      }
      
      public static function clearEnterString(param1:String) : String
      {
         if(param1)
         {
            return param1.replace(/\s/g," ");
         }
         return "";
      }
      
      public static function trim(param1:String) : String
      {
         if(param1 == null)
         {
            return null;
         }
         return param1.replace(/^\s+|\s+$/sg,"");
      }
      
      public static function replaceTemplateVarAll(param1:String, param2:String, param3:String) : String
      {
         return param1.split("${" + param2 + "}").join(param3);
      }
      
      public static function replaceAll(param1:String, param2:String, param3:String) : String
      {
         return param1.split(param2).join(param3);
      }
      
      public static function upperFirstLetter(param1:String) : String
      {
         var _loc2_:String = param1.charAt(0);
         return _loc2_.toUpperCase() + param1.substr(1,param1.length - 1);
      }
      
      public static function lowerFirstLetter(param1:String) : String
      {
         var _loc2_:String = param1.charAt(0);
         return _loc2_.toLowerCase() + param1.substr(1,param1.length - 1);
      }
      
      public static function camelCaseToUnderline(param1:String, param2:Boolean = false) : String
      {
         var _loc6_:int = 0;
         var _loc3_:* = null;
         var _loc4_:Array = spliceByUpper(param1);
         var _loc5_:int = _loc4_.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = _loc4_[_loc6_];
            if(param2)
            {
               _loc3_ = _loc3_.toUpperCase();
            }
            else
            {
               _loc3_ = _loc3_.toLowerCase();
            }
            _loc4_[_loc6_] = _loc3_;
            _loc6_++;
         }
         return _loc4_.join("_");
      }
      
      public static function underlineToCamelCase(param1:String, param2:Boolean = false) : String
      {
         var _loc6_:int = 0;
         var _loc3_:* = null;
         var _loc4_:Array = param1.split("_");
         var _loc5_:int = _loc4_.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = _loc4_[_loc6_];
            if(_loc6_ == 0)
            {
               if(param2)
               {
                  _loc3_ = upperFirstLetter(_loc3_);
               }
               else
               {
                  _loc3_ = lowerFirstLetter(_loc3_);
               }
            }
            else
            {
               _loc3_ = upperFirstLetter(_loc3_);
            }
            _loc4_[_loc6_] = _loc3_;
            _loc6_++;
         }
         return _loc4_.join("");
      }
      
      public static function spliceByUpper(param1:String) : Array
      {
         var _loc3_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:* = null;
         var _loc2_:Array = [];
         if(param1 == null || param1.length == 0)
         {
            return _loc2_;
         }
         var _loc4_:* = param1.substr(0,1);
         _loc3_ = param1.length;
         _loc6_ = 1;
         while(_loc6_ < _loc3_)
         {
            _loc5_ = param1.substr(_loc6_,1);
            if(_loc5_ == _loc5_.toUpperCase())
            {
               _loc2_.push(_loc4_);
               _loc4_ = _loc5_;
            }
            else
            {
               _loc4_ = _loc4_ + _loc5_;
            }
            _loc6_++;
         }
         if(_loc4_.length > 0)
         {
            _loc2_.push(_loc4_);
         }
         return _loc2_;
      }
      
      public static function classFullNameToName(param1:String) : String
      {
         return param1.replace("::",".");
      }
      
      public static function classFullNameToShortName(param1:String) : String
      {
         var _loc2_:Array = param1.split("::");
         return _loc2_[_loc2_.length - 1];
      }
      
      public static function fillWithSameStr(param1:String, param2:int) : String
      {
         if(param2 > 1)
         {
            return param1 + fillWithSameStr(param1,param2 - 1);
         }
         return param1;
      }
      
      public static function isNull(param1:String) : Boolean
      {
         if(param1 == null)
         {
            return true;
         }
         if(param1 == "null")
         {
            return true;
         }
         if(param1 == "0")
         {
            return true;
         }
         if(param1 == "")
         {
            return true;
         }
         if(param1 == "undefined")
         {
            return true;
         }
         return false;
      }
      
      public static function insertRepeat(param1:String, param2:int, param3:String = "\n") : String
      {
         var _loc7_:int = 0;
         var _loc5_:Array = param1.split("");
         var _loc4_:Array = [];
         var _loc6_:int = 0;
         _loc7_ = 0;
         while(_loc7_ < _loc5_.length)
         {
            _loc4_.push(_loc5_[_loc7_]);
            _loc6_++;
            if(_loc6_ == param2)
            {
               _loc6_ = 0;
               _loc4_.push(param3);
            }
            _loc7_++;
         }
         return _loc4_.join("");
      }
      
      public static function byteLen(param1:String) : int
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeMultiByte(param1,"gb2312");
         return _loc2_.length;
      }
   }
}
