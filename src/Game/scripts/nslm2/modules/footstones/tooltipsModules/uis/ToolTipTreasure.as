package nslm2.modules.footstones.tooltipsModules.uis
{
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.ToolTipTreasureCtrl;
   import proto.BaoWu;
   
   public class ToolTipTreasure extends TooltipUICommon
   {
       
      
      public function ToolTipTreasure()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         this.parts.push(new ToolTipTreasureCtrl(this,param1 as BaoWu));
         this.validateSize();
      }
   }
}
