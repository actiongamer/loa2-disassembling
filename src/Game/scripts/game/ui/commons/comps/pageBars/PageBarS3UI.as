package game.ui.commons.comps.pageBars
{
   import morn.core.components.View;
   import morn.core.components.Button;
   
   public class PageBarS3UI extends View
   {
      
      protected static var uiView:XML = <View width="51" height="400">
			  <Button skin="png.a5.btns.btn_longBar" var="btn_down" stateNum="3" rotation="90" bottom="-23" x="51"/>
			  <Button skin="png.a5.btns.btn_longBar" var="btn_up" stateNum="3" rotation="-90" top="29"/>
			</View>;
       
      
      public var btn_down:Button = null;
      
      public var btn_up:Button = null;
      
      public function PageBarS3UI()
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
