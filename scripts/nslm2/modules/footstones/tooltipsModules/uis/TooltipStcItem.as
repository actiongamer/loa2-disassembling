package nslm2.modules.footstones.tooltipsModules.uis
{
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.TooltipStcItemCtrl;
   
   public class TooltipStcItem extends TooltipUICommon
   {
       
      
      public function TooltipStcItem()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         this.parts.push(new TooltipStcItemCtrl(this,param1));
         this.validateSize();
      }
   }
}
