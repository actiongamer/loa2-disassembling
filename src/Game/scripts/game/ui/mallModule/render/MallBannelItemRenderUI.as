package game.ui.mallModule.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class MallBannelItemRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="50" height="50">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="0" y="0" var="img_quality" sizeGrid="6,6,6,6" width="50" height="50" smoothing="true"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="44" height="44" smoothing="true"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_num" width="54" align="right" x="-4" y="34" backgroundColor="0xcfbeaf" style="普通说明"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public function MallBannelItemRenderUI()
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
