package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.mgrs.stcMgrs.vos.StcSaddlehorseVo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipIconAndName_horse;
   import nslm2.modules.cultivates.horse.HorseService;
   import nslm2.modules.footstones.tooltipsModules.servers.TooltipHorseNeedVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.cultivates.horse.utils.HorseUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS1;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipHorseNeedRender;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS5;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipSkillRenderS2;
   
   public class TooltipHorseCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipHorseCtrl(param1:TooltipUICommon, param2:StcSaddlehorseVo)
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         super(param1);
         ui.box.addChild(new TooltipIconAndName_horse(param2));
         ui.addVGap(13);
         var _loc6_:int = HorseService.ins.getState(param2.id);
         if(!(_loc6_ == 1 || _loc6_ == 2))
         {
            _loc4_ = [];
            if(param2.prev > 0)
            {
               _loc4_.push(new TooltipHorseNeedVo(LocaleMgr.ins.getStr(999000176),LocaleMgr.ins.getStr(StcMgr.ins.getSaddlehorseVo(param2.prev).name),HorseService.ins.activatedHorseList.indexOf(param2.prev) > -1));
            }
            _loc4_.push(new TooltipHorseNeedVo(LocaleMgr.ins.getStr(999000177),String(param2.rank) + "/" + HorseUtil.getRank(HorseService.ins.masterLevel),HorseUtil.getRank(HorseService.ins.masterLevel) >= param2.rank));
            _loc5_ = WealthVo.parseCostStr(param2.item).count;
            _loc3_ = BagModel.ins.getStcCount(WealthVo.parseCostStr(param2.item).sid);
            _loc4_.push(new TooltipHorseNeedVo(LocaleMgr.ins.getStr(999000178),WealthUtil.parseCostStr(param2.item).showName + " (" + _loc3_ + "/" + _loc5_ + ")",_loc3_ >= _loc5_));
            ui.box.addChild(new TooltipTitleListPanelS1(LocaleMgr.ins.getStr(999000179),16046112,_loc4_,TooltipHorseNeedRender,_loc4_.length));
            ui.addVGap(13);
         }
         ui.box.addChild(new TooltipTitleListPanelS5(LocaleMgr.ins.getStr(999000180),NpcPropVo.parseArrStr(param2.prop)));
         ui.box.addChild(new TooltipTitleListPanelS1(LocaleMgr.ins.getStr(10220004),16046112,[param2.glory],TooltipSkillRenderS2,15));
      }
   }
}
