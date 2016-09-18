package game.ui.teamPKCS
{
   import morn.customs.components.SceneModuleView;
   import game.ui.commons.comps.others.RuleDescriptionUI;
   
   public class TeamPKCModuleUI extends SceneModuleView
   {
      
      protected static var uiView:XML = <SceneModuleView width="600" height="400">
			  <RuleDescription right="20" top="10" var="box_rule" x="30" y="30" runtime="game.ui.commons.comps.others.RuleDescriptionUI"/>
			  <RuleDescription right="20" top="50" var="box_time" x="39" y="85" runtime="game.ui.commons.comps.others.RuleDescriptionUI"/>
			</SceneModuleView>;
       
      
      public var box_rule:RuleDescriptionUI = null;
      
      public var box_time:RuleDescriptionUI = null;
      
      public function TeamPKCModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RuleDescriptionUI"] = RuleDescriptionUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
