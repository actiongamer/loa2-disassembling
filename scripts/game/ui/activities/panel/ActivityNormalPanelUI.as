package game.ui.activities.panel
{
   import morn.customs.components.PanelView;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.List;
   import morn.core.components.Box;
   import morn.core.components.ProgressBar;
   import morn.core.components.Button;
   import morn.core.components.Panel;
   import game.ui.activities.render.ActivityProgressRenderUI;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class ActivityNormalPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="593" height="467">
			  <Image skin="png.uiActivity.img_titleInitBg" x="299" y="144" var="img_bg" anchorX="0.5" anchorY="0.5" width="597" height="288"/>
			  <Image skin="png.uiActivity.蓝光" x="-16" y="22"/>
			  <Image skin="png.uiActivity.img_bg" x="2" y="148"/>
			  <Label autoSize="none" x="18" y="60" style="小标题" width="374" align="left" height="20" var="txt_activityTime" text="活动时间：无"/>
			  <Label autoSize="none" x="18" y="81" style="小标题" width="368" align="left" height="20" var="txt_rewardTime" text="领奖时间：无"/>
			  <Label autoSize="none" x="380" y="60" style="普通绿色" align="left" var="txt_leftTime" wordWrap="true" multiline="true" width="185" language="en" lgx="380,380" lgy="60,89"/>
			  <Label autoSize="none" x="12" y="10" style="渐变1" width="532" height="41" align="left" size="28" var="txt_activityName"/>
			  <List x="7" y="152" repeatY="4" spaceY="-3" var="list_task" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" width="580" height="303">
			    <ActivityProgressRender name="render" runtime="game.ui.activities.render.ActivityProgressRenderUI"/>
			  </List>
			  <Box x="34" y="50" var="box_repeatCharge">
			    <ProgressBar skin="png.a5.commonImgs.progress.progress" x="114" y="258" var="progress"/>
			    <Image skin="png.a5.commonImgs.progress.out_frame" x="94" y="272"/>
			    <Label text="pageBarS2" autoSize="none" y="141" style="普通说明" width="174" height="20" var="txt_curCharge" align="center"/>
			    <Label text="pageBarS2" autoSize="none" x="169" y="141" style="普通说明" width="183" height="20" var="txt_totalCharge" align="center"/>
			    <Label text="pageBarS2" autoSize="none" x="366" y="141" style="普通说明" width="164" height="20" var="txt_totalTimes" align="center"/>
			    <Label text="pageBarS2" autoSize="none" x="2" y="317" style="渐变1" width="520" height="26" align="center" var="txt_curTimes"/>
			    <List x="115" y="356" repeatX="5" width="278" height="51" spaceX="10" var="list_reward">
			      <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			    </List>
			    <Button label="\l41300099" x="422" y="364" style="按钮大绿" var="btn_getReward"/>
			    <Button label="\l12110016" x="392" style="按钮大蓝充值" var="btn_charge" y="-42"/>
			    <Label text="pageBarS2" autoSize="none" x="206" y="278" style="普通说明" width="135" height="20" var="txt_progress" align="center"/>
			    <List x="115" y="187" repeatX="5" width="278" height="51" spaceX="10" var="list_reward_base">
			      <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			    </List>
			    <Image skin="png.a5.commonImgs.img_splitLine" x="29" y="250"/>
			    <Label autoSize="none" x="115" y="219" style="普通说明" width="272" height="20" text="\l999902580" var="txt_tip"/>
			  </Box>
			  <Panel x="18" y="104" width="569" height="36" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" var="panel_rule">
			    <Label autoSize="none" style="小标题" align="left" var="txt_rule" wordWrap="true" multiline="true" width="549" text="无" x="0" y="0"/>
			  </Panel>
			</PanelView>;
       
      
      public var img_bg:Image = null;
      
      public var txt_activityTime:Label = null;
      
      public var txt_rewardTime:Label = null;
      
      public var txt_leftTime:Label = null;
      
      public var txt_activityName:Label = null;
      
      public var list_task:List = null;
      
      public var box_repeatCharge:Box = null;
      
      public var progress:ProgressBar = null;
      
      public var txt_curCharge:Label = null;
      
      public var txt_totalCharge:Label = null;
      
      public var txt_totalTimes:Label = null;
      
      public var txt_curTimes:Label = null;
      
      public var list_reward:List = null;
      
      public var btn_getReward:Button = null;
      
      public var btn_charge:Button = null;
      
      public var txt_progress:Label = null;
      
      public var list_reward_base:List = null;
      
      public var txt_tip:Label = null;
      
      public var panel_rule:Panel = null;
      
      public var txt_rule:Label = null;
      
      public function ActivityNormalPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.activities.render.ActivityProgressRenderUI"] = ActivityProgressRenderUI;
         viewClassMap["game.ui.commons.icons.WealthRenderS5UI"] = WealthRenderS5UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
