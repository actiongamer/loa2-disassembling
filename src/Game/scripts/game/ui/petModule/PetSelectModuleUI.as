package game.ui.petModule
{
   import morn.customs.components.PopModuleView;
   import game.ui.commons.comps.pageBars.PageBarS1UI;
   import morn.customs.components.WealthList;
   import game.ui.petModule.comps.PetSelectRenderUI;
   
   public class PetSelectModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="372" height="278">
			  <PanelBgS3 x="1" y="1" width="372" height="278" panelDragEnabled="false"/>
			  <PageBarS1 x="140" y="229" var="pageBarRef" runtime="game.ui.commons.comps.pageBars.PageBarS1UI"/>
			  <WealthList x="45" y="52" repeatX="4" repeatY="2" spaceX="28" var="list_pet" spaceY="26" visible="true">
			    <PetSelectRender name="render" runtime="game.ui.petModule.comps.PetSelectRenderUI"/>
			  </WealthList>
			</PopModuleView>;
       
      
      public var pageBarRef:PageBarS1UI = null;
      
      public var list_pet:WealthList = null;
      
      public function PetSelectModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS1UI"] = PageBarS1UI;
         viewClassMap["game.ui.petModule.comps.PetSelectRenderUI"] = PetSelectRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
