package game.ui.chatModules
{
   import morn.core.components.View;
   import morn.core.components.VScrollBar;
   
   public class ChatScrollBarUI extends View
   {
      
      protected static var uiView:XML = <View width="10" height="176">
			  <VScrollBar skin="png.a5.comps.scrollBar.vscroll_S2" width="10" top="0" bottom="0" var="txt_vscrollBar"/>
			</View>;
       
      
      public var txt_vscrollBar:VScrollBar = null;
      
      public function ChatScrollBarUI()
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
