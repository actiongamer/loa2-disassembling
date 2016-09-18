package morn.core.utils
{
   import com.mz.core.utils.ArrayUtil;
   
   public class PathUtil
   {
      
      public static const PNG:String = "png";
      
      public static const JPG:String = "jpg";
       
      
      public function PathUtil()
      {
         super();
      }
      
      public static function parseSuffix(param1:String, param2:Boolean = true) : String
      {
         var _loc3_:Array = param1.split(".");
         var _loc4_:String = _loc3_[_loc3_.length - 1];
         if(param2)
         {
            _loc4_ = _loc4_.toLowerCase();
         }
         return _loc4_;
      }
      
      public static function parseName(param1:String) : String
      {
         param1 = param1.split("?")[0];
         var _loc2_:Array = param1.split("/");
         param1 = _loc2_[_loc2_.length - 1];
         var _loc3_:Array = param1.split("\\");
         param1 = _loc3_[_loc3_.length - 1];
         return param1;
      }
      
      public static function parseNameWithoutSuffix(param1:String) : String
      {
         var _loc3_:String = parseName(param1);
         var _loc2_:Array = _loc3_.split(".");
         if(_loc2_.length == 1)
         {
            return _loc2_[0];
         }
         _loc2_.pop();
         return _loc2_.join(".");
      }
      
      public static function parseFolderPath(param1:String) : String
      {
         param1 = formatSeparator(param1);
         var _loc2_:Array = param1.split("/");
         if(_loc2_.length == 1)
         {
            return _loc2_[0];
         }
         _loc2_.pop();
         return _loc2_.join("/");
      }
      
      public static function formatSeparator(param1:String) : String
      {
         return StringUtils.replaceAll(param1,"\\","/");
      }
      
      public static function isPng(param1:String) : Boolean
      {
         return parseSuffix(param1) == "png";
      }
      
      public static function absoluteToRelate(param1:String, param2:String) : String
      {
         var _loc8_:int = 0;
         param1 = param1.replace(/\\/g,"/");
         param2 = param2.replace(/\\/g,"/");
         param1 = formatSeparator(param1);
         param2 = formatSeparator(param2);
         param2 = param2.split(":///").pop();
         param2 = param2.replace(////g,"/");
         param1 = param1.split(":///").pop();
         param1 = param1.replace(////g,"/");
         var _loc6_:Array = param1.split("/");
         var _loc4_:Array = param2.split("/");
         var _loc3_:Array = _loc4_.concat();
         var _loc5_:int = _loc4_.length;
         _loc8_ = 0;
         while(_loc8_ < _loc5_)
         {
            if(_loc4_[_loc8_] == _loc6_[_loc8_])
            {
               _loc3_.shift();
               _loc8_++;
               continue;
            }
            break;
         }
         var _loc7_:Array = ArrayUtil.fillBySameItem([],_loc6_.length - _loc8_,"..");
         return _loc7_.join("/") + "/" + _loc3_.join("/");
      }
      
      public static function relateToAbsolute(param1:String, param2:String) : String
      {
         var _loc7_:int = 0;
         param1 = formatSeparator(param1);
         param2 = formatSeparator(param2);
         param2 = param2.split(":///").pop();
         param2 = param2.replace(////g,"/");
         var _loc6_:Array = param1.split("/");
         var _loc4_:Array = param2.split("/");
         var _loc3_:Array = _loc6_.concat();
         var _loc5_:int = _loc4_.length;
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            if(_loc4_[_loc7_] == "..")
            {
               _loc3_.pop();
               _loc7_++;
               continue;
            }
            break;
         }
         while(_loc7_ < _loc5_)
         {
            _loc3_.push(_loc4_[_loc7_]);
            _loc7_++;
         }
         return _loc3_.join("/");
      }
      
      public static function spliceMulti(... rest) : String
      {
         var _loc3_:int = 0;
         if(rest.length == 0)
         {
            return "";
         }
         var _loc2_:String = rest[0];
         _loc3_ = 1;
         while(_loc3_ < rest.length)
         {
            _loc2_ = spliceBetween(_loc2_,String(rest[_loc3_]));
            _loc3_++;
         }
         return _loc2_;
      }
      
      public static function removeLastLetterArr(param1:String, param2:Array) : String
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:* = null;
         _loc4_ = param2.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param2[_loc5_];
            param1 = removeLastLetter(param1,_loc3_);
            _loc5_++;
         }
         return param1;
      }
      
      public static function removeLastLetter(param1:String, param2:String = "/") : String
      {
         if(param1.lastIndexOf(param2) == param1.length - 1)
         {
            return param1.substr(0,param1.length - 2);
         }
         return param1;
      }
      
      public static function spliceBetween(param1:String, param2:String) : String
      {
         param1 = StringUtils.trim(param1);
         param2 = StringUtils.trim(param2);
         if(param1 != "" && param1.lastIndexOf("/") != param1.length - 1)
         {
            param1 = param1 + "/";
         }
         if(param2.indexOf("/") == 0)
         {
            param2 = param2.replace("/","");
         }
         if(param2.lastIndexOf("/") == param2.length - 1)
         {
            param2 = param2.slice(0,-1);
         }
         return param1 + param2;
      }
      
      public static function objectToString(param1:Object, param2:String = ";", param3:Boolean = true) : String
      {
         var _loc4_:String = internalObjectToString(param1,param2,null,param3);
         return _loc4_;
      }
      
      private static function internalObjectToString(param1:Object, param2:String, param3:String, param4:Boolean) : String
      {
         var _loc8_:* = null;
         var _loc6_:* = null;
         var _loc5_:String = "";
         var _loc9_:Boolean = true;
         var _loc11_:int = 0;
         var _loc10_:* = param1;
         for(var _loc7_ in param1)
         {
            if(_loc9_)
            {
               _loc9_ = false;
            }
            else
            {
               _loc5_ = _loc5_ + param2;
            }
            _loc8_ = param1[_loc7_];
            _loc6_ = !!param3?param3 + "." + _loc7_:_loc7_;
            if(param4)
            {
               _loc6_ = encodeURIComponent(_loc6_);
            }
            if(_loc8_ is String)
            {
               _loc5_ = _loc5_ + (_loc6_ + "=" + (!!param4?encodeURIComponent(_loc8_ as String):_loc8_));
            }
            else if(_loc8_ is Number)
            {
               _loc8_ = _loc8_.toString();
               if(param4)
               {
                  _loc8_ = encodeURIComponent(_loc8_ as String);
               }
               _loc5_ = _loc5_ + (_loc6_ + "=" + _loc8_);
            }
            else if(_loc8_ is Boolean)
            {
               _loc5_ = _loc5_ + (_loc6_ + "=" + (!!_loc8_?"true":"false"));
            }
            else if(_loc8_ is Array)
            {
               _loc5_ = _loc5_ + internalArrayToString(_loc8_ as Array,param2,_loc6_,param4);
            }
            else
            {
               _loc5_ = _loc5_ + internalObjectToString(_loc8_,param2,_loc6_,param4);
            }
         }
         return _loc5_;
      }
      
      private static function internalArrayToString(param1:Array, param2:String, param3:String, param4:Boolean) : String
      {
         var _loc10_:int = 0;
         var _loc7_:* = null;
         var _loc6_:* = null;
         var _loc5_:String = "";
         var _loc9_:Boolean = true;
         var _loc8_:int = param1.length;
         _loc10_ = 0;
         while(_loc10_ < _loc8_)
         {
            if(_loc9_)
            {
               _loc9_ = false;
            }
            else
            {
               _loc5_ = _loc5_ + param2;
            }
            _loc7_ = param1[_loc10_];
            _loc6_ = param3 + "." + _loc10_;
            if(param4)
            {
               _loc6_ = encodeURIComponent(_loc6_);
            }
            if(_loc7_ is String)
            {
               _loc5_ = _loc5_ + (_loc6_ + "=" + (!!param4?encodeURIComponent(_loc7_ as String):_loc7_));
            }
            else if(_loc7_ is Number)
            {
               _loc7_ = _loc7_.toString();
               if(param4)
               {
                  _loc7_ = encodeURIComponent(_loc7_ as String);
               }
               _loc5_ = _loc5_ + (_loc6_ + "=" + _loc7_);
            }
            else if(_loc7_ is Boolean)
            {
               _loc5_ = _loc5_ + (_loc6_ + "=" + (!!_loc7_?"true":"false"));
            }
            else if(_loc7_ is Array)
            {
               _loc5_ = _loc5_ + internalArrayToString(_loc7_ as Array,param2,_loc6_,param4);
            }
            else
            {
               _loc5_ = _loc5_ + internalObjectToString(_loc7_,param2,_loc6_,param4);
            }
            _loc10_++;
         }
         return _loc5_;
      }
      
      public static function stringToObject(param1:String, param2:String = ";", param3:Boolean = true) : Object
      {
         var _loc11_:int = 0;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc6_:* = null;
         var _loc15_:* = null;
         var _loc4_:* = null;
         var _loc8_:Object = {};
         var _loc5_:Array = param1.split(param2);
         var _loc7_:int = _loc5_.length;
         _loc11_ = 0;
         while(_loc11_ < _loc7_)
         {
            _loc12_ = _loc5_[_loc11_].split("=");
            _loc13_ = _loc12_[0];
            if(param3)
            {
               _loc13_ = decodeURIComponent(_loc13_);
            }
            _loc14_ = _loc12_[1];
            if(param3)
            {
               _loc14_ = decodeURIComponent(_loc14_ as String);
            }
            if(_loc14_ == "true")
            {
               _loc14_ = true;
            }
            else if(_loc14_ == "false")
            {
               _loc14_ = false;
            }
            else
            {
               _loc16_ = int(_loc14_);
               if(_loc16_.toString() == _loc14_)
               {
                  _loc14_ = _loc16_;
               }
               else
               {
                  _loc16_ = Number(_loc14_);
                  if(_loc16_.toString() == _loc14_)
                  {
                     _loc14_ = _loc16_;
                  }
               }
            }
            _loc17_ = _loc8_;
            _loc12_ = _loc13_.split(".");
            _loc9_ = _loc12_.length;
            _loc10_ = 0;
            while(_loc10_ < _loc9_ - 1)
            {
               _loc6_ = _loc12_[_loc10_];
               if(_loc17_[_loc6_] == null && _loc10_ < _loc9_ - 1)
               {
                  _loc15_ = _loc12_[_loc10_ + 1];
                  _loc4_ = int(_loc15_);
                  if(_loc4_.toString() == _loc15_)
                  {
                     _loc17_[_loc6_] = [];
                  }
                  else
                  {
                     _loc17_[_loc6_] = {};
                  }
               }
               _loc17_ = _loc17_[_loc6_];
               _loc10_++;
            }
            _loc17_[_loc12_[_loc10_]] = _loc14_;
            _loc11_++;
         }
         return _loc8_;
      }
      
      public static function getDomainUrl(param1:String) : String
      {
         return param1.substr(0,param1.indexOf("/",7) + 1);
      }
   }
}
