package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.modules.foundations.playerHeaders.PlayerMilitaryVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcMilitaryrankVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS1;
   import nslm2.mgrs.skins.ColorLib;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipPropRenderS3;
   
   public class TooltipPlayerMilitaryCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipPlayerMilitaryCtrl(param1:TooltipUICommon, param2:PlayerMilitaryVo)
      {
         var _loc3_:* = null;
         super(param1);
         var _loc5_:StcMilitaryrankVo = StcMgr.ins.getMilitaryrankVo(param2.militaryRank);
         var _loc4_:String = LocaleMgr.ins.getStr(_loc5_.name);
         var _loc6_:int = MilitaryModel.ins.getPlayerQuality(param2.militaryRank);
         ui.box.addChild(new TooltipTitleListPanelS1(_loc4_,ColorLib.qualityColor(_loc6_),NpcPropVo.filterZeroProp(MilitaryModel.ins.getAddPropAll(_loc5_.id)),TooltipPropRenderS3));
         ui.addVGap();
         if(_loc6_)
         {
            _loc3_ = LocaleMgr.ins.getStr(30400000,[LocaleMgr.ins.getStr(6000 + _loc6_)]);
            ui.addTxt(_loc3_,ColorLib.qualityColor(_loc6_));
         }
      }
   }
}
