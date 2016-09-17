package morn.core.components
{
   import flash.system.Capabilities;
   import com.mz.core.configs.ClientConfig;
   import morn.customs.FilterLib;
   
   public class Styles
   {
      
      public static var defaultSizeGrid:Array = [4,4,4,4,0];
      
      private static var _isMacOS:int;
      
      private static var _fontName:String;
      
      private static var _fontSize:int = 0;
      
      public static var embedFonts:Boolean = false;
      
      public static var labelColor:uint = 13418916;
      
      public static var labelMargin:Array = [0,0,0,0];
      
      public static var buttonStateNum:int = 3;
      
      public static var buttonLabelColors:Array = [16769187,16769187,13418916,12632256];
      
      public static var buttonLabelMargin:Array = [0,0,0,0];
      
      public static var buttonStateFilters:Array = [null,[FilterLib.BUTTON_OVER_STATE],[FilterLib.BUTTON_DOWN_STATE]];
      
      public static var tabButtonStateFilters:Array = [[FilterLib.BUTTON_DOWN_STATE],[FilterLib.BUTTON_OVER_STATE],null];
      
      public static var linkLabelColors:Array = [32960,16744448,8388608,12632256];
      
      public static var comboBoxItemColors:Array = [6198710,16777215,0,9413809,16777215];
      
      public static var comboBoxItemHeight:int = 22;
      
      public static var scrollBarMinNum:int = 15;
      
      public static var scrollBarDelayTime:int = 500;
      
      public static var tipTextColor:uint = 0;
      
      public static var tipBorderColor:uint = 12632256;
      
      public static var tipBgColor:uint = 16777215;
      
      public static var smoothing:Boolean = false;
       
      
      public function Styles()
      {
         super();
      }
      
      public static function isMacOS() : Boolean
      {
         if(_isMacOS == 0)
         {
            _isMacOS = Capabilities.os.indexOf("Mac") > -1?1:2;
         }
         return _isMacOS == 1;
      }
      
      public static function get fontName() : String
      {
         if(_fontName == null)
         {
            if(ClientConfig.isMacOs)
            {
               _fontName = "Helvetica";
            }
            else
            {
               _fontName = "Microsoft YaHei,微软雅黑";
            }
         }
         return _fontName;
      }
      
      public static function get fontSize() : int
      {
         if(_fontSize == 0)
         {
            if(ClientConfig.isMacOs)
            {
               _fontSize = 14;
            }
            else
            {
               _fontSize = 12;
            }
         }
         return _fontSize;
      }
   }
}
