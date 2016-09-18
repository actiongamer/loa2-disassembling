package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipIconAndName_equip;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.utils.StringUtils;
   import nslm2.common.consts.NPCPropConsts;
   import game.ui.roleInfos.NpcProp2Vo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS1;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipProp2Render_equipStren;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipIconAndName_EquipPiece;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipIconAndName_itemNormal;
   
   public class TooltipStcItemCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipStcItemCtrl(param1:TooltipUICommon, param2:StcItemVo)
      {
         var _loc9_:* = null;
         var _loc4_:* = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:* = null;
         var _loc3_:* = null;
         super(param1);
         if(!param2)
         {
            return;
         }
         ui.img_bg.skin = SkinLib.changeSkinNum_underline(ui.img_bg.skin,param2.quality);
         if(param2.kind <= 4)
         {
            ui.box.addChild(new TooltipIconAndName_equip(UrlLib.itemIconLong(param2.icon),param2.quality,LocaleMgr.ins.getStr(param2.name),(!!StringUtils.isNull(param2.extend_1)?"":LocaleMgr.ins.getStr(10220006)) + LocaleMgr.ins.getStr(8000 + param2.kind),NPCPropConsts.ins.countFightValue_equip(param2),false));
            ui.addVGap(13);
            _loc4_ = [];
            _loc7_ = NPCPropConsts.ins.baseProp5List.length;
            _loc8_ = 0;
            while(_loc8_ < _loc7_)
            {
               _loc6_ = NPCPropConsts.ins.baseProp5List[_loc8_];
               _loc5_ = NPCPropConsts.ins.getStcVoPropertyName(_loc6_);
               if(param2[_loc5_] > 0)
               {
                  _loc3_ = new NpcProp2Vo(_loc6_,param2[_loc5_],0);
                  _loc4_.push(_loc3_);
               }
               _loc8_++;
            }
            ui.box.addChild(new TooltipTitleListPanelS1(LocaleMgr.ins.getStr(10220000),16046112,_loc4_,TooltipProp2Render_equipStren));
            if(StringUtils.isNull(param2.extend_1) == false)
            {
               ui.addVGap(10);
               ui.parts.push(new TooltipEquipSuitCtrl(ui,param2));
            }
            ui.addVGap(10);
            ui.addLine();
            ui.addVGap(10);
            ui.parts.push(new TooltipItemCommonCtrl(ui,param2));
         }
         else if(param2.kind == 21)
         {
            ui.parts.push(new TooltipItem_HeroPieceCtrl(ui,param2));
         }
         else if(param2.kind == 10 || param2.kind == 12)
         {
            ui.parts.push(new TooltipFashionCtrl(ui,param2));
         }
         else if(param2.kind == 81)
         {
            ui.parts.push(new TooltipGodhoodCtrl(ui,param2));
         }
         else if(param2.kind == 82)
         {
            ui.parts.push(new TooltipAwakeCtrl(ui,param2));
         }
         else if(param2.kind == 14)
         {
            ui.parts.push(new TooltipSkinCtrl(ui,param2));
         }
         else
         {
            if(param2.kind == 51 || param2.kind == 72 || param2.kind == 52)
            {
               ui.box.addChild(new TooltipIconAndName_EquipPiece(UrlLib.itemIcon(param2.icon),param2.quality,LocaleMgr.ins.getStr(param2.name),LocaleMgr.ins.getStr(8000 + param2.kind),param2.need_level));
            }
            else
            {
               ui.box.addChild(new TooltipIconAndName_itemNormal(UrlLib.itemIcon(param2.icon),param2.quality,LocaleMgr.ins.getStr(param2.name),LocaleMgr.ins.getStr(8000 + param2.kind),param2.need_level));
            }
            ui.addVGap(10);
            ui.parts.push(new TooltipItemCommonCtrl(ui,param2));
         }
      }
   }
}
