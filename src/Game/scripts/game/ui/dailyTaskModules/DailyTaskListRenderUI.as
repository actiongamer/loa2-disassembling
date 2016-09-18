package game.ui.dailyTaskModules
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS14UI;
   import morn.core.components.Button;
   import morn.core.components.CheckBox;
   import morn.customs.components.WealthList;
   import game.ui.commons.icons.WealthRenderS15UI;
   
   public class DailyTaskListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="755" height="88" name="render" buttonMode="false">
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgNormalS2" sizeGrid="16,16,16,16" width="751" height="84"/>
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgS3Selected" x="-4" y="-3" sizeGrid="10,10,10,10" width="759" height="91" name="selectBox1" var="img_selectedBg"/>
			  <Label text="任务名字任务名字任务名字任务名字任务名字" autoSize="left" x="81" y="11" style="重要提示橘黄" align="left" var="txt_title" size="14"/>
			  <Image skin="png.a5.commonImgs.img_finished" x="637" y="2" var="img_gotReward" language="en" lgx="615,637" lgy="2,2"/>
			  <Label text="5/5" autoSize="none" x="616" y="11" style="提示绿" align="center" var="txt_progress" width="118" height="18"/>
			  <Image skin="png.a5.commonImgs.小框分割线" x="80" y="31" width="519"/>
			  <WealthRenderS14 x="15" y="15" var="iconRender" runtime="game.ui.commons.icons.WealthRenderS14UI"/>
			  <Button label="领 取" y="36" style="按钮大绿" x="612" var="btn_go"/>
			  <Label text="字任务名字" autoSize="none" x="466" y="43" style="不足禁止红" align="right" var="txt_vipLimit" size="14" mouseEnabled="false" mouseChildren="false" width="276" height="20"/>
			  <Image skin="png.uiDailyTask.VIP标签" x="416" y="11" var="img_vipMark"/>
			  <Image skin="png.uiDailyTask.月卡标签" x="416" y="12" var="img_yueka"/>
			  <CheckBox label="FB" x="565" y="43.5" selected="true" style="CheckBox普通" visible="false" var="feedCheckBox"/>
			  <HBox x="83" y="44">
			    <Label text="奖励" autoSize="left" y="3" style="普通说明" align="left" width="100" height="18"/>
			    <WealthList x="85" repeatX="4" spaceX="30" var="list_reward" width="286" height="24">
			      <WealthRenderS15 name="render" runtime="game.ui.commons.icons.WealthRenderS15UI"/>
			    </WealthList>
			  </HBox>
			</View>;
       
      
      public var img_selectedBg:Image = null;
      
      public var txt_title:Label = null;
      
      public var img_gotReward:Image = null;
      
      public var txt_progress:Label = null;
      
      public var iconRender:WealthRenderS14UI = null;
      
      public var btn_go:Button = null;
      
      public var txt_vipLimit:Label = null;
      
      public var img_vipMark:Image = null;
      
      public var img_yueka:Image = null;
      
      public var feedCheckBox:CheckBox = null;
      
      public var list_reward:WealthList = null;
      
      public function DailyTaskListRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS14UI"] = WealthRenderS14UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS15UI"] = WealthRenderS15UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
