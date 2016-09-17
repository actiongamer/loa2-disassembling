package nslm2.modules.footstones.tooltipsModules.uis
{
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.TooltipStcNpcCtrl;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   
   public class TooltipStcNpc extends TooltipUICommon
   {
       
      
      public function TooltipStcNpc()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         super.show(param1,param2);
         this.parts.push(new TooltipStcNpcCtrl(this,param1 as StcNpcVo));
         this.validateSize();
      }
   }
}
