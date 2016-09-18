package game.ui.chatModules.localChatHistory
{
   import morn.core.components.View;
   import game.ui.chatModules.ChatScrollBarUI;
   import morn.customs.components.Placeholder;
   import morn.core.components.Box;
   
   public class ChatHistoryPanelLocalUI extends View
   {
      
      protected static var uiView:XML = <View width="330" height="495">
			  <ChatScrollBar y="0" top="0" bottom="0" var="boxScrollBar" x="316" runtime="game.ui.chatModules.ChatScrollBarUI"/>
			  <Placeholder width="313" x="0" y="0" var="placeHistory" height="495" top="0" bottom="0"/>
			  <Box var="contentBox"/>
			</View>;
       
      
      public var boxScrollBar:ChatScrollBarUI = null;
      
      public var placeHistory:Placeholder = null;
      
      public var contentBox:Box = null;
      
      public function ChatHistoryPanelLocalUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.chatModules.ChatScrollBarUI"] = ChatScrollBarUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
