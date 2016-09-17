package game.ui.chatModules.chatSendBoxes
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.customs.components.Placeholder;
   import morn.core.components.TextInput;
   
   public class ChatSendBoxUI extends View
   {
      
      protected static var uiView:XML = <View width="270" height="22">
			  <ChatFaceSelectPanel x="191" y="-201" var="faceSelectPanelUI" runtime="game.ui.chatModules.chatSendBoxes.ChatFaceSelectPanelUI"/>
			  <Button label="" stateNum="1" buttonMode="true" skin="png.uiChatModules.btn_smile" x="198" y="2" var="btn_face"/>
			  <Placeholder width="197" height="18" x="0" y="2" var="placeTxtSend"/>
			  <TextInput x="0" y="2" width="194" height="18" var="txt_sendPrompt" text="输入聊天信息" color="0xa0a0a0" labelFilterKind="黑色1像素描边" mouseEnabled="false" mouseChildren="false"/>
			  <Button x="221" y="0" var="btn_send" stateNum="1" skin="png.uiChatModules.a7.发送按钮"/>
			</View>;
       
      
      public var faceSelectPanelUI:game.ui.chatModules.chatSendBoxes.ChatFaceSelectPanelUI = null;
      
      public var btn_face:Button = null;
      
      public var placeTxtSend:Placeholder = null;
      
      public var txt_sendPrompt:TextInput = null;
      
      public var btn_send:Button = null;
      
      public function ChatSendBoxUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.chatModules.chatSendBoxes.ChatFaceSelectPanelUI"] = game.ui.chatModules.chatSendBoxes.ChatFaceSelectPanelUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
