package nslm2.inits.firstBattles
{
   import com.mz.core.utils2.task.TaskBase;
   import morn.core.components.View;
   import game.ui.commons.comps.others.NewerGuideCommonRenderUI;
   import nslm2.modules.footstones.newerGuideModules.NewerGuideArrow;
   import game.ui.newerGuideModules.NewerGuideSkipUI;
   import nslm2.modules.footstones.newerGuideModules.NewerGuideSkip;
   import game.ui.newerGuideModules.NewerGuideNPCSayUI;
   import nslm2.modules.footstones.newerGuideModules.NewerGuideNPCSay;
   import game.ui.loadingModules.LoadingSceneUI;
   import nslm2.modules.footstones.loadingModules.LoadingScene;
   import game.ui.loadingModules.LoadingPopUI;
   import nslm2.modules.footstones.loadingModules.LoadingPop;
   import game.ui.fightPlayers.RightHeaderUI;
   import nslm2.modules.battles.battle.RightHeader;
   import game.ui.statistic.LeftHeadUI;
   import nslm2.modules.battles.battleStatistic.BSLeftRender;
   import game.ui.statistic.RightHeadUI;
   import nslm2.modules.battles.battleStatistic.BSRightRender;
   import game.ui.battleResults.BattleDropsNameRenderUI;
   import nslm2.modules.battles.battleResults.BattleDropsNameRender;
   import game.ui.battleResults.BattleBtnsRenderUI;
   import nslm2.modules.battles.battleResults.render.BattleBtnsRender;
   
   public class RegRuntimeClassTaskFirstBattle extends TaskBase
   {
       
      
      public function RegRuntimeClassTaskFirstBattle()
      {
         super();
      }
      
      override public function exec() : void
      {
         View.runtimeClassMap[NewerGuideCommonRenderUI] = NewerGuideArrow;
         View.runtimeClassMap[NewerGuideSkipUI] = NewerGuideSkip;
         View.runtimeClassMap[NewerGuideNPCSayUI] = NewerGuideNPCSay;
         View.runtimeClassMap[LoadingSceneUI] = LoadingScene;
         View.runtimeClassMap[LoadingPopUI] = LoadingPop;
         View.runtimeClassMap[RightHeaderUI] = RightHeader;
         View.runtimeClassMap[LeftHeadUI] = BSLeftRender;
         View.runtimeClassMap[RightHeadUI] = BSRightRender;
         View.runtimeClassMap[BattleDropsNameRenderUI] = BattleDropsNameRender;
         View.runtimeClassMap[BattleBtnsRenderUI] = BattleBtnsRender;
         this.onComplete();
      }
   }
}
