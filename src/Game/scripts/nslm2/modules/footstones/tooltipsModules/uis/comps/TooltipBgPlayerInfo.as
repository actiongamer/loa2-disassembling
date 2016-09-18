package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.TooltipBgPlayerInfoCtrl;
   import proto.BgPlayerInfo;
   
   public class TooltipBgPlayerInfo extends TooltipUICommon
   {
       
      
      public function TooltipBgPlayerInfo()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         this.parts.push(new TooltipBgPlayerInfoCtrl(this,param1 as BgPlayerInfo));
         this.validateSize();
      }
   }
}
