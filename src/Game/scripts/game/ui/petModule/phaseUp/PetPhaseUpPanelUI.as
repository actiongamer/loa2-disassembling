package game.ui.petModule.phaseUp
{
   import morn.customs.components.FadeView;
   import morn.core.components.Box;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import game.ui.commons.icons.WealthRenderS16UI;
   import game.ui.roleInfos.RoleInfoCostRenderUI;
   import morn.customs.components.GRect;
   import morn.core.components.Image;
   import morn.core.components.ProgressBar;
   import game.ui.commons.icons.SkillRenderS3UI;
   import game.ui.commons.icons.SkillRenderS4UI;
   import game.ui.roleInfos.phaseUps.HorseShowRenderUI;
   import game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS1UI;
   import game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS2UI;
   import game.ui.roleInfos.tupos.RoleUpRenderUI;
   
   public class PetPhaseUpPanelUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView var="subPanel" width="798" height="481">
			  <Box x="591" y="53" var="box_next">
			    <Image skin="png.a5.commonImgs.img_yellow"/>
			    <List var="list_propNext" repeatX="1" repeatY="6" spaceY="5" y="33" x="34">
			      <RolePropPhaseUpRenderS2 x="0" y="0" name="render" runtime="game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS2UI"/>
			    </List>
			    <Label text="2阶" autoSize="none" x="66" height="18" var="txt_phaseNext" bold="true" letterSpacing="0" align="center" style="普通说明" y="6"/>
			  </Box>
			  <Box x="87" y="55" var="box_now">
			    <Image skin="png.a5.commonImgs.img_yellow"/>
			    <List var="list_propNow" repeatX="1" repeatY="6" y="30" width="93" height="138" spaceY="5" x="37">
			      <RolePropPhaseUpRenderS1 x="0" y="-1" name="render" runtime="game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS1UI"/>
			    </List>
			    <Label text="1阶" autoSize="left" x="67" var="txt_phaseNow" bold="true" letterSpacing="0" style="普通说明" y="5"/>
			  </Box>
			  <Button x="687" y="395" style="按钮小黄" var="btn_tujian" stateNum="1" skin="png.a5.commonImgs.btn_tujian" labelMargin="0,30,0,0"/>
			  <List x="679" y="83" repeatY="6" spaceY="3" var="list_up">
			    <RoleUpRender name="render" runtime="game.ui.roleInfos.tupos.RoleUpRenderUI"/>
			  </List>
			  <List x="118" y="227" var="list_nowSkill" repeatY="3" spaceY="10">
			    <SkillRenderS3 name="render" runtime="game.ui.commons.icons.SkillRenderS3UI"/>
			  </List>
			  <List x="613" y="227" var="list_nextSKill" repeatY="3" spaceY="10">
			    <SkillRenderS4 name="render" runtime="game.ui.commons.icons.SkillRenderS4UI"/>
			  </List>
			  <Box x="142" y="58" var="box_subBar">
			    <Image skin="png.uiPet.img_levelUpBottom" y="292"/>
			    <Button label="取消" stateNum="1" buttonMode="true" x="306" var="btn_stop" labelBold="false" y="349" style="按钮大红"/>
			    <Button label="一键进阶" stateNum="1" buttonMode="true" x="306" var="btn_phaseUpAll" labelBold="false" style="按钮大黄" y="349"/>
			    <Button label="\l30100005" stateNum="1" buttonMode="true" var="btn_phaseUpOne" style="按钮大绿" labelMargin="25" x="123" y="349"/>
			    <WealthRenderS16 x="183" y="385" var="hasRenderer" runtime="game.ui.commons.icons.WealthRenderS16UI"/>
			    <RoleInfoCostRender var="costRender" x="136" y="358" buttonMode="true" runtime="game.ui.roleInfos.RoleInfoCostRenderUI"/>
			    <Label text="\l30600203" autoSize="none" x="141" align="left" stroke="0x0" var="txt_hadNow" y="390" style="随品质变化"/>
			    <Image skin="png.uiPet.img_gradeUpBg" x="54" y="268"/>
			    <Label text="\l32000339" autoSize="none" align="center" stroke="0x0" var="txt_desc" y="272" style="随品质变化" width="508" height="20" x="25"/>
			    <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" x="79" fillColor="0x0" width="375" height="16" var="horseLampBg" y="3"/>
			    <Button skin="png.uiPet.btn_缩放按钮01" x="453" stateNum="1" var="btn_horseShow"/>
			    <Image skin="png.uiPet.三角" x="465" y="12" var="icon_showHide" anchorX="0.5" anchorY="0.5" rotation="-180" buttonMode="false" mouseChildren="false" mouseEnabled="false"/>
			    <List x="79" y="19" var="list_horseLamp" repeatY="0" width="375">
			      <HorseShowRender name="render" width="375" runtime="game.ui.roleInfos.phaseUps.HorseShowRenderUI"/>
			    </List>
			  </Box>
			  <Box x="235" y="355">
			    <ProgressBar skin="png.uiPet.progress" x="18" var="progressBar" width="326"/>
			    <Image skin="png.uiPet.进度条框" y="13" var="img_progressBg"/>
			    <Label text="\l30600203" autoSize="none" align="center" stroke="0x0" var="txt_progress" y="20" style="随品质变化" width="359" height="20" x="0"/>
			    <Image skin="png.a5.comps.img_block" x="180" y="22" width="13" height="13" var="img_flyTarget"/>
			  </Box>
			  <Label stroke="0xffffff" mouseEnabled="false" backgroundColor="0xcfbeaf" autoSize="left" x="675" y="446" letterSpacing="1" width="94" height="18" align="center" style="普通说明" text="\l9030105" mouseChildren="false"/>
			</FadeView>;
       
      
      public var subPanel:FadeView = null;
      
      public var box_next:Box = null;
      
      public var list_propNext:List = null;
      
      public var txt_phaseNext:Label = null;
      
      public var box_now:Box = null;
      
      public var list_propNow:List = null;
      
      public var txt_phaseNow:Label = null;
      
      public var btn_tujian:Button = null;
      
      public var list_up:List = null;
      
      public var list_nowSkill:List = null;
      
      public var list_nextSKill:List = null;
      
      public var box_subBar:Box = null;
      
      public var btn_stop:Button = null;
      
      public var btn_phaseUpAll:Button = null;
      
      public var btn_phaseUpOne:Button = null;
      
      public var hasRenderer:WealthRenderS16UI = null;
      
      public var costRender:RoleInfoCostRenderUI = null;
      
      public var txt_hadNow:Label = null;
      
      public var txt_desc:Label = null;
      
      public var horseLampBg:GRect = null;
      
      public var btn_horseShow:Button = null;
      
      public var icon_showHide:Image = null;
      
      public var list_horseLamp:List = null;
      
      public var progressBar:ProgressBar = null;
      
      public var img_progressBg:Image = null;
      
      public var txt_progress:Label = null;
      
      public var img_flyTarget:Image = null;
      
      public function PetPhaseUpPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.SkillRenderS3UI"] = SkillRenderS3UI;
         viewClassMap["game.ui.commons.icons.SkillRenderS4UI"] = SkillRenderS4UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS16UI"] = WealthRenderS16UI;
         viewClassMap["game.ui.roleInfos.RoleInfoCostRenderUI"] = RoleInfoCostRenderUI;
         viewClassMap["game.ui.roleInfos.phaseUps.HorseShowRenderUI"] = HorseShowRenderUI;
         viewClassMap["game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS1UI"] = RolePropPhaseUpRenderS1UI;
         viewClassMap["game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS2UI"] = RolePropPhaseUpRenderS2UI;
         viewClassMap["game.ui.roleInfos.tupos.RoleUpRenderUI"] = RoleUpRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
