package game.ui.roleInfos.phaseUps
{
   import morn.customs.components.PanelView;
   import morn.core.components.Image;
   import morn.core.components.Box;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.commons.icons.PlayerTitleRenderUI;
   import morn.core.components.Button;
   import morn.customs.components.GRect;
   import game.ui.commons.icons.WealthRenderS16UI;
   import game.ui.roleInfos.RoleInfoCostRenderUI;
   import game.ui.commons.icons.PhaseUpTalentRenderSize50UI;
   import game.ui.commons.icons.SkillRenderS3UI;
   import game.ui.commons.icons.SkillRenderS4UI;
   import game.ui.roleInfos.tupos.RoleUpRenderUI;
   
   public class RolePhaseUpPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="798" height="481" var="subPanel">
			  <ExpBox x="318.5" y="79" var="expBox" runtime="game.ui.roleInfos.phaseUps.ExpBoxUI"/>
			  <Image skin="png.uiRoleInfo.升阶_祝福值" x="365" y="208" var="img_exp" language="en" lgx="365,365,365,365,365,365,365,315" lgy="208,208,208,208,208,208,208,208"/>
			  <Box x="596" y="97" var="box_next">
			    <List var="list_propNext" repeatX="1" repeatY="5" spaceY="6" y="27">
			      <RolePropPhaseUpRenderS2 x="0" y="0" name="render" runtime="game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS2UI"/>
			    </List>
			    <Label text="2阶" autoSize="none" x="32" height="18" var="txt_phaseNext" bold="true" letterSpacing="0" align="center" style="普通说明"/>
			  </Box>
			  <Box x="118" y="98" var="box_now">
			    <List var="list_propNow" repeatX="1" repeatY="5" y="25" width="93" height="138" spaceY="6">
			      <RolePropPhaseUpRenderS1 x="0" y="-1" name="render" runtime="game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS1UI"/>
			    </List>
			    <Label text="1阶" autoSize="left" x="30" var="txt_phaseNow" bold="true" letterSpacing="0" style="普通说明" y="0"/>
			  </Box>
			  <PlayerTitleRender x="256" y="11" var="playerTitleRenderUI" runtime="game.ui.commons.icons.PlayerTitleRenderUI"/>
			  <List x="679" y="123" repeatY="5" spaceY="4" var="list_up">
			    <RoleUpRender name="render" runtime="game.ui.roleInfos.tupos.RoleUpRenderUI"/>
			  </List>
			  <List x="119" y="251" var="list_nowSkill" repeatY="3" spaceY="3">
			    <SkillRenderS3 name="render" runtime="game.ui.commons.icons.SkillRenderS3UI"/>
			  </List>
			  <List x="599" y="250" var="list_nextSKill" repeatY="3" spaceY="3">
			    <SkillRenderS4 name="render" runtime="game.ui.commons.icons.SkillRenderS4UI"/>
			  </List>
			  <Label text="1阶" x="348.5" height="20" var="txt_titlePhaseNow" bold="true" letterSpacing="0" y="55" width="101" style="普通说明" align="center" size="14"/>
			  <Box x="654" y="370">
			    <Box>
			      <Button style="按钮小黄" var="btn_tujian" stateNum="1" skin="png.uiRoleInfo.书" labelMargin="0,30,0,0" x="21"/>
			      <Label text="\l9030105" autoSize="none" align="center" stroke="0x0" y="56" style="随品质变化" width="113" height="20"/>
			    </Box>
			  </Box>
			  <Box x="73" y="74" var="box_subBar">
			    <Image skin="png.a5.commonImgs.分割透明底" x="90" y="295"/>
			    <Label text="有很低的概率" autoSize="none" y="250" width="650" height="26" align="center" color="0xffe0a3" size="12" stroke="0x0" var="txt_upProbability" isHtml="true"/>
			    <Button label="取消" stateNum="1" buttonMode="true" x="347" var="btn_stop" labelBold="false" y="325" style="按钮大红"/>
			    <Button label="一键进阶" stateNum="1" buttonMode="true" x="347" var="btn_phaseUpAll" labelBold="false" style="按钮大黄" y="325"/>
			    <Button label="\l30100005" stateNum="1" buttonMode="true" var="btn_phaseUpOne" style="按钮大绿" labelMargin="30" x="181" y="325"/>
			    <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" x="110" fillColor="0x0" width="433" height="16" var="horseLampBg"/>
			    <WealthRenderS16 x="239" y="365" var="hasRenderer" runtime="game.ui.commons.icons.WealthRenderS16UI"/>
			    <RoleInfoCostRender var="costRender" x="194" y="334" language="en" lgx="190,194" lgy="334,334" runtime="game.ui.roleInfos.RoleInfoCostRenderUI"/>
			    <Label text="\l30600203" x="161" align="right" stroke="0x0" var="txt_hadNow" y="370" style="随品质变化" width="80" height="20"/>
			    <Button skin="png.uiRoleInfo.btn_缩放按钮01" x="547" stateNum="1" var="btn_horseShow"/>
			    <Image skin="png.uiRoleInfo.三角" x="559" y="12" var="icon_showHide" anchorX="0.5" anchorY="0.5" rotation="-180" buttonMode="false" mouseChildren="false" mouseEnabled="false"/>
			    <List x="110" y="16" var="list_horseLamp" repeatY="0">
			      <HorseShowRender name="render" runtime="game.ui.roleInfos.phaseUps.HorseShowRenderUI"/>
			    </List>
			  </Box>
			  <Box x="30" y="367" var="box_talent">
			    <Image skin="png.uiRoleInfo.phaseUpTailent.img_bg1" y="2"/>
			    <Image skin="png.uiRoleInfo.phaseUpTailent.img_line1" x="210"/>
			    <Image skin="png.a5.commonImgs.img_yellow" x="32" y="9"/>
			    <Label text="\l9130113" autoSize="none" x="23" y="14" style="加底标题" width="158" height="20" align="center" var="txt_talent_title"/>
			    <List x="20" y="41" var="list_talent" repeatX="3" spaceX="8">
			      <PhaseUpTalentRenderSize50 name="render" runtime="game.ui.commons.icons.PhaseUpTalentRenderSize50UI"/>
			    </List>
			  </Box>
			</PanelView>;
       
      
      public var subPanel:PanelView = null;
      
      public var expBox:game.ui.roleInfos.phaseUps.ExpBoxUI = null;
      
      public var img_exp:Image = null;
      
      public var box_next:Box = null;
      
      public var list_propNext:List = null;
      
      public var txt_phaseNext:Label = null;
      
      public var box_now:Box = null;
      
      public var list_propNow:List = null;
      
      public var txt_phaseNow:Label = null;
      
      public var playerTitleRenderUI:PlayerTitleRenderUI = null;
      
      public var list_up:List = null;
      
      public var list_nowSkill:List = null;
      
      public var list_nextSKill:List = null;
      
      public var txt_titlePhaseNow:Label = null;
      
      public var btn_tujian:Button = null;
      
      public var box_subBar:Box = null;
      
      public var txt_upProbability:Label = null;
      
      public var btn_stop:Button = null;
      
      public var btn_phaseUpAll:Button = null;
      
      public var btn_phaseUpOne:Button = null;
      
      public var horseLampBg:GRect = null;
      
      public var hasRenderer:WealthRenderS16UI = null;
      
      public var costRender:RoleInfoCostRenderUI = null;
      
      public var txt_hadNow:Label = null;
      
      public var btn_horseShow:Button = null;
      
      public var icon_showHide:Image = null;
      
      public var list_horseLamp:List = null;
      
      public var box_talent:Box = null;
      
      public var txt_talent_title:Label = null;
      
      public var list_talent:List = null;
      
      public function RolePhaseUpPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.PhaseUpTalentRenderSize50UI"] = PhaseUpTalentRenderSize50UI;
         viewClassMap["game.ui.commons.icons.PlayerTitleRenderUI"] = PlayerTitleRenderUI;
         viewClassMap["game.ui.commons.icons.SkillRenderS3UI"] = SkillRenderS3UI;
         viewClassMap["game.ui.commons.icons.SkillRenderS4UI"] = SkillRenderS4UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS16UI"] = WealthRenderS16UI;
         viewClassMap["game.ui.roleInfos.RoleInfoCostRenderUI"] = RoleInfoCostRenderUI;
         viewClassMap["game.ui.roleInfos.phaseUps.ExpBoxUI"] = game.ui.roleInfos.phaseUps.ExpBoxUI;
         viewClassMap["game.ui.roleInfos.phaseUps.HorseShowRenderUI"] = HorseShowRenderUI;
         viewClassMap["game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS1UI"] = RolePropPhaseUpRenderS1UI;
         viewClassMap["game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS2UI"] = RolePropPhaseUpRenderS2UI;
         viewClassMap["game.ui.roleInfos.tupos.RoleUpRenderUI"] = RoleUpRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
