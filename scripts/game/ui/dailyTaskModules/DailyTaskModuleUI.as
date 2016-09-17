package game.ui.dailyTaskModules
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Tab;
   import morn.core.components.Image;
   
   public class DailyTaskModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="810" height="556">
			  <PanelBg x="4" y="0" width="805" height="556" showTabLine="true"/>
			  <Tab labels="每日任务,成就,资源挽回" x="33" y="40" style="TAB超长" var="tabBar" selectedIndex="0"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="221" y="36" var="img_redPoint2"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="117" y="36" var="img_redPoint1"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="327" y="36" var="img_redPoint3"/>
			</PopModuleView>;
       
      
      public var tabBar:Tab = null;
      
      public var img_redPoint2:Image = null;
      
      public var img_redPoint1:Image = null;
      
      public var img_redPoint3:Image = null;
      
      public function DailyTaskModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
