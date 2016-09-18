package game.ui.treasures.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Box;
   import morn.customs.components.GCircle;
   import morn.core.components.Label;
   
   public class RuneHoleListRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="150" height="88" buttonMode="false">
			  <Image skin="png.uiTreasure.镶嵌-圈圈" x="36" y="0"/>
			  <Image skin="png.uiTreasure.镶嵌-锁" x="58" y="20" var="img_lock" buttonMode="true"/>
			  <Box x="45" y="7" var="box_content" buttonMode="true">
			    <GCircle fillAlpha="0.5" lineAlpha="0" width="60" height="60" var="img_mask"/>
			    <Image skin="png.comp.image" x="5" y="6" var="img_icon" width="50" height="50"/>
			  </Box>
			  <Label text="冥界 +7%" autoSize="none" color="0xf9bd77" x="-14" y="71" style="二级框标题" size="12" align="center" width="178" var="txt_addtion" multiline="true" wordWrap="true"/>
			</WealthRender>;
       
      
      public var img_lock:Image = null;
      
      public var box_content:Box = null;
      
      public var img_mask:GCircle = null;
      
      public var img_icon:Image = null;
      
      public var txt_addtion:Label = null;
      
      public function RuneHoleListRenderUI()
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
