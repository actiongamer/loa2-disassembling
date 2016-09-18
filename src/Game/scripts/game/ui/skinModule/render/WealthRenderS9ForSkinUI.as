package game.ui.skinModule.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Box;
   
   public class WealthRenderS9ForSkinUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="60" height="60">
			  <Image skin="png.uiSkin.img_plus" x="-37" y="18" var="img_plus"/>
			  <Label text="\l999900500" autoSize="none" x="-49" y="84" style="普通说明" width="158" height="20" align="center" var="txt_name"/>
			  <Box x="-10" y="-11" var="box_main">
			    <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="10" y="11" var="img_quality" sizeGrid="6,6,6,6" width="60" height="60"/>
			    <Image skin="png.comp.image" x="13" y="14" var="img_icon" width="54" height="54"/>
			    <Image skin="png.uiSkin.img_dec" mouseEnabled="false"/>
			  </Box>
			</WealthRender>;
       
      
      public var img_plus:Image = null;
      
      public var txt_name:Label = null;
      
      public var box_main:Box = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public function WealthRenderS9ForSkinUI()
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
