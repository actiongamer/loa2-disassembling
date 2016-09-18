package game.ui.lotteryHeroModules.kindPanels
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import game.ui.lotteryHeroModules.selectPanels.LotteryHeroSelectNormalUI;
   
   public class LHKindNormalUI extends View
   {
      
      protected static var uiView:XML = <View width="363" height="457">
			  <Image skin="png.uiLottery.style7.普通bg" x="0" y="0" var="bg"/>
			  <Label text="可召唤XXX" x="39" y="402" width="327" height="48" stroke="0x0" var="txt_desc" align="center" isHtml="true" style="二级框标题" centerX="0"/>
			  <Image skin="png.uiLottery.style7.普通" y="18" centerX="0"/>
			  <LotteryHeroSelectNormal x="37" y="325" var="renderSelect" runtime="game.ui.lotteryHeroModules.selectPanels.LotteryHeroSelectNormalUI"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="163" y="354" var="imgRenPoint"/>
			  <Label text="99:99:99后免费" autoSize="none" height="18" stroke="0x0" var="txt_prompt" align="center" isHtml="true" x="2" y="316" width="359" style="普通说明"/>
			</View>;
       
      
      public var bg:Image = null;
      
      public var txt_desc:Label = null;
      
      public var renderSelect:LotteryHeroSelectNormalUI = null;
      
      public var imgRenPoint:Image = null;
      
      public var txt_prompt:Label = null;
      
      public function LHKindNormalUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.lotteryHeroModules.selectPanels.LotteryHeroSelectNormalUI"] = LotteryHeroSelectNormalUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
