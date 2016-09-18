package nslm2.modules.footstones.tooltipsModules.uis
{
   import game.ui.tooltipModules.TooltipStringUI;
   import nslm2.utils.RTools;
   
   public class TooltipString extends TooltipStringUI implements ITooltipUI
   {
       
      
      public function TooltipString()
      {
         super();
      }
      
      public function show(param1:*, param2:* = null) : void
      {
         this.txt_content.width = RTools.cl(250,200);
         this.txt_content.text = param1 as String;
         this.width = this.txt_content.textWidth + 4 + this.txt_content.x * 2;
         this.height = this.txt_content.textHeight + 0 + this.txt_content.y * 2 + -3 * 2;
      }
      
      public function get showWidth() : int
      {
         return this.width;
      }
      
      public function get showHeight() : int
      {
         return this.height;
      }
   }
}
