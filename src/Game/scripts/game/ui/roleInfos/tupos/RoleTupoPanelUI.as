package game.ui.roleInfos.tupos
{
   import morn.customs.components.PanelView;
   import morn.core.components.Box;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.commons.icons.PlayerTitleRenderUI;
   import morn.core.components.Button;
   import game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS1UI;
   import game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS2UI;
   
   public class RoleTupoPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="798" height="481">
			  <RoleTupoSubBar x="114.5" y="341" var="subBar" runtime="game.ui.roleInfos.tupos.RoleTupoSubBarUI"/>
			  <Box x="636" y="76" var="box_next" width="93" height="138">
			    <List var="list_propNext" repeatX="1" repeatY="5" spaceY="6" y="23" x="-13">
			      <RolePropPhaseUpRenderS2 name="render" runtime="game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS2UI"/>
			    </List>
			    <Label text="突破+11" autoSize="left" x="-35" height="22" var="txt_tupoNext" bold="true" size="13" style="提示绿" y="-3" width="150" align="center"/>
			    <Image skin="png.uiRoleInfo.角色-属性条" x="1" y="22" width="95" height="1"/>
			  </Box>
			  <Box x="77" y="77" var="box_now">
			    <List var="list_propBase" repeatX="1" repeatY="5" spaceY="6" y="23" width="93" height="138" x="0.5">
			      <RolePropPhaseUpRenderS1 x="1" y="1" name="render" runtime="game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS1UI"/>
			    </List>
			    <Label text="突破+10" autoSize="left" x="-53" height="18" var="txt_tupoNow" bold="true" size="13" letterSpacing="0" style="随品质变化" y="0" width="200" align="center"/>
			    <Image skin="png.uiRoleInfo.角色-属性条" y="20" width="95" height="1"/>
			  </Box>
			  <PlayerTitleRender x="256" y="11" var="playerNow" runtime="game.ui.commons.icons.PlayerTitleRenderUI"/>
			  <PlayerTitleRender x="379" y="16" scale="0.8" var="playerNext" visible="false" runtime="game.ui.commons.icons.PlayerTitleRenderUI"/>
			  <List x="718" y="99" repeatY="5" spaceY="3" var="list_up">
			    <RoleUpRender name="render" runtime="game.ui.roleInfos.tupos.RoleUpRenderUI"/>
			  </List>
			  <TupoUnlockSkillRender x="624" y="226" var="render_unlockSkill" runtime="game.ui.roleInfos.tupos.TupoUnlockSkillRenderUI"/>
			  <Box x="653" y="370">
			    <Button stateNum="1" buttonMode="true" x="22" var="btn_tianfu" labelBold="false" style="按钮小黄" labelMargin="0,30,0,0" skin="png.uiRoleInfo.书"/>
			    <Label text="\l30100015" autoSize="none" align="center" stroke="0x0" y="56" style="随品质变化" width="122" height="20" x="-6"/>
			  </Box>
			</PanelView>;
       
      
      public var subBar:game.ui.roleInfos.tupos.RoleTupoSubBarUI = null;
      
      public var box_next:Box = null;
      
      public var list_propNext:List = null;
      
      public var txt_tupoNext:Label = null;
      
      public var box_now:Box = null;
      
      public var list_propBase:List = null;
      
      public var txt_tupoNow:Label = null;
      
      public var playerNow:PlayerTitleRenderUI = null;
      
      public var playerNext:PlayerTitleRenderUI = null;
      
      public var list_up:List = null;
      
      public var render_unlockSkill:game.ui.roleInfos.tupos.TupoUnlockSkillRenderUI = null;
      
      public var btn_tianfu:Button = null;
      
      public function RoleTupoPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.PlayerTitleRenderUI"] = PlayerTitleRenderUI;
         viewClassMap["game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS1UI"] = RolePropPhaseUpRenderS1UI;
         viewClassMap["game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS2UI"] = RolePropPhaseUpRenderS2UI;
         viewClassMap["game.ui.roleInfos.tupos.RoleTupoSubBarUI"] = game.ui.roleInfos.tupos.RoleTupoSubBarUI;
         viewClassMap["game.ui.roleInfos.tupos.RoleUpRenderUI"] = RoleUpRenderUI;
         viewClassMap["game.ui.roleInfos.tupos.TupoUnlockSkillRenderUI"] = game.ui.roleInfos.tupos.TupoUnlockSkillRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
