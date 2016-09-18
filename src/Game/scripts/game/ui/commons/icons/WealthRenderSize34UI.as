package game.ui.commons.icons
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class WealthRenderSize34UI extends WealthRender
   {
      
      protected static var uiXML:XML = <WealthRender width="34" height="34">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS5_3" var="img_quality" sizeGrid="6,6,6,6" width="34" height="34"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="28" height="28"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_num" width="38" align="right" x="-3" y="17" backgroundColor="0xcfbeaf" color="0xffffff" size="11" height="18"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public function WealthRenderSize34UI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiXML);
      }
   }
}
