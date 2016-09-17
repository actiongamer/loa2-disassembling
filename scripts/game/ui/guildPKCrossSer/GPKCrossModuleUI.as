package game.ui.guildPKCrossSer
{
   import morn.customs.components.SceneModuleView;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import game.ui.commons.comps.others.TreasureBoxBaseRenderUI;
   import morn.core.components.Image;
   import morn.core.components.CheckBox;
   import morn.core.components.Button;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import game.ui.commons.comps.pageBars.PageBarS1UI;
   import morn.core.components.List;
   import morn.customs.components.Placeholder;
   
   public class GPKCrossModuleUI extends SceneModuleView
   {
      
      protected static var uiView:XML = <SceneModuleView width="600" height="400" y="0" x="0">
			  <Box x="-99" y="103" var="box_entry" centerX="0" centerY="0">
			    <Image skin="png.uiGuildPKCrossSer.img_enter_bg"/>
			    <Label text="渐变1" autoSize="none" x="82.5" y="24" style="渐变1" width="635" height="72" align="center" var="txt_big" size="28"/>
			    <Label text="普通说明" autoSize="none" x="121.5" y="112" style="普通说明" width="557" height="20" var="txt_small" align="center"/>
			  </Box>
			  <Box x="719" y="187" top="100" right="0" var="con_finalBox">
			    <Image skin="png.uiGuildPKCrossSer.img_box_bg" x="49" y="19" right="30"/>
			    <TreasureBoxBaseRender var="btn_rewardIcon" x="59" runtime="game.ui.commons.comps.others.TreasureBoxBaseRenderUI"/>
			    <Label autoSize="none" y="20" style="小标题" width="146" height="16" align="center" mouseEnabled="false" mouseChildren="false" var="txt_awardTitle"/>
			  </Box>
			  <Box x="-105" y="-5" centerX="0" top="-38" var="box_top">
			    <Image skin="png.uiGuildPKCrossSer.img_vs_bg" x="-0.5"/>
			    <Image skin="png.uiGuildPKCrossSer.img_vs" x="435" y="42"/>
			    <Image skin="png.comp.image" x="190" y="82" var="img_left_fbg" anchorX=".5" anchorY=".5" scaleX=".5" scaleY=".5" smoothing="true"/>
			    <Image skin="png.comp.image" x="192" y="73" anchorX=".5" anchorY=".5" var="img_left_ficon" scaleX=".5" scaleY=".5" smoothing="true"/>
			    <Image skin="png.comp.image" x="758" y="82" var="img_right_fbg" anchorX=".5" anchorY=".5" scaleX=".5" scaleY=".5" smoothing="true"/>
			    <Image skin="png.comp.image" x="760" y="73" anchorX=".5" anchorY=".5" var="img_right_ficon" scaleX=".5" scaleY=".5" smoothing="true"/>
			    <Label text="普通说明" autoSize="none" x="242" y="45" style="普通说明" height="20" var="txt_gl_name"/>
			    <Label text="普通说明" autoSize="none" x="242" y="66" style="普通说明" height="20" var="txt_gl_rep"/>
			    <Label text="普通说明" autoSize="none" x="242" y="87" style="普通说明" height="20" var="txt_gl_player_num"/>
			    <Label text="普通说明" autoSize="none" x="500" y="45" style="普通说明" height="20" var="txt_gr_name" align="right" width="211"/>
			    <Label text="普通说明" autoSize="none" x="499" y="66" style="普通说明" height="20" var="txt_gr_rep" align="right" width="212"/>
			    <Label text="普通说明" autoSize="none" x="499" y="87" style="普通说明" height="20" var="txt_gr_player_num" align="right" width="212"/>
			    <Label text="普通说明" autoSize="none" x="200.5" y="111" style="普通说明" width="535" var="txt_top_cd" align="center" size="14"/>
			    <Box x="682" y="79" var="rightwinBox">
			      <Image skin="png.uiGuildPKCrossSer.img_zkxx_win" var="img_rightwin"/>
			      <Label text="\l999900120" autoSize="none" y="33" style="渐变1" width="138" height="48" size="40" bold="true" align="center" var="rightwinTxt" mouseChildren="false" mouseEnabled="false"/>
			    </Box>
			    <Box x="114" y="79" var="leftwinBox">
			      <Image skin="png.uiGuildPKCrossSer.img_zkxx_loss" var="img_leftwin"/>
			      <Label text="\l999900119" autoSize="none" y="34" style="渐变灰" width="138" height="48" size="40" bold="true" align="center" var="leftwinTxt" mouseChildren="false" mouseEnabled="false"/>
			    </Box>
			  </Box>
			  <Box x="114" y="241" bottom="100" var="box_guild_times" centerX="0">
			    <Image skin="png.uiGuildPKCrossSer.img_bottom_bg" x="0" y="0" width="267" height="117"/>
			    <Label autoSize="none" y="71" style="普通说明" color="0xf04947" text="1" var="txt_time_desc" x="128" centerX="0"/>
			    <Label text="普通说明" autoSize="none" x="77" y="50" style="普通说明" height="20" var="txt_guild_times"/>
			    <Image skin="png.uiGuildPKCrossSer.img_rep" x="53" y="47"/>
			    <CheckBox label="简易战报（已开启）" x="63.5" y="89" selected="true" style="CheckBox普通" var="chk_fastfight" labelMargin="8" centerX="0"/>
			    <HBox x="53" y="3">
			      <Image skin="png.uiGuildPKCrossSer.img_rep"/>
			      <Label text="普通说明" autoSize="none" x="24" y="2" style="普通说明" height="20" var="txt_my_times"/>
			    </HBox>
			    <Button skin="png.a5.comps.numBars.btn_plus" x="246" y="3" stateNum="1" var="btn_addTimes"/>
			  </Box>
			  <Box x="200" y="318" centerX="0" bottom="74" var="box_pageUI">
			    <Image skin="png.uiGuildPKCrossSer.img_challenge2" width="200"/>
			    <PageBarS2 x="29" y="1" var="pageBarUI2" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  </Box>
			  <Box x="317" y="80" var="rank_panel" top="180" left="0">
			    <Image skin="png.uiGuildPKCrossSer.img_rank_bg" var="img_rank_bg" sizeGrid="10,10,10,10" width="300" height="326" x="1" y="0"/>
			    <Image skin="png.uiGuildPKCrossSer.img_list_top" x="1" y="31" width="294" height="23"/>
			    <Image skin="png.uiPKCrossSer.img_rank_line_5" y="76" x="0" width="294"/>
			    <Image skin="png.uiGuildPKCrossSer.img_rank_line_5" y="156" x="0" var="img_line_down" width="294"/>
			    <Box y="148" var="left_dock" x="295">
			      <Button skin="png.uiGuildPKCrossSer.btn_dock" stateNum="1" var="btn_left_dock"/>
			      <Image skin="png.uiGuildPKCrossSer.img_dock" y="17" mouseEnabled="false" mouseChildren="false" var="img_dock_left" anchorX=".5" anchorY=".5" x="10"/>
			    </Box>
			    <Label text="名次" autoSize="none" x="3" y="58" style="加底标题" width="38" height="20"/>
			    <Label text="\l99900141" autoSize="none" x="245" y="58" style="加底标题" align="center" width="50" height="20"/>
			    <Label text="名称" autoSize="none" x="34" y="58" style="加底标题" align="center" width="70"/>
			    <Box x="73" y="285" var="box_rank_button">
			      <PageBarS1 x="7" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS1UI"/>
			      <Button skin="png.uiGuildPKCrossSer.btn_next" x="102" y="1" stateNum="1" var="btn_next_more"/>
			      <Button skin="png.uiGuildPKCrossSer.btn_next" y="1" stateNum="1" scaleX="-1" var="btn_prev_more"/>
			    </Box>
			    <Label text="\l99900142" autoSize="none" x="7" y="10" style="渐变1" width="247" height="22" align="center" size="14"/>
			    <Label text="\l99900139" autoSize="none" x="99" y="58" style="加底标题" align="center" width="71"/>
			    <Label text="\l99900140" autoSize="none" x="166" y="58" style="加底标题" align="center" width="83" height="20"/>
			    <List x="5" y="76" var="list_rank">
			      <GPKRankRender name="render" runtime="game.ui.guildPKCrossSer.GPKRankRenderUI"/>
			    </List>
			    <HBox x="135" y="35">
			      <Label text="\l50400106" autoSize="left" style="普通说明"/>
			      <Label text="百名之外" autoSize="left" x="68" style="普通绿色" var="txt_rank" color="0xa9f16b"/>
			    </HBox>
			    <HBox x="6" y="35">
			      <Label autoSize="left" style="普通说明" height="22" var="txt_wdgx"/>
			      <Label text="250" autoSize="left" x="71" style="普通绿色" height="22" var="txt_jifen" color="0xa9f16b"/>
			    </HBox>
			  </Box>
			  <Placeholder width="50" height="50" x="113" y="-57" var="pos4"/>
			  <Placeholder width="50" height="50" x="0" y="-232" var="pos1"/>
			  <Placeholder width="50" height="50" x="-261" y="-263" var="pos0"/>
			  <Placeholder width="50" height="50" y="-71" x="395" var="pos5"/>
			  <Placeholder width="50" height="50" x="-159" y="-73" var="pos3"/>
			  <Placeholder width="50" height="50" x="257" y="-257" var="pos2"/>
			  <Box x="402" y="236" right="0" var="box_task">
			    <Image skin="png.uiGuildPKCrossSer.img_mini_task" height="130"/>
			    <Label text="跨服远征任务" autoSize="none" x="73" y="32" style="渐变1" width="106" height="22" align="left" var="txt_task_title" size="16"/>
			    <Label text="普通说明" autoSize="none" x="120" y="36" style="普通说明" var="txt_st" language="en" lgx="120,179,179,179,179" lgy="33,33,33,33,33"/>
			    <VBox x="73" y="52">
			      <Label text="普通说明普通说明普通说明普通说明普通说明普通说明普通说明" autoSize="none" style="普通说明" width="183" var="txt_task_info" multiline="true" wordWrap="true"/>
			      <Label autoSize="none" x="2" y="20" style="普通说明" var="txt_task_info0" text="1"/>
			    </VBox>
			  </Box>
			</SceneModuleView>;
       
      
      public var box_entry:Box = null;
      
      public var txt_big:Label = null;
      
      public var txt_small:Label = null;
      
      public var con_finalBox:Box = null;
      
      public var btn_rewardIcon:TreasureBoxBaseRenderUI = null;
      
      public var txt_awardTitle:Label = null;
      
      public var box_top:Box = null;
      
      public var img_left_fbg:Image = null;
      
      public var img_left_ficon:Image = null;
      
      public var img_right_fbg:Image = null;
      
      public var img_right_ficon:Image = null;
      
      public var txt_gl_name:Label = null;
      
      public var txt_gl_rep:Label = null;
      
      public var txt_gl_player_num:Label = null;
      
      public var txt_gr_name:Label = null;
      
      public var txt_gr_rep:Label = null;
      
      public var txt_gr_player_num:Label = null;
      
      public var txt_top_cd:Label = null;
      
      public var rightwinBox:Box = null;
      
      public var img_rightwin:Image = null;
      
      public var rightwinTxt:Label = null;
      
      public var leftwinBox:Box = null;
      
      public var img_leftwin:Image = null;
      
      public var leftwinTxt:Label = null;
      
      public var box_guild_times:Box = null;
      
      public var txt_time_desc:Label = null;
      
      public var txt_guild_times:Label = null;
      
      public var chk_fastfight:CheckBox = null;
      
      public var txt_my_times:Label = null;
      
      public var btn_addTimes:Button = null;
      
      public var box_pageUI:Box = null;
      
      public var pageBarUI2:PageBarS2UI = null;
      
      public var rank_panel:Box = null;
      
      public var img_rank_bg:Image = null;
      
      public var img_line_down:Image = null;
      
      public var left_dock:Box = null;
      
      public var btn_left_dock:Button = null;
      
      public var img_dock_left:Image = null;
      
      public var box_rank_button:Box = null;
      
      public var pageBarUI:PageBarS1UI = null;
      
      public var btn_next_more:Button = null;
      
      public var btn_prev_more:Button = null;
      
      public var list_rank:List = null;
      
      public var txt_rank:Label = null;
      
      public var txt_wdgx:Label = null;
      
      public var txt_jifen:Label = null;
      
      public var pos4:Placeholder = null;
      
      public var pos1:Placeholder = null;
      
      public var pos0:Placeholder = null;
      
      public var pos5:Placeholder = null;
      
      public var pos3:Placeholder = null;
      
      public var pos2:Placeholder = null;
      
      public var box_task:Box = null;
      
      public var txt_task_title:Label = null;
      
      public var txt_st:Label = null;
      
      public var txt_task_info:Label = null;
      
      public var txt_task_info0:Label = null;
      
      public function GPKCrossModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.TreasureBoxBaseRenderUI"] = TreasureBoxBaseRenderUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS1UI"] = PageBarS1UI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.guildPKCrossSer.GPKRankRenderUI"] = GPKRankRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
