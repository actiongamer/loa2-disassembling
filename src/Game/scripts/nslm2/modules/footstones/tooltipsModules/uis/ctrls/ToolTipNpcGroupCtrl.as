package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.modules.footstones.tooltipsModules.ToolTipNpcGroupVo;
   import game.ui.tooltipModules.comps.ToolTipNpcGroupViewUI;
   
   public class ToolTipNpcGroupCtrl extends TooltipCtrlBase
   {
       
      
      public function ToolTipNpcGroupCtrl(param1:TooltipUICommon, param2:ToolTipNpcGroupVo)
      {
         var _loc6_:int = 0;
         var _loc5_:* = null;
         super(param1);
         var _loc4_:ToolTipNpcGroupViewUI = new ToolTipNpcGroupViewUI();
         var _loc3_:Array = [];
         _loc6_ = 1;
         while(_loc6_ <= 3)
         {
            _loc5_ = {};
            _loc5_.index = _loc6_;
            _loc5_.type = param2.crtType;
            _loc3_.push(_loc5_);
            _loc6_++;
         }
         _loc4_.list_prop.dataSource = _loc3_;
         _loc4_.x = 15;
         ui.box.addChild(_loc4_);
      }
   }
}
