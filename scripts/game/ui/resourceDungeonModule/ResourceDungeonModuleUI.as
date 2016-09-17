package game.ui.resourceDungeonModule
{
   import morn.customs.components.SceneModuleView;
   import game.ui.fightPlayers.RightHeaderUI;
   
   public class ResourceDungeonModuleUI extends SceneModuleView
   {
      
      protected static var uiView:XML = <SceneModuleView width="600" height="400">
			  <RightHeader x="907" y="11" right="4" top="4" var="rightHeaderUI" runtime="game.ui.fightPlayers.RightHeaderUI"/>
			</SceneModuleView>;
       
      
      public var rightHeaderUI:RightHeaderUI = null;
      
      public function ResourceDungeonModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.fightPlayers.RightHeaderUI"] = RightHeaderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
