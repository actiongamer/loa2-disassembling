package nslm2.modules.foundations.miniNotice
{
   import proto.FunctionActionNotify;
   
   public class MiniNoticeFakeNotifyVo
   {
      
      public static const SEND_FAKE_NOTIFY_TIME:String = "sendFakeNotifyTime";
       
      
      public var sendFakeNotifyTime:int;
      
      public var notify:FunctionActionNotify;
      
      public function MiniNoticeFakeNotifyVo(param1:int, param2:FunctionActionNotify)
      {
         super();
         sendFakeNotifyTime = param1;
         notify = param2;
      }
   }
}
