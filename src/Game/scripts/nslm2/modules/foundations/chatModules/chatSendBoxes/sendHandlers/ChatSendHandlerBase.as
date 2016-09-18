package nslm2.modules.foundations.chatModules.chatSendBoxes.sendHandlers
{
   public class ChatSendHandlerBase
   {
       
      
      public var next:nslm2.modules.foundations.chatModules.chatSendBoxes.sendHandlers.ChatSendHandlerBase;
      
      public function ChatSendHandlerBase()
      {
         super();
      }
      
      public function setNext(param1:nslm2.modules.foundations.chatModules.chatSendBoxes.sendHandlers.ChatSendHandlerBase = null) : nslm2.modules.foundations.chatModules.chatSendBoxes.sendHandlers.ChatSendHandlerBase
      {
         this.next = param1;
         return this;
      }
      
      public function exec(param1:String) : nslm2.modules.foundations.chatModules.chatSendBoxes.sendHandlers.ChatSendHandlerBase
      {
         if(this.next)
         {
            return this.next.exec(param1);
         }
         return null;
      }
   }
}
