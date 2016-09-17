package nslm2.modules.foundations.miniNotice
{
   import proto.FunctionActionInfo;
   
   public class MiniNoticeTimerVo
   {
      
      public static const SHOW_NOTICE_TIME:String = "showNoticeTime";
       
      
      public var showNoticeTime:int;
      
      public var funcActionInfo:FunctionActionInfo;
      
      public function MiniNoticeTimerVo(param1:int, param2:FunctionActionInfo)
      {
         super();
         showNoticeTime = param1;
         funcActionInfo = param2;
      }
   }
}
