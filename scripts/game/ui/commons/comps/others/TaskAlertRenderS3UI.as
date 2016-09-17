package game.ui.commons.comps.others
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class TaskAlertRenderS3UI extends View
   {
      
      protected static var uiView:XML = <View width="150" height="50" mouseChildren="false" mouseEnabled="false">
			  <Box var="box_txt" x="-130" y="-128">
			    <Image skin="png.a5.commonImgs.img_alertBgS2" var="img_bg" sizeGrid="50,60,50,60" smoothing="true" x="-1" y="175" width="268" height="169" scaleY="-1"/>
			    <Label text="段落内容段落内容段落内容段落内容" autoSize="left" multiline="true" wordWrap="true" width="155" var="txt_content" leading="3" letterSpacing="1" style="普通说明" size="12" color="0xfff8c7" x="60" y="68"/>
			  </Box>
			</View>;
       
      
      public var box_txt:Box = null;
      
      public var img_bg:Image = null;
      
      public var txt_content:Label = null;
      
      public function TaskAlertRenderS3UI()
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
