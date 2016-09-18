package game.ui.teamGuajiScenes.pvp
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.Box;
   import morn.core.components.CheckBox;
   import morn.core.components.List;
   
   public class RobTreasurePanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="806" height="553">
			  <PanelBg width="806" height="552" x="0" y="0"/>
			  <Image skin="jpg.uiTeamGuajiPvP.pvpBg" x="3" y="25" var="img_funBg"/>
			  <Image skin="png.uiTeamGuajiPvP.透明底" x="238" y="395"/>
			  <Label text="普通说明" autoSize="left" x="26" y="39" style="普通说明" var="txt_getTip" align="left"/>
			  <Label text="\l41300203" autoSize="left" x="26" y="66" style="普通说明" align="left" var="txt1"/>
			  <Label text="1234" x="111" y="61" var="txt_myRank" size="20" style="渐变1" width="120" height="20"/>
			  <Button skin="png.a5.commonImgs.btn_buzhen1" x="248" y="456" stateNum="1" var="btn_position"/>
			  <Label text="03:22:12" autoSize="none" x="401" y="523" style="普通绿色" align="center" var="txt_mzCD" height="20" width="95"/>
			  <Button skin="png.uiTeamGuajiPvP.btn_refresh" x="331" y="460" stateNum="1" var="btn_refresh"/>
			  <Button skin="png.uiTeamGuajiPvP.btn_shell" x="412" y="460" stateNum="1" var="btn_mianZhan"/>
			  <Label text="\l41300211" autoSize="none" x="228" y="502" style="渐变4" width="104" height="22" align="center" mouseEnabled="false" size="14" mouseChildren="false"/>
			  <Button skin="png.uiTeamGuajiPvP.btn_bg" x="503" y="459" stateNum="1" var="btn_pieceBg"/>
			  <Label text="\l41300212" autoSize="none" x="313" y="502" style="渐变4" width="104" height="22" align="center" mouseEnabled="false" size="14" mouseChildren="false"/>
			  <Label text="\l41300215" autoSize="none" x="485" y="502" style="渐变4" width="104" height="22" align="center" mouseEnabled="false" size="14" mouseChildren="false"/>
			  <Box x="139" y="202" var="box_deadImg">
			    <Image skin="png.uiTeamGuajiPvP.img_cross" x="131" var="img_dead2" y="0"/>
			    <Image skin="png.uiTeamGuajiPvP.img_cross" x="296" var="img_dead3" y="0"/>
			    <Image skin="png.uiTeamGuajiPvP.img_cross" x="431" y="57" var="img_dead4"/>
			    <Image skin="png.uiTeamGuajiPvP.img_cross" y="57" var="img_dead1" x="0"/>
			  </Box>
			  <Label text="\l41300213" autoSize="none" x="393" y="502" style="渐变4" width="104" height="22" align="center" mouseEnabled="false" size="14" mouseChildren="false"/>
			  <Button skin="png.a5.commonImgs.btn_rank2" x="34" y="96" stateNum="1" var="btn_rank" width="36" height="36"/>
			  <Label text="5" autoSize="none" x="325" y="471" style="不足禁止红" width="77" height="39" align="center" mouseEnabled="false" size="30" var="txt_changeCD"/>
			  <Box x="110" y="328" var="box_status">
			    <PlayerStatus y="57" var="playerStatus1" runtime="game.ui.teamGuajiScenes.pvp.PlayerStatusUI"/>
			    <PlayerStatus x="134" var="playerStatus2" y="0" runtime="game.ui.teamGuajiScenes.pvp.PlayerStatusUI"/>
			    <PlayerStatus x="298" var="playerStatus3" y="0" runtime="game.ui.teamGuajiScenes.pvp.PlayerStatusUI"/>
			    <PlayerStatus x="434" y="57" var="playerStatus4" runtime="game.ui.teamGuajiScenes.pvp.PlayerStatusUI"/>
			  </Box>
			  <Label text="\l41300202" autoSize="left" x="91" y="39" style="重要提示黄" var="txt_see" align="left" underline="true" mouseChildren="true"/>
			  <Label text="排行榜" autoSize="left" x="12" y="121" style="小标题" align="center" var="txt_rankTip" width="75" height="18" mouseEnabled="false" mouseChildren="false"/>
			  <Button label="\l41300270" x="156" y="363" style="按钮小黄" var="sdBtn1"/>
			  <Button label="\l41300270" x="285" y="306" style="按钮小黄" var="sdBtn2"/>
			  <Button label="\l41300270" x="449" y="306" style="按钮小黄" var="sdBtn3"/>
			  <Button label="\l41300270" x="584" y="365" style="按钮小黄" var="sdBtn4"/>
			  <Box x="337" y="422" var="box_cnt">
			    <Label text="可夺宝次数：" autoSize="none" y="2" style="普通说明" align="right" x="-98" width="174" height="20"/>
			    <Button skin="png.a5.btns.btn_add" x="114" stateNum="1" var="btn_addCnt"/>
			    <Label text="10/10" x="59" y="2" style="普通说明" align="center" width="64" var="txt_robCnt" mouseEnabled="false" mouseChildren="false" height="20"/>
			    <Label text="可夺宝次数：" autoSize="left" x="141" y="2" style="普通绿色" align="left" var="txt_addCD" height="20"/>
			  </Box>
			  <CheckBox label="\l40740006" x="339" style="Radio普通" selected="true" var="check_simpleFight" labelMargin="12" y="397"/>
			  <Button label="\l41300285" x="635" style="按钮大绿" y="484" var="btn_fastRob"/>
			  <List x="127" y="350" var="list_canGet" width="593" height="93">
			    <CanGetView y="54" name="item0" runtime="game.ui.teamGuajiScenes.pvp.CanGetViewUI"/>
			    <CanGetView x="137" name="item1" runtime="game.ui.teamGuajiScenes.pvp.CanGetViewUI"/>
			    <CanGetView x="301" name="item2" runtime="game.ui.teamGuajiScenes.pvp.CanGetViewUI"/>
			    <CanGetView x="440" y="54" name="item3" runtime="game.ui.teamGuajiScenes.pvp.CanGetViewUI"/>
			  </List>
			  <Box x="530" y="30" var="box_otherDrop">
			    <Image skin="png.a5.commonImgs.img_recycleAlertBg" y="1" var="img_bg" x="0" width="189" height="66"/>
			    <Image skin="png.a5.commonImgs.img_recycleAlertPoint" x="27" y="35" var="img_point" anchorX="0.5" anchorY="0.5"/>
			    <Label text="装备重生后返还装" autoSize="left" x="50" style="普通说明" width="114" wordWrap="true" var="txt_otherDrop" y="7"/>
			  </Box>
			</PopModuleView>;
       
      
      public var img_funBg:Image = null;
      
      public var txt_getTip:Label = null;
      
      public var txt1:Label = null;
      
      public var txt_myRank:Label = null;
      
      public var btn_position:Button = null;
      
      public var txt_mzCD:Label = null;
      
      public var btn_refresh:Button = null;
      
      public var btn_mianZhan:Button = null;
      
      public var btn_pieceBg:Button = null;
      
      public var box_deadImg:Box = null;
      
      public var img_dead2:Image = null;
      
      public var img_dead3:Image = null;
      
      public var img_dead4:Image = null;
      
      public var img_dead1:Image = null;
      
      public var btn_rank:Button = null;
      
      public var txt_changeCD:Label = null;
      
      public var box_status:Box = null;
      
      public var playerStatus1:game.ui.teamGuajiScenes.pvp.PlayerStatusUI = null;
      
      public var playerStatus2:game.ui.teamGuajiScenes.pvp.PlayerStatusUI = null;
      
      public var playerStatus3:game.ui.teamGuajiScenes.pvp.PlayerStatusUI = null;
      
      public var playerStatus4:game.ui.teamGuajiScenes.pvp.PlayerStatusUI = null;
      
      public var txt_see:Label = null;
      
      public var txt_rankTip:Label = null;
      
      public var sdBtn1:Button = null;
      
      public var sdBtn2:Button = null;
      
      public var sdBtn3:Button = null;
      
      public var sdBtn4:Button = null;
      
      public var box_cnt:Box = null;
      
      public var btn_addCnt:Button = null;
      
      public var txt_robCnt:Label = null;
      
      public var txt_addCD:Label = null;
      
      public var check_simpleFight:CheckBox = null;
      
      public var btn_fastRob:Button = null;
      
      public var list_canGet:List = null;
      
      public var box_otherDrop:Box = null;
      
      public var img_bg:Image = null;
      
      public var img_point:Image = null;
      
      public var txt_otherDrop:Label = null;
      
      public function RobTreasurePanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.teamGuajiScenes.pvp.CanGetViewUI"] = CanGetViewUI;
         viewClassMap["game.ui.teamGuajiScenes.pvp.PlayerStatusUI"] = game.ui.teamGuajiScenes.pvp.PlayerStatusUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
