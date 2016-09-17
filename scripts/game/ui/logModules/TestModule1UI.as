package game.ui.logModules
{
   import morn.customs.components.PopModuleView;
   
   public class TestModule1UI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="600" height="400"/>;
       
      
      public function TestModule1UI()
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
