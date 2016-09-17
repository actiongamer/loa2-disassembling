package game.ui.battlefield.BattlefieldTodayReward
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Label;
   import morn.core.components.List;
   
   public class BattlefieldTodayRewardModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="600" height="400">
			  <PanelBgS3 x="4" y="2" width="640" height="389" frameStyle="2"/>
			  <Label text="\l50500136" autoSize="none" x="198" y="354" style="普通说明" width="254" align="center" height="20" var="txt_killed"/>
			  <List x="26" y="48" repeatX="3" spaceX="10" var="list_task">
			    <BattlefieldTodayRewardRender name="render" runtime="game.ui.battlefield.BattlefieldTodayReward.BattlefieldTodayRewardRenderUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var txt_killed:Label = null;
      
      public var list_task:List = null;
      
      public function BattlefieldTodayRewardModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.battlefield.BattlefieldTodayReward.BattlefieldTodayRewardRenderUI"] = BattlefieldTodayRewardRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
