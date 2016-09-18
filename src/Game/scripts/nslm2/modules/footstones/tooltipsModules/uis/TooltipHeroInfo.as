package nslm2.modules.footstones.tooltipsModules.uis
{
   import proto.HeroInfo;
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.TooltipHeroCtrl;
   
   public class TooltipHeroInfo extends TooltipUICommon
   {
       
      
      public function TooltipHeroInfo()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         super.show(param1,param2);
         var _loc3_:HeroInfo = param1 as HeroInfo;
         this.parts.push(new TooltipHeroCtrl(this,_loc3_));
         this.validateSize();
      }
   }
}
