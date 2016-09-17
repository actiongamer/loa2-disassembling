package game.ui.commons.icons
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class WealthRenderSize40UI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="40" height="40">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS5_3" var="img_quality" sizeGrid="6,6,6,6" width="40" height="40"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="34" height="34"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_num" width="49" align="right" x="-9" y="22" backgroundColor="0xcfbeaf" color="0xffffff" size="11" height="18" autoSize="right"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public function WealthRenderSize40UI()
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
