package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipBuzhenPanelUI;
   import proto.StageBtlReport.BuZhen;
   import nslm2.common.vo.PlayerVo;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   
   public class TooltipBuzhenPanel extends TooltipBuzhenPanelUI
   {
       
      
      public function TooltipBuzhenPanel(param1:Array)
      {
         var _loc2_:* = null;
         super();
         var _loc3_:Array = [];
         var _loc6_:int = 0;
         var _loc5_:* = param1;
         for each(var _loc4_ in param1)
         {
            _loc2_ = new PlayerVo();
            _loc2_.headerIconUrl = HeroInfoUtil.getHeadIconUrl(null,_loc4_.heroId);
            _loc2_.baseId = _loc4_.heroId;
            _loc2_.level = _loc4_.level;
            _loc3_.push(_loc2_);
         }
         this.list_buzhen.dataSource = _loc3_;
         this.x = 15;
      }
   }
}
