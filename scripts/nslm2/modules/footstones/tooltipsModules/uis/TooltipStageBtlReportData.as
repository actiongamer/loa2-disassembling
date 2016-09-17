package nslm2.modules.footstones.tooltipsModules.uis
{
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.TooltipStageBtlReportDataCtrl;
   
   public class TooltipStageBtlReportData extends TooltipUICommon
   {
       
      
      public function TooltipStageBtlReportData()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         this.parts.push(new TooltipStageBtlReportDataCtrl(this,param1));
         this.validateSize();
      }
   }
}
