package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipNpcFuncDescUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class TooltipNpcFuncDesc extends TooltipNpcFuncDescUI
   {
       
      
      public function TooltipNpcFuncDesc(param1:int, param2:int)
      {
         super();
         this.txt_name.text = LocaleMgr.ins.getStr(param1);
         this.txt_content.text = LocaleMgr.ins.getStr(param2);
         this.height = this.txt_content.y + this.txt_content.height;
         this.x = 15;
      }
   }
}
