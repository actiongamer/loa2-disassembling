package game.ui.commons.icons
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   
   public class WealthRenderS14UI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="54" height="54">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS4_2" var="img_quality" sizeGrid="6,6,6,6"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="50" height="50"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public function WealthRenderS14UI()
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
