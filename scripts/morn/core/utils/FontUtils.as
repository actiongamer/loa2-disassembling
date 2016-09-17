package morn.core.utils
{
   import flash.text.Font;
   import com.mz.core.logging.Log;
   import com.mz.core.utils2.reflects.ReflectUtil;
   
   public class FontUtils
   {
      
      public static const SimSun:String = "SimSun";
      
      public static const HELVETICA:String = "Helvetica";
      
      public static const SimHei:String = "SimHei";
      
      public static const YaHei:String = "Microsoft YaHei,微软雅黑";
      
      public static const Arial:String = "Em_YaHeiB";
      
      public static const RU_Arial:String = "Arial";
      
      public static const Em_YaHeiB:String = "Em_YaHeiB";
      
      private static var _ins:morn.core.utils.FontUtils;
       
      
      private var embedFontLib:Object;
      
      private var unembedFontLib:Object;
      
      public function FontUtils()
      {
         embedFontLib = [];
         unembedFontLib = [];
         super();
         unembedFontLib["SimSun"] = 1;
         unembedFontLib["Microsoft YaHei,微软雅黑"] = 1;
         unembedFontLib["SimHei"] = 1;
         unembedFontLib["Em_YaHeiB"] = 1;
      }
      
      public static function get ins() : morn.core.utils.FontUtils
      {
         if(_ins == null)
         {
            _ins = new morn.core.utils.FontUtils();
         }
         return _ins;
      }
      
      public static function showFonts() : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc1_:Array = Font.enumerateFonts();
         var _loc3_:int = _loc1_.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = _loc1_[_loc4_];
            Log.debug(morn.core.utils.FontUtils,_loc2_.fontName,_loc2_.fontStyle,_loc2_.fontType);
            _loc4_++;
         }
      }
      
      public function regFont(param1:String, param2:String) : void
      {
         var _loc3_:Class = ReflectUtil.getClass(param1);
         Font.registerFont(_loc3_);
         embedFontLib[param1] = param2;
      }
      
      public function getFullName(param1:String) : String
      {
         return embedFontLib[param1];
      }
      
      public function isEmbed(param1:String) : Boolean
      {
         return embedFontLib.hasOwnProperty(param1);
      }
      
      public function isCanUse(param1:String) : Boolean
      {
         return unembedFontLib.hasOwnProperty(param1);
      }
   }
}
