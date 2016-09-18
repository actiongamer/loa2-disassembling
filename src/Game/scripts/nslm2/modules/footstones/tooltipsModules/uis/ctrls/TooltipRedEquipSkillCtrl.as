package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import proto.Item;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.stcMgrs.vos.StcEquipAttrVo;
   import nslm2.modules.footstones.tooltipsModules.TooltipEquipAttrVo;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS6;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipRedEquipSkillRender;
   
   public class TooltipRedEquipSkillCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipRedEquipSkillCtrl(param1:TooltipUICommon, param2:Item)
      {
         var _loc3_:* = null;
         super(param1);
         var _loc7_:StcItemVo = StcMgr.ins.getItemVo(param2.itemId);
         var _loc6_:Array = StcMgr.ins.getVoArrByColumnValue("static_equip_attr","itemid",param2.itemId);
         var _loc4_:Array = [];
         var _loc9_:int = 0;
         var _loc8_:* = _loc6_;
         for each(var _loc5_ in _loc6_)
         {
            _loc3_ = new TooltipEquipAttrVo();
            _loc3_.attr_name = _loc5_.attr_name;
            _loc3_.attr_disc = _loc5_.attr_disc;
            _loc3_.active_disc = _loc5_.active_disc;
            _loc3_.show_order = _loc5_.show_order;
            if(_loc5_.active_condi_kind == 1)
            {
               _loc3_.actived = StcMgr.ins.getEquipStrengthVo(param2.strengthId).level >= _loc5_.active_condi_value;
            }
            else if(_loc5_.active_condi_kind == 2)
            {
               _loc3_.actived = StcMgr.ins.getEquipJinglianVo(param2.jinglianId).level >= _loc5_.active_condi_value;
            }
            _loc4_.push(_loc3_);
         }
         ui.img_bg.skin = SkinLib.changeSkinNum_underline(ui.img_bg.skin,_loc7_.quality);
         ui.box.addChild(new TooltipTitleListPanelS6(LocaleMgr.ins.getStr(10220012),_loc4_.sortOn("show_order"),TooltipRedEquipSkillRender));
      }
   }
}
