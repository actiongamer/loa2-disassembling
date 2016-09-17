package nslm2.modules.footstones.tooltipsModules.uis
{
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.ToolTipTreasureRuneCtrl;
   import proto.BaoWu;
   
   public class ToolTipTreasureRune extends TooltipUICommon
   {
       
      
      public function ToolTipTreasureRune()
      {
         super();
         var _loc1_:int = 270;
         this.width = _loc1_;
         this.img_bg.width = _loc1_;
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         this.parts.push(new ToolTipTreasureRuneCtrl(this,param1 as BaoWu));
         this.validateSize();
      }
   }
}
