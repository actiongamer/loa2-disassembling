package game.ui.petModule.comps
{
   import morn.customs.components.FadeView;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS3UI;
   
   public class PetSelectPanelUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="68" height="450">
			  <List y="53" repeatY="5" var="list_pet" spaceY="1">
			    <PetListRender name="render" buttonMode="true" runtime="game.ui.petModule.comps.PetListRenderUI"/>
			  </List>
			  <PageBarS3 x="8" height="450" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS3UI"/>
			</FadeView>;
       
      
      public var list_pet:List = null;
      
      public var pageBarUI:PageBarS3UI = null;
      
      public function PetSelectPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS3UI"] = PageBarS3UI;
         viewClassMap["game.ui.petModule.comps.PetListRenderUI"] = PetListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
