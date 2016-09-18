package nslm2.utils
{
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class LabelUtils
   {
      
      public static const RESTRICT_1:String = "Α-￥A-Za-z0-9";
      
      public static const RESTRICT_2:String = "A-Za-z0-9";
      
      public static const RESTRICT_3:String = "0-9";
       
      
      public function LabelUtils()
      {
         super();
      }
      
      public static function getCountColor(param1:int, param2:int) : uint
      {
         return param1 >= param2?14210735:16723968;
      }
      
      public static function countStr(param1:int, param2:int) : String
      {
         return TextFieldUtil.htmlText2(param1,LabelUtils.getCountColor(param1,param2));
      }
      
      public static function getCountNeedColor(param1:int, param2:int) : uint
      {
         return param1 >= param2?458496:16723968;
      }
      
      public static function getExchangeAvailColor(param1:int, param2:int) : uint
      {
         return param1 >= param2?16723968:458496;
      }
      
      public static function countNeedStr(param1:int, param2:int) : String
      {
         return TextFieldUtil.htmlText2(param1 + "/" + param2,LabelUtils.getCountNeedColor(param1,param2));
      }
      
      public static function getLeaveMaxColor(param1:int, param2:int) : uint
      {
         return param1 > 0?458496:14210735;
      }
      
      public static function leaveMaxStr(param1:int, param2:int) : String
      {
         return TextFieldUtil.htmlText2(param1 + "/" + param2,param1 > 0?458496:14210735);
      }
      
      public static function leaveMaxStrGR(param1:int, param2:int) : String
      {
         return TextFieldUtil.htmlText2(param1 + "/" + param2,param1 > 0?458496:16723968);
      }
      
      public static function leaveMaxStrGRWithLangId(param1:int, param2:int, param3:int) : String
      {
         return TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(param3,[param1,param2]),param1 > 0?458496:16723968);
      }
      
      public static function cdColor(param1:Boolean) : uint
      {
         return !!param1?458496:16723968;
      }
   }
}
