package game.ui.mainToolBar
{
   import morn.core.components.View;
   
   public class ExpBarRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="2" height="3">
			  <Image skin="png.uiMainToolBar.隔条"/>
			</View>;
       
      
      public function ExpBarRenderUI()
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
