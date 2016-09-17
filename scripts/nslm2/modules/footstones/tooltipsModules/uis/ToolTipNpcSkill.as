package nslm2.modules.footstones.tooltipsModules.uis
{
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.TooltipSkillCtrl;
   
   public class ToolTipNpcSkill extends TooltipUICommon
   {
       
      
      public function ToolTipNpcSkill()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         this.parts.push(new TooltipSkillCtrl(this,param1));
         this.validateSize();
      }
   }
}
