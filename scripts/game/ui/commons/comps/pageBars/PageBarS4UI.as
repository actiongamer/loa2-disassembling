package game.ui.commons.comps.pageBars
{
   import morn.core.components.View;
   import morn.core.components.Button;
   
   public class PageBarS4UI extends View
   {
      
      protected static var uiView:XML = <View width="400" height="51">
			  <Button skin="png.a5.btns.btn_longBar" var="btn_prev" stateNum="3" rotation="180" y="51" x="29"/>
			  <Button skin="png.a5.btns.btn_longBar" var="btn_next" stateNum="3" right="0"/>
			</View>;
       
      
      public var btn_prev:Button = null;
      
      public var btn_next:Button = null;
      
      public function PageBarS4UI()
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
