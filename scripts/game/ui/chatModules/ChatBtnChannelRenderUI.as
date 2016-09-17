package game.ui.chatModules
{
   import morn.core.components.View;
   import morn.core.components.Button;
   
   public class ChatBtnChannelRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="49" height="22">
			  <Button label="按钮" style="按钮小绿2" var="btn"/>
			</View>;
       
      
      public var btn:Button = null;
      
      public function ChatBtnChannelRenderUI()
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
