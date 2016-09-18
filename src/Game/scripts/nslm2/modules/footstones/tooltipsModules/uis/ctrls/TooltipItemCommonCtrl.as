package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import morn.core.utils.StringUtils;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.consts.NPCPropConsts;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcFashionSynVo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS1;
   import game.ui.tooltipModules.comps.TooltipPropRenderS2UI;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipWealthList;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipGetPoinsDesc;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipSellPrice;
   import nslm2.utils.WealthUtil;
   
   public class TooltipItemCommonCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipItemCommonCtrl(param1:TooltipUICommon, param2:StcItemVo, param3:Boolean = true)
      {
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc5_:* = null;
         var _loc14_:* = null;
         var _loc6_:* = null;
         var _loc13_:* = null;
         var _loc7_:* = null;
         var _loc4_:int = 0;
         var _loc10_:* = null;
         var _loc11_:Boolean = false;
         var _loc12_:* = null;
         super(param1);
         if(param2.kind == 61 && !StringUtils.isNull(param2.extend_3))
         {
            _loc8_ = param2.extend_3.split("|");
            _loc9_ = 0;
            while(_loc9_ < _loc8_.length)
            {
               _loc5_ = NpcPropVo.parseStr(String(_loc8_[_loc9_]),"+");
               _loc14_ = NPCPropConsts.ins.showValue(_loc5_.value,_loc5_.preFix);
               if(_loc5_.isShowColor)
               {
                  _loc14_ = TextFieldUtil.htmlText2(_loc14_,_loc5_.getValueColor());
               }
               ui.addTxt(NPCPropConsts.ins.getLocaleNameNormal(_loc5_.propId) + " " + _loc14_);
               _loc9_++;
            }
         }
         ui.addTxt(LocaleMgr.ins.getStr(param2.desc));
         if(param2.kind == 15 || param2.kind == 16)
         {
            ui.addVGap(10);
            ui.addLine();
            ui.addVGap(10);
            _loc6_ = StcMgr.ins.getVoByColumnValue("static_fashion_syn","item",param2.id);
            _loc13_ = NpcPropVo.parseArrStr(_loc6_.prop);
            _loc7_ = new TooltipTitleListPanelS1(LocaleMgr.ins.getStr(998001138),16046112,_loc13_,TooltipPropRenderS2UI);
            ui.box.addChild(_loc7_);
         }
         if(param2.kind == 97)
         {
            _loc4_ = param2.extend_3;
            _loc10_ = param2.extend_1.split("|");
            if(_loc10_.length > 0)
            {
               if(_loc4_ == 20)
               {
                  _loc12_ = StcMgr.ins.getItemVo(_loc10_[0]);
                  if(_loc12_.kind == 21)
                  {
                     _loc11_ = true;
                  }
               }
               else
               {
                  _loc11_ = true;
               }
               if(_loc11_)
               {
                  ui.addVGap(10);
                  ui.box.addChild(new TooltipWealthList(_loc4_,_loc10_));
               }
            }
         }
         ui.addVGap(10);
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
