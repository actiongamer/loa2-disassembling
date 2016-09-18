package game.ui.guildModules.manageView
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class ManagerListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="176" height="209" buttonMode="true" mouseChildren="false">
			  <Box x="0" y="0" var="box_content">
			    <Image skin="png.uiGuildModule.manage.管理小底部" var="img_funBg"/>
			    <Image skin="png.uiGuildModule.manage.徽章" x="86" y="111" var="img_icon" anchorX=".5" anchorY=".5"/>
			    <Label autoSize="none" x="-2" y="9" style="渐变1" width="174" height="41" var="lTitle" text="Title" align="center" size="16"/>
			  </Box>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="158" y="-3" var="img_redPoint"/>
			  <Image skin="png.uiGuildModule.manage.锁链" x="-4" y="102" var="img_lock"/>
			</View>;
       
      
      public var box_content:Box = null;
      
      public var img_funBg:Image = null;
      
      public var img_icon:Image = null;
      
      public var lTitle:Label = null;
      
      public var img_redPoint:Image = null;
      
      public var img_lock:Image = null;
      
      public function ManagerListRenderUI()
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
