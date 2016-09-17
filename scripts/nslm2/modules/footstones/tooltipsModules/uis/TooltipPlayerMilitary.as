package nslm2.modules.footstones.tooltipsModules.uis
{
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.TooltipPlayerMilitaryCtrl;
   import nslm2.modules.foundations.playerHeaders.PlayerMilitaryVo;
   
   public class TooltipPlayerMilitary extends TooltipUICommon
   {
       
      
      public function TooltipPlayerMilitary()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         this.parts.push(new TooltipPlayerMilitaryCtrl(this,param1 as PlayerMilitaryVo));
         this.validateSize();
      }
   }
}
