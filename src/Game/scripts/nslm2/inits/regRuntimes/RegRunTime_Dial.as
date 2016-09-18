package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.dialModule.renders.DialRankRenderUI;
   import nslm2.modules.funnies.dials.renders.DialRankRender;
   import game.ui.dialModule.renders.DialShopRenderUI;
   import nslm2.modules.funnies.dials.renders.DialShopRender;
   import game.ui.dialModule.renders.DialShopRenderFakeUI;
   import game.ui.dialModule.renders.DialCostRenderUI;
   import nslm2.modules.funnies.dials.renders.DialCostRender;
   import game.ui.dialModule.renders.DialMyScoreRenderUI;
   import nslm2.modules.funnies.dials.renders.DialMyScoreRender;
   import game.ui.dialModule.renders.DialWealthRenderUI;
   import nslm2.modules.funnies.dials.renders.DialWealthRender;
   import game.ui.dialModule.panels.DialAwardInfoPanelUI;
   import nslm2.modules.funnies.dials.panels.DialAwardInfoPanel;
   import game.ui.dialModule.panels.DialBagPanelUI;
   import nslm2.modules.funnies.dials.panels.DialBagPanel;
   import game.ui.dialModule.renders.DialItemRenderUI;
   import nslm2.modules.funnies.dials.renders.DialItemRender;
   import game.ui.dialModule.renders.DialBagRenderUI;
   import nslm2.modules.funnies.dials.renders.DialBagRender;
   
   public class RegRunTime_Dial
   {
       
      
      public function RegRunTime_Dial()
      {
         super();
         View.runtimeClassMap[DialRankRenderUI] = DialRankRender;
         View.runtimeClassMap[DialShopRenderUI] = DialShopRender;
         View.runtimeClassMap[DialShopRenderFakeUI] = DialShopRender;
         View.runtimeClassMap[DialCostRenderUI] = DialCostRender;
         View.runtimeClassMap[DialMyScoreRenderUI] = DialMyScoreRender;
         View.runtimeClassMap[DialWealthRenderUI] = DialWealthRender;
         View.runtimeClassMap[DialAwardInfoPanelUI] = DialAwardInfoPanel;
         View.runtimeClassMap[DialBagPanelUI] = DialBagPanel;
         View.runtimeClassMap[DialItemRenderUI] = DialItemRender;
         View.runtimeClassMap[DialBagRenderUI] = DialBagRender;
      }
   }
}
