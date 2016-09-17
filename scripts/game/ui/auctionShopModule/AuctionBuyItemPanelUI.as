package game.ui.auctionShopModule
{
   import morn.customs.components.PopModuleView;
   import game.ui.commons.icons.WealthRenderS9UI;
   import morn.core.components.Label;
   import morn.core.components.CheckBox;
   import morn.core.components.Button;
   import morn.core.components.Box;
   import game.ui.commons.comps.numBar.NumBarS1UI;
   
   public class AuctionBuyItemPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="378" height="320">
			  <PanelBgS3 x="4" y="1" width="371" height="318" showLightBottom="true" frameStyle="1" frameVisible="true"/>
			  <Image skin="png.uiAuctionShop.img_line" x="15" y="161" mouseEnabled="false" mouseChildren="false"/>
			  <WealthRenderS9 x="42" y="54" var="itemRender" runtime="game.ui.commons.icons.WealthRenderS9UI"/>
			  <Label text="\l30610062" x="129" y="107" style="普通说明" width="221" height="56" wordWrap="true" multiline="true" var="txt_tips"/>
			  <CheckBox label="\l30610052" x="124" y="168" selected="true" style="CheckBox普通" labelMargin="10" var="check_autoBuy"/>
			  <Button skin="png.a5.btns.btn_help" x="96" y="168" stateNum="1" var="btn_help"/>
			  <Box x="99.5" y="274" centerX="0">
			    <Button label="\l11300025" style="按钮中红" var="btn_cancel" x="105" y="0"/>
			    <Button label="\l11300024" style="按钮中绿" var="btn_ok"/>
			  </Box>
			  <Box x="30" y="201" var="box_auto" centerX="0">
			    <Label text="\l30610053" x="46" y="1" style="普通说明" width="113" height="22"/>
			    <NumBarS1 x="117" var="numbar" y="0" runtime="game.ui.commons.comps.numBar.NumBarS1UI"/>
			    <Label text="\l30610054" y="34" style="不足禁止红" width="317" height="22" align="center" centerX="0"/>
			  </Box>
			  <Box x="130" y="52" var="box_curPrice">
			    <Label text="\l30610097" style="普通说明" width="113" height="22"/>
			    <Label text="我的竞拍价格：" x="88" style="普通说明" width="142" height="22" var="txt_curPrice" y="0"/>
			  </Box>
			  <Box x="130" y="77" var="box_myPrice">
			    <Label text="\l30610051" style="普通说明" width="113" height="22" var="txt_priceLabel"/>
			    <Label text="我的竞拍价格：" x="88" style="普通说明" width="142" height="22" var="txt_myCost" y="0"/>
			  </Box>
			  <Image skin="jpg.uiPreview.圣物拍卖行-4装备合成+竞拍设定（示意图）" x="-741" y="-208" alpha=".6"/>
			  <Box x="96" y="201" var="onePriceBox">
			    <CheckBox label="\l30610115 " selected="true" style="CheckBox普通" labelMargin="10" var="check_onePrice" x="28"/>
			    <Button skin="png.a5.btns.btn_help" stateNum="1" var="btn_help2"/>
			  </Box>
			</PopModuleView>;
       
      
      public var itemRender:WealthRenderS9UI = null;
      
      public var txt_tips:Label = null;
      
      public var check_autoBuy:CheckBox = null;
      
      public var btn_help:Button = null;
      
      public var btn_cancel:Button = null;
      
      public var btn_ok:Button = null;
      
      public var box_auto:Box = null;
      
      public var numbar:NumBarS1UI = null;
      
      public var box_curPrice:Box = null;
      
      public var txt_curPrice:Label = null;
      
      public var box_myPrice:Box = null;
      
      public var txt_priceLabel:Label = null;
      
      public var txt_myCost:Label = null;
      
      public var onePriceBox:Box = null;
      
      public var check_onePrice:CheckBox = null;
      
      public var btn_help2:Button = null;
      
      public function AuctionBuyItemPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.numBar.NumBarS1UI"] = NumBarS1UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS9UI"] = WealthRenderS9UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
