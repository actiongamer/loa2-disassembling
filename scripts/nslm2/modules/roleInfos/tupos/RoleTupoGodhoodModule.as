package nslm2.modules.roleInfos.tupos
{
   import game.ui.roleInfos.tupos.RoleTupoGodhoodModuleUI;
   import nslm2.common.vo.WealthVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import nslm2.mgrs.stcMgrs.vos.StcTupoVo;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.Button;
   import proto.HeroTuPoItemEquipReq;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.common.model.HeroModel;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.ProtocolStatusRes;
   import game.ui.roleInfos.NpcPropVo;
   import com.mz.core.utils.DisplayUtils;
   import flash.geom.Point;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import morn.customs.expands.MornExpandUtil;
   
   public class RoleTupoGodhoodModule extends RoleTupoGodhoodModuleUI
   {
       
      
      private var _state:int;
      
      private var _vo:WealthVo;
      
      public function RoleTupoGodhoodModule()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         _vo = param1 as WealthVo;
         refresh();
         this.panelBg.titleImgId = this.moduleId;
         this.preShowCpl();
      }
      
      private function refresh() : void
      {
         this.render_item.dataSource = _vo;
         var _loc1_:StcTupoVo = StcMgr.ins.getTupoVo(RoleInfoModel.ins.heroInfo.baseInfo.baseId);
         _state = RoleTupoUtil.getGodhoodEquipState(HeroInfoUtil.heroBaseInfoToPanelBaseInfo(RoleInfoModel.ins.heroInfo.baseInfo),_vo.sid);
         changeView();
      }
      
      private function changeView() : void
      {
         switch(int(_state) - 2)
         {
            case 0:
               txt_cond.text = LocaleMgr.ins.getStr(30100403,[_vo.stcItemVo.need_level]);
               this.btn_equip.label = LocaleMgr.ins.getStr(30100404);
               break;
            case 1:
               txt_cond.visible = false;
               this.btn_equip.label = LocaleMgr.ins.getStr(11700014);
               break;
            case 2:
               txt_cond.visible = true;
               txt_cond.text = LocaleMgr.ins.getStr(30100401);
               this.btn_equip.label = LocaleMgr.ins.getStr(30100402);
         }
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1;
         if(this.btn_equip === _loc3_)
         {
            switch(int(_state) - 2)
            {
               case 0:
                  if(HeroModel.ins.isCurPlayerHero(RoleInfoModel.ins.heroInfo.baseInfo.id))
                  {
                     AlertUtil.lackLevel();
                     break;
                  }
                  ModuleMgr.ins.closeModule(this.moduleId);
                  ObserverMgr.ins.sendNotice("msg_role_info_show_lvlup_panel");
                  break;
               case 1:
                  _loc2_ = new HeroTuPoItemEquipReq();
                  _loc2_.hero = RoleInfoModel.ins.heroInfo.baseInfo.id;
                  _loc2_.item = BagModel.ins.getIdBySid(_vo.sid);
                  ServerEngine.ins.send(5015,_loc2_,server_onEquipCpl);
                  break;
               case 2:
                  ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealthVo(_vo),ModuleMgr.ins.popLayer.curModuleId);
            }
         }
      }
      
      private function server_onEquipCpl(param1:ProtocolStatusRes) : void
      {
         var _loc2_:Array = NpcPropVo.filterZeroProp(NpcPropVo.parseItemVo(_vo.stcItemVo));
         AlertUtil.showPropArrChangeTip(_loc2_,null,null,DisplayUtils.globarCenter(this).add(new Point(0,-100)));
         ObserverMgr.ins.sendNotice("msg_role_godhood_equip_cpl",_vo);
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         super.handleNotices(param1,param2);
         var _loc3_:* = param1;
         if("notice_refresh_module_need_resource_data" === _loc3_)
         {
            refresh();
         }
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         NGUtil.checkModuleShow(this.moduleId,this);
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["notice_refresh_module_need_resource_data"]);
      }
   }
}
