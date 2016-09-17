package game.ui.heroAwakenRoad
{
   import morn.core.components.View;
   import morn.core.components.Image;
   
   public class HeroAwakenChapterRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="796" height="531">
			  <Image skin="png.a5.comps.img_block" var="img_bg" visible="true" smoothing="true" width="796" height="531"/>
			  <Image skin="png.a5.comps.img_block" var="img_line" visible="true" smoothing="true" anchorX=".5" anchorY=".5" centerX="0" centerY="0"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var img_line:Image = null;
      
      public function HeroAwakenChapterRenderUI()
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
