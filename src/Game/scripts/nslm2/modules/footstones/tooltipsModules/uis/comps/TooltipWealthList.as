package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipWealthListUI;
   import nslm2.utils.WealthUtil;
   
   public class TooltipWealthList extends TooltipWealthListUI
   {
       
      
      public function TooltipWealthList(param1:int, param2:Array)
      {
         var _loc3_:* = null;
         var _loc7_:int = 0;
         var _loc6_:int = 0;
         super();
         var _loc4_:Array = [];
         var _loc5_:int = param2.length;
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            _loc6_ = param2[_loc7_];
            _loc4_.push(WealthUtil.createWealthVo(param1,_loc6_,1));
            _loc7_++;
         }
         this.list_icon.repeatY = Math.ceil(_loc5_ / 4);
         this.list_icon.array = _loc4_;
         this.height = this.list_icon.height;
         this.x = 25;
      }
   }
}
