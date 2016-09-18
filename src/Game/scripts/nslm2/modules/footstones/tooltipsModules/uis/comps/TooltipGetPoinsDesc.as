package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipGetPoinsDescUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class TooltipGetPoinsDesc extends TooltipGetPoinsDescUI
   {
       
      
      public function TooltipGetPoinsDesc(param1:int)
      {
         super();
         this.txt_getPointsDesc.text = LocaleMgr.ins.getStr(param1);
         this.height = this.txt_getPointsDesc.y + this.txt_getPointsDesc.height;
         this.x = 15;
      }
   }
}
