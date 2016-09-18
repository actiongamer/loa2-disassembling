package game.ui.chatModules
{
   import morn.core.components.View;
   import morn.customs.components.Placeholder;
   
   public class ChatHistoryPanelS1UI extends View
   {
      
      protected static var uiView:XML = <View width="330" height="176">
			  <Placeholder width="313" x="17" y="6" var="placeHistory" height="164"/>
			  <ChatScrollBar x="5" y="0" top="0" bottom="0" var="boxScrollBar" runtime="game.ui.chatModules.ChatScrollBarUI"/>
			</View>;
       
      
      public var placeHistory:Placeholder = null;
      
      public var boxScrollBar:game.ui.chatModules.ChatScrollBarUI = null;
      
      public function ChatHistoryPanelS1UI()
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
