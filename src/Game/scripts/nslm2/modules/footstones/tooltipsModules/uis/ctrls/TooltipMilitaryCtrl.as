package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.mgrs.stcMgrs.vos.StcMilitaryrankVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS1;
   import nslm2.mgrs.skins.ColorLib;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipPropRenderS3;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTxt;
   import nslm2.common.vo.WealthVo;
   import nslm2.utils.LabelUtils;
   import nslm2.common.model.PlayerModel;
   
   public class TooltipMilitaryCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipMilitaryCtrl(param1:TooltipUICommon, param2:StcMilitaryrankVo)
      {
         var _loc3_:* = null;
         var _loc7_:* = null;
         var _loc4_:* = null;
         super(param1);
         var _loc5_:String = LocaleMgr.ins.getStr(param2.name);
         var _loc6_:int = MilitaryModel.ins.getPlayerQuality(param2.id);
         if(param2.kind == 1)
         {
            ui.box.addChild(new TooltipTitleListPanelS1(_loc5_,ColorLib.qualityColor(_loc6_),NpcPropVo.filterZeroProp(MilitaryModel.ins.getAddPropSingle(param2.id)),TooltipPropRenderS3));
         }
         else
         {
            _loc3_ = LocaleMgr.ins.getStr(30400000,[LocaleMgr.ins.getStr(6000 + int(param2.prop))]);
            ui.box.addChild(new TooltipTitleListPanelS1(_loc5_,ColorLib.qualityColor(_loc6_),[_loc3_],TooltipTxt));
         }
         ui.addVGap();
         if(MilitaryModel.ins.hasUpgraded(param2.id) == false)
         {
            _loc7_ = WealthVo.parseCostStr(param2.cond);
            _loc4_ = _loc7_.showName + "  " + LabelUtils.countNeedStr(PlayerModel.ins.getCountByWealthVo(_loc7_),_loc7_.count);
            ui.box.addChild(new TooltipTitleListPanelS1(LocaleMgr.ins.getStr(_loc7_.stcItemVo.desc),16046112,[_loc4_],TooltipTxt));
         }
      }
   }
}
