package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipTitleListPanelS4UI;
   
   public class TooltipTitleListPanelS4 extends TooltipTitleListPanelS4UI
   {
       
      
      public function TooltipTitleListPanelS4(param1:String, param2:uint, param3:Array, param4:Class = null, param5:int = 7)
      {
         super();
         this.txt_title.color = param2;
         this.txt_title.text = param1;
         if(param4)
         {
            this.list_prop.itemRender = param4;
         }
         this.list_prop.repeatY = param3.length;
         this.list_prop.spaceY = param5;
         this.list_prop.array = param3;
         this.height = this.list_prop.y + this.list_prop.height;
         this.x = 15;
      }
   }
}
