package game.ui.dailyTaskModules.view
{
   import morn.customs.components.FadeView;
   import morn.core.components.List;
   import game.ui.dailyTaskModules.DailyTaskListRenderUI;
   
   public class AchiveTaskViewUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="772" height="400">
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" width="784" height="460" sizeGrid="20,20,20,20" x="0" y="-1"/>
			  <List x="7" y="7" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" height="441" var="list_task" width="772" spaceY="1">
			    <DailyTaskListRender name="render" runtime="game.ui.dailyTaskModules.DailyTaskListRenderUI"/>
			  </List>
			</FadeView>;
       
      
      public var list_task:List = null;
      
      public function AchiveTaskViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.dailyTaskModules.DailyTaskListRenderUI"] = DailyTaskListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
