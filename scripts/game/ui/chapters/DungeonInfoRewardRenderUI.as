package game.ui.chapters
{
   import morn.core.components.View;
   import game.ui.commons.icons.WealthRenderS5UI;
   import morn.core.components.Label;
   
   public class DungeonInfoRewardRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="50" height="62">
			  <WealthRenderS5 x="0" y="0" var="render_wealth" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_needNum" width="54" align="center" x="-2" y="49" backgroundColor="0xcfbeaf" style="普通说明"/>
			</View>;
       
      
      public var render_wealth:WealthRenderS5UI = null;
      
      public var txt_needNum:Label = null;
      
      public function DungeonInfoRewardRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS5UI"] = WealthRenderS5UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
