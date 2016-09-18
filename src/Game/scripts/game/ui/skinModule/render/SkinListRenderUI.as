package game.ui.skinModule.render
{
   import morn.core.components.View;
   
   public class SkinListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="207" height="117"/>;
       
      
      public function SkinListRenderUI()
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
