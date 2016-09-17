package nslm2.modules.footstones.tooltipsModules.uis
{
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.TooltipPlayerSkillCtrl;
   import nslm2.modules.footstones.tooltipsModules.TooltipPlayerSkillVo;
   
   public class TooltipPlayerSkill extends TooltipUICommon
   {
       
      
      public function TooltipPlayerSkill()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         this.parts.push(new TooltipPlayerSkillCtrl(this,param1 as TooltipPlayerSkillVo));
         this.validateSize();
      }
   }
}
