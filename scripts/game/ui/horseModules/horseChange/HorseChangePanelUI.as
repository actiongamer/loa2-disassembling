package game.ui.horseModules.horseChange
{
   import morn.customs.components.PanelView;
   import game.ui.horseModules.comps.HorseTitleNameUI;
   import game.ui.horseModules.HorseInfoPanelUI;
   import morn.core.components.Label;
   import game.ui.commons.comps.others.RedPointUI;
   
   public class HorseChangePanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="800" height="550">
			  <HorseTitleName x="203" y="75" var="titleNameUI" runtime="game.ui.horseModules.comps.HorseTitleNameUI"/>
			  <HorseSelectPanel x="18" y="83" var="list_selectHorseUI" runtime="game.ui.horseModules.horseChange.HorseSelectPanelUI"/>
			  <HorseInfoPanel x="602" y="75" var="infoPnaelUI" runtime="game.ui.horseModules.HorseInfoPanelUI"/>
			  <Label text="激活条" autoSize="none" x="270" style="小标题" var="txt_state" y="113" width="149" height="18" align="center"/>
			  <HorseActiveNeed x="123" y="407" var="render_activateNeed" runtime="game.ui.horseModules.horseChange.HorseActiveNeedUI"/>
			  <RedPoint x="565" y="217" var="changeSkillRedPoint" runtime="game.ui.commons.comps.others.RedPointUI"/>
			</PanelView>;
       
      
      public var titleNameUI:HorseTitleNameUI = null;
      
      public var list_selectHorseUI:game.ui.horseModules.horseChange.HorseSelectPanelUI = null;
      
      public var infoPnaelUI:HorseInfoPanelUI = null;
      
      public var txt_state:Label = null;
      
      public var render_activateNeed:game.ui.horseModules.horseChange.HorseActiveNeedUI = null;
      
      public var changeSkillRedPoint:RedPointUI = null;
      
      public function HorseChangePanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RedPointUI"] = RedPointUI;
         viewClassMap["game.ui.horseModules.HorseInfoPanelUI"] = HorseInfoPanelUI;
         viewClassMap["game.ui.horseModules.comps.HorseTitleNameUI"] = HorseTitleNameUI;
         viewClassMap["game.ui.horseModules.horseChange.HorseActiveNeedUI"] = game.ui.horseModules.horseChange.HorseActiveNeedUI;
         viewClassMap["game.ui.horseModules.horseChange.HorseSelectPanelUI"] = game.ui.horseModules.horseChange.HorseSelectPanelUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
