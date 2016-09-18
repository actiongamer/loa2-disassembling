package game.ui.logModules
{
   import morn.customs.components.TopModuleView;
   
   public class LogModuleUI extends TopModuleView
   {
      
      protected static var uiView:XML = <TopModuleView width="604" height="553">
			  <PanelBg x="0" y="0" width="589" height="551" panelDragEnabled="true"/>
			  <DebugPanel x="2" y="407" var="debugUI" runtime="game.ui.logModules.DebugPanelUI"/>
			</TopModuleView>;
       
      
      public var debugUI:game.ui.logModules.DebugPanelUI = null;
      
      public function LogModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.logModules.DebugPanelUI"] = game.ui.logModules.DebugPanelUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
