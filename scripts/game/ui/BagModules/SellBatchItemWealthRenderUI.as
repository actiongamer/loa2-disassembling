package game.ui.BagModules
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class SellBatchItemWealthRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="120" height="22">
			  <Label text="8888888888" autoSize="left" x="24" y="3" size="12" color="0xffe1a2" var="txt_num" letterSpacing="1" style="普通说明" width="96" height="18"/>
			  <Box x="11" y="11" scale="0.4">
			    <Image skin="png.comp.image" var="img_icon" width="46" height="45" anchorX="0.5" anchorY="0.5"/>
			  </Box>
			</WealthRender>;
       
      
      public var txt_num:Label = null;
      
      public var img_icon:Image = null;
      
      public function SellBatchItemWealthRenderUI()
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
