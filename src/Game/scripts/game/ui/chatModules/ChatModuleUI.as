package game.ui.chatModules
{
   import morn.customs.components.StaticModuleView;
   import morn.core.components.Box;
   import game.ui.chatModules.chatSendBoxes.ChatSendBoxUI;
   import morn.core.components.Button;
   import morn.core.components.Image;
   import morn.core.components.List;
   
   public class ChatModuleUI extends StaticModuleView
   {
      
      protected static var uiView:XML = <StaticModuleView width="330" height="30" var="whole">
			  <Box x="0" y="0" var="boxChatAll">
			    <Image skin="png.uiChatModules.a7.金属边框" y="0" x="0"/>
			    <ChatHistory var="historyView" x="0" y="-200" runtime="game.ui.chatModules.ChatHistoryUI"/>
			    <ChatSendBox x="55" y="4" var="sendBoxUI" runtime="game.ui.chatModules.chatSendBoxes.ChatSendBoxUI"/>
			    <Button label="按钮" x="3" y="4" style="按钮小绿2" var="btn_sendChannel"/>
			  </Box>
			  <ChatShowAllTip x="30" y="-25" var="showAllTip" runtime="game.ui.chatModules.ChatShowAllTipUI"/>
			  <Button skin="png.uiChatModules.a7.btn_缩放按钮01" x="0" y="-23" stateNum="1" var="btn_hideAll"/>
			  <Image skin="png.uiChatModules.a7.三角" x="12" y="-12" var="img_icon_scaleAll" anchorX="0.5" anchorY="0.5"/>
			  <List x="3" y="-107" repeatY="5" bottom="25" var="list_sendChannelOther">
			    <ChatBtnChannelRender name="render" runtime="game.ui.chatModules.ChatBtnChannelRenderUI"/>
			  </List>
			</StaticModuleView>;
       
      
      public var whole:StaticModuleView = null;
      
      public var boxChatAll:Box = null;
      
      public var historyView:game.ui.chatModules.ChatHistoryUI = null;
      
      public var sendBoxUI:ChatSendBoxUI = null;
      
      public var btn_sendChannel:Button = null;
      
      public var showAllTip:game.ui.chatModules.ChatShowAllTipUI = null;
      
      public var btn_hideAll:Button = null;
      
      public var img_icon_scaleAll:Image = null;
      
      public var list_sendChannelOther:List = null;
      
      public function ChatModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.chatModules.ChatBtnChannelRenderUI"] = ChatBtnChannelRenderUI;
         viewClassMap["game.ui.chatModules.ChatHistoryUI"] = game.ui.chatModules.ChatHistoryUI;
         viewClassMap["game.ui.chatModules.ChatShowAllTipUI"] = game.ui.chatModules.ChatShowAllTipUI;
         viewClassMap["game.ui.chatModules.chatSendBoxes.ChatSendBoxUI"] = ChatSendBoxUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
