package game.ui.roleTeam.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.customs.components.GRect;
   
   public class YuanFenItemRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="40" height="40">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" var="img_quality" sizeGrid="6,6,6,6" width="40" height="40"/>
			  <Image skin="png.comp.image" var="img_icon" width="34" height="34" x="3" y="3"/>
			  <GRect fillAlpha="0.6" radius="0,0,0,0" lineAlpha="0" width="38" height="38" fillColor="0x00000000" var="mask_black" mouseEnabled="false" x="1" y="1"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var mask_black:GRect = null;
      
      public function YuanFenItemRenderUI()
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
