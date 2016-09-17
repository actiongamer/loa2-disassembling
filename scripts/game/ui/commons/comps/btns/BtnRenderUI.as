package game.ui.commons.comps.btns
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class BtnRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="119" height="33" mouseChildren="false" mouseEnabled="false">
			  <Box var="box_content" x="14" y="8" mouseChildren="false" mouseEnabled="false">
			    <Label x="15" var="txt_label" size="12" text="label" y="0" isHtml="true" autoSize="left" style="随品质变化"/>
			    <Image skin="png.a5.comps.img_block" y="9" width="27" height="27" anchorX="0.5" anchorY="0.5" autoSize="true" var="img_icon" x="0"/>
			  </Box>
			</View>;
       
      
      public var box_content:Box = null;
      
      public var txt_label:Label = null;
      
      public var img_icon:Image = null;
      
      public function BtnRenderUI()
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
