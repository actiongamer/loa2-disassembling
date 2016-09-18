package nslm2.modules.footstones.tooltipsModules.uis
{
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.TooltipBuffCtrl;
   import nslm2.mgrs.stcMgrs.vos.StcBuffVo;
   
   public class TooltipBuff extends TooltipUICommon
   {
       
      
      public function TooltipBuff()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         this.parts.push(new TooltipBuffCtrl(this,param1 as StcBuffVo));
         this.validateSize();
      }
   }
}
