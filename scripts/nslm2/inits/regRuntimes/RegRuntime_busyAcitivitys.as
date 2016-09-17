package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.busyActivity.dragonBoats.funnys.DragonBoatFunnyPanelUI;
   import nslm2.modules.funnies.busyActivity.dragonBoats.funnys.DragonBoatFunnyPanel;
   import game.ui.busyActivity.dragonBoats.funnys.DragonBoatFunnyProductRenderUI;
   import nslm2.modules.funnies.busyActivity.dragonBoats.funnys.DragonBoatFunnyProductRender;
   import game.ui.busyActivity.dragonBoats.funnys.DragonBoatFunnyMaterialRenderUI;
   import nslm2.modules.funnies.busyActivity.dragonBoats.funnys.DragonBoatFunnyMaterialRender;
   import game.ui.busyActivity.dragonBoats.funnys.DragonBoatFunnyMaterialFreeRenderUI;
   import nslm2.modules.funnies.busyActivity.dragonBoats.funnys.DragonBoatFunnyMaterialFreeRender;
   import game.ui.busyActivity.dragonBoats.donates.DragonBoatDonateRequestPanelUI;
   import nslm2.modules.funnies.busyActivity.dragonBoats.donates.DragonBoatDonateRequestPanel;
   import game.ui.busyActivity.dragonBoats.donates.DragonBoatDonatePanelUI;
   import nslm2.modules.funnies.busyActivity.dragonBoats.donates.DragonBoatDonatePanel;
   import game.ui.busyActivity.dragonBoats.donates.DragonBoatDonateRenderUI;
   import nslm2.modules.funnies.busyActivity.dragonBoats.donates.DragonBoatDonateRender;
   import game.ui.busyActivity.dragonBoats.donates.DragonBoatDonateLogRenderUI;
   import nslm2.modules.funnies.busyActivity.dragonBoats.donates.DragonBoatDonateLogRender;
   import game.ui.busyActivity.dragonBoats.donates.DragonBoatDonateConfirmUI;
   import nslm2.modules.funnies.busyActivity.dragonBoats.donates.DragonBoatDonateConfirm;
   import game.ui.busyActivity.dragonBoats.donates.DragonBoatDonateRequestRenderUI;
   import nslm2.modules.funnies.busyActivity.dragonBoats.donates.DragonBoatDonateRequestRender;
   import game.ui.busyActivity.towers.funnys.TowerFunnyPanelUI;
   import nslm2.modules.funnies.busyActivity.towers.funnys.TowerFunnyPanel;
   import game.ui.busyActivity.towers.funnys.TowerFunnyCellRenderUI;
   import nslm2.modules.funnies.busyActivity.towers.funnys.TowerFunnyCellRender;
   import game.ui.busyActivity.towers.funnys.TowerFunnyLayerRenderUI;
   import nslm2.modules.funnies.busyActivity.towers.funnys.TowerFunnyLayerRender;
   
   public class RegRuntime_busyAcitivitys
   {
       
      
      public function RegRuntime_busyAcitivitys()
      {
         super();
         View.runtimeClassMap[DragonBoatFunnyPanelUI] = DragonBoatFunnyPanel;
         View.runtimeClassMap[DragonBoatFunnyProductRenderUI] = DragonBoatFunnyProductRender;
         View.runtimeClassMap[DragonBoatFunnyMaterialRenderUI] = DragonBoatFunnyMaterialRender;
         View.runtimeClassMap[DragonBoatFunnyMaterialFreeRenderUI] = DragonBoatFunnyMaterialFreeRender;
         View.runtimeClassMap[DragonBoatDonateRequestPanelUI] = DragonBoatDonateRequestPanel;
         View.runtimeClassMap[DragonBoatDonatePanelUI] = DragonBoatDonatePanel;
         View.runtimeClassMap[DragonBoatDonateRenderUI] = DragonBoatDonateRender;
         View.runtimeClassMap[DragonBoatDonateLogRenderUI] = DragonBoatDonateLogRender;
         View.runtimeClassMap[DragonBoatDonateConfirmUI] = DragonBoatDonateConfirm;
         View.runtimeClassMap[DragonBoatDonateRequestPanelUI] = DragonBoatDonateRequestPanel;
         View.runtimeClassMap[DragonBoatDonateRequestRenderUI] = DragonBoatDonateRequestRender;
         View.runtimeClassMap[TowerFunnyPanelUI] = TowerFunnyPanel;
         View.runtimeClassMap[TowerFunnyCellRenderUI] = TowerFunnyCellRender;
         View.runtimeClassMap[TowerFunnyLayerRenderUI] = TowerFunnyLayerRender;
      }
   }
}
