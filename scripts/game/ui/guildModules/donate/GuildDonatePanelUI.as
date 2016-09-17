package game.ui.guildModules.donate
{
   import morn.customs.components.FadeView;
   import morn.core.components.ProgressBar;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.comps.others.TreasureBoxBaseRenderUI;
   
   public class GuildDonatePanelUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="600" height="400">
			  <Image skin="jpg.uiGuildModule.donate.捐献底部" x="2" y="2"/>
			  <ProgressBar skin="png.a5.comps.progresses.progress_S9" x="233" y="123" sizeGrid="5,0,12,0" height="15" var="progressBar" value=".3" width="479"/>
			  <Label text="积分：120" autoSize="none" x="429" style="普通说明" width="96" height="18" align="center" name="item1" y="138" var="txt_score_1"/>
			  <Label text="积分：120" autoSize="none" x="548" style="普通说明" width="96" height="18" align="center" name="item2" y="138" var="txt_score_2"/>
			  <Label text="积分：120" autoSize="none" x="659" style="普通说明" width="96" height="18" align="center" name="item3" y="138" var="txt_score_3"/>
			  <List x="337" y="96" var="list_chest">
			    <TreasureBoxBaseRender x="339" name="item3" y="4" runtime="game.ui.commons.comps.others.TreasureBoxBaseRenderUI"/>
			    <TreasureBoxBaseRender name="item0" runtime="game.ui.commons.comps.others.TreasureBoxBaseRenderUI"/>
			    <TreasureBoxBaseRender x="229" name="item2" y="4" runtime="game.ui.commons.comps.others.TreasureBoxBaseRenderUI"/>
			    <TreasureBoxBaseRender x="113" name="item1" y="0" runtime="game.ui.commons.comps.others.TreasureBoxBaseRenderUI"/>
			  </List>
			  <Label text="积分：120" autoSize="none" style="普通说明" width="96" height="18" align="center" name="item0" x="308" y="138" var="txt_score_0"/>
			  <Label text="\l40700013 " autoSize="left" x="227" y="64" style="普通说明"/>
			  <Label text="50" autoSize="left" x="310" y="64" style="普通说明" width="45" height="18" var="txt_conValue" language="en" lgx="330,310" lgy="64,64"/>
			  <List x="228" y="174" repeatX="3" spaceX="-4" var="list_donate">
			    <DonateListRender name="render" runtime="game.ui.guildModules.donate.DonateListRenderUI"/>
			  </List>
			  <DonateNoticeDialog x="177" y="10" var="donateDialog" mouseEnabled="false" mouseChildren="false" language="en" lgx="177,177" lgy="3,10" runtime="game.ui.guildModules.donate.DonateNoticeDialogUI"/>
			  <Label text="\l40700047 " autoSize="left" x="232" y="432" style="普通说明" height="19" language="ru" lgx="232,232,232,232,232,232,232,232" lgy="432,432,432,432,432,432,432,422"/>
			  <Label text="50" autoSize="left" x="293" y="432" style="普通说明" width="163" height="18" var="txt_level" language="ru" lgx="300,293,300,300,300,300,300,300" lgy="432,432,432,432,432,432,432,422"/>
			  <Label text=" Lv.@{value} 公会当日最多可获得&lt;font color='#fff300'>@{value}&lt;/font>次公会经验" autoSize="none" x="348" y="432" style="普通说明" var="txt_expLimit" align="right" width="400" height="20" language="ru" lgx="348,348,348,348,348,348,348,348" lgy="432,432,432,432,432,432,432,440"/>
			  <Box x="517" y="12" lgx="517,517,517,517,517,517,517,527" lgy="12,12,12,12,12,12,12,12" language="ru">
			    <Label text="\l40700046 " autoSize="none" style="普通说明" width="200" align="right"/>
			    <Label text="50" autoSize="left" x="203" style="普通说明" height="18" var="txt_coin"/>
			    <Label text="\l40700014" autoSize="none" y="21" style="普通说明" width="200" height="20" align="right"/>
			    <Label text="1000000" autoSize="left" x="203" y="21" style="普通说明" height="18" var="txt_myContr"/>
			  </Box>
			</FadeView>;
       
      
      public var progressBar:ProgressBar = null;
      
      public var txt_score_1:Label = null;
      
      public var txt_score_2:Label = null;
      
      public var txt_score_3:Label = null;
      
      public var list_chest:List = null;
      
      public var txt_score_0:Label = null;
      
      public var txt_conValue:Label = null;
      
      public var list_donate:List = null;
      
      public var donateDialog:game.ui.guildModules.donate.DonateNoticeDialogUI = null;
      
      public var txt_level:Label = null;
      
      public var txt_expLimit:Label = null;
      
      public var txt_coin:Label = null;
      
      public var txt_myContr:Label = null;
      
      public function GuildDonatePanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.TreasureBoxBaseRenderUI"] = TreasureBoxBaseRenderUI;
         viewClassMap["game.ui.guildModules.donate.DonateListRenderUI"] = DonateListRenderUI;
         viewClassMap["game.ui.guildModules.donate.DonateNoticeDialogUI"] = game.ui.guildModules.donate.DonateNoticeDialogUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
