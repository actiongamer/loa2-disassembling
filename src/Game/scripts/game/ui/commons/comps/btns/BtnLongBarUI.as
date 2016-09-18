package game.ui.commons.comps.btns
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Button;
   
   public class BtnLongBarUI extends View
   {
      
      protected static var uiView:XML = <View width="51" height="563">
			  <Image skin="png.a5.btns.img_btnLongBarBg" x="0" y="0" width="51" height="553" sizeGrid="0,20,0,20" var="img_bg" smoothing="true"/>
			  <Button skin="png.a5.btns.btn_longBar" x="13" y="256" stateNum="3" var="btn_arrow"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var btn_arrow:Button = null;
      
      public function BtnLongBarUI()
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
