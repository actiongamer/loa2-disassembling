package game.ui.logModules
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class TestAccordionContentRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="140" height="28">
			  <Image skin="png.a5.comps.lists.img_selectBox0S1" x="0" y="0" width="140" height="28"/>
			  <Label text="label" autoSize="left" x="43" y="6" var="txt2" width="53" height="18" color="0xbcbcbc"/>
			</View>;
       
      
      public var txt2:Label = null;
      
      public function TestAccordionContentRenderUI()
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
