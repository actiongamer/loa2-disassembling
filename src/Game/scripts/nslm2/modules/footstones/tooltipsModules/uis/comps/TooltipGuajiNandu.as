package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.ToolTipGuajiNanduCtrl;
   import nslm2.mgrs.stcMgrs.vos.StcGuajiVo;
   
   public class TooltipGuajiNandu extends TooltipUICommon
   {
       
      
      public function TooltipGuajiNandu()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         this.parts.push(new ToolTipGuajiNanduCtrl(this,param1 as StcGuajiVo));
         this.img_bg.width = 180;
         this.validateSize();
      }
   }
}
