package game.ui.fashionModules
{
   import morn.core.components.View;
   
   public class FashionListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="207" height="117"/>;
       
      
      public function FashionListRenderUI()
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
