package nslm2.modules.footstones.tooltipsModules.uis
{
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.TooltipNpcFuncCtrl;
   import nslm2.mgrs.stcMgrs.vos.StcFunctionVo;
   
   public class TooltipNpcFunc extends TooltipUICommon
   {
       
      
      public function TooltipNpcFunc()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         this.parts.push(new TooltipNpcFuncCtrl(this,param1 as StcFunctionVo));
         this.validateSize();
      }
   }
}
