package game.ui.chatModules
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class ChatShowAllTipUI extends View
   {
      
      protected static var uiView:XML = <View width="216" height="30" mouseChildren="true">
			  <Image skin="png.uiChatModules.img_historyBg1" x="5" y="-3" sizeGrid="23,3,3,10" width="216" height="30" var="txtChatMsgBG"/>
			  <Label text="\l999000605" autoSize="none" x="15" y="6" style="普通说明" var="txtChatMsg" height="20"/>
			</View>;
       
      
      public var txtChatMsgBG:Image = null;
      
      public var txtChatMsg:Label = null;
      
      public function ChatShowAllTipUI()
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
