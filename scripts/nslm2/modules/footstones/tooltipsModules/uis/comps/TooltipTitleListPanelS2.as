package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipTitleListPanelS2UI;
   
   public class TooltipTitleListPanelS2 extends TooltipTitleListPanelS2UI
   {
       
      
      public function TooltipTitleListPanelS2(param1:String, param2:uint, param3:String, param4:Array, param5:Class = null)
      {
         super();
         this.txt_title.color = param2;
         this.txt_title.text = param1;
         this.txt_title2.text = param3;
         if(param5)
         {
            this.list_prop.itemRender = param5;
         }
         this.list_prop.repeatY = param4.length;
         this.list_prop.array = param4;
         this.height = this.list_prop.y + this.list_prop.height;
         this.x = 15;
      }
   }
}
