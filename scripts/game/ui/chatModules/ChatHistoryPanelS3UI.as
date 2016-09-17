package game.ui.chatModules
{
   import morn.core.components.View;
   import morn.customs.components.Placeholder;
   
   public class ChatHistoryPanelS3UI extends View
   {
      
      protected static var uiView:XML = <View width="330" height="76">
			  <Placeholder width="313" y="3" var="placeHistory" height="70" x="17"/>
			  <ChatScrollBar x="5" y="0" top="0" bottom="0" var="boxScrollBar" runtime="game.ui.chatModules.ChatScrollBarUI"/>
			</View>;
       
      
      public var placeHistory:Placeholder = null;
      
      public var boxScrollBar:game.ui.chatModules.ChatScrollBarUI = null;
      
      public function ChatHistoryPanelS3UI()
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
