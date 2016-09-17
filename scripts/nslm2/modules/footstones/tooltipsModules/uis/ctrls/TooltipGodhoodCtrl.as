package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipIconAndName_godhood;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS5;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import nslm2.common.model.HeroModel;
   import proto.HeroInfo;
   import nslm2.modules.roleInfos.tupos.RoleTupoUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.tooltipsModules.TooltipGodhoodVo;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipGodhoodCanEquip;
   
   public class TooltipGodhoodCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipGodhoodCtrl(param1:TooltipUICommon, param2:StcItemVo)
      {
         super(param1);
         ui.box.addChild(new TooltipIconAndName_godhood(UrlLib.itemIcon(param2.icon),param2.quality,LocaleMgr.ins.getStr(param2.name),LocaleMgr.ins.getStr(8000 + param2.kind),BagModel.ins.getStcCount(param2.id).toString(),param2.extend_1));
         ui.addVGap(10);
         ui.addTxt(LocaleMgr.ins.getStr(param2.desc));
         ui.addVGap(10);
         ui.box.addChild(new TooltipTitleListPanelS5(LocaleMgr.ins.getStr(999000175),NpcPropVo.filterZeroProp(NpcPropVo.parseItemVo(param2))));
         if(RoleInfoModel.ins.heroInfo)
         {
            if(RoleInfoModel.ins.heroInfo.baseInfo.level < param2.need_level)
            {
               ui.addTxt(LocaleMgr.ins.getStr(10000003) + ": " + param2.need_level,16723968);
            }
         }
         var _loc3_:Vector.<HeroInfo> = HeroModel.ins.getPositionHeros();
         var _loc4_:Array = [];
         var _loc7_:int = 0;
         var _loc6_:* = _loc3_;
         for each(var _loc5_ in _loc3_)
         {
            if(RoleTupoUtil.isNeedItem(StcMgr.ins.getTupoVo(_loc5_.baseInfo.baseId),param2.id))
            {
               _loc4_.push(new TooltipGodhoodVo(_loc5_,param2));
            }
         }
         if(_loc4_.length > 0)
         {
            ui.addVGap(10);
            ui.addLine();
            ui.addVGap(10);
            ui.box.addChild(new TooltipGodhoodCanEquip(_loc4_));
            ui.addVGap(10);
         }
      }
   }
}
