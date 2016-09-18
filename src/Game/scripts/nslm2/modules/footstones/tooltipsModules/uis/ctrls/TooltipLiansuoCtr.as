package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import game.ui.tooltipModules.comps.TooltipTitleTxtUI;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.modules.footstones.tooltipsModules.ToolTipLianSuoVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcEquipLiansuoVo;
   import game.ui.roleInfos.NpcPropVo;
   import game.ui.roleInfos.NpcProp2Vo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS1;
   import game.ui.tooltipModules.comps.TooltipPropRenderS1UI;
   
   public class TooltipLiansuoCtr extends TooltipCtrlBase
   {
       
      
      public function TooltipLiansuoCtr(param1:TooltipUICommon, param2:ToolTipLianSuoVo)
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc4_:* = null;
         var _loc12_:* = null;
         var _loc5_:* = null;
         var _loc3_:* = null;
         super(param1);
         var _loc10_:String = "";
         var _loc11_:int = 0;
         switch(int(param2.kind) - 1)
         {
            case 0:
               _loc11_ = 30100064;
               _loc10_ = LocaleMgr.ins.getStr(30100076);
               _loc6_ = 30100068;
               _loc7_ = 30100072;
               break;
            case 1:
               _loc11_ = 30100065;
               _loc10_ = LocaleMgr.ins.getStr(30100077);
               _loc6_ = 30100069;
               _loc7_ = 30100073;
               break;
            case 2:
               _loc11_ = 30100066;
               _loc10_ = LocaleMgr.ins.getStr(30100078);
               _loc6_ = 30100070;
               _loc7_ = 30100074;
               break;
            case 3:
               _loc11_ = 30100067;
               _loc10_ = LocaleMgr.ins.getStr(30100079);
               _loc6_ = 30100071;
               _loc7_ = 30100075;
         }
         ui.addTxt(_loc10_,14210735);
         ui.addLine();
         ui.addVGap();
         if(param2.level == 0)
         {
            _loc8_ = createTtileTxt();
            if(param2.lackEquip)
            {
               _loc8_.txt_name.text = LocaleMgr.ins.getStr(_loc6_);
            }
            else
            {
               _loc8_.txt_name.text = LocaleMgr.ins.getStr(_loc7_);
            }
            ui.box.addChild(_loc8_);
         }
         else
         {
            _loc9_ = StcMgr.ins.getVoByMultiColumnValue("static_equip_liansuo",["kind","level"],[param2.kind,param2.level]);
            _loc4_ = NpcPropVo.parseArrStr(_loc9_.add_growth,"+");
            _loc12_ = NpcProp2Vo.parseTwoPropArr(_loc4_,[]);
            _loc5_ = LocaleMgr.ins.getStr(30500002) + "：" + param2.level + LocaleMgr.ins.getStr(30100082);
            ui.box.addChild(new TooltipTitleListPanelS1(_loc5_,16046112,_loc4_,TooltipPropRenderS1UI));
         }
         var _loc13_:StcEquipLiansuoVo = StcMgr.ins.getVoByMultiColumnValue("static_equip_liansuo",["kind","level"],[param2.kind,param2.level + 1]);
         if(_loc13_)
         {
            _loc3_ = LocaleMgr.ins.getStr(30500003) + "：" + _loc13_.level + LocaleMgr.ins.getStr(30100082) + LocaleMgr.ins.getStr(_loc11_,[_loc13_.condition]);
            ui.addVGap();
            ui.addLine();
            ui.addVGap();
            _loc4_ = NpcPropVo.parseArrStr(_loc13_.add_growth,"+");
            ui.box.addChild(new TooltipTitleListPanelS1(_loc3_,16046112,_loc4_,TooltipPropRenderS1UI));
         }
         else
         {
            ui.addVGap();
            ui.addLine();
            ui.addVGap();
            _loc8_ = createTtileTxt();
            _loc8_.txt_name.text = LocaleMgr.ins.getStr(30100080);
            ui.box.addChild(_loc8_);
         }
      }
      
      private function createTtileTxt() : TooltipTitleTxtUI
      {
         var _loc1_:TooltipTitleTxtUI = new TooltipTitleTxtUI();
         _loc1_.txt_name.size = 12;
         _loc1_.txt_name.color = 16046112;
         _loc1_.txt_name.isHtml = true;
         _loc1_.x = 15;
         return _loc1_;
      }
   }
}
