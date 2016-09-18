package game.ui.dailyTaskModules.view
{
   import morn.customs.components.FadeView;
   import morn.core.components.List;
   import morn.customs.components.ClipList;
   import morn.core.components.Label;
   import morn.core.components.ProgressBar;
   import game.ui.dailyTaskModules.TaskScoreRenderUI;
   import game.ui.commons.comps.others.TreasureBoxBaseRenderUI;
   import game.ui.dailyTaskModules.DailyTaskListRenderUI;
   
   public class DailyTaskViewUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="780" height="401">
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="0" y="86" width="784" height="373" sizeGrid="20,20,20,20"/>
			  <List x="7" y="96" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" height="359" var="list_task" width="772" spaceY="1">
			    <DailyTaskListRender name="render" runtime="game.ui.dailyTaskModules.DailyTaskListRenderUI"/>
			  </List>
			  <Image skin="png.uiDailyTask.积分底部" x="1" y="0"/>
			  <Label text="当前积分" x="3" y="25" style="重要提示橘黄" height="20" bold="true" align="right" width="117"/>
			  <ClipList value="89" align="left" url="png.a5.comps.clipList.clipList_S11" x="160" y="21" clipWidth="18" gapX="-2" var="cliplist_score"/>
			  <Label text="请配语言包" autoSize="none" x="14" y="54" style="普通说明" width="244" height="18" align="center" var="txt_tip"/>
			  <ProgressBar skin="png.a5.comps.progresses.progress_S9" x="305" y="46" sizeGrid="5,0,12,0" height="15" var="progressBar" value=".3" width="451"/>
			  <Label text="积分：120" autoSize="none" style="普通说明" width="96" height="18" align="center" name="item0" x="349" y="60" var="txt_score_0"/>
			  <Label text="积分：120" autoSize="none" x="435" style="普通说明" width="96" height="18" align="center" name="item1" y="60" var="txt_score_1"/>
			  <Label text="积分：120" autoSize="none" x="521" style="普通说明" width="96" height="18" align="center" name="item2" y="60" var="txt_score_2"/>
			  <Label text="积分：120" autoSize="none" x="609" style="普通说明" width="96" height="18" align="center" name="item3" y="60" var="txt_score_3"/>
			  <List x="375" y="16" var="list_chest">
			    <TreasureBoxBaseRender x="263" name="item3" y="3" runtime="game.ui.commons.comps.others.TreasureBoxBaseRenderUI"/>
			    <TreasureBoxBaseRender name="item0" x="3" y="0" runtime="game.ui.commons.comps.others.TreasureBoxBaseRenderUI"/>
			    <TreasureBoxBaseRender x="176" name="item2" y="3" runtime="game.ui.commons.comps.others.TreasureBoxBaseRenderUI"/>
			    <TreasureBoxBaseRender x="87" name="item1" y="1" runtime="game.ui.commons.comps.others.TreasureBoxBaseRenderUI"/>
			  </List>
			  <TaskScoreRender x="125" y="19" var="scoreRender1" runtime="game.ui.dailyTaskModules.TaskScoreRenderUI"/>
			  <TaskScoreRender x="273" y="38" var="scoreRender2" runtime="game.ui.dailyTaskModules.TaskScoreRenderUI"/>
			</FadeView>;
       
      
      public var list_task:List = null;
      
      public var cliplist_score:ClipList = null;
      
      public var txt_tip:Label = null;
      
      public var progressBar:ProgressBar = null;
      
      public var txt_score_0:Label = null;
      
      public var txt_score_1:Label = null;
      
      public var txt_score_2:Label = null;
      
      public var txt_score_3:Label = null;
      
      public var list_chest:List = null;
      
      public var scoreRender1:TaskScoreRenderUI = null;
      
      public var scoreRender2:TaskScoreRenderUI = null;
      
      public function DailyTaskViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.TreasureBoxBaseRenderUI"] = TreasureBoxBaseRenderUI;
         viewClassMap["game.ui.dailyTaskModules.DailyTaskListRenderUI"] = DailyTaskListRenderUI;
         viewClassMap["game.ui.dailyTaskModules.TaskScoreRenderUI"] = TaskScoreRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
