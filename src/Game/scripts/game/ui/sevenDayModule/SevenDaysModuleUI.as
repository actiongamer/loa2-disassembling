package game.ui.sevenDayModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Tab;
   import morn.core.components.List;
   import morn.core.components.Image;
   import game.ui.sevenDayModule.view.DayRenderUI;
   
   public class SevenDaysModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="804" height="550">
			  <PanelBg x="0" y="0" width="804" height="550" showTabLine="false"/>
			  <Tab labels="\l999000588,\l999000589,\l999000590,\l999000591" x="228" y="36" selectedIndex="0" style="TAB超长" var="tabBar"/>
			  <List x="12" y="34" repeatY="7" spaceY="5" var="day_list">
			    <DayRender name="render" buttonMode="true" runtime="game.ui.sevenDayModule.view.DayRenderUI"/>
			  </List>
			  <Image skin="png.a5.bgs.panelBgs.img_bgS1" x="215" y="60" sizeGrid="18,18,18,18" width="578" height="479"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="313" y="32" var="img_redPoint1" visible="false"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="522" y="32" var="img_redPoint3" visible="false"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="418" y="32" var="img_redPoint2" visible="false"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="628" y="32" var="img_redPoint4" visible="false"/>
			</PopModuleView>;
       
      
      public var tabBar:Tab = null;
      
      public var day_list:List = null;
      
      public var img_redPoint1:Image = null;
      
      public var img_redPoint3:Image = null;
      
      public var img_redPoint2:Image = null;
      
      public var img_redPoint4:Image = null;
      
      public function SevenDaysModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.sevenDayModule.view.DayRenderUI"] = DayRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
