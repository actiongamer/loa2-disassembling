package game.ui.newerGuideModules
{
   import morn.customs.components.TopModuleView;
   import game.ui.commons.comps.others.NewerGuideCommonRenderUI;
   
   public class NewerGuideModuleUI extends TopModuleView
   {
      
      protected static var uiView:XML = <TopModuleView width="1000" height="600">
			  <NewerGuideNPCSay x="0" bottom="40" var="sayCompUI" runtime="game.ui.newerGuideModules.NewerGuideNPCSayUI"/>
			  <NewerGuideSkip x="828" y="527" var="uiSkip" runtime="game.ui.newerGuideModules.NewerGuideSkipUI"/>
			  <NewerGuideCommonRender x="537" y="60" var="arrowCompUI" runtime="game.ui.commons.comps.others.NewerGuideCommonRenderUI"/>
			</TopModuleView>;
       
      
      public var sayCompUI:game.ui.newerGuideModules.NewerGuideNPCSayUI = null;
      
      public var uiSkip:game.ui.newerGuideModules.NewerGuideSkipUI = null;
      
      public var arrowCompUI:NewerGuideCommonRenderUI = null;
      
      public function NewerGuideModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.NewerGuideCommonRenderUI"] = NewerGuideCommonRenderUI;
         viewClassMap["game.ui.newerGuideModules.NewerGuideNPCSayUI"] = game.ui.newerGuideModules.NewerGuideNPCSayUI;
         viewClassMap["game.ui.newerGuideModules.NewerGuideSkipUI"] = game.ui.newerGuideModules.NewerGuideSkipUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
