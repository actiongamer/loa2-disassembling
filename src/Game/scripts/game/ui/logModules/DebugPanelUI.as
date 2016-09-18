package game.ui.logModules
{
   import morn.core.components.View;
   import morn.core.components.Tab;
   import morn.core.components.TextInput;
   import morn.core.components.CheckBox;
   
   public class DebugPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="512" height="130">
			  <Tab labels="label1,label2" skin="png.comp.tab" x="2" y="23" var="btns_test"/>
			  <HBox x="2" y="2">
			    <TextInput text="TextInput" skin="png.comp.textinput" var="txt0"/>
			    <TextInput text="TextInput" skin="png.comp.textinput" var="txt1"/>
			    <TextInput text="TextInput" skin="png.comp.textinput" var="txt2"/>
			    <TextInput text="TextInput" skin="png.comp.textinput" var="txt3"/>
			  </HBox>
			  <Tab labels="label1,label2" skin="png.comp.tab" x="2" y="75" var="btns_test2"/>
			  <Tab labels="label1,label2" skin="png.comp.tab" x="2" y="101" var="btns_test3"/>
			  <CheckBox label="label" skin="png.comp.checkbox" x="519" y="4" var="checkBox_dev"/>
			  <Tab labels="label1,label2" skin="png.comp.tab" x="2" y="48" var="btns_test1"/>
			</View>;
       
      
      public var btns_test:Tab = null;
      
      public var txt0:TextInput = null;
      
      public var txt1:TextInput = null;
      
      public var txt2:TextInput = null;
      
      public var txt3:TextInput = null;
      
      public var btns_test2:Tab = null;
      
      public var btns_test3:Tab = null;
      
      public var checkBox_dev:CheckBox = null;
      
      public var btns_test1:Tab = null;
      
      public function DebugPanelUI()
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
