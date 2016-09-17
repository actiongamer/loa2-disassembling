package game.ui.chatModules
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.Tab;
   import morn.core.components.Box;
   import game.ui.miniMaps.MiniMapBtnUI;
   
   public class ChatHistoryUI extends View
   {
      
      protected static var uiView:XML = <View width="330" height="200" buttonMode="false">
			  <Image skin="png.uiChatModules.a7.聊天底框" sizeGrid="10,10,10,10" left="0" right="0" top="0" bottom="-30" var="img_chatBg" x="0" y="-160"/>
			  <Image skin="png.uiChatModules.a7.消息提示底" x="17" y="152" var="img_newMsgBg"/>
			  <Image skin="png.uiChatModules.a7.聊天底框" sizeGrid="10,10,10,10" left="0" var="img_chatBg2" x="0" y="-82" height="82" width="330" right="0"/>
			  <ChatHistoryPanelS2 var="panelS2in" runtime="game.ui.chatModules.ChatHistoryPanelS2UI"/>
			  <ChatHistoryPanelS1 var="panelS1in" runtime="game.ui.chatModules.ChatHistoryPanelS1UI"/>
			  <ChatHistoryPanelS3 y="-77" var="panelS3in" runtime="game.ui.chatModules.ChatHistoryPanelS3UI"/>
			  <Button label="" stateNum="1" buttonMode="true" skin="png.uiChatModules.a7.btn_scale" y="0" var="btn_win" right="0"/>
			  <Button label="" stateNum="1" buttonMode="true" skin="png.uiChatModules.btn_no" x="297" y="178" var="btn_no" bottom="2" right="25"/>
			  <Image skin="png.uiChatModules.img_line" x="383" y="51" sizeGrid="4,0,4,4" var="img_line"/>
			  <Tab labels="标签,聊天" x="24" y="177" style="TAB聊天" selectedIndex="0" var="tab_channelGroup" bottom="0" skin="png.a5.btns.tab_S8"/>
			  <Button skin="png.a5.btns.btn_chatscale" x="314" y="178" stateNum="1" var="btn_chatScale" bottom="2"/>
			  <Box x="17" y="0" var="btnMore" mouseChildren="false">
			    <Image skin="png.a5.bgs.panelBgs.img_panelBgS11" y="0" sizeGrid="5,5,5,5" width="286" height="19" alpha="0.9"/>
			    <Label text="/|999001131" autoSize="none" x="42" y="0" style="普通说明" width="215" height="19" align="center"/>
			  </Box>
			  <MiniMapBtn x="253" y="175" var="btn_gm" bottom="0" runtime="game.ui.miniMaps.MiniMapBtnUI"/>
			</View>;
       
      
      public var img_chatBg:Image = null;
      
      public var img_newMsgBg:Image = null;
      
      public var img_chatBg2:Image = null;
      
      public var panelS2in:game.ui.chatModules.ChatHistoryPanelS2UI = null;
      
      public var panelS1in:game.ui.chatModules.ChatHistoryPanelS1UI = null;
      
      public var panelS3in:game.ui.chatModules.ChatHistoryPanelS3UI = null;
      
      public var btn_win:Button = null;
      
      public var btn_no:Button = null;
      
      public var img_line:Image = null;
      
      public var tab_channelGroup:Tab = null;
      
      public var btn_chatScale:Button = null;
      
      public var btnMore:Box = null;
      
      public var btn_gm:MiniMapBtnUI = null;
      
      public function ChatHistoryUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.chatModules.ChatHistoryPanelS1UI"] = game.ui.chatModules.ChatHistoryPanelS1UI;
         viewClassMap["game.ui.chatModules.ChatHistoryPanelS2UI"] = game.ui.chatModules.ChatHistoryPanelS2UI;
         viewClassMap["game.ui.chatModules.ChatHistoryPanelS3UI"] = game.ui.chatModules.ChatHistoryPanelS3UI;
         viewClassMap["game.ui.miniMaps.MiniMapBtnUI"] = MiniMapBtnUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
