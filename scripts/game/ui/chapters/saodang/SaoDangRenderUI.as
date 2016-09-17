package game.ui.chapters.saodang
{
   import morn.core.components.View;
   
   public class SaoDangRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="257" height="137"/>;
       
      
      public function SaoDangRenderUI()
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
