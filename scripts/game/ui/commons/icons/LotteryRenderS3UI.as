package game.ui.commons.icons
{
   import morn.customs.components.LotteryRender;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class LotteryRenderS3UI extends LotteryRender
   {
      
      protected static var uiView:XML = <LotteryRender width="77" height="21">
			  <Label text="x88888" autoSize="left" x="21" y="3" size="12" var="txt_num" letterSpacing="1" style="小标题"/>
			  <Box x="10" y="10" width="115" height="115">
			    <Image skin="png.comp.image" var="img_icon" width="22" height="22" anchorX="0.5" anchorY="0.5"/>
			  </Box>
			</LotteryRender>;
       
      
      public var txt_num:Label = null;
      
      public var img_icon:Image = null;
      
      public function LotteryRenderS3UI()
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
