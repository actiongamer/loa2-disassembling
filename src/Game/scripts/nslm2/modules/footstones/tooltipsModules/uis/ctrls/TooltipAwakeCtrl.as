package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcGridNodeVo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipIconAndName_itemNormal;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS5;
   import com.mz.core.utils.TextFieldUtil;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipGetPoinsDesc;
   import morn.core.utils.StringUtils;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipSellPrice;
   import nslm2.utils.WealthUtil;
   
   public class TooltipAwakeCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipAwakeCtrl(param1:TooltipUICommon, param2:StcItemVo, param3:Boolean = true)
      {
         super(param1);
         var _loc4_:StcGridNodeVo = StcMgr.ins.getGridNodeVo(int(param2.extend_1));
         ui.box.addChild(new TooltipIconAndName_itemNormal(UrlLib.itemIcon(param2.icon),param2.quality,LocaleMgr.ins.getStr(param2.name),LocaleMgr.ins.getStr(8000 + param2.kind),param2.need_level));
         ui.addVGap(10);
         ui.addTxt(LocaleMgr.ins.getStr(param2.desc));
         ui.addVGap(10);
         if(_loc4_)
         {
            ui.addTxt(LocaleMgr.ins.getStr(30106013,[_loc4_.pagenum]),14210735);
            ui.addVGap(10);
         }
         if(ModuleMgr.ins.popLayer.curModuleId == 30100 && _loc4_)
         {
            ui.box.addChild(new TooltipTitleListPanelS5(TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(999000174),16773888),NpcPropVo.parseArrStr(_loc4_.node_attr)));
            ui.addVGap(10);
         }
         ui.addLine();
         ui.addVGap(10);
         ui.box.addChild(new TooltipGetPoinsDesc(int(param2.get_point_des)));
         ui.addVGap(10);
         ui.addLine();
         ui.addVGap(10);
         if(param3)
         {
            if(!StringUtils.isNull(param2.sell_price))
            {
               ui.box.addChild(new TooltipSellPrice(WealthUtil.parseCostStr(param2.sell_price)));
            }
            else
            {
               ui.addTxt(LocaleMgr.ins.getStr(10000002),7566195);
            }
         }
      }
   }
}
