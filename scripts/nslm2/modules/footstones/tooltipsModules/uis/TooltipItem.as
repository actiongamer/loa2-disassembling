package nslm2.modules.footstones.tooltipsModules.uis
{
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.TooltipItemCtrl;
   import proto.Item;
   
   public class TooltipItem extends TooltipUICommon
   {
       
      
      public function TooltipItem()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         this.parts.push(new TooltipItemCtrl(this,param1 as Item));
         this.validateSize();
      }
   }
}
