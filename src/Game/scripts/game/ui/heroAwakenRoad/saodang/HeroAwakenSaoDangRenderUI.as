package game.ui.heroAwakenRoad.saodang
{
   import morn.core.components.View;
   
   public class HeroAwakenSaoDangRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="257" height="137"/>;
       
      
      public function HeroAwakenSaoDangRenderUI()
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
