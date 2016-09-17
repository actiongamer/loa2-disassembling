package game.ui.petModule.baseInfo
{
   import morn.customs.components.FadeView;
   import morn.core.components.Panel;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.commons.props.FightValueBoxUI;
   import morn.core.components.Box;
   import game.ui.petModule.comps.PetComposeCostRenderUI;
   import morn.core.components.Button;
   import game.ui.commons.comps.others.EquipStarRenderUI;
   import game.ui.roleInfos.equipPanels.BasePropRenderUI;
   import game.ui.roleTeam.render.RoleSkillRenderUI;
   
   public class PetInfoPanelUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView name="render" width="770" height="472" mouseEnabled="true">
			  <Image skin="png.uiPet.bg2" x="532" y="-37"/>
			  <Panel x="538" y="18" width="220" height="434" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" var="infoPanel">
			    <Image skin="png.a5.commonImgs.img_yellow" x="29" y="39"/>
			    <Image skin="png.a5.commonImgs.img_yellow" x="29" y="169"/>
			    <Image skin="png.uiPet.img5" y="-7" x="0"/>
			    <List x="62" y="198" var="list_skill" repeatX="2" spaceX="16" centerX="0">
			      <RoleSkillRender name="render" runtime="game.ui.roleTeam.render.RoleSkillRenderUI"/>
			    </List>
			    <List x="32" y="65" repeatY="5" var="list_baseProp">
			      <BasePropRender name="render" runtime="game.ui.roleInfos.equipPanels.BasePropRenderUI"/>
			    </List>
			    <Label text="\l32000009" autoSize="none" x="29" y="42" style="加底标题" width="142" height="18" align="center" var="txt_titlePlayerProp"/>
			    <FightValueBox x="29" y="7" var="fightValueBoxRef" runtime="game.ui.commons.props.FightValueBoxUI"/>
			    <Label text="\l32000010" autoSize="none" x="29" y="175" style="加底标题" width="142" height="18" align="center" var="txt_titleSkill"/>
			    <VBox x="9" y="237">
			      <Label text="\l32000026" autoSize="none" style="普通说明" width="195" align="left" var="l0" multiline="true" wordWrap="true"/>
			      <Box x="0" y="37" var="box_down1">
			        <Image skin="png.a5.commonImgs.img_yellow" x="20"/>
			        <Label text="战宠光环" autoSize="none" y="3" style="加底标题" width="182" height="18" align="center" var="txt_grolyTitle"/>
			        <List x="23" y="29" repeatY="5" var="list_allProp">
			          <BasePropRender name="render" runtime="game.ui.roleInfos.equipPanels.BasePropRenderUI"/>
			        </List>
			      </Box>
			      <Label text="\l32000021" autoSize="none" style="普通说明暗色深" width="195" align="left" y="167" var="l2" multiline="true" wordWrap="true"/>
			      <Box y="189" var="box_extra">
			        <Image skin="png.a5.commonImgs.img_yellow" x="14"/>
			        <Label text="\l32000024" autoSize="none" x="10" y="5" style="加底标题" width="162" height="18" align="center"/>
			        <Label text="123123123123" autoSize="left" y="29" style="普通说明暗色深" width="195" align="left" var="txt_legend" multiline="true" wordWrap="true"/>
			      </Box>
			    </VBox>
			  </Panel>
			  <Image skin="png.uiPet.bg1" x="90" y="387"/>
			  <Box x="114" y="406" var="box_compose">
			    <PetComposeCostRender x="68" var="costRender" runtime="game.ui.petModule.comps.PetComposeCostRenderUI"/>
			    <Label text="\l32000005" stroke="0xffffff" mouseEnabled="false" var="txt_needLabl" backgroundColor="0xcfbeaf" autoSize="left" y="2" letterSpacing="1" width="64" height="18" align="left" style="普通说明"/>
			    <Button label="\l32000007" x="277" style="按钮大绿" y="13" var="btn_compose"/>
			  </Box>
			  <List repeatX="10" var="list_stars" spaceX="-6" x="135" y="355">
			    <EquipStarRender name="render" runtime="game.ui.commons.comps.others.EquipStarRenderUI"/>
			  </List>
			  <Box x="99" y="419" var="box_follow_option">
			    <Button label="合成" x="148" style="按钮大绿" var="btn_option"/>
			    <Box var="box_follow">
			      <Button label="跟随" x="5" style="按钮大绿" var="btn_follow"/>
			      <Label text="tip_follow" stroke="0xffffff" mouseEnabled="false" var="txt_tip_follow" backgroundColor="0xcfbeaf" autoSize="left" y="33" letterSpacing="1" width="136" height="18" align="center" style="重要提示黄"/>
			    </Box>
			  </Box>
			  <List repeatX="5" var="list_stars_2" spaceX="-6" x="230" y="322">
			    <EquipStarRender name="render" runtime="game.ui.commons.comps.others.EquipStarRenderUI"/>
			  </List>
			  <Label text="\l320000202" stroke="0xffffff" mouseEnabled="true" var="txt_goto_secret" backgroundColor="0xcfbeaf" autoSize="left" y="59" letterSpacing="1" width="136" height="18" align="center" style="重要提示黄" x="93" underline="true" buttonMode="true" mouseChildren="false"/>
			</FadeView>;
       
      
      public var infoPanel:Panel = null;
      
      public var list_skill:List = null;
      
      public var list_baseProp:List = null;
      
      public var txt_titlePlayerProp:Label = null;
      
      public var fightValueBoxRef:FightValueBoxUI = null;
      
      public var txt_titleSkill:Label = null;
      
      public var l0:Label = null;
      
      public var box_down1:Box = null;
      
      public var txt_grolyTitle:Label = null;
      
      public var list_allProp:List = null;
      
      public var l2:Label = null;
      
      public var box_extra:Box = null;
      
      public var txt_legend:Label = null;
      
      public var box_compose:Box = null;
      
      public var costRender:PetComposeCostRenderUI = null;
      
      public var txt_needLabl:Label = null;
      
      public var btn_compose:Button = null;
      
      public var list_stars:List = null;
      
      public var box_follow_option:Box = null;
      
      public var btn_option:Button = null;
      
      public var box_follow:Box = null;
      
      public var btn_follow:Button = null;
      
      public var txt_tip_follow:Label = null;
      
      public var list_stars_2:List = null;
      
      public var txt_goto_secret:Label = null;
      
      public function PetInfoPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.EquipStarRenderUI"] = EquipStarRenderUI;
         viewClassMap["game.ui.commons.props.FightValueBoxUI"] = FightValueBoxUI;
         viewClassMap["game.ui.petModule.comps.PetComposeCostRenderUI"] = PetComposeCostRenderUI;
         viewClassMap["game.ui.roleInfos.equipPanels.BasePropRenderUI"] = BasePropRenderUI;
         viewClassMap["game.ui.roleTeam.render.RoleSkillRenderUI"] = RoleSkillRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
