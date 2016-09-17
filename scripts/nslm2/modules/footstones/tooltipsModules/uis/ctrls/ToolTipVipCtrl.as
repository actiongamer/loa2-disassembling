package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.modules.foundations.vip.vo.VipVo;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS3;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTxt;
   
   public class ToolTipVipCtrl extends TooltipCtrlBase
   {
       
      
      public function ToolTipVipCtrl(param1:TooltipUICommon, param2:VipVo)
      {
         super(param1);
         var _loc3_:Array = VipModel.ins.getVipValueArr(param2);
         ui.box.addChild(new TooltipTitleListPanelS3(LocaleMgr.ins.getStr(30100998,[]),16769442,_loc3_,TooltipTxt));
      }
   }
}
