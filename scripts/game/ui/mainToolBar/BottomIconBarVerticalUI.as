package game.ui.mainToolBar
{
   import morn.core.components.View;
   
   public class BottomIconBarVerticalUI extends View
   {
      
      protected static var uiView:XML = <View width="65" height="65">
			  <BottomIconRender runtime="game.ui.mainToolBar.BottomIconRenderUI"/>
			</View>;
       
      
      public function BottomIconBarVerticalUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.mainToolBar.BottomIconRenderUI"] = BottomIconRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
