package game.ui.heroCompare.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class HCHeroListRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="100" height="100" buttonMode="true">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="18" y="10" var="img_quality" sizeGrid="6,6,6,6" width="62" height="62"/>
			  <Image skin="png.comp.image" x="21" y="13" var="img_icon" width="56" height="56"/>
			  <Image skin="png.uiHeroCompare.名字透明黑底" x="-11" y="75"/>
			  <Label text="名字名字名字 + 8" autoSize="none" x="-5" y="77" style="普通灰色" width="106" height="20" multiline="true" wordWrap="true" align="center" var="txt_name" isHtml="true" mouseEnabled="false"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public function HCHeroListRenderUI()
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
