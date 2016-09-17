package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.lotteryHeroModules.kindPanels.LHKindPanelUI;
   import nslm2.modules.cultivates.lotteryHeroModules.kindPanels.LHKindPanel;
   import game.ui.lotteryHeroModules.kindPanels.LHKindNormalUI;
   import nslm2.modules.cultivates.lotteryHeroModules.kindPanels.LHKindNormal;
   import game.ui.lotteryHeroModules.kindPanels.LHKindAdvanUI;
   import nslm2.modules.cultivates.lotteryHeroModules.kindPanels.LHKindAdvan;
   import game.ui.lotteryHeroModules.comps.LHNextHighUI;
   import nslm2.modules.cultivates.lotteryHeroModules.comps.LHNextHigh;
   import game.ui.lotteryHeroModules.getRewards.GetRewardProgressBoxUI;
   import nslm2.modules.cultivates.lotteryHeroModules.getRewards.GetRewardProgressBox;
   import game.ui.lotteryHeroModules.getRewards.GetRewardProgressBarUI;
   import nslm2.modules.cultivates.lotteryHeroModules.getRewards.GetRewardProgressBar;
   import game.ui.lotteryHeroModules.getRewards.GetRewardKindRenderUI;
   import nslm2.modules.cultivates.lotteryHeroModules.getRewards.GetRewardKindRender;
   import game.ui.lotteryHeroModules.getRewards.GetRewardProgressRenderUI;
   import nslm2.modules.cultivates.lotteryHeroModules.getRewards.GetRewardProgressRender;
   import game.ui.lotteryHeroModules.getRewards.GetRewardRenderUI;
   import nslm2.modules.cultivates.lotteryHeroModules.getRewards.GetRewardRender;
   import game.ui.lotteryHeroModules.results.LotteryHeroResultRenderUI;
   import nslm2.modules.cultivates.lotteryHeroModules.results.LotteryHeroResultRender;
   import game.ui.lotteryHeroModules.results.LotteryHeroResultHigthNameUI;
   import nslm2.modules.cultivates.lotteryHeroModules.results.LotteryHeroResultHigthName;
   import game.ui.lotteryHeroModules.results.ResultOneUI;
   import nslm2.modules.cultivates.lotteryHeroModules.results.ResultOne;
   import game.ui.lotteryHeroModules.results.ResultListUI;
   import nslm2.modules.cultivates.lotteryHeroModules.results.ResultList;
   import game.ui.lotteryHeroModules.selectPanels.LHSelectCommonUI;
   import nslm2.modules.cultivates.lotteryHeroModules.selectPanels.LHSelectCommon;
   import game.ui.tipMenus.TipMenuRenderUI;
   import nslm2.modules.footstones.tipMenus.TipMenuRender;
   import game.ui.notices.BottomMsgRenderUI;
   import nslm2.modules.footstones.notices.BottomMsgRender;
   import game.ui.lotteryHeroModules.heroPreviews.HeroPreviewRenderUI;
   import nslm2.modules.cultivates.lotteryHeroModules.heroPreviews.HeroPreviewRender;
   import game.ui.lotteryHeroModules.selectPanels.LotteryHeroSelectNormalUI;
   import nslm2.modules.cultivates.lotteryHeroModules.selectPanels.LotteryHeroSelectNormal;
   import game.ui.lotteryHeroModules.selectPanels.LotteryHeroSelectDiamondUI;
   import nslm2.modules.cultivates.lotteryHeroModules.selectPanels.LotteryHeroSelectDiamond;
   import game.ui.lotteryHeroModules.kindPanels.LHKindQQLotteryRenderUI;
   import nslm2.modules.cultivates.lotteryHeroModules.comps.LHKindQQLotteryRender;
   
   public class RegRuntime_LotteryHero
   {
       
      
      public function RegRuntime_LotteryHero()
      {
         super();
         View.runtimeClassMap[LHKindPanelUI] = LHKindPanel;
         View.runtimeClassMap[LHKindNormalUI] = LHKindNormal;
         View.runtimeClassMap[LHKindAdvanUI] = LHKindAdvan;
         View.runtimeClassMap[LHNextHighUI] = LHNextHigh;
         View.runtimeClassMap[GetRewardProgressBoxUI] = GetRewardProgressBox;
         View.runtimeClassMap[GetRewardProgressBarUI] = GetRewardProgressBar;
         View.runtimeClassMap[GetRewardKindRenderUI] = GetRewardKindRender;
         View.runtimeClassMap[GetRewardProgressRenderUI] = GetRewardProgressRender;
         View.runtimeClassMap[GetRewardRenderUI] = GetRewardRender;
         View.runtimeClassMap[LotteryHeroResultRenderUI] = LotteryHeroResultRender;
         View.runtimeClassMap[LotteryHeroResultHigthNameUI] = LotteryHeroResultHigthName;
         View.runtimeClassMap[ResultOneUI] = ResultOne;
         View.runtimeClassMap[ResultListUI] = ResultList;
         View.runtimeClassMap[LHSelectCommonUI] = LHSelectCommon;
         View.runtimeClassMap[TipMenuRenderUI] = TipMenuRender;
         View.runtimeClassMap[BottomMsgRenderUI] = BottomMsgRender;
         View.runtimeClassMap[HeroPreviewRenderUI] = HeroPreviewRender;
         View.runtimeClassMap[LotteryHeroSelectNormalUI] = LotteryHeroSelectNormal;
         View.runtimeClassMap[LotteryHeroSelectDiamondUI] = LotteryHeroSelectDiamond;
         View.runtimeClassMap[LHKindQQLotteryRenderUI] = LHKindQQLotteryRender;
      }
   }
}
