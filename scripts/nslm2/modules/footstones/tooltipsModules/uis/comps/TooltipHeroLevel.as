package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipHeroLevelUI;
   import proto.HeroInfo;
   
   public class TooltipHeroLevel extends TooltipHeroLevelUI
   {
       
      
      public function TooltipHeroLevel(param1:HeroInfo)
      {
         super();
         this.txt_value.text = String(param1.baseInfo.level);
         this.txt_value2.text = String(param1.baseInfo.sjLevel);
      }
   }
}
