package morn.core.utils
{
   import flash.display.DisplayObject;
   import flash.filters.BitmapFilter;
   import flash.utils.ByteArray;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.filters.ColorMatrixFilter;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.utils.Dictionary;
   import flash.xml.XMLNode;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getDefinitionByName;
   import flash.utils.describeType;
   
   public class ObjectUtils
   {
      
      private static const grayFilter:ColorMatrixFilter = new ColorMatrixFilter([0.3086,0.6094,0.082,0,0,0.3086,0.6094,0.082,0,0,0.3086,0.6094,0.082,0,0,0,0,0,1,0]);
      
      private static var _tf:TextField = new TextField();
      
      private static var refCount:int = 0;
      
      private static var FORMAT_INDENT:int = 2;
      
      private static var TYPE_INFO_CACHE:Dictionary = new Dictionary();
      
      private static var CLASS_INFO_CACHE:Dictionary = new Dictionary();
       
      
      public function ObjectUtils()
      {
         super();
      }
      
      public static function addFilter(param1:DisplayObject, param2:BitmapFilter) : void
      {
         var _loc3_:Array = param1.filters || [];
         _loc3_.push(param2);
         param1.filters = _loc3_;
      }
      
      public static function clearFilter(param1:DisplayObject, param2:Class) : void
      {
         var _loc5_:int = 0;
         var _loc3_:* = undefined;
         var _loc4_:Array = param1.filters;
         if(_loc4_ != null && _loc4_.length > 0)
         {
            _loc5_ = _loc4_.length - 1;
            while(_loc5_ > -1)
            {
               _loc3_ = _loc4_[_loc5_];
               if(_loc3_ is param2)
               {
                  _loc4_.splice(_loc5_,1);
               }
               _loc5_--;
            }
            param1.filters = _loc4_;
         }
      }
      
      public static function clone(param1:*) : *
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeObject(param1);
         _loc2_.position = 0;
         return _loc2_.readObject();
      }
      
      public static function createBitmap(param1:int, param2:int, param3:uint = 0, param4:Number = 1) : Bitmap
      {
         var _loc5_:Bitmap = new Bitmap(new BitmapData(1,1,false,param3));
         _loc5_.alpha = param4;
         _loc5_.width = param1;
         _loc5_.height = param2;
         return _loc5_;
      }
      
      public static function readAMF(param1:ByteArray) : Object
      {
         if(param1 && param1.length > 0 && param1.readByte() == 17)
         {
            return param1.readObject();
         }
         return null;
      }
      
      public static function writeAMF(param1:Object) : ByteArray
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(17);
         _loc2_.writeObject(param1);
         return _loc2_;
      }
      
      public static function gray(param1:DisplayObject, param2:Boolean = true) : void
      {
         if(param2)
         {
            addFilter(param1,grayFilter);
         }
         else
         {
            clearFilter(param1,ColorMatrixFilter);
         }
      }
      
      public static function getTextField(param1:TextFormat, param2:String = "Test") : TextField
      {
         _tf.autoSize = "left";
         _tf.defaultTextFormat = param1;
         _tf.text = param2;
         return _tf;
      }
      
      public static function toString(param1:Object, param2:int = 4, param3:Array = null, param4:Array = null) : String
      {
         refCount = 0;
         return internalToString(param1,0,param2,null,param3,param4);
      }
      
      private static function internalToString(param1:Object, param2:int = 0, param3:int = 100, param4:Dictionary = null, param5:Array = null, param6:Array = null) : String
      {
         var _loc13_:* = null;
         var _loc7_:* = null;
         var _loc9_:* = null;
         var _loc12_:* = null;
         var _loc14_:* = false;
         var _loc8_:* = undefined;
         var _loc10_:int = 0;
         var _loc11_:String = param1 == null?"null":typeof param1;
         var _loc17_:* = _loc11_;
         if("boolean" !== _loc17_)
         {
            if("number" !== _loc17_)
            {
               if("xml" !== _loc17_)
               {
                  if("string" !== _loc17_)
                  {
                     if("object" !== _loc17_)
                     {
                        return "(" + _loc11_ + ")";
                     }
                     if(param1 is Date)
                     {
                        return param1.toString();
                     }
                     if(param1 is XMLNode)
                     {
                        return param1.toString();
                     }
                     if(param1 is Class)
                     {
                        return "(" + getQualifiedClassName(param1) + ")";
                     }
                     _loc7_ = getClassInfo(param1,param6,{
                        "includeReadOnly":true,
                        "uris":param5
                     });
                     _loc9_ = _loc7_.properties;
                     _loc13_ = "(" + _loc7_.name + ")";
                     if(param4 == null)
                     {
                        param4 = new Dictionary(true);
                     }
                     _loc12_ = param4[param1];
                     if(_loc12_ != null)
                     {
                        _loc13_ = _loc13_ + ("#" + int(_loc12_));
                        return _loc13_;
                     }
                     if(param1 != null)
                     {
                        _loc13_ = _loc13_ + ("#" + refCount.toString());
                        param4[param1] = refCount;
                        refCount = Number(refCount) + 1;
                     }
                     _loc14_ = param1 is Array;
                     param2 = param2 + 1;
                     _loc10_ = 0;
                     while(_loc10_ < _loc9_.length)
                     {
                        _loc13_ = newline(_loc13_,param2 * FORMAT_INDENT);
                        _loc8_ = _loc9_[_loc10_];
                        if(_loc14_)
                        {
                           _loc13_ = _loc13_ + "[";
                        }
                        _loc13_ = _loc13_ + _loc8_.toString();
                        if(_loc14_)
                        {
                           _loc13_ = _loc13_ + "] ";
                        }
                        else
                        {
                           _loc13_ = _loc13_ + " = ";
                        }
                        try
                        {
                           if(param2 > param3)
                           {
                              _loc13_ = _loc13_ + ("max depth(" + param3 + ") reached...");
                           }
                           else
                           {
                              _loc13_ = _loc13_ + internalToString(param1[_loc8_],param2,param3,param4,param5,param6);
                           }
                        }
                        catch(e:Error)
                        {
                           _loc13_ = _loc13_ + "?";
                        }
                        _loc10_++;
                     }
                     param2 = param2 - 1;
                     return _loc13_;
                  }
                  return "\"" + param1.toString() + "\"";
               }
               return "XML!=" + param1.toXMLString();
            }
         }
         return param1.toString();
      }
      
      public static function describeType(param1:*) : XML
      {
         var _loc3_:* = null;
         if(param1 is String)
         {
            _loc3_ = param1;
         }
         else
         {
            _loc3_ = getQualifiedClassName(param1);
         }
         var _loc2_:XML = TYPE_INFO_CACHE[_loc3_];
         if(_loc2_)
         {
            return _loc2_;
         }
         if(param1 is String)
         {
            param1 = getDefinitionByName(param1);
         }
         var _loc4_:* = flash.utils.describeType(param1);
         TYPE_INFO_CACHE[_loc3_] = _loc4_;
         _loc2_ = _loc4_;
         return _loc2_;
      }
      
      public static function getClassInfo(param1:Object, param2:Array = null, param3:Object = null) : Object
      {
         var _loc10_:int = 0;
         var _loc16_:int = 0;
         var _loc4_:* = null;
         var _loc17_:* = null;
         var _loc20_:* = null;
         var _loc9_:* = null;
         var _loc13_:* = null;
         var _loc11_:* = null;
         var _loc6_:* = null;
         var _loc8_:Boolean = false;
         var _loc21_:Number = NaN;
         var _loc5_:* = null;
         var _loc15_:* = null;
         var _loc12_:* = null;
         var _loc14_:int = 0;
         if(param3 == null)
         {
            param3 = {
               "includeReadOnly":true,
               "uris":null,
               "includeTransient":true
            };
         }
         var _loc23_:Array = [];
         var _loc19_:* = false;
         if(typeof param1 == "xml")
         {
            _loc20_ = "XML";
            _loc13_ = param1.text();
            if(_loc13_.length())
            {
               _loc23_.push("*");
            }
            _loc13_ = param1.attributes();
         }
         else
         {
            _loc6_ = describeType(param1);
            _loc20_ = _loc6_.@name.toString();
            _loc9_ = _loc6_.@alias.toString();
            _loc19_ = _loc6_.@isDynamic.toString() == "true";
            if(param3.includeReadOnly)
            {
               var _loc24_:* = _loc6_..accessor;
               var _loc25_:int = 0;
               var _loc27_:* = new XMLList("");
               _loc13_ = _loc6_..accessor.(@access != "writeonly") + _loc6_..variable;
            }
            else
            {
               var _loc28_:* = _loc6_..accessor;
               var _loc29_:int = 0;
               _loc24_ = new XMLList("");
               _loc13_ = _loc6_..accessor.(@access == "readwrite") + _loc6_..variable;
            }
            _loc8_ = false;
         }
         if(!_loc19_)
         {
            _loc17_ = getCacheKey(param1,param2,param3);
            _loc4_ = CLASS_INFO_CACHE[_loc17_];
            if(_loc4_ != null)
            {
               return _loc4_;
            }
         }
         _loc4_ = {};
         _loc4_["name"] = _loc20_;
         _loc4_["alias"] = _loc9_;
         _loc4_["properties"] = _loc23_;
         _loc4_["dynamic"] = _loc19_;
         var _loc7_:Object = {};
         if(param2)
         {
            _loc10_ = param2.length;
            _loc16_ = 0;
            while(_loc16_ < _loc10_)
            {
               _loc7_[param2[_loc16_]] = 1;
               _loc16_++;
            }
         }
         var _loc22_:* = _loc20_ == "Array";
         if(_loc19_)
         {
            var _loc31_:int = 0;
            var _loc30_:* = param1;
            for(var _loc18_ in param1)
            {
               if(_loc7_[_loc18_] != 1)
               {
                  if(_loc22_)
                  {
                     _loc21_ = parseInt(_loc18_);
                     if(isNaN(_loc21_))
                     {
                        _loc23_.push(new QName("",_loc18_));
                     }
                     else
                     {
                        _loc23_.push(_loc21_);
                     }
                  }
                  else
                  {
                     _loc23_.push(new QName("",_loc18_));
                  }
               }
            }
            _loc8_ = _loc22_ && !isNaN(Number(_loc18_));
         }
         if(!(_loc20_ == "Object" || _loc22_))
         {
            if(_loc20_ == "XML")
            {
               _loc10_ = _loc13_.length();
               _loc16_ = 0;
               while(_loc16_ < _loc10_)
               {
                  _loc18_ = _loc13_[_loc16_].name();
                  if(_loc7_[_loc18_] != 1)
                  {
                     _loc23_.push(new QName("","@" + _loc18_));
                  }
                  _loc16_++;
               }
            }
            else
            {
               _loc10_ = _loc13_.length();
               _loc5_ = param3.uris;
               _loc16_ = 0;
               while(_loc16_ < _loc10_)
               {
                  _loc11_ = _loc13_[_loc16_];
                  _loc18_ = _loc11_.@name.toString();
                  _loc15_ = _loc11_.@uri.toString();
                  if(_loc7_[_loc18_] != 1)
                  {
                     if(_loc5_ != null)
                     {
                        if(_loc5_.length == 1 && _loc5_[0] == "*")
                        {
                           _loc12_ = new QName(_loc15_,_loc18_);
                           try
                           {
                              param1[_loc12_];
                              _loc23_.push();
                           }
                           catch(e:Error)
                           {
                           }
                        }
                        else
                        {
                           _loc14_ = 0;
                           while(_loc14_ < _loc5_.length)
                           {
                              _loc15_ = _loc5_[_loc14_];
                              if(_loc11_.@uri.toString() == _loc15_)
                              {
                                 _loc12_ = new QName(_loc15_,_loc18_);
                                 try
                                 {
                                    param1[_loc12_];
                                    _loc23_.push(_loc12_);
                                 }
                                 catch(e:Error)
                                 {
                                 }
                              }
                              _loc14_++;
                           }
                        }
                     }
                     else if(_loc15_.length == 0)
                     {
                        _loc12_ = new QName(_loc15_,_loc18_);
                        try
                        {
                           param1[_loc12_];
                           _loc23_.push(_loc12_);
                        }
                        catch(e:Error)
                        {
                        }
                     }
                  }
                  _loc16_++;
               }
            }
         }
         _loc23_.sort(1 | (!!_loc8_?16:0));
         _loc16_ = 0;
         while(_loc16_ < _loc23_.length - 1)
         {
            if(_loc23_[_loc16_].toString() == _loc23_[_loc16_ + 1].toString())
            {
               _loc23_.splice(_loc16_,1);
               _loc16_--;
            }
            _loc16_++;
         }
         if(!_loc19_)
         {
            _loc17_ = getCacheKey(param1,param2,param3);
            CLASS_INFO_CACHE[_loc17_] = _loc4_;
         }
         return _loc4_;
      }
      
      private static function getCacheKey(param1:Object, param2:Array = null, param3:Object = null) : String
      {
         var _loc8_:* = 0;
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc7_:String = getQualifiedClassName(param1);
         if(param2 != null)
         {
            _loc8_ = uint(0);
            while(_loc8_ < param2.length)
            {
               _loc6_ = param2[_loc8_] as String;
               if(_loc6_ != null)
               {
                  _loc7_ = _loc7_ + _loc6_;
               }
               _loc8_++;
            }
         }
         if(param3 != null)
         {
            var _loc10_:int = 0;
            var _loc9_:* = param3;
            for(var _loc4_ in param3)
            {
               _loc7_ = _loc7_ + _loc4_;
               _loc5_ = param3[_loc4_] as String;
               if(_loc5_ != null)
               {
                  _loc7_ = _loc7_ + _loc5_;
               }
            }
         }
         return _loc7_;
      }
      
      private static function newline(param1:String, param2:int = 0) : String
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         _loc3_ = _loc3_ + "\n";
         _loc4_ = 0;
         while(_loc4_ < param2)
         {
            _loc3_ = _loc3_ + " ";
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function merge(... rest) : Object
      {
         var _loc4_:int = 0;
         var _loc2_:Object = rest[0] || {};
         _loc4_ = 1;
         while(_loc4_ < rest.length)
         {
            var _loc6_:int = 0;
            var _loc5_:* = rest[_loc4_];
            for(var _loc3_ in rest[_loc4_])
            {
               _loc2_[_loc3_] = rest[_loc3_];
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      public static function setParams(param1:Object, param2:Object) : void
      {
         if(param2)
         {
            var _loc5_:int = 0;
            var _loc4_:* = param2;
            for(var _loc3_ in param2)
            {
               if(param1.hasOwnProperty(_loc3_))
               {
                  param1[_loc3_] = param2[_loc3_];
               }
            }
         }
      }
      
      public static function isNone(param1:*) : Boolean
      {
         if(param1 == null)
         {
            return true;
         }
         if(param1 == undefined)
         {
            return true;
         }
         if(param1 is int)
         {
            if(param1 == 0)
            {
               return true;
            }
         }
         else if(param1 is Number)
         {
            if(isNaN(param1 as Number))
            {
               return true;
            }
         }
         else if(param1 is String)
         {
            if(param1 == "" || param1 == "0" || param1 == "null" || param1 == "undefined")
            {
               return true;
            }
         }
         else if(param1 is Array)
         {
            if((param1 as Array).length == 0)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function copyXMLParams(param1:Object, param2:Object, param3:Array) : void
      {
         copyParams(param1,param2,param3,"@");
      }
      
      public static function copyParams(param1:Object, param2:Object, param3:Array, param4:String = "", param5:Boolean = false, param6:Boolean = false) : void
      {
         var _loc7_:int = 0;
         _loc7_ = 0;
         while(_loc7_ < param3.length)
         {
            if(!(param5 && !param1.hasOwnProperty(param4 + param3[_loc7_])))
            {
               if(!(param6 && !param2.hasOwnProperty(param3[_loc7_])))
               {
                  param2[param3[_loc7_]] = param1[param4 + param3[_loc7_]];
               }
            }
            _loc7_++;
         }
      }
      
      public static function classOf(param1:Object) : Class
      {
         var _loc2_:String = classFullName(param1);
         return getDefinitionByName(_loc2_) as Class;
      }
      
      public static function className(param1:Object) : String
      {
         var _loc2_:String = getQualifiedClassName(param1);
         return _loc2_.split("::")[1];
      }
      
      public static function classFullName(param1:Object) : String
      {
         var _loc2_:String = getQualifiedClassName(param1);
         return _loc2_.replace("::",".");
      }
      
      public static function toKeyValueString(param1:Object) : String
      {
         var _loc2_:String = "";
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for(var _loc3_ in param1)
         {
            _loc2_ = _loc2_ + (_loc3_ + ":" + param1[_loc3_] + ",");
         }
         return _loc2_;
      }
      
      public static function copyByByteArray(param1:Object) : *
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeObject(param1);
         _loc2_.position = 0;
         return _loc2_.readObject();
      }
      
      public static function copyByDescribeType(param1:Object, param2:Object) : void
      {
         var _loc6_:int = 0;
         var _loc3_:int = 0;
         var _loc5_:* = null;
         var _loc4_:Array = varListOfOb(param1);
         _loc3_ = _loc4_.length;
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc5_ = _loc4_[_loc6_];
            param2[_loc5_] = param1[_loc5_];
            _loc6_++;
         }
      }
      
      public static function varListOfClass(param1:Class, param2:Boolean = false, param3:Boolean = false) : Array
      {
         var _loc6_:XML = describeType(param1);
         var _loc4_:XMLList = _loc6_.factory.variable;
         var _loc5_:XMLList = _loc6_.factory.accessor;
         return varListOf(_loc4_,_loc5_,param2,param3);
      }
      
      public static function constListOfClass(param1:Class) : Array
      {
         var _loc2_:XML = describeType(param1);
         var _loc3_:XMLList = _loc2_.constant;
         return varListOf(_loc3_,null,false,false);
      }
      
      public static function varListOfOb(param1:Object, param2:Boolean = false, param3:Boolean = false) : Array
      {
         var _loc6_:XML = describeType(param1);
         var _loc4_:XMLList = _loc6_.variable;
         var _loc5_:XMLList = _loc6_.accessor;
         return varListOf(_loc4_,_loc5_,param2,param3);
      }
      
      private static function varListOf(param1:XMLList, param2:XMLList, param3:Boolean, param4:Boolean) : Array
      {
         var _loc8_:int = 0;
         var _loc7_:int = 0;
         var _loc6_:* = null;
         var _loc5_:Array = [];
         _loc7_ = param1.length();
         _loc8_ = 0;
         while(_loc8_ < _loc7_)
         {
            _loc6_ = param1[_loc8_];
            _loc5_.push(String(_loc6_.@name));
            _loc8_++;
         }
         if(param2)
         {
            _loc7_ = param2.length();
            _loc8_ = 0;
            while(_loc8_ < _loc7_)
            {
               _loc6_ = param2[_loc8_];
               if(_loc6_.@access == "readwrite")
               {
                  _loc5_.push(String(_loc6_.@name));
               }
               else if(param3 == true && _loc6_.@access == "readonly")
               {
                  _loc5_.push(String(_loc6_.@name));
               }
               else if(param4 == true && _loc6_.@access == "writeonly")
               {
                  _loc5_.push(String(_loc6_.@name));
               }
               _loc8_++;
            }
         }
         return _loc5_;
      }
      
      public static function getValueArr(param1:*, param2:Array) : Array
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc3_:Array = [];
         var _loc5_:int = param2.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = param2[_loc6_];
            _loc3_.push(param1[_loc4_]);
            _loc6_++;
         }
         return _loc3_;
      }
      
      public static function hasKey(param1:Object) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for(var _loc2_ in param1)
         {
            return true;
         }
         return false;
      }
      
      public static function __debugByDescribe(param1:Object) : String
      {
         var _loc6_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc2_:String = "";
         var _loc5_:Array = varListOfOb(param1);
         _loc4_ = _loc5_.length;
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc3_ = _loc5_[_loc6_];
            _loc2_ = _loc2_ + (_loc3_ + ":" + param1[_loc3_] + ",");
            _loc6_++;
         }
         return _loc2_;
      }
      
      public static function __debugToString(param1:Object) : String
      {
         var _loc2_:String = "";
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for(var _loc3_ in param1)
         {
            _loc2_ = _loc2_ + (_loc3_ + ":" + param1[_loc3_] + ",");
         }
         return _loc2_;
      }
      
      public static function __debugVars(param1:Object, param2:Array) : String
      {
         var _loc6_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc4_:String = "";
         if(param2 && param2.length > 0)
         {
            _loc4_ = _loc4_ + "Vars: ";
            _loc5_ = param2.length;
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc3_ = param2[_loc6_];
               _loc4_ = _loc4_ + " ";
               if(param1.hasOwnProperty(_loc3_))
               {
                  _loc4_ = _loc4_ + _loc3_;
                  _loc4_ = _loc4_ + ":";
                  _loc4_ = _loc4_ + param1[_loc3_];
               }
               else
               {
                  _loc4_ = _loc4_ + ("no " + _loc3_);
               }
               _loc6_++;
            }
         }
         return _loc4_;
      }
   }
}
