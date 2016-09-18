package nslm2.common.ui.components.comps2d
{
   import game.ui.commons.comps.others.RuleDescriptionUI;
   import nslm2.modules.footstones.tooltipsModules.TooltipUtils;
   
   public class RuleDesComponent extends RuleDescriptionUI
   {
       
      
      public function RuleDesComponent()
      {
         super();
         TooltipUtils.preventHideByMouseDown(this);
      }
   }
}
