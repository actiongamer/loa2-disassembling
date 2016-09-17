package game.ui.pkCrossSer
{
   import morn.customs.components.SceneModuleView;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.CheckBox;
   import game.ui.commons.comps.others.RuleDescriptionUI;
   import morn.core.components.Image;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS1UI;
   import game.ui.commons.comps.others.TreasureBoxBaseRenderUI;
   
   public class PKCrossModuleUI extends SceneModuleView
   {
      
      protected static var uiView:XML = <SceneModuleView width="600" height="400">
			  <Box x="365" y="419" bottom="50" centerX="0" var="bottom_panel">
			    <Image skin="png.uiPKCrossSer.img_bottom_bg" x="38"/>
			    <Label text="挑战次数 10/10" autoSize="none" x="113" y="50" style="小标题" width="116" height="20" var="txt_times" align="center"/>
			    <Label text="活动时间剩余：" autoSize="none" style="普通说明" width="300" height="20" x="21" y="29" align="center" var="txt_cd_preFinish"/>
			    <Label text="\l50600008" autoSize="none" y="70" style="普通说明" width="344" height="20" align="center" mouseChildren="false" mouseEnabled="false"/>
			    <Button skin="png.a5.comps.numBars.btn_plus" x="217" y="48" stateNum="1" var="btn_addTimes"/>
			    <CheckBox label="简易战报" x="125" y="6" selected="true" style="CheckBox普通" var="chk_fastfight" labelMargin="8"/>
			  </Box>
			  <RuleDescription right="20" top="20" var="box_rule" x="10" y="10" runtime="game.ui.commons.comps.others.RuleDescriptionUI"/>
			  <Box x="307" y="70" var="rank_panel" top="180" left="0">
			    <Image skin="png.uiPKCrossSer.img_rank_bg" var="img_rank_bg" sizeGrid="10,10,10,10" width="272" height="326" x="1" y="0"/>
			    <Image skin="png.uiPKCrossSer.img_list_top" x="1" y="31"/>
			    <Label text="\l41300088" autoSize="left" x="15" y="35" style="普通说明" width="68" height="19"/>
			    <Image skin="png.uiPKCrossSer.img_rank_line_5" y="76" x="0"/>
			    <Label text="250" autoSize="left" x="86" y="35" style="普通绿色" width="64" height="20" var="txt_jifen"/>
			    <Image skin="png.uiPKCrossSer.img_rank_line_5" y="156" x="0" var="img_line_down"/>
			    <Label text="百名之外" autoSize="left" x="204" y="35" style="普通绿色" var="txt_rank"/>
			    <Box y="148" var="left_dock" x="268">
			      <Button skin="png.uiPKCrossSer.btn_dock" stateNum="1" var="btn_left_dock"/>
			      <Image skin="png.uiPKCrossSer.img_dock" y="17" mouseEnabled="false" mouseChildren="false" var="img_dock_left" anchorX=".5" anchorY=".5" x="10"/>
			    </Box>
			    <List x="5" y="77" var="list_rank" repeatY="10">
			      <PKCrossRankRender name="render" runtime="game.ui.pkCrossSer.PKCrossRankRenderUI"/>
			    </List>
			    <Label text="名次" autoSize="none" x="10" y="57" style="加底标题"/>
			    <Label text="积分" autoSize="none" x="204" y="57" style="加底标题" width="61" height="19" align="center"/>
			    <Label text="名称" autoSize="none" x="47" y="57" style="加底标题" width="151" height="20" align="left"/>
			    <Label text="\l50400106" x="122" y="35" style="普通说明" align="right" width="78" height="20"/>
			    <Box x="73" y="285" var="box_rank_button">
			      <PageBarS1 x="7" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS1UI"/>
			      <Button skin="png.uiPKCrossSer.btn_next" x="102" y="1" stateNum="1" var="btn_next_more"/>
			      <Button skin="png.uiPKCrossSer.btn_next" y="1" stateNum="1" scaleX="-1" var="btn_prev_more"/>
			    </Box>
			    <Label text="\l999001129" autoSize="left" x="4" y="10" style="下划线黄色" width="260" height="23" align="center"/>
			    <Image x="3" y="5" width="42" height="26" var="img_myFlag"/>
			  </Box>
			  <PKCrossTop x="46" y="47" centerX="0" top="30" var="top_panel" runtime="game.ui.pkCrossSer.PKCrossTopUI"/>
			  <Image skin="png.uiPKCrossSer.img_cross" x="400" y="135" visible="false"/>
			  <Image skin="png.uiPKCrossSer.rank1" x="451" y="469" visible="false"/>
			  <Image skin="png.uiPKCrossSer.rank2" x="475" y="549" visible="false"/>
			  <Image skin="png.uiPKCrossSer.rank3" x="667" y="441" visible="false"/>
			  <Box x="744" y="177" top="100" right="0" var="con_finalBox">
			    <Image skin="png.uiPKCrossSer.img_box_bg" x="22" y="47" right="30"/>
			    <Label text="\l9050251" autoSize="none" y="48" style="小标题" width="146" height="16" align="center" mouseEnabled="false" mouseChildren="false" right="10"/>
			    <Label text="12:13:13" autoSize="none" y="68" style="普通说明" width="146" height="28" align="center" var="txt_rewardCD" right="10"/>
			    <TreasureBoxBaseRender var="btn_rewardIcon" right="62" x="75" runtime="game.ui.commons.comps.others.TreasureBoxBaseRenderUI"/>
			  </Box>
			  <Box x="207" y="135" centerX="0" top="0" var="box_upbg">
			    <Image skin="png.uiPKCrossSer.img_upbg"/>
			    <Label autoSize="none" x="43" y="5" style="二级框标题" align="center" width="93" height="20" var="txt_currLayer"/>
			  </Box>
			</SceneModuleView>;
       
      
      public var bottom_panel:Box = null;
      
      public var txt_times:Label = null;
      
      public var txt_cd_preFinish:Label = null;
      
      public var btn_addTimes:Button = null;
      
      public var chk_fastfight:CheckBox = null;
      
      public var box_rule:RuleDescriptionUI = null;
      
      public var rank_panel:Box = null;
      
      public var img_rank_bg:Image = null;
      
      public var txt_jifen:Label = null;
      
      public var img_line_down:Image = null;
      
      public var txt_rank:Label = null;
      
      public var left_dock:Box = null;
      
      public var btn_left_dock:Button = null;
      
      public var img_dock_left:Image = null;
      
      public var list_rank:List = null;
      
      public var box_rank_button:Box = null;
      
      public var pageBarUI:PageBarS1UI = null;
      
      public var btn_next_more:Button = null;
      
      public var btn_prev_more:Button = null;
      
      public var img_myFlag:Image = null;
      
      public var top_panel:game.ui.pkCrossSer.PKCrossTopUI = null;
      
      public var con_finalBox:Box = null;
      
      public var txt_rewardCD:Label = null;
      
      public var btn_rewardIcon:TreasureBoxBaseRenderUI = null;
      
      public var box_upbg:Box = null;
      
      public var txt_currLayer:Label = null;
      
      public function PKCrossModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RuleDescriptionUI"] = RuleDescriptionUI;
         viewClassMap["game.ui.commons.comps.others.TreasureBoxBaseRenderUI"] = TreasureBoxBaseRenderUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS1UI"] = PageBarS1UI;
         viewClassMap["game.ui.pkCrossSer.PKCrossRankRenderUI"] = PKCrossRankRenderUI;
         viewClassMap["game.ui.pkCrossSer.PKCrossTopUI"] = game.ui.pkCrossSer.PKCrossTopUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
