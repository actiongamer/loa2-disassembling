package game.ui.commons.comps.others
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class RecycleAlertRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="209" height="50" mouseChildren="false" mouseEnabled="false">
			  <Box x="0" y="-1" var="box_content">
			    <Image skin="png.a5.commonImgs.img_recycleAlertBg" y="1" var="img_bg"/>
			    <Image skin="png.a5.commonImgs.img_recycleAlertPoint" x="27" y="27" var="img_point" anchorX="0.5" anchorY="0.5"/>
			    <Label text="装备重生后返还装备和所有养成资源和所有养成资源和所有养资源和所有养资源和所有养资源和所有养" autoSize="left" x="50" style="普通说明" width="114" wordWrap="true" var="txt_alert"/>
			  </Box>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="-2.5" y="-4.5" width="216" height="143" sizeGrid="20,20,20,20" var="img_mask"/>
			</View>;
       
      
      public var box_content:Box = null;
      
      public var img_bg:Image = null;
      
      public var img_point:Image = null;
      
      public var txt_alert:Label = null;
      
      public var img_mask:Image = null;
      
      public function RecycleAlertRenderUI()
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
