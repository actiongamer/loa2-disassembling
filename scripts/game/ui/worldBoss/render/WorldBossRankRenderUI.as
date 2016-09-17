package game.ui.worldBoss.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.List;
   
   public class WorldBossRankRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="766" height="40">
			  <Image skin="png.a5.commonImgs.1ST" x="33" y="8" var="img_rank"/>
			  <Label text="普通说明" autoSize="none" x="147" y="12" style="普通说明" var="txt_name" width="122" height="20" align="center"/>
			  <Label text="100000000" autoSize="none" x="338" y="13" style="普通说明" var="txt_count" align="center" width="103" height="20"/>
			  <Label text="111" autoSize="none" x="2" y="12" style="普通说明" var="txt_rank" width="90" height="19" align="center"/>
			  <List x="576" y="1" var="list_rwd" spaceX="10">
			    <HornorRankRewardRender name="render" runtime="game.ui.worldBoss.render.HornorRankRewardRenderUI"/>
			  </List>
			</View>;
       
      
      public var img_rank:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_count:Label = null;
      
      public var txt_rank:Label = null;
      
      public var list_rwd:List = null;
      
      public function WorldBossRankRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.worldBoss.render.HornorRankRewardRenderUI"] = HornorRankRewardRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
