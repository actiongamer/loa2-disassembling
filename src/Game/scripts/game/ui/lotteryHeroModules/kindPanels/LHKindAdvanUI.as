package game.ui.lotteryHeroModules.kindPanels
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import game.ui.lotteryHeroModules.selectPanels.LotteryHeroSelectDiamondUI;
   import game.ui.lotteryHeroModules.comps.LHNextHighUI;
   
   public class LHKindAdvanUI extends View
   {
      
      protected static var uiView:XML = <View width="363" height="457">
			  <Image skin="png.uiLottery.style7.高级bg" var="bg"/>
			  <Label text="可召唤XXX" x="18" y="402" width="327" height="48" stroke="0x0" var="txt_desc" align="center" isHtml="true" style="二级框标题" centerX="0" multiline="true" wordWrap="true"/>
			  <LotteryHeroSelectDiamond x="37" y="325" var="renderSelect" runtime="game.ui.lotteryHeroModules.selectPanels.LotteryHeroSelectDiamondUI"/>
			  <Image skin="png.uiLottery.style7.高级" y="18" centerX="0"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="163" y="354" var="imgRenPoint"/>
			  <Label text="99:99:99后免费" autoSize="none" height="18" stroke="0x0" var="txt_prompt" align="center" isHtml="true" x="14.5" y="294" width="334" style="普通说明"/>
			  <LHNextHigh x="36" y="262" var="nextHigh" runtime="game.ui.lotteryHeroModules.comps.LHNextHighUI"/>
			  <Image skin="png.a5.comps.img_block" x="295" y="347" width="34" height="28" var="img_discount"/>
			  <Image skin="png.uiLottery.img_light" x="-293" y="-321" var="img_light" mouseEnabled="false" mouseChildren="false"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="6" y="7" width="352" height="442" sizeGrid="20,20,20,20" var="img_mask"/>
			</View>;
       
      
      public var bg:Image = null;
      
      public var txt_desc:Label = null;
      
      public var renderSelect:LotteryHeroSelectDiamondUI = null;
      
      public var imgRenPoint:Image = null;
      
      public var txt_prompt:Label = null;
      
      public var nextHigh:LHNextHighUI = null;
      
      public var img_discount:Image = null;
      
      public var img_light:Image = null;
      
      public var img_mask:Image = null;
      
      public function LHKindAdvanUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.lotteryHeroModules.comps.LHNextHighUI"] = LHNextHighUI;
         viewClassMap["game.ui.lotteryHeroModules.selectPanels.LotteryHeroSelectDiamondUI"] = LotteryHeroSelectDiamondUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
