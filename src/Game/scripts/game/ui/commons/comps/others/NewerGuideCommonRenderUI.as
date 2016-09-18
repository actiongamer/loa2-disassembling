package game.ui.commons.comps.others
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Box;
   import morn.core.components.Label;
   
   public class NewerGuideCommonRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="100" height="100">
			  <Image skin="png.a5.comps.img_block" x="153" width="162" height="130" var="img_dialog" y="-248"/>
			  <Box var="box_txt" x="-154" y="-309">
			    <Image skin="png.a5.commonImgs.img_summaryBg" var="txt_bg" sizeGrid="50,60,50,60" smoothing="true"/>
			    <Label text="段落内容" autoSize="left" multiline="true" wordWrap="true" width="200" var="txt_content" leading="3" letterSpacing="1" style="普通说明" size="14" color="0xfff8c7" x="60" y="68"/>
			  </Box>
			  <Box var="box_arrow" rotation="0" x="0" y="0">
			    <Image skin="png.a5.commonImgs.img_arrow" x="0" y="0" var="img_arrow" anchorX="0.5" mouseChildren="false" mouseEnabled="false" anchorY="1"/>
			  </Box>
			</View>;
       
      
      public var img_dialog:Image = null;
      
      public var box_txt:Box = null;
      
      public var txt_bg:Image = null;
      
      public var txt_content:Label = null;
      
      public var box_arrow:Box = null;
      
      public var img_arrow:Image = null;
      
      public function NewerGuideCommonRenderUI()
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
