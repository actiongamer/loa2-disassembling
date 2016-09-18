package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import proto.BaoWu;
   import proto.BaoWuFumo;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipIconAndName_Treausre;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.Uint64Util;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.modules.cultivates.treasure.util.TreasureUtil;
   import game.ui.roleInfos.NpcProp2Vo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS2;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipProp2Render_equipStren;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS7;
   import game.ui.tooltipModules.comps.TooltipPropRenderS4UI;
   import proto.BaoWuBuff;
   import morn.core.utils.NumberUtil;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTxt;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.mgrs.stcMgrs.vos.StcBaowuKeyinVo;
   import game.ui.tooltipModules.comps.TooltipPropRenderS1UI;
   import nslm2.modules.footstones.tooltipsModules.uis.ToolTipTreasureRune;
   
   public class ToolTipTreasureCtrl extends TooltipCtrlBase
   {
       
      
      public function ToolTipTreasureCtrl(param1:TooltipUICommon, param2:BaoWu)
      {
         var _loc21_:* = null;
         var _loc3_:* = null;
         var _loc7_:int = 0;
         var _loc9_:int = 0;
         var _loc11_:* = null;
         var _loc19_:* = null;
         var _loc22_:* = null;
         var _loc12_:int = 0;
         var _loc16_:* = null;
         var _loc23_:* = null;
         var _loc18_:Number = NaN;
         var _loc6_:* = null;
         var _loc15_:* = null;
         var _loc4_:* = null;
         var _loc8_:* = null;
         var _loc17_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         super(param1);
         var _loc5_:StcItemVo = StcMgr.ins.getItemVo(param2.baseId);
         ui.img_bg.skin = SkinLib.changeSkinNum_underline(ui.img_bg.skin,_loc5_.quality);
         if(_loc5_.kind <= 9)
         {
            ui.box.addChild(new TooltipIconAndName_Treausre(UrlLib.itemIconLong(_loc5_.icon),_loc5_.quality,LocaleMgr.ins.getStr(_loc5_.name),LocaleMgr.ins.getStr(8000 + _loc5_.kind),!!param2.ability?Uint64Util.toNumber(param2.ability):0,param2.statue == 2,param2.keyin,_loc5_.quality >= 5));
            ui.addVGap(13);
            _loc11_ = NpcPropVo.parseFightProp(param2.base,"+");
            _loc19_ = [];
            _loc7_ = _loc11_.length;
            _loc9_ = 0;
            while(_loc9_ < _loc7_)
            {
               _loc16_ = _loc11_[_loc9_];
               _loc12_ = TreasureUtil.caculateStrenAddProp(_loc16_.value,param2.level);
               _loc22_ = new NpcPropVo(_loc16_.propId,_loc12_,"+");
               _loc19_.push(_loc22_);
               _loc9_++;
            }
            _loc23_ = NpcProp2Vo.parseTwoPropArr(_loc11_,_loc19_);
            ui.box.addChild(new TooltipTitleListPanelS2(LocaleMgr.ins.getStr(10220000),16046112,LocaleMgr.ins.getStr(10220002) + " " + param2.level + "/" + _loc5_.extend_3,_loc23_,TooltipProp2Render_equipStren));
            _loc3_ = NpcPropVo.parseFightProp(param2.random,"+",1);
            ui.addVGap(10);
            ui.box.addChild(new TooltipTitleListPanelS7(LocaleMgr.ins.getStr(999000182),16046112,_loc3_,TooltipPropRenderS4UI));
            if(param2.buff.length)
            {
               ui.addVGap(6);
               var _loc25_:int = 0;
               var _loc24_:* = param2.buff;
               for each(var _loc20_ in param2.buff)
               {
                  _loc18_ = _loc20_.value;
                  if(NumberUtil.isFloatNumber(_loc18_))
                  {
                     _loc18_ = _loc18_ * 100;
                  }
                  if(NumberUtil.isFloatNumber(_loc18_))
                  {
                     _loc6_ = _loc18_.toFixed(1);
                  }
                  else
                  {
                     _loc6_ = _loc18_ + "";
                  }
                  _loc15_ = LocaleMgr.ins.getStr(StcMgr.ins.getBuffVo(_loc20_.id).desc,[_loc6_]);
                  _loc4_ = new TooltipTxt(14210735);
                  _loc4_.content = _loc15_;
                  _loc4_.x = 25 + 20;
                  ui.box.addChild(_loc4_);
               }
            }
            if(FuncOpenAutoCtrl.checkOpen(30609) && param2.keyin > 0)
            {
               ui.addVGap(10);
               _loc3_ = [];
               _loc8_ = StcMgr.ins.getVoByMultiColumnValue("static_baowu_keyin",["level","itemid"],[param2.keyin,_loc5_.id]);
               _loc17_ = _loc8_.add_attr.split("|");
               var _loc27_:int = 0;
               var _loc26_:* = _loc17_;
               for each(var _loc10_ in _loc17_)
               {
                  _loc13_ = new NpcPropVo(_loc10_.split(":")[0],_loc10_.split(":")[1],"+");
                  _loc3_.push(_loc13_);
               }
               ui.box.addChild(new TooltipTitleListPanelS7(LocaleMgr.ins.getStr(999001105),16046112,_loc3_,TooltipPropRenderS1UI));
            }
            ui.addVGap(10);
            ui.addLine();
            ui.addVGap(10);
            ui.parts.push(new TooltipItemCommonCtrl(ui,_loc5_,false));
            if(param2.statue == 0)
            {
               ui.addTxt(LocaleMgr.ins.getStr(30610030),458496);
            }
            else if(param2.statue == 3)
            {
               ui.addTxt(LocaleMgr.ins.getStr(30610030),458496);
            }
            else
            {
               ui.addTxt(LocaleMgr.ins.getStr(30610031),16723968);
            }
            if(param2.fumo.length > 0)
            {
               if(checkHasRune(param2) || checkHasFuwenKeyin(param2))
               {
                  _loc14_ = new ToolTipTreasureRune();
                  _loc14_.show(param2);
                  _loc14_.x = ui.width - 8;
                  ui.width = ui.width + _loc14_.width - 12;
                  ui.addChild(_loc14_);
               }
            }
         }
         else
         {
            ui.parts.push(new TooltipStcItemCtrl(ui,_loc5_));
         }
      }
      
      private function checkHasRune(param1:BaoWu) : Boolean
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1.fumo;
         for each(var _loc2_ in param1.fumo)
         {
            if(_loc2_.id > 0)
            {
               return true;
            }
         }
         return false;
      }
      
      private function checkHasFuwenKeyin(param1:BaoWu) : Boolean
      {
         return param1.fuwenkeyin > 9;
      }
   }
}
