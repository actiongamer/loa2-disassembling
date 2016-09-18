package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipProp2RenderUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class TooltipProp2Render_equipStren extends TooltipProp2RenderUI
   {
       
      
      public function TooltipProp2Render_equipStren()
      {
         super();
         this.ref_txt_name.color = 14210735;
         this.ref_txt_value.color = 458496;
         this.ref_txt_value2.color = 458496;
      }
      
      override public function showValue() : void
      {
         this.ref_txt_value.text = "+" + vo.value;
      }
      
      override public function showValue2() : void
      {
         this.ref_txt_value2.text = "(" + LocaleMgr.ins.getStr(10220007) + "+" + vo.valueNext.toFixed() + ")";
      }
   }
}
