package com.mz.core.utils
{
   import flash.text.TextFormat;
   import morn.core.components.Label;
   
   public class TextFieldUtil
   {
      
      public static const TEXT_WIDTH_OFFSET:int = 4;
      
      public static const TEXT_HEIGHT_OFFSET:int = 0;
      
      public static const TEXT_HEIGHT_OFFSET2:int = -3;
       
      
      public function TextFieldUtil()
      {
         super();
      }
      
      public static function htmlText2(param1:*, param2:* = null, param3:* = null, param4:* = null) : String
      {
         return htmlText(param1,new TextFormat(null,param3,param2,param4));
      }
      
      public static function linkHtmlText2(param1:*, param2:String = null, param3:* = null, param4:* = null, param5:* = null) : String
      {
         return linkHtmlText(param1,new TextFormat(null,param4,param3,param5),param2);
      }
      
      public static function htmlText(param1:*, param2:TextFormat) : String
      {
         var _loc3_:Array = [];
         if(param2.font != null)
         {
            _loc3_.push("FACE=\"" + param2.font + "\"");
         }
         if(param2.color != null)
         {
            _loc3_.push("COLOR=\"#" + (param2.color as uint).toString(16) + "\"");
         }
         if(param2.size != null)
         {
            _loc3_.push("SIZE=\"" + param2.size + "\"");
         }
         if(param2.bold != null)
         {
            param1 = "<B>" + param1 + "</B>";
         }
         if(_loc3_.length)
         {
            return "<FONT " + _loc3_.join(" ") + ">" + param1 + "</FONT>";
         }
         return "<FONT>" + param1 + "</FONT>";
      }
      
      public static function linkHtmlText(param1:String, param2:TextFormat, param3:String) : String
      {
         if(param3)
         {
            return htmlText("<u><a href=\"event:" + param3 + "\">" + param1 + "</a></u>",param2);
         }
         return htmlText("<u><a>" + param1 + "</a></u>",param2);
      }
      
      public static function htmlSpecialChars(param1:String) : String
      {
         param1 = param1.replace(/\</g,"&lt;");
         param1 = param1.replace(/\>/g,"&gt;");
         return param1;
      }
      
      public static function removeUnderline(param1:String) : String
      {
         return param1.replace(/<u>/gi,"").replace(/<\/u>/gi,"");
      }
      
      public static function showLabelBottomModel(param1:Label) : void
      {
         param1.textField.mouseEnabled = false;
         param1.buttonMode = true;
      }
   }
}
