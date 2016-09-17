package game.ui.chatModules.chatSendBoxes
{
   import morn.core.components.View;
   import morn.customs.components.Placeholder;
   
   public class ChatFaceSelectPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="228" height="201">
			  <Image skin="png.uiChatModules.a7.表情框" sizeGrid="10,10,10,10" x="0" y="0" width="228" height="201"/>
			  <Placeholder width="216" height="189" x="6" y="6" var="placeFaceSelectPanel"/>
			</View>;
       
      
      public var placeFaceSelectPanel:Placeholder = null;
      
      public function ChatFaceSelectPanelUI()
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
