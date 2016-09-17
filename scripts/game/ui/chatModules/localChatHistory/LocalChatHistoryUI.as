package game.ui.chatModules.localChatHistory
{
   import morn.customs.components.PopModuleView;
   import morn.customs.components.PanelBg;
   import morn.core.components.Tab;
   
   public class LocalChatHistoryUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="360" height="580">
			  <PanelBg bgBMargin="10,35,10,60" width="360" height="580" x="0" y="0" var="panelBG"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="14" y="53" width="333" height="512" sizeGrid="20,20,20,20"/>
			  <ChatHistoryPanelLocal x="17" y="63" var="panel" runtime="game.ui.chatModules.localChatHistory.ChatHistoryPanelLocalUI"/>
			  <Tab labels="标签,聊天" x="17" y="34" selectedIndex="0" skin="png.a5.btns.tab_S8" var="tab_channelGroup" style="TAB聊天"/>
			</PopModuleView>;
       
      
      public var panelBG:PanelBg = null;
      
      public var panel:game.ui.chatModules.localChatHistory.ChatHistoryPanelLocalUI = null;
      
      public var tab_channelGroup:Tab = null;
      
      public function LocalChatHistoryUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.chatModules.localChatHistory.ChatHistoryPanelLocalUI"] = game.ui.chatModules.localChatHistory.ChatHistoryPanelLocalUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
