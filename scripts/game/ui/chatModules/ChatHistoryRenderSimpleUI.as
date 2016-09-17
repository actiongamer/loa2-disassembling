package game.ui.chatModules
{
   import morn.core.components.View;
   import morn.customs.components.Placeholder;
   
   public class ChatHistoryRenderSimpleUI extends View
   {
      
      protected static var uiView:XML = <View width="310" height="20">
			  <Placeholder width="310" height="20" x="0" y="0" var="placeContent"/>
			</View>;
       
      
      public var placeContent:Placeholder = null;
      
      public function ChatHistoryRenderSimpleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
