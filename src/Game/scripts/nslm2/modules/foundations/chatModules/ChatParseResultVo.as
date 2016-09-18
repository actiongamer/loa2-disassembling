package nslm2.modules.foundations.chatModules
{
   public class ChatParseResultVo
   {
       
      
      public var msg:String;
      
      public var faceArr:Array;
      
      public function ChatParseResultVo(param1:String, param2:Array)
      {
         super();
         this.msg = param1;
         this.faceArr = param2;
      }
   }
}
