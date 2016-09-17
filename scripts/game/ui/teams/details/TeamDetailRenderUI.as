package game.ui.teams.details
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Button;
   import morn.core.components.Label;
   
   public class TeamDetailRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="196" height="80">
			  <Button label="请离开" style="按钮小黄" var="btn_kick" x="40" y="3"/>
			  <TeamDetailSmallRender x="15.5" y="37" var="render_small" runtime="game.ui.teams.details.TeamDetailSmallRenderUI"/>
			  <Label text="普通说明" autoSize="none" x="-8" y="58" style="普通说明" align="center" width="168" height="20" var="txt_speed"/>
			</WealthRender>;
       
      
      public var btn_kick:Button = null;
      
      public var render_small:game.ui.teams.details.TeamDetailSmallRenderUI = null;
      
      public var txt_speed:Label = null;
      
      public function TeamDetailRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.teams.details.TeamDetailSmallRenderUI"] = game.ui.teams.details.TeamDetailSmallRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
