package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.mgrs.stcMgrs.vos.StcGuajiVo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.ToolTipGuajiNanduPanel;
   
   public class ToolTipGuajiNanduCtrl extends TooltipCtrlBase
   {
       
      
      public function ToolTipGuajiNanduCtrl(param1:TooltipUICommon, param2:StcGuajiVo = null)
      {
         super(param1);
         ui.box.addChild(new ToolTipGuajiNanduPanel(param2));
      }
   }
}
