package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipGetPoinsDescUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class TooltipGridAngleActive extends TooltipGetPoinsDescUI
   {
       
      
      public function TooltipGridAngleActive(param1:int, param2:Boolean)
      {
         super();
         this.txt_name.width = NaN;
         this.txt_name.text = LocaleMgr.ins.getStr(30106011).split("\n")[0];
         if(param2)
         {
            this.txt_getPointsDesc.text = LocaleMgr.ins.getStr(30106012).split("\n")[1];
         }
         else
         {
            this.txt_getPointsDesc.text = LocaleMgr.ins.getStr(30106011).split("\n")[1];
         }
         this.height = this.txt_getPointsDesc.y + this.txt_getPointsDesc.height;
         this.x = 15;
      }
   }
}
