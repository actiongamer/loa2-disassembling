package nslm2.modules.foundations.chatModules.historyPanels.historyS2
{
   import game.ui.chatModules.ChatHistoryRenderSimpleUI;
   import proto.PublicTalkNotify;
   
   public class ChatHistoryRenderSimple extends ChatHistoryRenderSimpleUI implements IChatHistoryRender
   {
      
      public static const BORDER_GAP:int = 6;
       
      
      public var txtRich:nslm2.modules.foundations.chatModules.historyPanels.historyS2.ChatHistoryRenderTxt;
      
      private var _showChannelName:Boolean = true;
      
      private var _vo:PublicTalkNotify;
      
      public function ChatHistoryRenderSimple()
      {
         super();
         txtRich = new nslm2.modules.foundations.chatModules.historyPanels.historyS2.ChatHistoryRenderTxt(this.placeContent.width);
         placeContent.replaceWithDisplay(this.txtRich);
      }
      
      public function get showChannelName() : Boolean
      {
         return _showChannelName;
      }
      
      public function set showChannelName(param1:Boolean) : void
      {
         if(_showChannelName != param1)
         {
            _showChannelName = param1;
         }
      }
      
      public function get vo() : PublicTalkNotify
      {
         return _vo;
      }
      
      public function set vo(param1:PublicTalkNotify) : void
      {
         if(_vo != param1)
         {
            _vo = param1;
            this.txtRich.show(vo,true);
            this.height = this.txtRich.viewHeight;
         }
      }
   }
}
