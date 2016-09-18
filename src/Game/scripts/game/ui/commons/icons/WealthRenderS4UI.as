package game.ui.commons.icons
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class WealthRenderS4UI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="50" height="49">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="0" y="-1" var="img_quality" sizeGrid="6,6,6,6"/>
			  <Image skin="png.comp.image" x="3" y="2" var="img_icon" width="44" height="44"/>
			  <Label text="1000" stroke="0xffffff" mouseEnabled="false" var="txt_countAndNeed" backgroundColor="0xcfbeaf" align="right" x="-36" y="30" width="84" height="20" style="随品质变化"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_countAndNeed:Label = null;
      
      public function WealthRenderS4UI()
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
