package game.ui.horseModules.horseChange
{
   import morn.customs.components.FadeView;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS3UI;
   
   public class HorseSelectPanelUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="68" height="450">
			  <List y="53" repeatY="5" var="list_horse" spaceY="1">
			    <HorseListRender name="render" buttonMode="true" runtime="game.ui.horseModules.horseChange.HorseListRenderUI"/>
			  </List>
			  <PageBarS3 x="8" height="450" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS3UI"/>
			</FadeView>;
       
      
      public var list_horse:List = null;
      
      public var pageBarUI:PageBarS3UI = null;
      
      public function HorseSelectPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS3UI"] = PageBarS3UI;
         viewClassMap["game.ui.horseModules.horseChange.HorseListRenderUI"] = HorseListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
