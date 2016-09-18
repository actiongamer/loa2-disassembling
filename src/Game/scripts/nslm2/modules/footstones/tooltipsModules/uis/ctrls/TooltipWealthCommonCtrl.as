package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.common.vo.WealthVo;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.utils.LabelUtils;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import morn.customs.StyleLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipIconAndName_wealth;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipGetPoinsDesc;
   
   public class TooltipWealthCommonCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipWealthCommonCtrl(param1:TooltipUICommon, param2:WealthVo)
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         super(param1);
         if(param2.kind == 21)
         {
            _loc4_ = TextFieldUtil.htmlText2(param2.showCount + "/" + DefindConsts.LOTTERY_POINT_FULL,LabelUtils.getCountNeedColor(param2.showCount,int(DefindConsts.LOTTERY_POINT_FULL)));
         }
         else if(param2.kind == 2)
         {
            _loc4_ = param2.showCount + "/" + PlayerModel.ins.staminaMax;
         }
         else if(param2.kind == 10)
         {
            if(param2.useStcCount == false)
            {
               _loc4_ = int(param2.showCount).toString();
            }
            else
            {
               _loc4_ = PlayerModel.ins.exp + "/" + PlayerModel.ins.expNeed + " (" + TextFieldUtil.htmlText2(LocaleConsts.percentStrInt(PlayerModel.ins.exp / PlayerModel.ins.expNeed * 100),StyleLib.ins.getConfigVo("普通绿色").color) + ")";
            }
         }
         else
         {
            _loc4_ = int(param2.showCount).toString();
         }
         if(param2.kind == 10 && param2.useStcCount)
         {
            _loc3_ = LocaleMgr.ins.getStr(3000 + param2.kind) + "  " + _loc4_;
         }
         else
         {
            _loc3_ = LocaleMgr.ins.getStr(3000 + param2.kind);
         }
         ui.box.addChild(new TooltipIconAndName_wealth(UrlLib.itemIcon(param2.kind),_loc3_,_loc4_,LocaleMgr.ins.getStr(3100 + param2.kind)));
         ui.addVGap(10);
         ui.addLine();
         ui.addVGap(10);
         ui.box.addChild(new TooltipGetPoinsDesc(3200 + param2.kind));
      }
   }
}
