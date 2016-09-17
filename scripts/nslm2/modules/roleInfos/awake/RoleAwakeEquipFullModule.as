package nslm2.modules.roleInfos.awake
{
   import game.ui.roleInfos.awake.RoleAwakeEquipModuleUI;
   import nslm2.mgrs.stcMgrs.vos.StcGridNodeVo;
   import nslm2.common.vo.WealthVo;
   import nslm2.utils.WealthUtil;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.utils.LabelUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.Button;
   import proto.ShenGridChooseReq;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.common.model.HeroModel;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import flash.events.MouseEvent;
   import proto.ShenGridChooseRes;
   import morn.customs.expands.MornExpandUtil;
   
   public class RoleAwakeEquipFullModule extends RoleAwakeEquipModuleUI
   {
       
      
      private var _vo:StcGridNodeVo;
      
      private var _wealthVo:WealthVo;
      
      private var _state:int;
      
      public function RoleAwakeEquipFullModule()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         _vo = param1 as StcGridNodeVo;
         refresh();
         this.render_item.txt_name.width = 100;
         this.panelBg.titleImgId = this.moduleId;
         this.preShowCpl();
      }
      
      private function refresh() : void
      {
         _wealthVo = WealthUtil.parseCostStr(_vo.cost_item);
         this.render_item.dataSource = _wealthVo;
         refreshList();
         _state = RoleAwakeUtil.checkHeroStatus(_vo);
         changeView();
      }
      
      private function refreshList() : void
      {
         var _loc2_:Array = NpcPropVo.parseArrStr(_vo.node_attr,"+");
         this.list_prop.dataSource = _loc2_;
         this.render_Extitem1.dataSource = _wealthVo;
         this.label_ExtItem1.color = ColorLib.qualityColor(_wealthVo.quality);
         this.label_ExtItem1.text = _wealthVo.showName;
         var _loc1_:int = BagModel.ins.getStcCount(_wealthVo.sid);
         this.label_need1.color = LabelUtils.getCountNeedColor(_loc1_,_wealthVo.showCount);
         this.label_need1.text = _loc1_ + "/" + _wealthVo.showCount;
         var _loc3_:WealthVo = WealthUtil.parseCostStr(_vo.cost_ziyuan);
         if(_loc3_)
         {
            this.render_Extitem2.dataSource = _loc3_;
            this.label_ExtItem2.color = ColorLib.qualityColor(_loc3_.quality);
            this.label_ExtItem2.text = _loc3_.showName;
            _loc1_ = BagModel.ins.getStcCount(_loc3_.sid);
            this.label_need2.color = LabelUtils.getCountNeedColor(_loc1_,_loc3_.showCount);
            this.label_need2.text = _loc1_ + "/" + _loc3_.showCount;
         }
      }
      
      private function changeView() : void
      {
         switch(int(_state) - 1)
         {
            case 0:
               this.btn_equip.label = LocaleMgr.ins.getStr(9990003122);
               break;
            case 1:
               this.btn_equip.label = LocaleMgr.ins.getStr(30100404);
               break;
            case 2:
               this.btn_equip.label = LocaleMgr.ins.getStr(30100402);
         }
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1;
         if(this.btn_equip === _loc3_)
         {
            switch(int(_state) - 1)
            {
               case 0:
                  _loc2_ = new ShenGridChooseReq();
                  _loc2_.heroid = RoleInfoModel.ins.heroInfo.baseInfo.id;
                  _loc2_.nodeid = this._vo.id;
                  ServerEngine.ins.send(7428,_loc2_,server_onEquipCpl);
                  break;
               case 1:
                  if(HeroModel.ins.isCurPlayerHero(RoleInfoModel.ins.heroInfo.baseInfo.id))
                  {
                     AlertUtil.lackLevel();
                     break;
                  }
                  ModuleMgr.ins.closeModule(this.moduleId);
                  ObserverMgr.ins.sendNotice("msg_role_info_show_lvlup_panel");
                  break;
               case 2:
                  if(BagModel.ins.getStcCount(_wealthVo.sid) >= _wealthVo.showCount)
                  {
                     ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealthVo(WealthUtil.parseCostStr(_vo.cost_ziyuan)),ModuleMgr.ins.popLayer.curModuleId);
                  }
                  else
                  {
                     ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealthVo(this._wealthVo),ModuleMgr.ins.popLayer.curModuleId);
                  }
            }
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["msg_role_awake_number_changed","msg_item_num_change"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         super.handleNotices(param1,param2);
         var _loc3_:* = param1;
         if("msg_role_awake_number_changed" !== _loc3_)
         {
            if("msg_item_num_change" === _loc3_)
            {
               refresh();
            }
         }
         else
         {
            refresh();
         }
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         super.btnCloseHandler(param1);
         ObserverMgr.ins.sendNotice("msg_role_awake_refresh_panel",_vo);
      }
      
      private function server_onEquipCpl(param1:ShenGridChooseRes) : void
      {
         ObserverMgr.ins.sendNotice("msg_role_awake_equip_cpl",_vo);
         ModuleMgr.ins.closeModule(this.moduleId);
      }
   }
}
