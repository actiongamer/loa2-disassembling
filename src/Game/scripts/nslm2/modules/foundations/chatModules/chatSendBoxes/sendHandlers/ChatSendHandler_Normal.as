package nslm2.modules.foundations.chatModules.chatSendBoxes.sendHandlers
{
   import nslm2.modules.foundations.chatModules.chatSendBoxes.ChatSendBox;
   import nslm2.modules.foundations.chatModules.historyPanels.ChatHistory;
   import nslm2.modules.foundations.chatModules.ChatUtils;
   import nslm2.modules.foundations.chatModules.ChatModel;
   import nslm2.modules.foundations.chatModules.ChatConsts;
   import proto.TalkContent;
   import proto.PublicTalkReq;
   import nslm2.nets.sockets.ServerEngine;
   
   public class ChatSendHandler_Normal extends ChatSendHandlerBase
   {
       
      
      public var channelId:int;
      
      private var sendBox:ChatSendBox;
      
      private var hisotryViewRef:ChatHistory;
      
      public function ChatSendHandler_Normal()
      {
         super();
      }
      
      public function config(param1:ChatSendBox, param2:ChatHistory) : ChatSendHandler_Normal
      {
         this.sendBox = param1;
         this.hisotryViewRef = param2;
         return this;
      }
      
      override public function exec(param1:String) : ChatSendHandlerBase
      {
         this.check(param1);
         return this;
      }
      
      private function check(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc4_:String = ChatUtils.checkSendTxt(param1,channelId);
         if(_loc4_)
         {
            this.hisotryViewRef.appendChat(ChatUtils.createWarnRes(_loc4_));
         }
         else
         {
            ChatModel.ins.saveLastSendTime(channelId);
            if(channelId != 6)
            {
               _loc3_ = ChatConsts.channelIdTogpID(channelId);
               _loc2_ = new TalkContent();
               _loc2_.content = param1;
               _loc5_ = new PublicTalkReq();
               _loc5_.pindao = channelId;
               _loc5_.content = _loc2_;
               ServerEngine.ins.send(6001,_loc5_);
            }
            this.sendBox.clear();
         }
      }
   }
}
