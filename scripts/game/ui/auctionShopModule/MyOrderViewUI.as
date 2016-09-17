package game.ui.auctionShopModule
{
   import morn.customs.components.FadeView;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.List;
   import game.ui.auctionShopModule.render.MyOrderListRenderUI;
   import game.ui.auctionShopModule.render.SortLableUI;
   
   public class MyOrderViewUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="798" height="470">
			  <Image skin="png.a5.commonImgs.img_yellow" x="59" y="11"/>
			  <Image skin="png.uiAuctionShop.img_txtBg" x="67" y="44" sizeGrid="6,6,6,6" width="128" height="24"/>
			  <Button skin="png.a5.btns.btn_add" x="198" y="45" stateNum="1" var="btn_recharge"/>
			  <Label text="\l30610005" autoSize="none" x="42" y="15" style="加底标题" width="188" height="20" align="center"/>
			  <Image skin="png.a5.commonImgs.4" x="41" y="43"/>
			  <Label text="600000" autoSize="none" x="73" y="48" style="普通说明" width="116" height="20" align="left" var="txt_gold"/>
			  <Label text="\l30610006" autoSize="none" x="39" y="83" style="重要提示橘黄" width="194" height="40" align="left" wordWrap="true" multiline="true"/>
			  <Label text="\l30610072 " autoSize="none" x="383.5" y="13" style="渐变1" width="253" height="26" align="center"/>
			  <Label text="\l30610015" autoSize="none" x="279" y="51" style="加底标题" width="73" height="20" align="center"/>
			  <PageBarS2 x="439.5" y="419" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <Button label="\l30610078 " x="588" style="按钮中黄" y="420" var="btn_set" width="100"/>
			  <Button label="\l30610021" x="693" y="420" style="按钮中绿" var="btn_refresh" width="100"/>
			  <List x="245" y="76" repeatY="10" spaceY="4" var="list_item">
			    <MyOrderListRender name="render" runtime="game.ui.auctionShopModule.render.MyOrderListRenderUI"/>
			  </List>
			  <Label text="\l30610061" autoSize="none" x="39" y="166" style="普通说明" width="188" height="299" align="left" var="txt_info" wordWrap="true" multiline="true"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="55" y="134"/>
			  <Label text="\l30610060" autoSize="none" x="38" y="138" style="加底标题" width="188" height="20" align="center"/>
			  <Label text="\l30610074 " autoSize="none" x="373" y="51" style="加底标题" width="73" height="20" align="center"/>
			  <Label text="\l30610077" autoSize="none" x="622" y="51" style="加底标题" width="101" height="20" align="center"/>
			  <Label text="\l30610075 " autoSize="none" x="719" y="51" style="加底标题" width="76" height="20" align="center"/>
			  <List x="425" y="49" var="list_title">
			    <SortLable name="item0" runtime="game.ui.auctionShopModule.render.SortLableUI"/>
			    <SortLable x="90" name="item1" runtime="game.ui.auctionShopModule.render.SortLableUI"/>
			  </List>
			</FadeView>;
       
      
      public var btn_recharge:Button = null;
      
      public var txt_gold:Label = null;
      
      public var pageBarUI:PageBarS2UI = null;
      
      public var btn_set:Button = null;
      
      public var btn_refresh:Button = null;
      
      public var list_item:List = null;
      
      public var txt_info:Label = null;
      
      public var list_title:List = null;
      
      public function MyOrderViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.auctionShopModule.render.MyOrderListRenderUI"] = MyOrderListRenderUI;
         viewClassMap["game.ui.auctionShopModule.render.SortLableUI"] = SortLableUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
