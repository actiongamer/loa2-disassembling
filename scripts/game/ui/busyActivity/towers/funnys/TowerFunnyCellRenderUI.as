package game.ui.busyActivity.towers.funnys
{
   import morn.core.components.View;
   import game.ui.commons.icons.WealthRenderSize34UI;
   
   public class TowerFunnyCellRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="35" height="35">
			  <WealthRenderSize34 x="0" y="0" var="renderWealth" runtime="game.ui.commons.icons.WealthRenderSize34UI"/>
			</View>;
       
      
      public var renderWealth:WealthRenderSize34UI = null;
      
      public function TowerFunnyCellRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderSize34UI"] = WealthRenderSize34UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
