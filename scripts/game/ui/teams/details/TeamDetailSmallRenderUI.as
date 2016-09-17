package game.ui.teams.details
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS13UI;
   
   public class TeamDetailSmallRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="120" height="10">
			  <Image skin="png.uiTeams.队伍黑的透明底" x="-16" y="-8"/>
			  <Label text="额外收益" autoSize="none" x="-19" y="-4" style="普通说明" width="74" height="18" var="txt_tip" align="right"/>
			  <WealthRenderS13 x="60" y="-5.5" var="extra_reward" runtime="game.ui.commons.icons.WealthRenderS13UI"/>
			</WealthRender>;
       
      
      public var txt_tip:Label = null;
      
      public var extra_reward:WealthRenderS13UI = null;
      
      public function TeamDetailSmallRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS13UI"] = WealthRenderS13UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
