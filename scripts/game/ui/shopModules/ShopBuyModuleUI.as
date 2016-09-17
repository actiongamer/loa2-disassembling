package game.ui.shopModules
{
   import morn.customs.components.PopModuleView;
   import game.ui.commons.comps.numBar.NumBarS1UI;
   import morn.core.components.Label;
   import game.ui.shopModules.render.ShopBuyRenderUI;
   import game.ui.commons.comps.btns.BtnOkUI;
   import game.ui.commons.comps.btns.BtnCancelUI;
   import morn.core.components.List;
   import game.ui.commons.icons.LotteryRenderS6UI;
   
   public class ShopBuyModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="373" height="259">
			  <PanelBgS3 x="1" y="1" width="371" height="257"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="123" y="159"/>
			  <NumBarS1 x="110" y="129" var="numBar" runtime="game.ui.commons.comps.numBar.NumBarS1UI"/>
			  <Label stroke="0xffffff" mouseEnabled="false" var="txt_prizeAll" width="94" align="right" x="76" y="165.5" style="普通说明" height="21" text="总价"/>
			  <ShopBuyRender var="render_wealth" lgx="113,113,113,113,113,113,113,73" lgy="51,51,51,51,51,51,51,51" x="113" y="51" language="ru" runtime="game.ui.shopModules.render.ShopBuyRenderUI"/>
			  <BtnOk x="95" y="216" var="btn_confirm" runtime="game.ui.commons.comps.btns.BtnOkUI"/>
			  <BtnCancel x="199" y="216" var="btn_cancel" runtime="game.ui.commons.comps.btns.BtnCancelUI"/>
			  <List x="172" y="163" var="list_totalPrize" centerX="20" repeatX="1">
			    <LotteryRenderS6 name="render" runtime="game.ui.commons.icons.LotteryRenderS6UI"/>
			  </List>
			</PopModuleView>;
       
      
      public var numBar:NumBarS1UI = null;
      
      public var txt_prizeAll:Label = null;
      
      public var render_wealth:ShopBuyRenderUI = null;
      
      public var btn_confirm:BtnOkUI = null;
      
      public var btn_cancel:BtnCancelUI = null;
      
      public var list_totalPrize:List = null;
      
      public function ShopBuyModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.btns.BtnCancelUI"] = BtnCancelUI;
         viewClassMap["game.ui.commons.comps.btns.BtnOkUI"] = BtnOkUI;
         viewClassMap["game.ui.commons.comps.numBar.NumBarS1UI"] = NumBarS1UI;
         viewClassMap["game.ui.commons.icons.LotteryRenderS6UI"] = LotteryRenderS6UI;
         viewClassMap["game.ui.shopModules.render.ShopBuyRenderUI"] = ShopBuyRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
