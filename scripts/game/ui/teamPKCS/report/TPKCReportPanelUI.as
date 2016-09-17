package game.ui.teamPKCS.report
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   
   public class TPKCReportPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="456" height="550">
			  <PanelBg x="0" y="0" width="456" height="550"/>
			  <List x="14" y="39" var="list_item" width="429" height="490">
			    <TPKCReportRender name="render" runtime="game.ui.teamPKCS.report.TPKCReportRenderUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var list_item:List = null;
      
      public function TPKCReportPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.teamPKCS.report.TPKCReportRenderUI"] = TPKCReportRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
