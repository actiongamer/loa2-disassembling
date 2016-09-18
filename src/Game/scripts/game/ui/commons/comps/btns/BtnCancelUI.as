package game.ui.commons.comps.btns
{
   import morn.core.components.View;
   import morn.core.components.Button;
   
   public class BtnCancelUI extends View
   {
      
      protected static var uiView:XML = <View width="82" height="26">
			  <Button label="\l11300025" style="按钮中红" var="btn_cancel"/>
			</View>;
       
      
      public var btn_cancel:Button = null;
      
      public function BtnCancelUI()
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
