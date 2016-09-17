package game.ui.shopModules
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS10UI;
   
   public class BuyStaminaUI extends View
   {
      
      protected static var uiView:XML = <View width="305" height="106">
			  <Image skin="png.a5.commonImgs.img_arrowRight" x="170" y="91"/>
			  <Label text="是否花费钻石购买体力?" autoSize="none" x="88" y="70" style="普通说明" width="207.85" align="center" var="txt_prompt"/>
			  <WealthRenderS10 x="118" y="95" var="renderFrom" runtime="game.ui.commons.icons.WealthRenderS10UI"/>
			  <WealthRenderS10 x="224" y="95" var="renderTo" runtime="game.ui.commons.icons.WealthRenderS10UI"/>
			  <Label text="体力不足" autoSize="none" x="41" y="43" style="不足禁止红" width="300" height="19" align="center" var="txt_title" size="15"/>
			  <Label text="是否花费钻石购买体力?" autoSize="none" x="41" y="131" style="普通说明" width="300" align="center" var="txt_prompt2"/>
			  <Label text="是否花费钻石购买体力?" autoSize="none" x="41" y="153" style="普通说明" width="300" align="center" var="txt_viphint" height="20"/>
			</View>;
       
      
      public var txt_prompt:Label = null;
      
      public var renderFrom:WealthRenderS10UI = null;
      
      public var renderTo:WealthRenderS10UI = null;
      
      public var txt_title:Label = null;
      
      public var txt_prompt2:Label = null;
      
      public var txt_viphint:Label = null;
      
      public function BuyStaminaUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS10UI"] = WealthRenderS10UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
