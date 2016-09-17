package game.ui.commons.icons
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   
   public class WealthRenderS2UI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="50" height="50" showMultipleSign="false">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgValid" x="-4" y="-4"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="0" y="0" var="img_quality" sizeGrid="6,6,6,6"/>
			  <Image skin="png.comp.image" x="2" y="2" var="img_icon" width="46" height="45"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public function WealthRenderS2UI()
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
