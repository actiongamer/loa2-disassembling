package game.ui.commons.icons
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class WealthRenderSize56UI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="56" height="56">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS4_5" var="img_quality" sizeGrid="6,6,6,6" width="56" height="56"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="50" height="50"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_num" width="54" align="right" x="2" y="36" backgroundColor="0xcfbeaf" color="0xffffff"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public function WealthRenderSize56UI()
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
