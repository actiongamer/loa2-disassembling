package nslm2.modules.footstones.tooltipsModules.uis
{
   import game.ui.tooltipModules.comps.TooltipGodhoodCanEquipUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class TooltipGodhoodCanEquip extends TooltipGodhoodCanEquipUI
   {
       
      
      public function TooltipGodhoodCanEquip(param1:Array)
      {
         super();
         this.txt_name.text = LocaleMgr.ins.getStr(30100405);
         this.list_hero.dataSource = param1;
         this.list_hero.repeatY = Math.ceil(param1.length / this.list_hero.repeatX);
         this.height = this.list_hero.y + this.list_hero.height;
         this.x = 15;
         this.commitMeasure();
      }
   }
}
