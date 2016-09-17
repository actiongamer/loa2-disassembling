package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipTitleListPanelS1UI;
   
   public class TooltipTitleListPanelS7 extends TooltipTitleListPanelS1UI
   {
       
      
      public function TooltipTitleListPanelS7(param1:String, param2:uint, param3:Array, param4:Class = null, param5:int = 7)
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
         this.list_prop.dataSource = param3;
         if(param3 && param3.length)
         {
            this.height = this.list_prop.y + this.list_prop.height;
         }
         else
         {
            this.height = txt_title.height;
         }
         this.x = 15;
      }
   }
}
