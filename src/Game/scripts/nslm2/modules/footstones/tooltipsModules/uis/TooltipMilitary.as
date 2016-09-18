package nslm2.modules.footstones.tooltipsModules.uis
{
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.TooltipMilitaryCtrl;
   import nslm2.mgrs.stcMgrs.vos.StcMilitaryrankVo;
   
   public class TooltipMilitary extends TooltipUICommon
   {
       
      
      public function TooltipMilitary()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         this.parts.push(new TooltipMilitaryCtrl(this,param1 as StcMilitaryrankVo));
         this.validateSize();
      }
   }
}
