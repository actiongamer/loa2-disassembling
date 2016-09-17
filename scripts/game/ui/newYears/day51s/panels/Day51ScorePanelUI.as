package game.ui.newYears.day51s.panels
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.ProgressBar;
   import game.ui.newYears.day51s.renders.Day51ScoreRenderFakeUI;
   
   public class Day51ScorePanelUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="400">
			  <Image skin="png.a5.comps.img_block" x="-183" y="-73" var="img_avatar" autoSize="true" width="404" height="404"/>
			  <Image skin="png.uiFunnyCommon.img_list_bg" x="240" y="42"/>
			  <List x="245" y="79" var="list_gift" repeatY="7" spaceY="4" width="514">
			    <Day51ScoreRenderFake name="render" runtime="game.ui.newYears.day51s.renders.Day51ScoreRenderFakeUI"/>
			  </List>
			  <Label text="LV" autoSize="none" x="289" y="60" style="加底标题" width="59" align="center" var="txt_list_title_lv" height="20"/>
			  <Label text="Reward" autoSize="none" x="444" y="54" style="加底标题" width="59" align="center" var="txt_list_title_reward" height="20"/>
			  <Label text="Option" autoSize="none" x="616" y="54" style="加底标题" width="59" align="center" var="txt_list_title_option" height="20"/>
			  <Label text="Date Time CD" autoSize="none" x="244" y="3" style="普通说明" width="512" height="19" var="txt_cd" align="left"/>
			  <Label text="myScore" autoSize="none" x="244" y="22" style="小标题" width="107" height="19" var="txt_score"/>
			  <Image skin="png.uiFunnyCommon.img_list_line" x="255" y="77"/>
			  <Label text="tip1" autoSize="none" x="513" y="1" style="重要提示黄" width="253" height="19" var="txt_tip1" align="right" size="11"/>
			  <ProgressBar skin="png.a5.comps.progresses.progress_S9" x="369" y="25" var="progressBar"/>
			  <Label text="myScore" autoSize="none" x="425" y="23" style="小标题" width="203" height="19" var="txt_score_progress" align="center"/>
			</View>;
       
      
      public var img_avatar:Image = null;
      
      public var list_gift:List = null;
      
      public var txt_list_title_lv:Label = null;
      
      public var txt_list_title_reward:Label = null;
      
      public var txt_list_title_option:Label = null;
      
      public var txt_cd:Label = null;
      
      public var txt_score:Label = null;
      
      public var txt_tip1:Label = null;
      
      public var progressBar:ProgressBar = null;
      
      public var txt_score_progress:Label = null;
      
      public function Day51ScorePanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.newYears.day51s.renders.Day51ScoreRenderFakeUI"] = Day51ScoreRenderFakeUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
