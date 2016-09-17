package game.ui.petModule.levelUp
{
   import morn.customs.components.FadeView;
   import morn.core.components.Box;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS1UI;
   import game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS2UI;
   import game.ui.roleInfos.tupos.RoleUpRenderUI;
   
   public class PetLevelUpPanelUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="770" height="472">
			  <Image skin="png.a5.commonImgs.img_yellow" x="116" y="91"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="578" y="91"/>
			  <Box x="144" y="97" var="box_nowLevel">
			    <List var="list_propBase" repeatX="1" repeatY="5" spaceY="6" y="24">
			      <RolePropPhaseUpRenderS1 name="render" runtime="game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS1UI"/>
			    </List>
			    <Label text="Lv.8" autoSize="none" stroke="0x0" var="txt_levelNow" letterSpacing="1" align="center" x="19" width="46.25" height="18" style="随品质变化" bold="true" y="0"/>
			    <Image skin="png.uiRoleInfo.角色-属性条" x="6" y="21" width="95" height="1"/>
			  </Box>
			  <Box x="606" y="97" var="box_nextLevel">
			    <List var="list_propNext" repeatX="1" repeatY="5" spaceY="6" y="25">
			      <RolePropPhaseUpRenderS2 name="render" runtime="game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS2UI"/>
			    </List>
			    <Label text="Lv.8" autoSize="none" stroke="0x0" var="txt_levelNext" letterSpacing="1" align="center" x="20" width="46.25" height="18" style="重要提示绿" bold="true"/>
			    <Image skin="png.uiRoleInfo.角色-属性条" x="7" y="22" width="95" height="1"/>
			  </Box>
			  <List x="684" y="122" repeatY="5" spaceY="3" var="list_up">
			    <RoleUpRender name="render" runtime="game.ui.roleInfos.tupos.RoleUpRenderUI"/>
			  </List>
			  <PetLevelUpSubBar x="159" y="313" var="subBar" runtime="game.ui.petModule.levelUp.PetLevelUpSubBarUI"/>
			</FadeView>;
       
      
      public var box_nowLevel:Box = null;
      
      public var list_propBase:List = null;
      
      public var txt_levelNow:Label = null;
      
      public var box_nextLevel:Box = null;
      
      public var list_propNext:List = null;
      
      public var txt_levelNext:Label = null;
      
      public var list_up:List = null;
      
      public var subBar:game.ui.petModule.levelUp.PetLevelUpSubBarUI = null;
      
      public function PetLevelUpPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.petModule.levelUp.PetLevelUpSubBarUI"] = game.ui.petModule.levelUp.PetLevelUpSubBarUI;
         viewClassMap["game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS1UI"] = RolePropPhaseUpRenderS1UI;
         viewClassMap["game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS2UI"] = RolePropPhaseUpRenderS2UI;
         viewClassMap["game.ui.roleInfos.tupos.RoleUpRenderUI"] = RoleUpRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
