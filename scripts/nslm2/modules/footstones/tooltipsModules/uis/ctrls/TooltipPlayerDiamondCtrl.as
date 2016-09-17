package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.common.vo.PlayerDiamondVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipIconAndName_2KindDiamond;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipIconAndName_wealth2;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipGetPoinsDesc;
   
   public class TooltipPlayerDiamondCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipPlayerDiamondCtrl(param1:TooltipUICommon, param2:PlayerDiamondVo)
      {
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         super(param1);
         if(param2.showNormalDiamond)
         {
            _loc5_ = PlayerModel.ins.getWealthValue(3);
         }
         else
         {
            _loc5_ = 0;
         }
         if(param2.showGlodDiamond)
         {
            _loc4_ = PlayerModel.ins.getWealthValue(4);
         }
         else
         {
            _loc4_ = 0;
         }
         if(param2.showNormalDiamond)
         {
            _loc3_ = LocaleMgr.ins.getStr(3000 + 3) + TextFieldUtil.htmlText2("  " + (_loc5_ + _loc4_) + "",458496);
            if(param2.showGlodDiamond)
            {
               _loc3_ = _loc3_ + ("  " + LocaleMgr.ins.getStr(999900100));
               ui.box.addChild(new TooltipIconAndName_2KindDiamond(UrlLib.itemMiniIcon(3),_loc3_,UrlLib.itemMiniIcon(4),TextFieldUtil.htmlText2("  " + _loc4_.toString(),458496),LocaleMgr.ins.getStr(3100 + 3)));
            }
            else
            {
               ui.box.addChild(new TooltipIconAndName_wealth2(UrlLib.itemMiniIcon(3),_loc3_,"",LocaleMgr.ins.getStr(3100 + 3)));
            }
            ui.addVGap(10);
         }
         if(param2.showGlodDiamond)
         {
            _loc3_ = LocaleMgr.ins.getStr(3000 + 4) + TextFieldUtil.htmlText2("  " + _loc4_ + "",458496);
            ui.box.addChild(new TooltipIconAndName_wealth2(UrlLib.itemMiniIcon(4),_loc3_,"",LocaleMgr.ins.getStr(3100 + 4)));
            ui.addVGap(10);
         }
         ui.addLine();
         ui.addVGap(10);
         if(param2.showGlodDiamond && param2.showNormalDiamond == false)
         {
            ui.box.addChild(new TooltipGetPoinsDesc(3200 + 4));
         }
         else
         {
            ui.box.addChild(new TooltipGetPoinsDesc(3200 + 3));
         }
      }
   }
}
