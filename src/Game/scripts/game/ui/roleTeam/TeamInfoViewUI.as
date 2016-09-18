package game.ui.roleTeam
{
   import morn.core.components.View;
   import morn.core.components.List;
   import game.ui.roleTeam.render.TeamRoleViewRenderUI;
   
   public class TeamInfoViewUI extends View
   {
      
      protected static var uiView:XML = <View width="263" height="342">
			  <List var="list_teamHero" x="16" y="7">
			    <TeamRoleViewRender name="item0" x="0" y="0" buttonMode="true" runtime="game.ui.roleTeam.render.TeamRoleViewRenderUI"/>
			    <TeamRoleViewRender x="134" name="item1" y="0" buttonMode="true" runtime="game.ui.roleTeam.render.TeamRoleViewRenderUI"/>
			    <TeamRoleViewRender name="item2" y="174" x="0" buttonMode="true" runtime="game.ui.roleTeam.render.TeamRoleViewRenderUI"/>
			    <TeamRoleViewRender x="134" y="174" name="item3" buttonMode="true" runtime="game.ui.roleTeam.render.TeamRoleViewRenderUI"/>
			  </List>
			</View>;
       
      
      public var list_teamHero:List = null;
      
      public function TeamInfoViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.roleTeam.render.TeamRoleViewRenderUI"] = TeamRoleViewRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
