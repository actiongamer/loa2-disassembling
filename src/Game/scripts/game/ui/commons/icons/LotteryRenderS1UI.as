package game.ui.commons.icons
{
   import morn.customs.components.LotteryRender;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class LotteryRenderS1UI extends LotteryRender
   {
      
      protected static var uiView:XML = <LotteryRender width="120" height="22">
			  <Label text="x88888" autoSize="left" x="24" y="3" size="12" var="txt_num" letterSpacing="1" style="随品质变化"/>
			  <Box x="12" y="11" scale="0.4">
			    <Image skin="png.comp.image" var="img_icon" width="46" height="45" anchorX="0.5" anchorY="0.5"/>
			  </Box>
			</LotteryRender>;
       
      
      public var txt_num:Label = null;
      
      public var img_icon:Image = null;
      
      public function LotteryRenderS1UI()
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
