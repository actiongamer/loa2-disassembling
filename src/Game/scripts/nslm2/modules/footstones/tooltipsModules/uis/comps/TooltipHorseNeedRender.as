package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipHorseNeedRenderUI;
   import nslm2.modules.footstones.tooltipsModules.servers.TooltipHorseNeedVo;
   
   public class TooltipHorseNeedRender extends TooltipHorseNeedRenderUI
   {
       
      
      public function TooltipHorseNeedRender()
      {
         super();
      }
      
      public function get vo() : TooltipHorseNeedVo
      {
         return this.dataSource as TooltipHorseNeedVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(vo)
         {
            this.txt_name.text = vo.str1;
            this.txt_value.text = vo.str2;
            this.txt_value.color = !!vo.had?458496:16723968;
         }
      }
   }
}
