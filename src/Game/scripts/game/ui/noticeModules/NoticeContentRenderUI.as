package game.ui.noticeModules
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class NoticeContentRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="344" height="62">
			  <Box x="36" y="5" var="boxContent">
			    <Label autoSize="left" style="普通说明" width="284" multiline="true" wordWrap="true" var="txt_content" align="left"/>
			    <Label text="35分钟前" autoSize="none" style="普通灰色" width="284" multiline="false" wordWrap="true" align="right" var="txt_time"/>
			    <Image skin="png.uiNotice.分割线" var="img_line" x="0" y="54"/>
			  </Box>
			  <Image skin="png.uiNotice.小点" x="20" y="7"/>
			</View>;
       
      
      public var boxContent:Box = null;
      
      public var txt_content:Label = null;
      
      public var txt_time:Label = null;
      
      public var img_line:Image = null;
      
      public function NoticeContentRenderUI()
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
