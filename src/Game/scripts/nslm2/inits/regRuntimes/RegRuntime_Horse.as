package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.horseModules.comps.HorseTitleNameUI;
   import nslm2.modules.cultivates.horse.comps.HorseTitleName;
   import game.ui.horseModules.HorseInfoPanelUI;
   import nslm2.modules.cultivates.horse.HorseInfoPanel;
   import game.ui.horseModules.comps.HorsePropRenderPropUI;
   import nslm2.modules.cultivates.horse.comps.HorsePropRenderProp;
   import game.ui.horseModules.comps.HorsePropRenderMasterUI;
   import nslm2.modules.cultivates.horse.comps.HorsePropRenderMaster;
   import game.ui.horseModules.comps.HorsePropRenderPlayerUI;
   import nslm2.modules.cultivates.horse.comps.HorsePropRenderPlayer;
   import game.ui.horseModules.horseChange.HorsePreRenderUI;
   import nslm2.modules.cultivates.horse.horseChange.HorsePreRender;
   import game.ui.horseModules.horseChange.HorseCostRenderUI;
   import nslm2.modules.cultivates.horse.horseChange.HorseCostRender;
   import game.ui.horseModules.horseChange.HorseListRenderUI;
   import nslm2.modules.cultivates.horse.horseChange.HorseListRender;
   import game.ui.horseModules.horseChange.HorsePropPanelUI;
   import nslm2.modules.cultivates.horse.horseChange.HorsePropPanel;
   import game.ui.horseModules.horseMaster.HorseMasterLvLabelUI;
   import nslm2.modules.cultivates.horse.horseMaster.HorseMasterLvLabel;
   import game.ui.horseModules.horseMaster.HorsePropCurRenderUI;
   import nslm2.modules.cultivates.horse.horseMaster.HorsePropCurRender;
   import game.ui.horseModules.horseMaster.HorsePropNextRenderUI;
   import nslm2.modules.cultivates.horse.horseMaster.HorsePropNextRender;
   import game.ui.horseModules.horseMaster.HorseMasterCostRenderUI;
   import nslm2.modules.cultivates.horse.horseMaster.HorseMasterCostRender;
   import game.ui.horseModules.horseChange.HorseActiveNeedUI;
   import nslm2.modules.cultivates.horse.horseChange.HorseActiveNeed;
   import game.ui.horseModules.horseMaster.HorseSkillRenderUI;
   import nslm2.modules.cultivates.horse.comps.HorseSkillRender;
   import game.ui.horseModules.horseMaster.HorseTianfuRenderUI;
   import nslm2.modules.cultivates.horse.horseMaster.HorseTianfuRender;
   
   public class RegRuntime_Horse
   {
       
      
      public function RegRuntime_Horse()
      {
         super();
         View.runtimeClassMap[HorseTitleNameUI] = HorseTitleName;
         View.runtimeClassMap[HorseInfoPanelUI] = HorseInfoPanel;
         View.runtimeClassMap[HorsePropRenderPropUI] = HorsePropRenderProp;
         View.runtimeClassMap[HorsePropRenderMasterUI] = HorsePropRenderMaster;
         View.runtimeClassMap[HorsePropRenderPlayerUI] = HorsePropRenderPlayer;
         View.runtimeClassMap[HorsePreRenderUI] = HorsePreRender;
         View.runtimeClassMap[HorseCostRenderUI] = HorseCostRender;
         View.runtimeClassMap[HorseListRenderUI] = HorseListRender;
         View.runtimeClassMap[HorsePropPanelUI] = HorsePropPanel;
         View.runtimeClassMap[HorseMasterLvLabelUI] = HorseMasterLvLabel;
         View.runtimeClassMap[HorsePropCurRenderUI] = HorsePropCurRender;
         View.runtimeClassMap[HorsePropNextRenderUI] = HorsePropNextRender;
         View.runtimeClassMap[HorseMasterCostRenderUI] = HorseMasterCostRender;
         View.runtimeClassMap[HorseActiveNeedUI] = HorseActiveNeed;
         View.runtimeClassMap[HorseSkillRenderUI] = HorseSkillRender;
         View.runtimeClassMap[HorseTianfuRenderUI] = HorseTianfuRender;
      }
   }
}
