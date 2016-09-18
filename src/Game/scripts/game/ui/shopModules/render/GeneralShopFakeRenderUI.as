package game.ui.shopModules.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   
   public class GeneralShopFakeRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="296" height="93">
			  <Image skin="png.a5.comps.img_block" var="img_bg" left="4" x="0" y="-1" width="296" height="93"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public function GeneralShopFakeRenderUI()
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
