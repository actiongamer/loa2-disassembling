package nslm2.modules.footstones.tooltipsModules.uis
{
   import game.ui.tooltipModules.comps.ToolTipStringWideUI;
   import nslm2.modules.footstones.tooltipsModules.vos.WideToolTipStringVo;
   
   public class ToolTipStringWide extends ToolTipStringWideUI implements ITooltipUI
   {
       
      
      public function ToolTipStringWide()
      {
         super();
      }
      
      public function show(param1:*, param2:* = null) : void
      {
         var _loc3_:WideToolTipStringVo = param1 as WideToolTipStringVo;
         if(_loc3_.width)
         {
            this.txt_content.width = _loc3_.width;
         }
         this.txt_content.text = _loc3_.content as String;
         this._width = this.txt_content.width + 4 + this.txt_content.x * 2;
         this._height = this.txt_content.textHeight + 0 + this.txt_content.y * 2 + -3 * 2;
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
