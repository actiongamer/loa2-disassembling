package game.ui.mainToolBar
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import morn.core.components.Image;
   
   public class BottomIconBarTopRightUI extends View
   {
      
      protected static var uiView:XML = <View width="65" height="65" mouseEnabled="false">
			  <Box x="-1" y="-1" width="65" height="65" var="box_icons" mouseEnabled="false"/>
			  <Button stateNum="1" var="btn_page" x="2.5" y="10.5" skin="png.a5.btns.btn_pageLeft"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="-1175" y="-15" width="1174" height="425" sizeGrid="20,20,20,20" mouseEnabled="false" mouseChildren="false" var="img_mask"/>
			</View>;
       
      
      public var box_icons:Box = null;
      
      public var btn_page:Button = null;
      
      public var img_mask:Image = null;
      
      public function BottomIconBarTopRightUI()
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
