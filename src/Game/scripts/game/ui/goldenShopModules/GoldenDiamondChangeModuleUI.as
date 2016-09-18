package game.ui.goldenShopModules
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import game.ui.commons.comps.numBar.NumBarS1UI;
   import game.ui.commons.icons.WealthRenderS16UI;
   
   public class GoldenDiamondChangeModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="250" height="350">
			  <Image skin="png.uiGoldenShop.img_bg" x="-26.5" y="-17"/>
			  <Label text="注：阿萨德发生的发生地方生地方生地方生地方" autoSize="none" x="29" y="77" style="普通说明" width="210" align="left" var="txt_11200502" wordWrap="true" multiline="true"/>
			  <Image skin="png.uiGoldenShop.img_title" x="26" y="192"/>
			  <Image skin="png.uiGoldenShop.img_subBg" x="32" y="256"/>
			  <Image skin="png.uiGoldenShop.img_arrow" x="105" y="288"/>
			  <Button label="按钮" x="66" style="按钮大黄" y="355" var="btn_swap"/>
			  <NumBarS1 x="41" y="225" var="numBar" runtime="game.ui.commons.comps.numBar.NumBarS1UI"/>
			  <Label text="您当前兑换额度：" autoSize="none" x="20.5" y="261" style="普通说明" width="215" align="center" var="txt_swapLimit" height="20" size="16"/>
			  <WealthRenderS16 x="95" y="317" var="render_changeGolden" runtime="game.ui.commons.icons.WealthRenderS16UI"/>
			  <Button skin="png.a5.btns.btn_add" x="193" y="47" stateNum="1" var="btn_recharge"/>
			  <Image skin="png.a5.comps.numBars.img_numBg" x="68" y="46" sizeGrid="6,6,6,6" width="119" height="23"/>
			  <Image skin="png.a5.commonImgs.3" x="32" y="46"/>
			  <Label text="600000" autoSize="none" x="70" y="50" style="普通说明" width="122" height="20" align="left" var="txt_gold"/>
			  <Image skin="png.uiGoldenShop.img_title2" x="26" y="14"/>
			  <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.a5.btns.btn_closeS1" y="3" x="217" var="btn_close"/>
			</PopModuleView>;
       
      
      public var txt_11200502:Label = null;
      
      public var btn_swap:Button = null;
      
      public var numBar:NumBarS1UI = null;
      
      public var txt_swapLimit:Label = null;
      
      public var render_changeGolden:WealthRenderS16UI = null;
      
      public var btn_recharge:Button = null;
      
      public var txt_gold:Label = null;
      
      public var btn_close:Button = null;
      
      public function GoldenDiamondChangeModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.numBar.NumBarS1UI"] = NumBarS1UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS16UI"] = WealthRenderS16UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
