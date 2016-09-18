package game.ui.commons.icons
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class LotteryRenderS5UI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="130" height="20">
			  <Label text="金币:" x="-40" y="1" size="12" var="txt_name" letterSpacing="1" style="随品质变化" width="100" height="18" align="right"/>
			  <Label text="x88888" autoSize="left" x="86" y="1" size="12" var="txt_num" letterSpacing="1" style="随品质变化"/>
			  <Box x="73" y="9" scale="0.4">
			    <Image skin="png.comp.image" var="img_icon" width="46" height="45" anchorX="0.5" anchorY="0.5"/>
			  </Box>
			</WealthRender>;
       
      
      public var txt_name:Label = null;
      
      public var txt_num:Label = null;
      
      public var img_icon:Image = null;
      
      public function LotteryRenderS5UI()
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
