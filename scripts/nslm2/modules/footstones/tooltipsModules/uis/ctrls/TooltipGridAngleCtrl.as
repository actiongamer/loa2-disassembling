package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.modules.footstones.tooltipsModules.ToolTipGridActiveVo;
   import game.ui.tooltipModules.comps.ToolTipGridAngleViewUI;
   import game.ui.roleInfos.NpcPropVo;
   import morn.customs.components.RolePropBaseRenderS2;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.consts.NPCPropConsts;
   import com.greensock.TweenLite;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipGridAngleActive;
   
   public class TooltipGridAngleCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipGridAngleCtrl(param1:TooltipUICommon, param2:ToolTipGridActiveVo)
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         super(param1);
         var _loc5_:ToolTipGridAngleViewUI = new ToolTipGridAngleViewUI();
         if(param2.isMid)
         {
            _loc4_ = NpcPropVo.parseArrStr(param2.vo.mid_attr,"+")[0];
         }
         else
         {
            _loc4_ = NpcPropVo.parseStr(param2.vo.angle_attr,"+");
         }
         _loc5_.list_prop.dataSource = _loc4_;
         var _loc8_:int = 0;
         var _loc7_:* = _loc5_.list_prop.cells;
         for each(var _loc6_ in _loc5_.list_prop.cells)
         {
            _loc6_.ref_txt_name.width = NaN;
            _loc3_ = "+" + (_loc4_.value < 1?int(_loc4_.value * 1000) / 10 + "%":_loc4_.value);
            _loc3_ = TextFieldUtil.htmlText2(_loc3_,458496);
            if(param2.isMid)
            {
               _loc6_.ref_txt_name.text = LocaleMgr.ins.getStr(param2.vo.mid_attr_desc) + "：" + _loc3_;
            }
            else
            {
               _loc6_.ref_txt_name.text = NPCPropConsts.ins.getLocaleNameNormal(_loc4_.propId) + "：" + _loc3_;
            }
            _loc6_.ref_txt_value.text = "";
         }
         _loc5_.x = 15;
         if(param2.active)
         {
            _loc5_.label_active.x = 110;
            _loc6_.ref_txt_name.text = _loc6_.ref_txt_name.text + TextFieldUtil.htmlText2("  " + LocaleMgr.ins.getStr(30120024),16723968);
            _loc5_.label_active.text = "";
         }
         else
         {
            _loc5_.label_active.x = 110;
            _loc6_.ref_txt_name.text = _loc6_.ref_txt_name.text + TextFieldUtil.htmlText2("  " + LocaleMgr.ins.getStr(30120025),16723968);
            _loc5_.label_active.text = "";
         }
         TweenLite.from(_loc5_.label_active,0.5,{
            "x":180,
            "alpha":0
         });
         ui.box.addChild(_loc5_);
         ui.addVGap(10);
         ui.addLine();
         ui.addVGap(10);
         ui.box.addChild(new TooltipGridAngleActive(1,param2.isMid));
      }
   }
}
