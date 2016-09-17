package game.ui.commons.comps.others
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.Label;
   
   public class ClickToNextUI extends View
   {
      
      protected static var uiView:XML = <View width="150" height="18">
			  <Image skin="png.a5.commonImgs.文字底" x="-15" y="-2"/>
			  <Button stateNum="1" skin="png.a5.btns.btn_click" y="4" x="0" var="img_icon" width="19" height="11"/>
			  <Label width="367" x="23" text="\l30100016" y="0" style="重要提示绿" autoSize="none" align="left" var="txt_alert" height="20"/>
			</View>;
       
      
      public var img_icon:Button = null;
      
      public var txt_alert:Label = null;
      
      public function ClickToNextUI()
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
