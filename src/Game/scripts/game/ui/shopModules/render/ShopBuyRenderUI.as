package game.ui.shopModules.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRender60X60UI;
   
   public class ShopBuyRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="186" height="60">
			  <Label stroke="0xffffff" mouseEnabled="false" var="txt_name" width="220" align="left" x="70" y="0" height="23" text="泰坦之光" size="14" style="随品质变化"/>
			  <Label stroke="0xffffff" mouseEnabled="false" var="txt_limit" width="216" align="left" x="70" y="21" style="普通说明" height="18" text="每日限购：30/50"/>
			  <Label stroke="0xffffff" mouseEnabled="false" var="txt_hasNum" width="83" align="left" x="105" y="40" style="普通说明" height="18" text="0"/>
			  <WealthRender60X60 x="0" y="0" var="wealthRender" runtime="game.ui.commons.icons.WealthRender60X60UI"/>
			  <Label text="\l60300008" stroke="0xffffff" mouseEnabled="false" width="42" align="left" x="70" y="40" style="普通说明" height="18"/>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public var txt_limit:Label = null;
      
      public var txt_hasNum:Label = null;
      
      public var wealthRender:WealthRender60X60UI = null;
      
      public function ShopBuyRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRender60X60UI"] = WealthRender60X60UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
