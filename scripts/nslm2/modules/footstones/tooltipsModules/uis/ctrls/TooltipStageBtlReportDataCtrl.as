package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import proto.StageBtlReport;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipIconAndName_player;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipBuzhenPanel;
   
   public class TooltipStageBtlReportDataCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipStageBtlReportDataCtrl(param1:TooltipUICommon, param2:StageBtlReport)
      {
         super(param1);
         var _loc3_:StcNpcVo = StcMgr.ins.getNpcVo(param2.heroId);
         ui.box.addChild(new TooltipIconAndName_player(HeroInfoUtil.getHeadIconUrl(null,param2.heroId),param2.level,param2.name,Uint64Util.toNumber(param2.zhanli)));
         this.ui.addVGap(10);
         this.ui.addLine();
         this.ui.addVGap(10);
         this.ui.box.addChild(new TooltipBuzhenPanel(param2.buzhen));
      }
   }
}
