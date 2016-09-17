package game.ui.logModules
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.TextInput;
   
   public class Param3DRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="80" height="24">
			  <Label text="X:" autoSize="left" x="0" y="-2" size="18" color="0xFFFF00" var="txt_name"/>
			  <TextInput text="999.99" skin="png.comp.textinput" x="24" y="1" width="53" height="22" var="txt_value" color="0x6666FF" size="14" align="center" restrict="\-0-9."/>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public var txt_value:TextInput = null;
      
      public function Param3DRenderUI()
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
