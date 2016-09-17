package nslm2.modules.footstones.tooltipsModules.uis
{
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.TooltipPlayerDiamondCtrl;
   import nslm2.common.vo.PlayerDiamondVo;
   
   public class TooltipPlayerDiamond extends TooltipUICommon
   {
       
      
      public function TooltipPlayerDiamond()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         this.parts.push(new TooltipPlayerDiamondCtrl(this,param1 as PlayerDiamondVo));
         this.validateSize();
      }
   }
}
