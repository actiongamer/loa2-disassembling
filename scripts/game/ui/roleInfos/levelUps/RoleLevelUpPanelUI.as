package game.ui.roleInfos.levelUps
{
   import morn.customs.components.PanelView;
   import morn.core.components.Box;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.commons.icons.PlayerTitleRenderUI;
   import game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS1UI;
   import game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS2UI;
   import game.ui.roleInfos.tupos.RoleUpRenderUI;
   
   public class RoleLevelUpPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="798" height="481">
			  <RoleLevelUpSubBar x="139" y="307" var="subBar" runtime="game.ui.roleInfos.levelUps.RoleLevelUpSubBarUI"/>
			  <Box x="167" y="113" var="box_nowLevel">
			    <List var="list_propBase" repeatX="1" repeatY="5" spaceY="6" y="24">
			      <RolePropPhaseUpRenderS1 name="render" runtime="game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS1UI"/>
			    </List>
			    <Label text="Lv.8" autoSize="none" stroke="0x0" var="txt_levelNow" letterSpacing="1" align="center" x="19" width="46.25" height="18" style="随品质变化" bold="true" y="0"/>
			    <Image skin="png.uiRoleInfo.角色-属性条" x="6" y="21" width="95" height="1"/>
			  </Box>
			  <Box x="544" y="112" var="box_nextLevel">
			    <List var="list_propNext" repeatX="1" repeatY="5" spaceY="6" y="25">
			      <RolePropPhaseUpRenderS2 name="render" runtime="game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS2UI"/>
			    </List>
			    <Label text="Lv.8" autoSize="none" stroke="0x0" var="txt_levelNext" letterSpacing="1" align="center" x="20" width="46.25" height="18" style="重要提示绿" bold="true"/>
			    <Image skin="png.uiRoleInfo.角色-属性条" x="7" y="22" width="95" height="1"/>
			  </Box>
			  <PlayerTitleRender x="256" y="11" var="playerTitleRender" runtime="game.ui.commons.icons.PlayerTitleRenderUI"/>
			  <List x="622" y="137" repeatY="5" spaceY="3" var="list_up">
			    <RoleUpRender name="render" runtime="game.ui.roleInfos.tupos.RoleUpRenderUI"/>
			  </List>
			</PanelView>;
       
      
      public var subBar:game.ui.roleInfos.levelUps.RoleLevelUpSubBarUI = null;
      
      public var box_nowLevel:Box = null;
      
      public var list_propBase:List = null;
      
      public var txt_levelNow:Label = null;
      
      public var box_nextLevel:Box = null;
      
      public var list_propNext:List = null;
      
      public var txt_levelNext:Label = null;
      
      public var playerTitleRender:PlayerTitleRenderUI = null;
      
      public var list_up:List = null;
      
      public function RoleLevelUpPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.PlayerTitleRenderUI"] = PlayerTitleRenderUI;
         viewClassMap["game.ui.roleInfos.levelUps.RoleLevelUpSubBarUI"] = game.ui.roleInfos.levelUps.RoleLevelUpSubBarUI;
         viewClassMap["game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS1UI"] = RolePropPhaseUpRenderS1UI;
         viewClassMap["game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS2UI"] = RolePropPhaseUpRenderS2UI;
         viewClassMap["game.ui.roleInfos.tupos.RoleUpRenderUI"] = RoleUpRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
