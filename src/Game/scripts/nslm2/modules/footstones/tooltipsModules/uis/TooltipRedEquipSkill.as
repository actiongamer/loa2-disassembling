package nslm2.modules.footstones.tooltipsModules.uis
{
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.TooltipRedEquipSkillCtrl;
   
   public class TooltipRedEquipSkill extends TooltipUICommon
   {
       
      
      public function TooltipRedEquipSkill()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         this.parts.push(new TooltipRedEquipSkillCtrl(this,param1));
         this.validateSize();
      }
      
      override protected function validateSize() : void
      {
         super.validateSize();
         this.img_bg.height = this.height;
      }
   }
}
