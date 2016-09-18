package game.ui.BagModules
{
   import morn.customs.components.PanelView;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.components.List;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import game.ui.commons.icons.WealthRenderS8UI;
   
   public class SellBatchViewUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="250" height="502">
			  <PanelBg width="250" height="502" showImgTitle1="false" panelDragEnabled="false"/>
			  <Button label="确 定" y="450" style="按钮中红" x="84" var="btn_sell"/>
			  <Image skin="png.uiBag.线01" x="10" y="426"/>
			  <Label text="点击或拖动物品到出售列表" stroke="0xffffff" mouseEnabled="false" align="center" autoSize="none" style="普通说明" x="7" y="222" width="235" height="27.0625" size="14" var="txt_prompt"/>
			  <List x="20" y="50" repeatY="5" spaceY="3" width="228" height="367" var="list_sellItem">
			    <SellBatchItemRender name="render" runtime="game.ui.BagModules.SellBatchItemRenderUI"/>
			  </List>
			  <Box x="28" y="431" var="box_total">
			    <Image skin="png.uiBag.出售总价底"/>
			    <Image x="10" y="2" var="img_txtSellPriceAll" autoSize="true" skin="png.a5.comps.img_block" width="62" height="14"/>
			    <WealthRenderS8 x="81" var="renderSellPriceAll" runtime="game.ui.commons.icons.WealthRenderS8UI"/>
			  </Box>
			</PanelView>;
       
      
      public var btn_sell:Button = null;
      
      public var txt_prompt:Label = null;
      
      public var list_sellItem:List = null;
      
      public var box_total:Box = null;
      
      public var img_txtSellPriceAll:Image = null;
      
      public var renderSellPriceAll:WealthRenderS8UI = null;
      
      public function SellBatchViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.BagModules.SellBatchItemRenderUI"] = SellBatchItemRenderUI;
         viewClassMap["game.ui.commons.icons.WealthRenderS8UI"] = WealthRenderS8UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
