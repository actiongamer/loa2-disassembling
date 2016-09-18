package game.ui.abilityRankModule.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.List;
   
   public class AbilityRankListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="700" height="47">
			  <Image skin="png.a5.commonImgs.rank.img_crown1" x="39" y="14" var="img_crown"/>
			  <Label text="普通说明啦啦" autoSize="none" x="74" y="17" style="普通说明" width="143" height="20" align="center" var="txt_name"/>
			  <Label text="123123123" autoSize="none" x="196" y="16" style="普通说明" width="143" height="20" align="center" var="txt_value"/>
			  <Label text="1" autoSize="none" x="-19" y="17" style="普通说明" width="143" height="20" align="center" var="txt_rank"/>
			  <List x="354" y="6" var="list_reward" repeatX="3" spaceX="2">
			    <AbilityRewardRender name="render" runtime="game.ui.abilityRankModule.render.AbilityRewardRenderUI"/>
			  </List>
			  <List x="508" y="6" var="list_superReward" repeatX="6" spaceX="2">
			    <AbilityRewardRender name="render" runtime="game.ui.abilityRankModule.render.AbilityRewardRenderUI"/>
			  </List>
			</View>;
       
      
      public var img_crown:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_value:Label = null;
      
      public var txt_rank:Label = null;
      
      public var list_reward:List = null;
      
      public var list_superReward:List = null;
      
      public function AbilityRankListRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.abilityRankModule.render.AbilityRewardRenderUI"] = AbilityRewardRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
