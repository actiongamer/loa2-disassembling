package game.ui.logModules
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Tab;
   
   public class TestModule2UI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="600" height="400">
			  <PanelBg x="0" y="0"/>
			  <Tab labels="label1,label2" skin="png.comp.tab" x="50" y="62" var="tab"/>
			  <Label text="2" autoSize="left" x="173" y="192" size="48" color="0x00FF00" bold="true"/>
			</PopModuleView>;
       
      
      public var tab:Tab = null;
      
      public function TestModule2UI()
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
