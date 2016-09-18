package game.ui.auctionShopModule
{
   import morn.customs.components.FadeView;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.components.RadioGroup;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.List;
   import morn.core.components.Box;
   import morn.core.components.ComboBox;
   import game.ui.auctionShopModule.render.AuctionListRenderUI;
   import game.ui.auctionShopModule.render.SortLableUI;
   
   public class BuyViewUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="798" height="470" mouseChildren="true">
			  <Image skin="png.a5.commonImgs.img_yellow" x="59" y="11"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="61" y="110"/>
			  <Image skin="png.uiAuctionShop.img_txtBg" x="68" y="44" sizeGrid="6,6,6,6" width="128" height="24"/>
			  <Button skin="png.a5.btns.btn_add" x="198" y="45" stateNum="1" var="btn_recharge"/>
			  <Label text="\l30610005" autoSize="none" x="36" y="16" style="加底标题" width="188" height="20" align="center"/>
			  <Label text="\l30610007" autoSize="none" x="36" y="114" style="加底标题" width="188" height="20" align="center"/>
			  <Image skin="png.a5.commonImgs.4" x="41" y="43"/>
			  <Label text="600000" autoSize="none" x="73" y="48" style="普通说明" width="122" height="20" align="left" var="txt_gold"/>
			  <Label text="\l30610006" autoSize="none" x="39" y="83" style="重要提示橘黄" width="194" height="40" align="left" wordWrap="true" multiline="true"/>
			  <Image skin="png.uiAuctionShop.img_dot" x="34" y="147"/>
			  <Image skin="png.uiAuctionShop.img_dot" x="34" y="178"/>
			  <Image skin="png.uiAuctionShop.img_dot" x="34" y="209"/>
			  <Label text="\l30610014" autoSize="none" x="383.5" y="13" style="渐变1" width="253" height="26" align="center"/>
			  <RadioGroup x="665" y="15" var="typeGroup" language="ru" lgx="655,655,655,655,655,655,655,635" lgy="15,15,15,15,15,15,15,15">
			    <RadioButton label="\l30610012" style="Radio普通" selected="true" y="0" labelMargin="6" name="item0"/>
			    <RadioButton label="\l30610013" x="70" style="Radio普通" selected="true" y="0" labelMargin="6" name="item1"/>
			  </RadioGroup>
			  <Label text="\l30610015" autoSize="none" x="279" y="51" style="加底标题" width="73" height="20" align="center"/>
			  <Label text="\l30610018" autoSize="none" x="532" y="51" style="加底标题" width="73" height="20" align="center"/>
			  <PageBarS2 x="439.5" y="419" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <Button label="\l30610020" x="588" style="按钮中黄" y="420" var="btn_buy" width="100"/>
			  <Button label="\l30610021" x="693" y="420" style="按钮中绿" var="btn_refresh" width="100"/>
			  <List x="245" y="76" repeatY="10" spaceY="4" var="list_item" buttonMode="false">
			    <AuctionListRender name="render" buttonMode="true" runtime="game.ui.auctionShopModule.render.AuctionListRenderUI"/>
			  </List>
			  <List x="379" y="49" var="list_title">
			    <SortLable name="item0" x="-43" y="0" runtime="game.ui.auctionShopModule.render.SortLableUI"/>
			    <SortLable x="21" name="item1" y="0" runtime="game.ui.auctionShopModule.render.SortLableUI"/>
			    <SortLable x="313" name="item3" y="0" runtime="game.ui.auctionShopModule.render.SortLableUI"/>
			    <SortLable x="235" name="item2" y="0" runtime="game.ui.auctionShopModule.render.SortLableUI"/>
			  </List>
			  <Box x="47" y="141" var="box_search">
			    <Label text="\l30610008" autoSize="none" y="3" style="普通说明" width="148" height="20" align="left"/>
			    <Label text="\l30610009" autoSize="none" y="34" style="普通说明" width="148" height="20" align="left"/>
			    <Label text="\l30610010" autoSize="none" y="65" style="普通说明" width="148" height="20" align="left"/>
			    <ComboBox labels="label1,label2" x="40" style="Combobox普通" var="comb_1" sizeGrid="2,2,40,2" width="142" scrollBarSkin="png.a5.comps.scrollBar.vscroll_S3"/>
			    <ComboBox labels="label1,label2" x="40" y="31" style="Combobox普通" var="comb_2" sizeGrid="2,2,40,2" width="142" scrollBarSkin="png.a5.comps.scrollBar.vscroll_S3"/>
			    <ComboBox labels="label1,label2" x="40" y="61" style="Combobox普通" var="comb_3" sizeGrid="2,2,40,2" width="142" scrollBarSkin="png.a5.comps.scrollBar.vscroll_S3"/>
			    <Button label="\l30610011" x="28" style="按钮大黄" y="99" var="btn_search"/>
			  </Box>
			  <Label text="\l30610104" autoSize="none" x="38" y="317" style="普通说明" width="189" height="149" align="left" wordWrap="true" multiline="true"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="60" y="285"/>
			  <Label text="\l30610103" autoSize="none" x="56" y="289" style="加底标题" width="148" height="20" align="center"/>
			  <Label text="\l30610112" autoSize="none" x="249" y="84" style="下划线黄色" width="543" height="20" align="center" var="txt_empty"/>
			</FadeView>;
       
      
      public var btn_recharge:Button = null;
      
      public var txt_gold:Label = null;
      
      public var typeGroup:RadioGroup = null;
      
      public var pageBarUI:PageBarS2UI = null;
      
      public var btn_buy:Button = null;
      
      public var btn_refresh:Button = null;
      
      public var list_item:List = null;
      
      public var list_title:List = null;
      
      public var box_search:Box = null;
      
      public var comb_1:ComboBox = null;
      
      public var comb_2:ComboBox = null;
      
      public var comb_3:ComboBox = null;
      
      public var btn_search:Button = null;
      
      public var txt_empty:Label = null;
      
      public function BuyViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.auctionShopModule.render.AuctionListRenderUI"] = AuctionListRenderUI;
         viewClassMap["game.ui.auctionShopModule.render.SortLableUI"] = SortLableUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
