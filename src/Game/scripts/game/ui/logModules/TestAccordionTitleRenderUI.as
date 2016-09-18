package game.ui.logModules
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class TestAccordionTitleRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="101" height="27">
			  <RadioButton skin="png.a5.btns.radio_S1" x="1" y="3"/>
			  <Label text="label" autoSize="left" x="32" y="4" var="txt1" width="53" height="18" color="0xFFFF00" size="16"/>
			</View>;
       
      
      public var txt1:Label = null;
      
      public function TestAccordionTitleRenderUI()
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
