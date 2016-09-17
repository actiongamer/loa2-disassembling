package game.ui.teamGuajiScenes
{
   import morn.customs.components.SceneModuleView;
   import game.ui.teamGuajiScenes.mains.CurChallengePanelUI;
   import game.ui.teamGuajiScenes.mains.InfoPanelUI;
   import morn.core.components.Label;
   import game.ui.teamGuajiScenes.mains.GuajiFightLogPanelUI;
   import game.ui.commons.comps.others.RuleDescriptionUI;
   import morn.core.components.List;
   import game.ui.teamGuajiScenes.mains.MemberListRenderUI;
   
   public class TeamGuajiSceneUI extends SceneModuleView
   {
      
      protected static var uiView:XML = <SceneModuleView width="1000" height="600">
			  <CurChallengePanel var="curChallengePanelUI" right="6" x="813" y="59" runtime="game.ui.teamGuajiScenes.mains.CurChallengePanelUI"/>
			  <InfoPanel centerX="0" bottom="90" var="infoPanelUI" x="366" y="350" runtime="game.ui.teamGuajiScenes.mains.InfoPanelUI"/>
			  <Image skin="png.uiTeamGuajis.抬头底" x="436" y="11" centerX="0" top="0"/>
			  <Label text="当前难度:困难" autoSize="none" x="364" style="二级框标题" var="txt_floor" width="272" height="23" align="center" centerX="0" top="1" size="14" y="1"/>
			  <GuajiFightLogPanel var="fightLogPanel" x="-15" top="380" runtime="game.ui.teamGuajiScenes.mains.GuajiFightLogPanelUI"/>
			  <RuleDescription y="11" right="16" x="845" var="helpView" runtime="game.ui.commons.comps.others.RuleDescriptionUI"/>
			  <List x="34" repeatY="2" spaceY="4" var="list_member" y="155" top="220">
			    <MemberListRender name="render" runtime="game.ui.teamGuajiScenes.mains.MemberListRenderUI"/>
			  </List>
			  <Label text="\l41210132 " autoSize="none" style="渐变2" width="104" height="25" align="left" x="16" y="191"/>
			</SceneModuleView>;
       
      
      public var curChallengePanelUI:CurChallengePanelUI = null;
      
      public var infoPanelUI:InfoPanelUI = null;
      
      public var txt_floor:Label = null;
      
      public var fightLogPanel:GuajiFightLogPanelUI = null;
      
      public var helpView:RuleDescriptionUI = null;
      
      public var list_member:List = null;
      
      public function TeamGuajiSceneUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RuleDescriptionUI"] = RuleDescriptionUI;
         viewClassMap["game.ui.teamGuajiScenes.mains.CurChallengePanelUI"] = CurChallengePanelUI;
         viewClassMap["game.ui.teamGuajiScenes.mains.GuajiFightLogPanelUI"] = GuajiFightLogPanelUI;
         viewClassMap["game.ui.teamGuajiScenes.mains.InfoPanelUI"] = InfoPanelUI;
         viewClassMap["game.ui.teamGuajiScenes.mains.MemberListRenderUI"] = MemberListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
