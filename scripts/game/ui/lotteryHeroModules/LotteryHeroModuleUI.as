package game.ui.lotteryHeroModules
{
   import morn.customs.components.StaticModuleView;
   import game.ui.lotteryHeroModules.kindPanels.LHKindPanelUI;
   import game.ui.lotteryHeroModules.results.LotteryHeroResultHigthNameUI;
   
   public class LotteryHeroModuleUI extends StaticModuleView
   {
      
      protected static var uiView:XML = <StaticModuleView x="0" y="0" width="1000" height="800">
			  <LHKindPanel var="kindPanelUI" right="0" left="0" x="-282" y="453" top="0" bottom="0" runtime="game.ui.lotteryHeroModules.kindPanels.LHKindPanelUI"/>
			  <LotteryHeroResultHigthName var="highHeroNameUI" centerX="0" centerY="0" runtime="game.ui.lotteryHeroModules.results.LotteryHeroResultHigthNameUI"/>
			</StaticModuleView>;
       
      
      public var kindPanelUI:LHKindPanelUI = null;
      
      public var highHeroNameUI:LotteryHeroResultHigthNameUI = null;
      
      public function LotteryHeroModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.lotteryHeroModules.kindPanels.LHKindPanelUI"] = LHKindPanelUI;
         viewClassMap["game.ui.lotteryHeroModules.results.LotteryHeroResultHigthNameUI"] = LotteryHeroResultHigthNameUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
