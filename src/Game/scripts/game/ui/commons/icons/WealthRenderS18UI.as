package game.ui.commons.icons
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class WealthRenderS18UI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="197" height="62">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS6_2" x="0" y="0" var="img_quality" sizeGrid="6,6,6,6"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="56" height="56"/>
			  <Label text="名字名字名字名字名字" stroke="0xffffff" mouseEnabled="false" var="txt_name" align="left" y="2" backgroundColor="0xcfbeaf" height="36" x="76" mouseChildren="false" style="普通说明" width="173" multiline="true" wordWrap="true" language="ru" lgx="76,76,76,76,76,76,76,76" lgy="7,7,7,7,7,7,7,2"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_num" width="54" align="right" x="8" y="42" backgroundColor="0xcfbeaf" color="0xffffff"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_num:Label = null;
      
      public function WealthRenderS18UI()
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
