package game.ui.commons.icons
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class WealthRenderS7UI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="55" height="75">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS4_2" x="0" y="0" var="img_quality" sizeGrid="6,6,6,6"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="46" height="46" scale="1.1"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_num" width="54" align="right" x="0" y="36" backgroundColor="0xcfbeaf" style="普通说明" mouseChildren="false"/>
			  <Label text="1000" stroke="0xffffff" mouseEnabled="false" var="txt_addNum" align="center" backgroundColor="0xcfbeaf" height="18" x="-17" y="56" width="91" style="普通说明" mouseChildren="false"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public var txt_addNum:Label = null;
      
      public function WealthRenderS7UI()
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
