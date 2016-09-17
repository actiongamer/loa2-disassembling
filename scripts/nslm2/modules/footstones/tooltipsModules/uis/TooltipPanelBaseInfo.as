package nslm2.modules.footstones.tooltipsModules.uis
{
   import proto.HeroInfo;
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.TooltipHeroCtrl;
   
   public class TooltipPanelBaseInfo extends TooltipUICommon
   {
       
      
      public function TooltipPanelBaseInfo()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         super.show(param1,param2);
         var _loc3_:HeroInfo = param2 as HeroInfo;
         this.parts.push(new TooltipHeroCtrl(this,_loc3_));
         this.validateSize();
      }
   }
}
