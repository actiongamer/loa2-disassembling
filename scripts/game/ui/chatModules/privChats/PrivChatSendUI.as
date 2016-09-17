package game.ui.chatModules.privChats
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.TextInput;
   import morn.customs.components.Placeholder;
   import game.ui.chatModules.chatSendBoxes.ChatFaceSelectPanelUI;
   
   public class PrivChatSendUI extends View
   {
      
      protected static var uiView:XML = <View width="444" height="124">
			  <Image skin="png.a5.bgs.panelBgs.img_panelBgS11" x="0" y="0" width="444" height="83" sizeGrid="4,4,4,4"/>
			  <Button label="" stateNum="1" buttonMode="true" skin="png.uiChatModules.btn_smile" x="112" y="101" var="btn_face"/>
			  <TextInput x="0" y="102" width="109" height="18" var="txt_leaveCount" text="还可以输入100个字" mouseEnabled="false" mouseChildren="false" style="普通说明"/>
			  <Button x="346" y="90" style="按钮中绿" var="btn_send" label="发送"/>
			  <Placeholder width="437" height="76" x="4" y="4" var="placeTxtSend"/>
			  <ChatFaceSelectPanel x="105" y="-102" var="faceSelectPanelUI" runtime="game.ui.chatModules.chatSendBoxes.ChatFaceSelectPanelUI"/>
			  <TextInput x="4" y="4" width="194" height="18" var="txt_sendPrompt" text="输入聊天信息" color="0xa0a0a0" labelFilterKind="黑色1像素描边" mouseEnabled="false" mouseChildren="false"/>
			</View>;
       
      
      public var btn_face:Button = null;
      
      public var txt_leaveCount:TextInput = null;
      
      public var btn_send:Button = null;
      
      public var placeTxtSend:Placeholder = null;
      
      public var faceSelectPanelUI:ChatFaceSelectPanelUI = null;
      
      public var txt_sendPrompt:TextInput = null;
      
      public function PrivChatSendUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.chatModules.chatSendBoxes.ChatFaceSelectPanelUI"] = ChatFaceSelectPanelUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
