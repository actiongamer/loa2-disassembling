package nslm2.modules.footstones.tooltipsModules.uis
{
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.TooltipHorseCtrl;
   import nslm2.mgrs.stcMgrs.vos.StcSaddlehorseVo;
   
   public class TooltipHorse extends TooltipUICommon
   {
       
      
      public function TooltipHorse()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         this.parts.push(new TooltipHorseCtrl(this,param1 as StcSaddlehorseVo));
         this.validateSize();
      }
   }
}
