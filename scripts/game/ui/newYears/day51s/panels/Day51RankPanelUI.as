package game.ui.newYears.day51s.panels
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.newYears.day51s.renders.Day51RankRenderFakeUI;
   
   public class Day51RankPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="813" height="490">
			  <Image skin="png.a5.comps.img_block" x="-310" y="-73" var="img_avatar" autoSize="true" width="367" height="378"/>
			  <Image skin="png.uiFunnyCommon.img_list_bg" x="84" y="42" width="689" height="400"/>
			  <Label text="Date Time CD" autoSize="none" x="90" y="2" style="普通说明" width="554" height="19" var="txt_cd" align="left"/>
			  <List x="79" y="79" var="list_gift" repeatY="5" spaceY="1" width="689" height="354">
			    <Day51RankRenderFake name="render" runtime="game.ui.newYears.day51s.renders.Day51RankRenderFakeUI"/>
			  </List>
			  <Label text="lv.4" autoSize="none" x="563" y="2" style="小标题" width="188" height="22" align="right" var="txt_tree_lv"/>
			  <Label text="tip1" autoSize="none" x="90" y="20" style="重要提示黄" width="554" height="25" var="txt_tip2" align="left" size="14"/>
			  <Box x="116" y="52">
			    <Label text="LV" autoSize="none" x="31" style="加底标题" width="59" align="center" var="txt_list_title_lv" height="20"/>
			    <Label text="score" autoSize="none" x="134" style="加底标题" width="59" align="center" var="txt_list_title_score" height="20"/>
			    <Label text="reward" autoSize="none" x="275" style="加底标题" width="59" align="center" var="txt_list_title_reward" height="20"/>
			    <Image skin="png.uiFunnyCommon.img_list_line" y="25" width="630"/>
			    <Label text="reward_super" autoSize="none" x="458" style="加底标题" width="208" align="center" var="txt_list_title_reward_super" height="20" y="0" language="en" lgx="428,458,458,458,458,458,458,458"/>
			  </Box>
			  <Label text="tip1" autoSize="none" x="530" y="21" style="小标题" width="222" height="19" var="txt_tip1" align="right" size="11"/>
			</View>;
       
      
      public var img_avatar:Image = null;
      
      public var txt_cd:Label = null;
      
      public var list_gift:List = null;
      
      public var txt_tree_lv:Label = null;
      
      public var txt_tip2:Label = null;
      
      public var txt_list_title_lv:Label = null;
      
      public var txt_list_title_score:Label = null;
      
      public var txt_list_title_reward:Label = null;
      
      public var txt_list_title_reward_super:Label = null;
      
      public var txt_tip1:Label = null;
      
      public function Day51RankPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.newYears.day51s.renders.Day51RankRenderFakeUI"] = Day51RankRenderFakeUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
