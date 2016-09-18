package game.ui.chatModules.privChats
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Label;
   
   public class PrivChatModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="660" height="514">
			  <PanelBgS3 bgBMargin="10,35,10,60" width="660" height="514" x="0" y="0"/>
			  <Image skin="png.a5.bgs.panelBgs.img_panelBgS11" x="19" y="36" width="617" height="462" sizeGrid="4,4,4,4"/>
			  <Image skin="png.a5.bgs.panelBgs.raw.底板一级二级底九宫格" x="176" y="36" width="461" height="462"/>
			  <Image skin="png.a5.bgs.panelBgs.img_panelBgS11" x="183" y="103" width="445" height="258" sizeGrid="4,4,4,4"/>
			  <Label text="label" x="186" y="104" width="420" height="20" multiline="true" var="govementtip" wordWrap="true"/>
			  <PrivChatPlayerRender x="186" y="46" var="render_targetUI" runtime="game.ui.chatModules.privChats.PrivChatPlayerRenderUI"/>
			  <PrivChatRoleList x="24" y="42" var="listPanelUI" runtime="game.ui.chatModules.privChats.PrivChatRoleListUI"/>
			  <PrivChatHistory x="184" y="105" var="historyUI" runtime="game.ui.chatModules.privChats.PrivChatHistoryUI"/>
			  <PrivChatSend x="184" y="367" var="sendBoxUI" runtime="game.ui.chatModules.privChats.PrivChatSendUI"/>
			</PopModuleView>;
       
      
      public var govementtip:Label = null;
      
      public var render_targetUI:game.ui.chatModules.privChats.PrivChatPlayerRenderUI = null;
      
      public var listPanelUI:game.ui.chatModules.privChats.PrivChatRoleListUI = null;
      
      public var historyUI:game.ui.chatModules.privChats.PrivChatHistoryUI = null;
      
      public var sendBoxUI:game.ui.chatModules.privChats.PrivChatSendUI = null;
      
      public function PrivChatModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.chatModules.privChats.PrivChatHistoryUI"] = game.ui.chatModules.privChats.PrivChatHistoryUI;
         viewClassMap["game.ui.chatModules.privChats.PrivChatPlayerRenderUI"] = game.ui.chatModules.privChats.PrivChatPlayerRenderUI;
         viewClassMap["game.ui.chatModules.privChats.PrivChatRoleListUI"] = game.ui.chatModules.privChats.PrivChatRoleListUI;
         viewClassMap["game.ui.chatModules.privChats.PrivChatSendUI"] = game.ui.chatModules.privChats.PrivChatSendUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
