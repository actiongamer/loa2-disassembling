package nslm2.modules.footstones.assistantModules.vos
{
   public class AssistantTimerVo
   {
      
      public static const SHOW_NOTICE_TIME:String = "showNoticeTime";
       
      
      public var showNoticeTime:int;
      
      public var funcId:int;
      
      public function AssistantTimerVo(param1:int, param2:int)
      {
         super();
         showNoticeTime = param1;
         funcId = param2;
      }
   }
}
