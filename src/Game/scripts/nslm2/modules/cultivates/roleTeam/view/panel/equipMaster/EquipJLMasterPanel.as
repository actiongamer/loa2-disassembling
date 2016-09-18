package nslm2.modules.cultivates.roleTeam.view.panel.equipMaster
{
   import game.ui.roleTeam.panel.EquipStrenMasterViewUI;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.modules.roleInfos.equipPanels.HeroEquipVo;
   import nslm2.modules.roleInfos.equipPanels.EquipHeroPosVo;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcEquipLiansuoVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.modules.cultivates.roleTeam.util.RoleTeamUtil;
   
   public class EquipJLMasterPanel extends EquipStrenMasterViewUI implements IViewStackPage
   {
       
      
      public function EquipJLMasterPanel()
      {
         super();
         list_equip.changeHandler = listClickHandler;
      }
      
      public function viewStackIn() : void
      {
         show();
         this.visible = true;
         this.fadeIn();
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
      }
      
      private function listClickHandler() : void
      {
         var _loc2_:HeroEquipVo = list_equip.selectedItem as HeroEquipVo;
         var _loc1_:EquipHeroPosVo = new EquipHeroPosVo(RoleInfoModel.ins.heroInfo.baseInfo.id,_loc2_.place,false);
         _loc1_.tabIndex = 1;
         ObserverMgr.ins.sendNotice("notice_refresh_module_equip_grow_data",_loc1_);
         ModuleMgr.ins.showModule(30500,_loc1_);
      }
      
      public function show() : void
      {
         var _loc4_:* = null;
         var _loc1_:int = RoleInfoModel.ins.heroInfo.baseInfo.jinglianLSLv;
         var _loc5_:StcEquipLiansuoVo = StcMgr.ins.getVoByMultiColumnValue("static_equip_liansuo",["kind","level"],[2,_loc1_]);
         var _loc3_:int = _loc1_ + 1;
         var _loc6_:* = StcMgr.ins.getVoByMultiColumnValue("static_equip_liansuo",["kind","level"],[2,_loc3_]);
         txt_progressTitle.text = LocaleMgr.ins.getStr(30100084);
         txt_tips.text = LocaleMgr.ins.getStr(30100057);
         txt_liansuoName.text = LocaleMgr.ins.getStr(30100061,[_loc5_.level]);
         if(_loc5_.level == 0)
         {
            txt_lvlZeroTip.text = LocaleMgr.ins.getStr(30100053);
            box_nowProp.visible = false;
         }
         else
         {
            txt_lvlZeroTip.text = "";
            box_nowProp.visible = true;
            _loc4_ = NpcPropVo.parseArrStr(_loc5_.add_growth,"+");
            list_prop.dataSource = _loc4_;
            txt_name.text = LocaleMgr.ins.getStr(30100061,[_loc5_.level]);
            txt_con.text = LocaleMgr.ins.getStr(30100065,[_loc5_.condition]);
         }
         if(_loc6_)
         {
            list_nextProp.dataSource = NpcPropVo.parseArrStr(_loc6_.add_growth,"+");
            txt_nameNext.text = LocaleMgr.ins.getStr(30100061,[_loc6_.level]);
            txt_conNext.text = LocaleMgr.ins.getStr(30100065,[_loc6_.condition]);
            txt_maxLvl.visible = false;
            box_next.visible = true;
         }
         else
         {
            _loc6_ = _loc5_;
            txt_maxLvl.visible = true;
            box_next.visible = false;
         }
         var _loc2_:Array = RoleTeamUtil.toEquipVoArr(RoleInfoModel.ins.heroInfo.items,_loc6_.condition);
         list_equip.dataSource = _loc2_;
      }
   }
}
