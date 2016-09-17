package game.ui.chatModules
{
   import morn.core.components.View;
   import morn.customs.components.Placeholder;
   
   public class ChatHistoryPanelS2UI extends View
   {
      
      protected static var uiView:XML = <View width="330" height="300">
			  <Placeholder width="308" x="17" y="0" var="placeHistory" height="300" top="0" bottom="0"/>
			  <ChatScrollBar y="0" top="0" bottom="0" var="boxScrollBar" x="5" runtime="game.ui.chatModules.ChatScrollBarUI"/>
			</View>;
       
      
      public var placeHistory:Placeholder = null;
      
      public var boxScrollBar:game.ui.chatModules.ChatScrollBarUI = null;
      
      public function ChatHistoryPanelS2UI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.chatModules.ChatScrollBarUI"] = game.ui.chatModules.ChatScrollBarUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
