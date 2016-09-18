package game.ui.busyActivity.dragonBoats.donates
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderSize56UI;
   
   public class DragonBoatDonateRequestRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="346" height="70">
			  <Button label="按钮" x="257" style="按钮中绿" var="btn_request" y="21"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_num" width="120" align="center" x="68" y="25" backgroundColor="0xcfbeaf" height="20" style="普通说明" size="13"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_count" width="120" align="center" x="142" y="25" backgroundColor="0xcfbeaf" height="20" style="普通说明" size="13"/>
			  <Image skin="png.a5.commonImgs.分割线" x="127" y="167" left="10" right="10" bottom="-2"/>
			  <WealthRenderSize56 x="6" y="6" var="render_item" runtime="game.ui.commons.icons.WealthRenderSize56UI"/>
			</View>;
       
      
      public var btn_request:Button = null;
      
      public var txt_num:Label = null;
      
      public var txt_count:Label = null;
      
      public var render_item:WealthRenderSize56UI = null;
      
      public function DragonBoatDonateRequestRenderUI()
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
