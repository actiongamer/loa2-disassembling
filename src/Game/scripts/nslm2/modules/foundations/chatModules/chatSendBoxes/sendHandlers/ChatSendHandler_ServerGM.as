package nslm2.modules.foundations.chatModules.chatSendBoxes.sendHandlers
{
   import proto.TalkContent;
   import proto.PublicTalkReq;
   import nslm2.nets.sockets.ServerEngine;
   
   public class ChatSendHandler_ServerGM extends ChatSendHandlerBase
   {
       
      
      public function ChatSendHandler_ServerGM()
      {
         super();
      }
      
      override public function exec(param1:String) : ChatSendHandlerBase
      {
         if(this.check(param1))
         {
            return this;
         }
         return super.exec(param1);
      }
      
      private function check(param1:String) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1.slice(0,2) == "//")
         {
            _loc2_ = new TalkContent();
            _loc2_.content = param1;
            _loc3_ = new PublicTalkReq();
            _loc3_.pindao = 0;
            _loc3_.content = _loc2_;
            ServerEngine.ins.send(6001,_loc3_);
            return true;
         }
         return false;
      }
   }
}
