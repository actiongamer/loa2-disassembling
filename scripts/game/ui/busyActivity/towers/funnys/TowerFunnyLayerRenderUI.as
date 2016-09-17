package game.ui.busyActivity.towers.funnys
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.List;
   
   public class TowerFunnyLayerRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="350.5" height="35">
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_name" width="79" align="center" x="-82" y="-4" backgroundColor="0xcfbeaf" height="20" style="重要提示黄" size="14"/>
			  <List x="0" y="0" repeatX="9" spaceX="4" var="list_reward" centerX="0">
			    <TowerFunnyCellRender name="render" runtime="game.ui.busyActivity.towers.funnys.TowerFunnyCellRenderUI"/>
			  </List>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public var list_reward:List = null;
      
      public function TowerFunnyLayerRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.busyActivity.towers.funnys.TowerFunnyCellRenderUI"] = TowerFunnyCellRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
