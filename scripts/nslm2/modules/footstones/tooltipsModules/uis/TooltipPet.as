package nslm2.modules.footstones.tooltipsModules.uis
{
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.ToolTipPetCtr;
   import nslm2.modules.cultivates.pet.vo.PetInfoVo;
   
   public class TooltipPet extends TooltipUICommon
   {
       
      
      public function TooltipPet()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         this.parts.push(new ToolTipPetCtr(this,param1 as PetInfoVo));
         this.validateSize();
      }
   }
}
