package game.ui.newYears.day51s.panels
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS1UI;
   import game.ui.newYears.day51s.renders.Day51HelpRenderUI;
   
   public class Day51HelpModule1UI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="700" height="540">
			  <PanelBg x="0" y="0" left="0" right="0" top="0" bottom="0"/>
			  <List x="8" y="30" var="list_content">
			    <Day51HelpRender name="render" runtime="game.ui.newYears.day51s.renders.Day51HelpRenderUI"/>
			  </List>
			  <PageBarS1 x="303" y="297" var="pageBarUI" bottom="12" runtime="game.ui.commons.comps.pageBars.PageBarS1UI"/>
			</PopModuleView>;
       
      
      public var list_content:List = null;
      
      public var pageBarUI:PageBarS1UI = null;
      
      public function Day51HelpModule1UI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS1UI"] = PageBarS1UI;
         viewClassMap["game.ui.newYears.day51s.renders.Day51HelpRenderUI"] = Day51HelpRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
