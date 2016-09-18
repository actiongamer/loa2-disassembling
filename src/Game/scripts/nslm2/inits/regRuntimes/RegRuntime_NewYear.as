package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.newYears.newYear2016s.NewYear2016RenderUI;
   import nslm2.modules.funnies.newYears.newYear2016s.NewYear2016Render;
   import game.ui.newYears.newYear2016s.NewYear2016_BossPanelUI;
   import nslm2.modules.funnies.newYears.newYear2016s.NewYear2016_BossPanel;
   import game.ui.newYears.newYear2016s.NewYear2016_GodPanelUI;
   import nslm2.modules.funnies.newYears.newYear2016s.NewYear2016_GodPanel;
   import game.ui.newYears.newYear2016s.NewYear2016_GodSubPanel1UI;
   import nslm2.modules.funnies.newYears.newYear2016s.NewYear2016_GodSubPanel1;
   import game.ui.newYears.newYear2016s.NewYear2016_GodSubPanel2UI;
   import nslm2.modules.funnies.newYears.newYear2016s.NewYear2016_GodSubPanel2;
   import game.ui.newYears.newYear2016s.NewYear2016_GodSubPanel2RenderUI;
   import nslm2.modules.funnies.newYears.newYear2016s.NewYear2016_GodSubPanel2Render;
   import game.ui.newYears.fooldays.Foolday2016ShopPanelUI;
   import nslm2.modules.funnies.newYears.fooldays.Foolday2016ShopPanel;
   import game.ui.newYears.fooldays.FooldayShopRenderUI;
   import nslm2.modules.funnies.newYears.fooldays.FooldayShopRender;
   import game.ui.newYears.day51s.renders.Day51CostRenderUI;
   import nslm2.modules.funnies.newYears.day51s.renders.Day51CostRender;
   import game.ui.newYears.day51s.renders.Day51CostRender2UI;
   import nslm2.modules.funnies.newYears.day51s.renders.Day51CostRender2;
   import game.ui.newYears.day51s.renders.Day51RewardIconUI;
   import nslm2.modules.funnies.newYears.day51s.renders.Day51RewardIcon;
   import game.ui.newYears.day51s.renders.Day51ScoreRenderUI;
   import nslm2.modules.funnies.newYears.day51s.renders.Day51ScoreRender;
   import game.ui.newYears.day51s.renders.Day51ScoreRenderFakeUI;
   import game.ui.newYears.day51s.renders.Day51ShopRenderUI;
   import nslm2.modules.funnies.newYears.day51s.renders.Day51ShopRender;
   import game.ui.newYears.day51s.renders.Day51ShopRenderFakeUI;
   import game.ui.newYears.day51s.renders.Day51RankRenderUI;
   import nslm2.modules.funnies.newYears.day51s.renders.Day51RankRender;
   import game.ui.newYears.day51s.renders.Day51RankRenderFakeUI;
   import game.ui.newYears.day51s.renders.Day51HelpRenderUI;
   import nslm2.modules.funnies.newYears.day51s.renders.Day51HelpRender;
   import game.ui.newYears.day51s.renders.Day51CoinRenderUI;
   import nslm2.modules.funnies.newYears.day51s.renders.Day51CoinRender;
   
   public class RegRuntime_NewYear
   {
       
      
      public function RegRuntime_NewYear()
      {
         super();
         View.runtimeClassMap[NewYear2016RenderUI] = NewYear2016Render;
         View.runtimeClassMap[NewYear2016_BossPanelUI] = NewYear2016_BossPanel;
         View.runtimeClassMap[NewYear2016_GodPanelUI] = NewYear2016_GodPanel;
         View.runtimeClassMap[NewYear2016_GodSubPanel1UI] = NewYear2016_GodSubPanel1;
         View.runtimeClassMap[NewYear2016_GodSubPanel2UI] = NewYear2016_GodSubPanel2;
         View.runtimeClassMap[NewYear2016_GodSubPanel2RenderUI] = NewYear2016_GodSubPanel2Render;
         View.runtimeClassMap[Foolday2016ShopPanelUI] = Foolday2016ShopPanel;
         View.runtimeClassMap[FooldayShopRenderUI] = FooldayShopRender;
         View.runtimeClassMap[Day51CostRenderUI] = Day51CostRender;
         View.runtimeClassMap[Day51CostRender2UI] = Day51CostRender2;
         View.runtimeClassMap[Day51RewardIconUI] = Day51RewardIcon;
         View.runtimeClassMap[Day51ScoreRenderUI] = Day51ScoreRender;
         View.runtimeClassMap[Day51ScoreRenderFakeUI] = Day51ScoreRender;
         View.runtimeClassMap[Day51ShopRenderUI] = Day51ShopRender;
         View.runtimeClassMap[Day51ShopRenderFakeUI] = Day51ShopRender;
         View.runtimeClassMap[Day51RankRenderUI] = Day51RankRender;
         View.runtimeClassMap[Day51RankRenderFakeUI] = Day51RankRender;
         View.runtimeClassMap[Day51HelpRenderUI] = Day51HelpRender;
         View.runtimeClassMap[Day51CoinRenderUI] = Day51CoinRender;
      }
   }
}
