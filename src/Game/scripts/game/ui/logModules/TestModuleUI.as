package game.ui.logModules
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   
   public class TestModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="600" height="400">
			  <List x="37" y="62" repeatX="2" repeatY="2" width="389" height="205" spaceX="6" spaceY="6" var="list_1" name="list_1">
			    <Param3DRender name="render" runtime="game.ui.logModules.Param3DRenderUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var list_1:List = null;
      
      public function TestModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.logModules.Param3DRenderUI"] = Param3DRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
