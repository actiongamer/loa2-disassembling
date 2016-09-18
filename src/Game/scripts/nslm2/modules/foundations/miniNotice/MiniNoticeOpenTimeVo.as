package nslm2.modules.foundations.miniNotice
{
   public class MiniNoticeOpenTimeVo
   {
      
      public static const START_TIME:String = "startTime";
       
      
      public var funcId:int;
      
      public var startTime:int;
      
      public var endTime:int;
      
      public function MiniNoticeOpenTimeVo(param1:int, param2:int, param3:int)
      {
         super();
         funcId = param1;
         startTime = param2;
         endTime = param3;
      }
   }
}
