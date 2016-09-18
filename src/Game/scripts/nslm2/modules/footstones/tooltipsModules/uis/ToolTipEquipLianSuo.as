package nslm2.modules.footstones.tooltipsModules.uis
{
   import nslm2.modules.footstones.tooltipsModules.ToolTipLianSuoVo;
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.TooltipLiansuoCtr;
   
   public class ToolTipEquipLianSuo extends TooltipUICommon
   {
       
      
      public function ToolTipEquipLianSuo()
      {
         super();
         img_bg.url = "png.a5.bgs.tooltipBgs.img_commonTipBg";
         img_bg.sizeGrid = "15,15,15,15";
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         var _loc3_:ToolTipLianSuoVo = param1 as ToolTipLianSuoVo;
         this.parts.push(new TooltipLiansuoCtr(this,_loc3_));
         this.validateSize();
      }
   }
}
