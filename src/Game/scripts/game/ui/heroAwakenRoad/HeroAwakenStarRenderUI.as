package game.ui.heroAwakenRoad
{
   import morn.core.components.View;
   import morn.core.components.Image;
   
   public class HeroAwakenStarRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="28" height="27">
			  <Image skin="png.uiHeroAwakenRoad.img_star" var="img_star" smoothing="true" scale="0.91" x="14" y="13" autoSize="true" anchorX="0.5" anchorY="0.5"/>
			</View>;
       
      
      public var img_star:Image = null;
      
      public function HeroAwakenStarRenderUI()
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
