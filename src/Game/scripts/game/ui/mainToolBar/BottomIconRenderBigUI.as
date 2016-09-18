package game.ui.mainToolBar
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class BottomIconRenderBigUI extends View
   {
      
      protected static var uiView:XML = <View width="65" height="65">
			  <Image skin="png.uiMainToolBar.img_bg" x="110" y="161" centerX="0" centerY="0"/>
			  <Image skin="png.a5.comps.img_block" var="img_bg" autoSize="true" width="64" height="64" x="32" y="64" anchorX="0.5" anchorY="1"/>
			  <Label text="渐变1" autoSize="none" style="渐变1" width="64" align="center" var="txt_names" x="0.5" y="43" height="22"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var txt_names:Label = null;
      
      public function BottomIconRenderBigUI()
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
