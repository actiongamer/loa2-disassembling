package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipProp2RenderUI;
   
   public class TooltipProp2Render_equipJinglian extends TooltipProp2RenderUI
   {
       
      
      public function TooltipProp2Render_equipJinglian()
      {
         super();
         this.ref_txt_name.color = 14210735;
         this.ref_txt_value.color = 458496;
         this.ref_txt_value2.color = 458496;
      }
      
      override public function showValue() : void
      {
         super.showValue();
      }
   }
}
