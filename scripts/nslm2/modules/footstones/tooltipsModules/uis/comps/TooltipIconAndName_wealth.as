package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipIconAndName_wealthUI;
   
   public class TooltipIconAndName_wealth extends TooltipIconAndName_wealthUI
   {
       
      
      public function TooltipIconAndName_wealth(param1:String, param2:String, param3:String, param4:String)
      {
         super();
         this.img_icon.url = param1;
         this.txt_name.text = param2;
         this.txt_desc.text = param4;
         this.x = 15;
         this.height = this.txt_desc.y + this.txt_desc.textHeight;
      }
   }
}
