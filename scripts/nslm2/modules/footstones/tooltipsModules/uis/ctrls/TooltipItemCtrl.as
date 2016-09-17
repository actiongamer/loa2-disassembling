package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import proto.Item;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipIconAndName_equip;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.utils.StringUtils;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.bag.itemModuels.BagConsts;
   import nslm2.mgrs.stcMgrs.vos.StcEquipStrengthVo;
   import game.ui.roleInfos.NpcProp2Vo;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.consts.NPCPropConsts;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS2;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipProp2Render_equipStren;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS1;
   import nslm2.mgrs.stcMgrs.vos.StcEquipJinglianVo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipProp2Render_equipJinglian;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.mgrs.stcMgrs.vos.StcEquipAddStarVo;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipRedEquipSkill;
   
   public class TooltipItemCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipItemCtrl(param1:TooltipUICommon, param2:Item)
      {
         var _loc19_:* = null;
         var _loc3_:* = null;
         var _loc8_:int = 0;
         var _loc10_:int = 0;
         var _loc20_:* = null;
         var _loc17_:* = null;
         var _loc9_:* = NaN;
         var _loc7_:int = 0;
         var _loc14_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc11_:* = null;
         var _loc15_:* = null;
         var _loc6_:int = 0;
         var _loc18_:* = null;
         var _loc4_:* = null;
         var _loc16_:* = null;
         super(param1);
         var _loc5_:StcItemVo = StcMgr.ins.getItemVo(param2.itemId);
         ui.img_bg.skin = SkinLib.changeSkinNum_underline(ui.img_bg.skin,_loc5_.quality);
         if(_loc5_.kind <= 4)
         {
            ui.box.addChild(new TooltipIconAndName_equip(UrlLib.itemIconLong(_loc5_.icon),_loc5_.quality,LocaleMgr.ins.getStr(_loc5_.name),(!!StringUtils.isNull(_loc5_.extend_1)?"":LocaleMgr.ins.getStr(10220006)) + LocaleMgr.ins.getStr(8000 + _loc5_.kind),!!param2.ability?Uint64Util.toNumber(param2.ability):0,param2.isEquiped,BagConsts.EQUIP_PLACE.indexOf(_loc5_.kind) != -1?param2.star:-1));
            ui.addVGap(13);
            _loc20_ = StcMgr.ins.getEquipStrengthVo(param2.strengthId);
            if(_loc20_)
            {
               _loc17_ = NpcProp2Vo.parseTwoPropArr([],NpcPropVo.parseArrStr(_loc20_.add_growth));
            }
            _loc3_ = [];
            _loc8_ = NPCPropConsts.ins.baseProp5List.length;
            _loc10_ = 0;
            while(_loc10_ < _loc8_)
            {
               _loc7_ = NPCPropConsts.ins.baseProp5List[_loc10_];
               _loc14_ = NPCPropConsts.ins.getStcVoPropertyName(_loc7_);
               if(_loc5_[_loc14_] > 0)
               {
                  _loc9_ = 0;
                  if(_loc17_)
                  {
                     _loc12_ = ArrayUtil.findByAttr(_loc17_,"propId",_loc7_);
                     if(_loc12_)
                     {
                        _loc9_ = Number(_loc12_.valueNext);
                     }
                  }
                  _loc13_ = new NpcProp2Vo(_loc7_,_loc5_[_loc14_],_loc9_);
                  _loc3_.push(_loc13_);
               }
               _loc10_++;
            }
            if(_loc20_)
            {
               ui.box.addChild(new TooltipTitleListPanelS2(LocaleMgr.ins.getStr(10220000),16046112,LocaleMgr.ins.getStr(10220002) + " " + _loc20_.level + "/" + DefindConsts.EQUIP_STRENGTH_MAXLV,_loc3_,TooltipProp2Render_equipStren));
            }
            else
            {
               ui.box.addChild(new TooltipTitleListPanelS1(LocaleMgr.ins.getStr(10220000),16046112,_loc3_,TooltipProp2Render_equipStren));
            }
            if(param2.jinglianId)
            {
               _loc11_ = StcMgr.ins.getEquipJinglianVo(param2.jinglianId);
               if(_loc11_ && StringUtils.isNull(_loc11_.add_growth) == false)
               {
                  ui.addVGap(10);
                  _loc3_ = NpcProp2Vo.parseTwoPropArr(NpcPropVo.parseArrStr(_loc11_.add_growth),[]);
                  ui.box.addChild(new TooltipTitleListPanelS2(LocaleMgr.ins.getStr(10220001),16046112,LocaleMgr.ins.getStr(10220003) + " " + _loc11_.level + "/" + DefindConsts.EQUIP_JINGLIAN_MAXLV,_loc3_,TooltipProp2Render_equipJinglian));
               }
            }
            if(FuncOpenAutoCtrl.checkOpen(30502) && (param2.starExp || uint(param2.star)))
            {
               _loc15_ = StcMgr.ins.getVoByMultiColumnValue("static_equip_add_star",["equipId","star"],[param2.itemId,param2.star]);
               if(_loc15_)
               {
                  _loc6_ = 0;
                  _loc3_ = NpcPropVo.parseStarArrStr(_loc15_,param2.starExp,"+");
                  while(_loc6_ < param2.star - 1)
                  {
                     _loc6_++;
                     _loc18_ = StcMgr.ins.getEquipAddStarVo(_loc15_.id - param2.star + _loc6_);
                     _loc3_ = _loc3_.concat(NpcPropVo.parseArrStr(_loc18_.extra_property,"+"));
                  }
                  _loc3_ = _loc3_.concat(NpcPropVo.parseArrStr(_loc15_.extra_property,"+"));
               }
               _loc3_ = NpcProp2Vo.parseTwoPropArr(_loc3_,[],false,false);
               ui.addVGap(10);
               _loc4_ = new TooltipTitleListPanelS1(LocaleMgr.ins.getStr(10220010),16046112,_loc3_,TooltipProp2Render_equipJinglian);
               ui.box.addChild(_loc4_);
            }
            if(StringUtils.isNull(_loc5_.extend_1) == false)
            {
               ui.addVGap(10);
               ui.parts.push(new TooltipEquipSuitCtrl(ui,null,param2));
            }
            ui.addVGap(10);
            ui.addLine();
            ui.addVGap(10);
            ui.parts.push(new TooltipItemCommonCtrl(ui,_loc5_));
            if(_loc5_.quality == 6)
            {
               _loc16_ = new TooltipRedEquipSkill();
               _loc16_.show(param2);
               _loc16_.x = ui.width;
               _loc16_.width = 240;
               _loc16_.img_bg.width = 240;
               ui.width = ui.width + _loc16_.width;
               ui.addChild(_loc16_);
            }
         }
         else
         {
            ui.parts.push(new TooltipStcItemCtrl(ui,_loc5_));
         }
      }
   }
}
