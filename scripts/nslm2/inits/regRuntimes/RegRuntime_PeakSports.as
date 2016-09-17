package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.peakSports.peakSportsScene.panel.PeakSportsSceneTopPanelUI;
   import nslm2.modules.battles.PeakSports.scene.PeakSportsSceneTopPanel;
   import game.ui.peakSports.peakSportsScene.panel.PeakSportsMyInfoPanelUI;
   import nslm2.modules.battles.PeakSports.scene.PeakSportsMyInfoPanel;
   import game.ui.peakSports.peakSportsReport.render.PeakSportsReportRenderUI;
   import nslm2.modules.battles.PeakSports.view.renders.PeakSportsReportRender;
   import game.ui.peakSports.peakSportsReport.render.PeakSportsReportTabRenderUI;
   import nslm2.modules.battles.PeakSports.view.renders.PeakSportsReportTabRender;
   import game.ui.peakSports.peakSportsFightResult.render.PeakSportsFightResultHeroRenderUI;
   import nslm2.modules.battles.PeakSports.view.renders.PeakSportsFightResultHeroRender;
   import game.ui.peakSports.peakSportsScene.panel.PeakSportsHeroInfoRenderUI;
   import nslm2.modules.battles.PeakSports.scene.PeakSportsHeroInfoRender;
   
   public class RegRuntime_PeakSports
   {
       
      
      public function RegRuntime_PeakSports()
      {
         super();
         View.runtimeClassMap[PeakSportsSceneTopPanelUI] = PeakSportsSceneTopPanel;
         View.runtimeClassMap[PeakSportsMyInfoPanelUI] = PeakSportsMyInfoPanel;
         View.runtimeClassMap[PeakSportsReportRenderUI] = PeakSportsReportRender;
         View.runtimeClassMap[PeakSportsReportTabRenderUI] = PeakSportsReportTabRender;
         View.runtimeClassMap[PeakSportsFightResultHeroRenderUI] = PeakSportsFightResultHeroRender;
         View.runtimeClassMap[PeakSportsHeroInfoRenderUI] = PeakSportsHeroInfoRender;
      }
   }
}
