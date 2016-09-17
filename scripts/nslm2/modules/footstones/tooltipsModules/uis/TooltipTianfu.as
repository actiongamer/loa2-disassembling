package nslm2.modules.footstones.tooltipsModules.uis
{
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.TooltipTianfuCtrl;
   
   public class TooltipTianfu extends TooltipUICommon
   {
       
      
      public function TooltipTianfu()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         this.parts.push(new TooltipTianfuCtrl(this,param1));
         this.validateSize();
      }
   }
}
