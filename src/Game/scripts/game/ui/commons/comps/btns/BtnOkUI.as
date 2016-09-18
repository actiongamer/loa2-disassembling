package game.ui.commons.comps.btns
{
   import morn.core.components.View;
   import morn.core.components.Button;
   
   public class BtnOkUI extends View
   {
      
      protected static var uiView:XML = <View width="82" height="26">
			  <Button label="\l11300024" style="按钮中绿" var="btn_ok"/>
			</View>;
       
      
      public var btn_ok:Button = null;
      
      public function BtnOkUI()
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
