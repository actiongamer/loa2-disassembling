package game.ui.commons.comps.btns
{
   import morn.core.components.View;
   import morn.core.components.Button;
   
   public class BtnFaceBookUI extends View
   {
      
      protected static var uiView:XML = <View width="119" height="33">
			  <Button label="Share" skin="png.a5.btns.btn_fb_share" sizeGrid="5,5,5,10" stateNum="1" labelSize="15" labelMargin="20" visible="true" var="faceBookBtn" x="0" y="0"/>
			</View>;
       
      
      public var faceBookBtn:Button = null;
      
      public function BtnFaceBookUI()
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
