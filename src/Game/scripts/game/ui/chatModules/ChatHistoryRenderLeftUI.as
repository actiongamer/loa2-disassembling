package game.ui.chatModules
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.customs.components.Placeholder;
   
   public class ChatHistoryRenderLeftUI extends View
   {
      
      protected static var uiView:XML = <View width="310" height="70">
			  <Image skin="png.uiChatModules.img_historyBg1" x="46" y="22" sizeGrid="10,16,8,8" width="228" height="49" var="img_chatBg"/>
			  <Label text="[世界]我以为" autoSize="left" x="44" y="0" color="0xc2beaf" size="12" width="225" height="20" var="txt_playerName"/>
			  <ChatHistoryHeaderIcon x="0" y="0" var="headerIcon" runtime="game.ui.chatModules.ChatHistoryHeaderIconUI"/>
			  <Placeholder width="212" height="26" x="56" y="26" var="placeContent"/>
			</View>;
       
      
      public var img_chatBg:Image = null;
      
      public var txt_playerName:Label = null;
      
      public var headerIcon:game.ui.chatModules.ChatHistoryHeaderIconUI = null;
      
      public var placeContent:Placeholder = null;
      
      public function ChatHistoryRenderLeftUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.chatModules.ChatHistoryHeaderIconUI"] = game.ui.chatModules.ChatHistoryHeaderIconUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
