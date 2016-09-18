package nslm2.modules.foundations.chatModules.historyPanels.historyS2
{
   import game.ui.chatModules.ChatHistoryHeaderIconUI;
   
   public class ChatHistoryHeaderIcon extends ChatHistoryHeaderIconUI
   {
       
      
      public function ChatHistoryHeaderIcon()
      {
         super();
         this.img_playerIcon.mask = this.playerIconMask;
      }
   }
}
