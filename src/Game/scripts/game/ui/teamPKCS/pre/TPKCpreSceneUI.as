package game.ui.teamPKCS.pre
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.Image;
   import game.ui.commons.comps.pageBars.PageBarS1UI;
   import morn.core.components.List;
   import morn.core.components.Tab;
   import morn.customs.components.ClipList;
   
   public class TPKCpreSceneUI extends View
   {
      
      protected static var uiView:XML = <View width="800" height="600" left="0" right="0" top="0" bottom="0">
			  <Box x="-121" y="-78" top="0" var="box_top" centerX="0">
			    <Image skin="png.uiTeamPKCS.img_title0" x="70"/>
			    <Image skin="png.uiTeamPKCS.img_vs" y="116"/>
			    <Label text="普通说明" autoSize="none" x="224" y="121" style="普通说明" width="384" height="20" align="center" var="txt_time"/>
			    <Label text="普通说明" autoSize="none" x="83" y="139" style="普通说明" width="180" height="20" align="left" var="txt_l0"/>
			    <Label text="普通说明" autoSize="none" x="603" y="139" style="普通说明" width="180" height="20" align="left" var="txt_r0"/>
			    <Label text="普通说明" autoSize="none" x="603" y="185" style="普通说明" width="194" height="58" align="left" var="txt_r3" multiline="true" wordWrap="true"/>
			    <Label text="普通说明" autoSize="none" x="83" y="185" style="普通说明" width="180" height="58" align="left" var="txt_l3" multiline="true" wordWrap="true"/>
			    <Label text="\l999900255" autoSize="none" x="51" y="27" style="渐变1" width="726" align="center" size="48" bold="true" height="65"/>
			    <Label text="\l999900271" autoSize="none" x="133" y="89" style="渐变2" width="562" height="26" align="center" size="20" var="digiDayTxt"/>
			    <HBox x="83" y="160">
			      <Label text="\l999900286" autoSize="none" y="2" style="普通说明" height="20" align="left" var="txt_l1"/>
			      <Label text="渐变1" autoSize="none" x="75" style="渐变1" width="104" height="24" align="left" size="16" var="left_pow"/>
			    </HBox>
			    <HBox x="603" y="159">
			      <Label text="\l999900286" autoSize="none" y="2" style="普通说明" height="20" align="left" var="txt_r1"/>
			      <Label text="渐变1" autoSize="none" x="75" style="渐变1" width="104" height="24" align="left" size="16" var="right_pow"/>
			    </HBox>
			  </Box>
			  <Box x="61" y="388" bottom="0" var="box_bottom" centerX="0">
			    <Image skin="png.uiTeamPKCS.img_bg0" x="0" y="0"/>
			    <Button label="按钮" y="19" style="按钮中红" x="449" var="btn_change"/>
			    <Button label="按钮" y="19" style="按钮中红" x="186" var="btn_changeOrder"/>
			    <Image skin="png.uiTeamPKCS.img_bg1" x="226" y="89"/>
			    <Label text="加底标题" autoSize="none" x="286" y="114" style="加底标题" width="117" height="20" var="txt_fight_time"/>
			    <Button skin="png.a5.comps.numBars.btn_plus" x="403" y="113" stateNum="1" var="btn_addTime"/>
			    <Button label="按钮" x="299" style="按钮大绿" y="15.5" var="btn_fight"/>
			    <Label text="普通说明" autoSize="none" x="268" y="142" style="普通说明" width="174" height="20" align="center" var="fight_time_tip"/>
			  </Box>
			  <Box x="328" y="90" var="rank_panel" top="200" left="0">
			    <Image skin="png.uiTeamPKCS.img_rank_bg" var="img_rank_bg" sizeGrid="10,10,10,10" width="272" height="326" alpha="0.9"/>
			    <Image skin="png.uiTeamPKCS.img_list_top" y="27" x="0" width="268" height="27"/>
			    <Box y="148" var="left_dock" x="267">
			      <Button skin="png.uiTeamPKCS.btn_dock" stateNum="1" var="btn_left_dock" x="0" y="0" width="21" height="34"/>
			      <Image skin="png.uiTeamPKCS.img_dock" y="17" mouseEnabled="false" mouseChildren="false" var="img_dock_left" anchorX=".5" anchorY=".5" x="10"/>
			    </Box>
			    <Label text="\l999900289" autoSize="none" x="4" y="55" style="加底标题" var="tt0"/>
			    <Label text="\l999900290" autoSize="none" x="71" y="54" style="加底标题" width="49" height="20" align="left" var="tt1"/>
			    <Box x="72" y="285" var="box_rank_button">
			      <PageBarS1 x="7" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS1UI"/>
			      <Button skin="png.uiTeamPKCS.btn_next" x="102" y="1" stateNum="1" var="btn_next_more"/>
			      <Button skin="png.uiTeamPKCS.btn_next" y="1" stateNum="1" scaleX="-1" var="btn_prev_more"/>
			    </Box>
			    <Label text="\l50800047" autoSize="none" x="26" y="10" style="渐变1" width="203" height="22" align="center" size="14" var="txt_left_day"/>
			    <Label text="\l999900291" autoSize="none" x="141" y="55" style="加底标题" align="left" var="tt2"/>
			    <Label text="\l999900292" autoSize="none" x="211" y="55" style="加底标题" align="left" var="tt3" width="53" height="20"/>
			    <Image skin="png.uiTeamPKCS.img_rank_line_5" x="0" y="74" width="266" height="201"/>
			    <List x="0" y="73" repeatY="5" spaceY="6" var="list_rank">
			      <TPKCRankRender name="render" runtime="game.ui.teamPKCS.pre.TPKCRankRenderUI"/>
			    </List>
			    <Tab x="1" y="30" style="TAB暗红色" labels="排名,队伍战况" selectedIndex="1" var="tab"/>
			    <Label text="\l999900293" autoSize="none" x="0" y="289" style="普通说明" height="20" align="center" var="left_my_tip" width="263"/>
			  </Box>
			  <Box x="574" y="216" right="0" var="box_reward">
			    <Image skin="png.uiTeamPKCS.img_rank_bg" sizeGrid="10,10,10,10" width="220" height="314" x="223" scaleX="-1"/>
			    <Label text="\l50800055" autoSize="none" y="10" style="渐变1" width="203" height="22" align="center" size="14" x="11" var="right_small_title"/>
			    <Label text="普通说明" autoSize="none" x="24" y="246" style="普通说明" width="174" height="20" align="center" var="txt_fight_tip"/>
			    <Button label="按钮" x="70" y="271" style="按钮中绿" var="btn_fight_award"/>
			    <Image skin="png.uiTeamPKCS.img_rank_line_5" y="36" width="212" height="199" x="9"/>
			    <List y="31" repeatY="5" spaceY="-1" x="10" var="list_time_reward">
			      <TPKCawardRender name="render" runtime="game.ui.teamPKCS.pre.TPKCawardRenderUI"/>
			    </List>
			    <Box y="131" var="right_dock" width="7" height="34" x="0">
			      <Button skin="png.uiTeamPKCS.btn_dock" stateNum="1" var="btn_right_dock" x="8" width="21" height="34" scaleX="-1"/>
			      <Image skin="png.uiTeamPKCS.img_dock" y="17" mouseEnabled="false" mouseChildren="false" var="img_dock_right" anchorX=".5" anchorY=".5" rotation="180" x="-1"/>
			    </Box>
			  </Box>
			  <Box x="-16" y="42" top="0" var="box_fight_top" centerX="0">
			    <Image skin="png.uiTeamPKCS.img_title1" x="115" y="0"/>
			    <Image skin="png.uiTeamPKCS.img_vs" y="58"/>
			    <Label text="普通说明" autoSize="none" x="87" y="78" style="普通说明" width="155" height="20" align="left" var="txt_l_name"/>
			    <Label text="普通说明" autoSize="none" x="607" y="78" style="普通说明" width="155" height="20" align="left" var="txt_r_name"/>
			    <Image skin="png.a5.bgs.iconBgs.img_iconBgSkillS1" x="89" y="128" sizeGrid="22,22,22,22"/>
			    <Image skin="png.a5.bgs.iconBgs.img_iconBgSkillS1" x="609" y="128" sizeGrid="22,22,22,22"/>
			    <Image skin="png.comp.image" x="92" y="130" width="40" height="40" var="buff_left" smoothing="true"/>
			    <Image skin="png.comp.image" x="612" y="130" width="40" height="40" var="buff_right" smoothing="true"/>
			    <Label text="1" autoSize="none" x="100" y="154" style="普通说明" height="19" var="buff_num_left" width="32" align="right"/>
			    <Label text="1" autoSize="none" x="620" y="154" style="普通说明" height="19" var="buff_num_right" width="32" align="right"/>
			    <Label text="争霸赛第9场" autoSize="none" x="92" y="20" style="渐变1" width="645" align="center" size="25" height="34" bold="true" var="digiRoundTxt"/>
			    <HBox x="607" y="95">
			      <Label text="\l999900286" autoSize="none" y="5" style="普通说明" height="20" align="left" var="txt_r_zzl"/>
			      <Label text="1233" autoSize="none" x="50" style="渐变1" width="104" height="22" align="left" size="20" var="txt_r_power"/>
			    </HBox>
			    <HBox x="87" y="95">
			      <Label text="\l999900286" autoSize="none" y="5" style="普通说明" height="20" align="left" var="txt_l_zzl"/>
			      <Label text="1233" autoSize="none" x="53" style="渐变1" width="104" height="22" align="left" size="20" var="txt_l_power"/>
			    </HBox>
			    <Box x="521" y="56" language="en" lgx="485,521,521,521,521,521" lgy="56,56,56,56,56,56">
			      <ClipList value="9" clipWidth="26" align="left" url="png.uiTeamPKCS.clipList_big" y="6" var="digi_right"/>
			      <Label text="\l999900273" autoSize="none" x="26" style="加底标题" width="98" height="60" size="40" align="left"/>
			    </Box>
			    <Box x="222" y="56">
			      <ClipList value="9" clipWidth="26" align="left" url="png.uiTeamPKCS.clipList_big" y="6" var="digi_left"/>
			      <Label text="\l999900273" autoSize="none" x="27" style="加底标题" width="97" height="60" size="40" align="left"/>
			    </Box>
			  </Box>
			  <Button label="按钮" x="358" style="按钮大绿" y="514" centerX="0" bottom="100" var="btn_finish"/>
			  <Box x="519" y="195" right="0" var="box_fight_panel" width="281" height="224">
			    <Image skin="png.uiTeamPKCS.img_rank_bg" sizeGrid="10,10,10,10" width="278" height="224" x="282" scaleX="-1"/>
			    <Label text="\l41701000" autoSize="none" y="11" style="渐变1" width="203" height="22" align="center" size="14" x="48" var="txt_fight_title"/>
			    <Image skin="png.uiTeamPKCS.img_rank_line_5" y="31" x="11"/>
			    <Image skin="png.uiTeamPKCS.img_rank_line_5" y="111" x="11"/>
			    <List x="11" y="31" var="list_match" repeatY="9" spaceY="-1">
			      <TPKCMatchRender name="render" runtime="game.ui.teamPKCS.pre.TPKCMatchRenderUI"/>
			    </List>
			    <Box y="91" var="fight_dock">
			      <Button skin="png.uiTeamPKCS.btn_dock" stateNum="1" var="btn_dock_fight" scaleX="-1" x="9"/>
			      <Image skin="png.uiTeamPKCS.img_dock" y="17" mouseEnabled="false" mouseChildren="false" var="img_dock_fight" anchorX=".5" anchorY=".5" rotation="180"/>
			    </Box>
			  </Box>
			</View>;
       
      
      public var box_top:Box = null;
      
      public var txt_time:Label = null;
      
      public var txt_l0:Label = null;
      
      public var txt_r0:Label = null;
      
      public var txt_r3:Label = null;
      
      public var txt_l3:Label = null;
      
      public var digiDayTxt:Label = null;
      
      public var txt_l1:Label = null;
      
      public var left_pow:Label = null;
      
      public var txt_r1:Label = null;
      
      public var right_pow:Label = null;
      
      public var box_bottom:Box = null;
      
      public var btn_change:Button = null;
      
      public var btn_changeOrder:Button = null;
      
      public var txt_fight_time:Label = null;
      
      public var btn_addTime:Button = null;
      
      public var btn_fight:Button = null;
      
      public var fight_time_tip:Label = null;
      
      public var rank_panel:Box = null;
      
      public var img_rank_bg:Image = null;
      
      public var left_dock:Box = null;
      
      public var btn_left_dock:Button = null;
      
      public var img_dock_left:Image = null;
      
      public var tt0:Label = null;
      
      public var tt1:Label = null;
      
      public var box_rank_button:Box = null;
      
      public var pageBarUI:PageBarS1UI = null;
      
      public var btn_next_more:Button = null;
      
      public var btn_prev_more:Button = null;
      
      public var txt_left_day:Label = null;
      
      public var tt2:Label = null;
      
      public var tt3:Label = null;
      
      public var list_rank:List = null;
      
      public var tab:Tab = null;
      
      public var left_my_tip:Label = null;
      
      public var box_reward:Box = null;
      
      public var right_small_title:Label = null;
      
      public var txt_fight_tip:Label = null;
      
      public var btn_fight_award:Button = null;
      
      public var list_time_reward:List = null;
      
      public var right_dock:Box = null;
      
      public var btn_right_dock:Button = null;
      
      public var img_dock_right:Image = null;
      
      public var box_fight_top:Box = null;
      
      public var txt_l_name:Label = null;
      
      public var txt_r_name:Label = null;
      
      public var buff_left:Image = null;
      
      public var buff_right:Image = null;
      
      public var buff_num_left:Label = null;
      
      public var buff_num_right:Label = null;
      
      public var digiRoundTxt:Label = null;
      
      public var txt_r_zzl:Label = null;
      
      public var txt_r_power:Label = null;
      
      public var txt_l_zzl:Label = null;
      
      public var txt_l_power:Label = null;
      
      public var digi_right:ClipList = null;
      
      public var digi_left:ClipList = null;
      
      public var btn_finish:Button = null;
      
      public var box_fight_panel:Box = null;
      
      public var txt_fight_title:Label = null;
      
      public var list_match:List = null;
      
      public var fight_dock:Box = null;
      
      public var btn_dock_fight:Button = null;
      
      public var img_dock_fight:Image = null;
      
      public function TPKCpreSceneUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS1UI"] = PageBarS1UI;
         viewClassMap["game.ui.teamPKCS.pre.TPKCMatchRenderUI"] = TPKCMatchRenderUI;
         viewClassMap["game.ui.teamPKCS.pre.TPKCRankRenderUI"] = TPKCRankRenderUI;
         viewClassMap["game.ui.teamPKCS.pre.TPKCawardRenderUI"] = TPKCawardRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
