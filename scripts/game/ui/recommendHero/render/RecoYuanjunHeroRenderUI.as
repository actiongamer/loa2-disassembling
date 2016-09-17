package game.ui.recommendHero.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class RecoYuanjunHeroRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="48" height="60" buttonMode="true">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="0" y="-1" var="img_quality" sizeGrid="6,6,6,6" width="48" height="48"/>
			  <Image skin="png.comp.image" x="2" y="2" var="img_icon" width="43" height="43"/>
			  <Label autoSize="none" x="-54.5" y="50" style="随品质变化" width="157" wordWrap="true" align="center" bold="false" height="19" var="txt_name" text="英雄名字名字"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public function RecoYuanjunHeroRenderUI()
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
