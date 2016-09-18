package game.ui.activities
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Tab;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS1UI;
   import game.ui.activities.render.ActivityRenderUI;
   
   public class ActivityModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="800" height="550">
			  <PanelBg x="-3" y="0" width="804" height="551" showTabLine="false"/>
			  <GRect fillAlpha="1" radius="0,0,0,0" lineAlpha="0" fillColor="0x0" width="772" height="473" x="14" y="63"/>
			  <Image skin="png.a5.bgs.panelBgs.img_frameS1" x="12" y="61" sizeGrid="14,18,14,14" width="777" height="477"/>
			  <Tab labels="\l60500000" x="28" y="37" style="TAB长" var="tab_title" selectedIndex="0"/>
			  <List x="20" y="70" repeatY="8" spaceY="6" var="list_activity">
			    <ActivityRender name="render" runtime="game.ui.activities.render.ActivityRenderUI"/>
			  </List>
			  <PageBarS1 x="53" y="501" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS1UI"/>
			</PopModuleView>;
       
      
      public var tab_title:Tab = null;
      
      public var list_activity:List = null;
      
      public var pageBarUI:PageBarS1UI = null;
      
      public function ActivityModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.activities.render.ActivityRenderUI"] = ActivityRenderUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS1UI"] = PageBarS1UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
