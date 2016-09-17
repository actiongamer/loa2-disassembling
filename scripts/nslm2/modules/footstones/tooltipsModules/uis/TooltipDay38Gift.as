package nslm2.modules.footstones.tooltipsModules.uis
{
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.TooltipDay38GiftCtrl;
   import nslm2.modules.funnies.newYears.day38s.Day38GiftVo;
   
   public class TooltipDay38Gift extends TooltipUICommon
   {
       
      
      public function TooltipDay38Gift()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         this.parts.push(new TooltipDay38GiftCtrl(this,param1 as Day38GiftVo));
         this.validateSize();
      }
   }
}
