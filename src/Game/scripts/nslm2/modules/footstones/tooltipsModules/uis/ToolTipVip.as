package nslm2.modules.footstones.tooltipsModules.uis
{
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.ToolTipVipCtrl;
   import nslm2.modules.foundations.vip.vo.VipVo;
   
   public class ToolTipVip extends TooltipUICommon
   {
       
      
      public function ToolTipVip()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         this.parts.push(new ToolTipVipCtrl(this,param1 as VipVo));
         this.validateSize();
      }
   }
}
