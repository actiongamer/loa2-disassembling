package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipSellPriceUI;
   import nslm2.common.vo.WealthVo;
   
   public class TooltipSellPrice extends TooltipSellPriceUI
   {
       
      
      public function TooltipSellPrice(param1:WealthVo)
      {
         super();
         this.txt_name.color = 14210735;
         this.render_sellPrice.dataSource = param1;
         this.x = 15;
      }
   }
}
