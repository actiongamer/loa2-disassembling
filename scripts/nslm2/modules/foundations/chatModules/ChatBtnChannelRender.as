package nslm2.modules.foundations.chatModules
{
   import game.ui.chatModules.ChatBtnChannelRenderUI;
   
   public class ChatBtnChannelRender extends ChatBtnChannelRenderUI
   {
       
      
      public function ChatBtnChannelRender()
      {
         super();
      }
      
      public function get channelId() : int
      {
         return this.dataSource as int;
      }
      
      public function get channelVo() : ChatChannelVo
      {
         return ChatConsts.ins.getChannelVo(this.channelId);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(channelVo)
         {
            this.btn.label = channelVo.name;
         }
      }
   }
}
