package game.ui.auctionShopModule
{
   import morn.customs.components.PopModuleView;
   import game.ui.commons.icons.WealthRenderS9UI;
   import morn.core.components.Label;
   import game.ui.commons.comps.numBar.NumBarS1UI;
   import morn.core.components.ComboBox;
   import morn.core.components.Button;
   import morn.core.components.Box;
   
   public class AuctionSellItemPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="386" height="268">
			  <PanelBgS3 x="4" y="1" width="378" height="268" showLightBottom="true" frameStyle="1" frameVisible="true"/>
			  <WealthRenderS9 x="42" y="57" var="itemRender" runtime="game.ui.commons.icons.WealthRenderS9UI"/>
			  <Label text="\l30610042" x="140" y="57" style="普通说明" width="113" height="22"/>
			  <Label text="\l30610043" x="140" y="92" style="普通说明" width="113" height="22" var="txt_priceLbl"/>
			  <NumBarS1 x="210" y="89" var="numbar" runtime="game.ui.commons.comps.numBar.NumBarS1UI"/>
			  <ComboBox labels="label1,label2" x="211" y="54" style="Combobox普通" sizeGrid="2,2,40,2" var="comb_time"/>
			  <Label text="\l30610045" x="50" y="185" style="下划线黄色" width="277" height="22" size="12" align="center"/>
			  <Box x="99.5" y="225" centerX="0">
			    <Button label="\l11300025" style="按钮中红" var="btn_cancel" x="105" y="0"/>
			    <Button label="\l11300024" style="按钮中绿" var="btn_ok"/>
			  </Box>
			  <Box x="140" y="157" var="box_sjfy">
			    <Label text="上架费用：" x="67" style="普通说明" width="113" height="22" size="12" var="txt_cost"/>
			    <Label text="\l30610044" style="普通说明" width="113" height="22"/>
			  </Box>
			  <Label text="\l30610099" x="324" y="93" style="普通说明" width="39" height="22" size="12" align="left"/>
			  <Box x="140" y="123" var="box_num">
			    <Label text="\l30610102" y="3" style="普通说明" width="113" height="22"/>
			    <NumBarS1 x="70" var="numbarCnt" runtime="game.ui.commons.comps.numBar.NumBarS1UI"/>
			  </Box>
			  <Box x="140" y="123" var="box_onePrice">
			    <Label text="\l30610114 " y="3" style="普通说明" width="113" height="22"/>
			    <NumBarS1 x="70" var="numbarOnePrice" runtime="game.ui.commons.comps.numBar.NumBarS1UI"/>
			    <Label text="\l30610099" x="184" y="1" style="普通说明" width="39" height="22" size="12" align="left"/>
			  </Box>
			  <Image skin="jpg.uiPreview.圣物拍卖行-4装备合成+竞拍设定（示意图）" x="-252" y="-240" alpha=".6"/>
			</PopModuleView>;
       
      
      public var itemRender:WealthRenderS9UI = null;
      
      public var txt_priceLbl:Label = null;
      
      public var numbar:NumBarS1UI = null;
      
      public var comb_time:ComboBox = null;
      
      public var btn_cancel:Button = null;
      
      public var btn_ok:Button = null;
      
      public var box_sjfy:Box = null;
      
      public var txt_cost:Label = null;
      
      public var box_num:Box = null;
      
      public var numbarCnt:NumBarS1UI = null;
      
      public var box_onePrice:Box = null;
      
      public var numbarOnePrice:NumBarS1UI = null;
      
      public function AuctionSellItemPanelUI()
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
