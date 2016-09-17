package game.ui.busyActivity.dragonBoats.donates
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderSize56UI;
   
   public class DragonBoatDonateRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="450" height="70">
			  <Button label="按钮" x="337" style="按钮中黄" var="btn_request" y="21"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_player_name" width="120" align="center" x="95" y="25" backgroundColor="0xcfbeaf" height="20" style="普通说明" size="13"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_count" width="120" align="center" x="203" y="25" backgroundColor="0xcfbeaf" height="20" style="普通说明" size="13"/>
			  <WealthRenderSize56 x="6" y="6" var="render_item" runtime="game.ui.commons.icons.WealthRenderSize56UI"/>
			</View>;
       
      
      public var btn_request:Button = null;
      
      public var txt_player_name:Label = null;
      
      public var txt_count:Label = null;
      
      public var render_item:WealthRenderSize56UI = null;
      
      public function DragonBoatDonateRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderSize56UI"] = WealthRenderSize56UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
