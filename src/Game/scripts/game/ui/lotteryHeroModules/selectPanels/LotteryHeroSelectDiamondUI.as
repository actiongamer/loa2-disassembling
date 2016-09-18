package game.ui.lotteryHeroModules.selectPanels
{
   import morn.core.components.View;
   
   public class LotteryHeroSelectDiamondUI extends View
   {
      
      protected static var uiView:XML = <View width="280" height="68">
			  <LHSelectCommon var="boxCommon" runtime="game.ui.lotteryHeroModules.selectPanels.LHSelectCommonUI"/>
			</View>;
       
      
      public var boxCommon:game.ui.lotteryHeroModules.selectPanels.LHSelectCommonUI = null;
      
      public function LotteryHeroSelectDiamondUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.lotteryHeroModules.selectPanels.LHSelectCommonUI"] = game.ui.lotteryHeroModules.selectPanels.LHSelectCommonUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
