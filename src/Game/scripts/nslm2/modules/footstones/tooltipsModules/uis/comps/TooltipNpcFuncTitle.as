package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipNpcFuncTitleUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class TooltipNpcFuncTitle extends TooltipNpcFuncTitleUI
   {
       
      
      public function TooltipNpcFuncTitle(param1:int)
      {
         super();
         this.txt_name.text = LocaleMgr.ins.getStr(param1);
      }
   }
}
