package game.ui.recommendHero.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class RecoTeamHeroRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="110" height="100" buttonMode="true">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="25" y="0" var="img_quality" sizeGrid="6,6,6,6" width="60" height="60"/>
			  <Image skin="png.comp.image" x="28" y="3" var="img_icon" width="54" height="54"/>
			  <Label autoSize="none" x="0" y="63" style="随品质变化" width="110" wordWrap="true" align="center" bold="false" height="19" var="txt_name" text="英雄名字名字"/>
			  <Label autoSize="none" x="0" y="81" style="随品质变化" width="110" wordWrap="true" align="center" bold="false" height="19" var="txt_yuanfen" text="激活缘分2/4"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_yuanfen:Label = null;
      
      public function RecoTeamHeroRenderUI()
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
