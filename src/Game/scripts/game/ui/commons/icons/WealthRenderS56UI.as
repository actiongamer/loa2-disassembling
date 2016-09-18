package game.ui.commons.icons
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class WealthRenderS56UI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="56" height="56">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS4_2" x="0" y="0" var="img_quality" sizeGrid="6,6,6,6"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="50" height="50"/>
			  <Label text="12" stroke="0xffffff" mouseEnabled="false" var="txt_num" width="66" align="right" x="-12" y="36" backgroundColor="0xcfbeaf" style="普通说明" height="15"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public function WealthRenderS56UI()
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
