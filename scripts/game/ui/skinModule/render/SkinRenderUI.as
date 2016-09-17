package game.ui.skinModule.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   
   public class SkinRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="55" height="55" buttonMode="true">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_1" x="0" y="0" var="img_quality" sizeGrid="6,6,6,6" scale="1.1"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="44" height="44" scale="1.1"/>
			  <Image skin="png.a5.commonImgs.勾选框-对勾" x="19" y="24" var="img_equiped"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var img_equiped:Image = null;
      
      public function SkinRenderUI()
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
