package game.ui.chatModules.privChats
{
   import morn.core.components.View;
   import morn.customs.components.Placeholder;
   import game.ui.chatModules.ChatScrollBarUI;
   
   public class PrivChatHistoryUI extends View
   {
      
      protected static var uiView:XML = <View width="423" height="255">
			  <Placeholder width="423" x="0" y="0" var="placeHistory" height="255"/>
			  <ChatScrollBar var="boxScrollBar" x="425" bottom="4" top="4" runtime="game.ui.chatModules.ChatScrollBarUI"/>
			</View>;
       
      
      public var placeHistory:Placeholder = null;
      
      public var boxScrollBar:ChatScrollBarUI = null;
      
      public function PrivChatHistoryUI()
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
