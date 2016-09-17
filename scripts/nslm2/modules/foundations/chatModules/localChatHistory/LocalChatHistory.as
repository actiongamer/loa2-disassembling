package nslm2.modules.foundations.chatModules.localChatHistory
{
   import game.ui.chatModules.localChatHistory.LocalChatHistoryUI;
   import nslm2.modules.foundations.chatModules.ChatModel;
   import nslm2.modules.foundations.chatModules.ChatConsts;
   import nslm2.modules.foundations.chatModules.ChannelGroupVo;
   
   public class LocalChatHistory extends LocalChatHistoryUI
   {
       
      
      private var groupIdArr:Array;
      
      public var curGroupId:int;
      
      public function LocalChatHistory()
      {
         super();
         initTabChannel(ChatConsts.ins.historyChannelArr);
         tab_channelGroup.userChangeHandler = tab_channel_handler;
         this.panelBG.txt_titleName.text = "聊天";
      }
      
      override public function preShow(param1:Object = null) : void
      {
         (this.panel as ChatHistoryPanelLocal).show(ChatModel.ins.getLocalTalkDataList());
         preShowCpl();
      }
      
      public function initTabChannel(param1:Array) : void
      {
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:* = null;
         groupIdArr = param1;
         var _loc6_:Array = [];
         var _loc4_:int = groupIdArr.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = groupIdArr[_loc5_];
            _loc2_ = ChatConsts.ins.getChannelGroupVo(_loc3_);
            _loc6_.push(_loc2_.name);
            _loc5_++;
         }
         this.tab_channelGroup.labels = _loc6_.join(",");
         this.tab_channelGroup.selectedIndex = 0;
      }
      
      private function tab_channel_handler(param1:int) : void
      {
         this.curGroupId = this.groupIdArr[param1];
         (this.panel as ChatHistoryPanelLocal).setGroupId(this.curGroupId);
      }
      
      override public function dispose() : void
      {
         (this.panel as ChatHistoryPanelLocal).dispose();
         super.dispose();
      }
   }
}
