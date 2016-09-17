package game.ui.auctionShopModule
{
   import morn.customs.components.FadeView;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.Button;
   import morn.core.components.List;
   import game.ui.auctionShopModule.render.AuctionItemListRenderUI;
   import game.ui.auctionShopModule.render.SortLableUI;
   
   public class SellViewUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="798" height="470" buttonMode="true">
			  <Image skin="png.uiAuctionShop.bg3" x="22" y="0"/>
			  <Label text="\l30610071 " autoSize="none" x="360.5" y="13" style="渐变1" width="300" height="26" align="center"/>
			  <PageBarS2 x="439.5" y="419" var="pageBar1" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <Button label="\l30610070 " x="588" style="按钮中黄" y="420" var="btn_unSell" width="100"/>
			  <Button label="\l30610021" x="693" y="420" style="按钮中绿" var="btn_refresh" width="100"/>
			  <List x="39" y="45" repeatX="3" repeatY="5" var="list_treasure">
			    <AuctionItemListRender name="render" runtime="game.ui.auctionShopModule.render.AuctionItemListRenderUI"/>
			  </List>
			  <PageBarS2 x="59" y="371" var="pageBar2" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <Button label="\l30610040" x="92" style="按钮中黄" y="420" var="btn_sell"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="54.5" y="9"/>
			  <Label text="\l30610041" autoSize="none" x="26.5" y="13" style="二级框标题" width="210" height="20" align="center" bold="true"/>
			  <Label text="\l30610015" autoSize="none" x="279" y="51" style="加底标题" width="73" height="20" align="center"/>
			  <Label text="\l30610018" autoSize="none" x="532" y="51" style="加底标题" width="73" height="20" align="center"/>
			  <List x="379" y="49" var="list_title">
			    <SortLable name="item0" x="-42" y="0" runtime="game.ui.auctionShopModule.render.SortLableUI"/>
			    <SortLable x="28" name="item1" y="0" runtime="game.ui.auctionShopModule.render.SortLableUI"/>
			    <SortLable x="313" name="item3" y="0" runtime="game.ui.auctionShopModule.render.SortLableUI"/>
			    <SortLable x="235" name="item2" y="0" runtime="game.ui.auctionShopModule.render.SortLableUI"/>
			  </List>
			  <AuctionSellListView x="245" y="76" var="sellView" runtime="game.ui.auctionShopModule.AuctionSellListViewUI"/>
			</FadeView>;
       
      
      public var pageBar1:PageBarS2UI = null;
      
      public var btn_unSell:Button = null;
      
      public var btn_refresh:Button = null;
      
      public var list_treasure:List = null;
      
      public var pageBar2:PageBarS2UI = null;
      
      public var btn_sell:Button = null;
      
      public var list_title:List = null;
      
      public var sellView:game.ui.auctionShopModule.AuctionSellListViewUI = null;
      
      public function SellViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.auctionShopModule.AuctionSellListViewUI"] = game.ui.auctionShopModule.AuctionSellListViewUI;
         viewClassMap["game.ui.auctionShopModule.render.AuctionItemListRenderUI"] = AuctionItemListRenderUI;
         viewClassMap["game.ui.auctionShopModule.render.SortLableUI"] = SortLableUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
