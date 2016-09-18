package game.ui.commons.icons
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class WealthRenderSize64UI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="64" height="64">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS7_7" x="0" y="0" var="img_quality" sizeGrid="6,6,6,6" width="64" height="64"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="58" height="58"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_num" width="54" align="right" x="7" y="43" backgroundColor="0xcfbeaf" color="0xffffff"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public function WealthRenderSize64UI()
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
