package org.specter3d.utils
{
   public class StringUtil
   {
       
      
      public function StringUtil()
      {
         super();
      }
      
      public static function checkStrIsNumber(param1:String) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:Number = NaN;
         if(param1 == null)
         {
            return false;
         }
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ = param1.charCodeAt(_loc3_);
            if(_loc2_ < 48 || _loc2_ > 57)
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
      
      public static function substitute(param1:String, ... rest) : String
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(param1 == null)
         {
            return "";
         }
         if(rest.length == 1 && rest[0] is Array)
         {
            _loc3_ = rest[0];
         }
         else
         {
            _loc3_ = rest;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            param1 = param1.replace(new RegExp("\\{" + _loc4_ + "\\}","g"),_loc3_[_loc4_]);
            _loc4_++;
         }
         return param1;
      }
      
      public static function leadingZero(param1:int, param2:int = 2) : String
      {
         var _loc3_:String = param1.toString();
         while(_loc3_.length < param2)
         {
            _loc3_ = "0" + _loc3_;
         }
         return _loc3_;
      }
      
      public static function toHtmlFont(param1:String, param2:String = "", param3:uint = 0) : String
      {
         var _loc4_:String = "<font";
         if(param2 != "")
         {
            if(param2.charAt() != "#")
            {
               param2 = "#" + param2;
            }
            _loc4_ = _loc4_ + (" color=\'" + param2 + "\'");
         }
         if(param3 != 0)
         {
            _loc4_ = _loc4_ + (" size=\'" + param3 + "\'");
         }
         _loc4_ = _loc4_ + (">" + param1 + "</font>");
         return _loc4_;
      }
      
      public static function trim(param1:String) : String
      {
         var _loc3_:int = 0;
         if(param1 == null)
         {
            return "";
         }
         while(isWhitespace(param1.charAt(_loc3_)))
         {
            _loc3_++;
         }
         var _loc2_:int = param1.length - 1;
         while(isWhitespace(param1.charAt(_loc2_)))
         {
            _loc2_--;
         }
         if(_loc2_ >= _loc3_)
         {
            return param1.slice(_loc3_,_loc2_ + 1);
         }
         return "";
      }
      
      public static function isWhitespace(param1:String) : Boolean
      {
         var _loc2_:* = param1;
         if(" " !== _loc2_)
         {
            if("\t" !== _loc2_)
            {
               if("\r" !== _loc2_)
               {
                  if("\n" !== _loc2_)
                  {
                     if("\f" !== _loc2_)
                     {
                        return false;
                     }
                  }
                  addr9:
                  return true;
               }
               addr8:
               §§goto(addr9);
            }
            addr7:
            §§goto(addr8);
         }
         §§goto(addr7);
      }
      
      public static function replaceAll(param1:String, param2:String, param3:String) : String
      {
         var _loc4_:* = param1;
         do
         {
            param1 = _loc4_;
            _loc4_ = param1.replace(param2,param3);
         }
         while(_loc4_ != param1);
         
         return _loc4_;
      }
      
      public static function replaceAll1(param1:String, param2:String, param3:String) : String
      {
         while(param1.indexOf(param2) != -1)
         {
            param1 = param1.replace(param2,param3);
         }
         return param1;
      }
   }
}
