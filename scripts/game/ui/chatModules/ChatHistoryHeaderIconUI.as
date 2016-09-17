package game.ui.chatModules
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.customs.components.GRect;
   
   public class ChatHistoryHeaderIconUI extends View
   {
      
      protected static var uiView:XML = <View width="42" height="42">
			  <Image skin="png.uiChatModules.img_iconBg" x="0" y="0"/>
			  <Image skin="png.comp.image" x="3" y="3" width="36" height="36" var="img_playerIcon"/>
			  <GRect fillAlpha="0.5" radius="4,4,4,4" lineAlpha="0" x="3" y="3" width="36" height="36" var="playerIconMask"/>
			</View>;
       
      
      public var img_playerIcon:Image = null;
      
      public var playerIconMask:GRect = null;
      
      public function ChatHistoryHeaderIconUI()
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
