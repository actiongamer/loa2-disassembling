package nslm2.modules.cultivates.horse.horseChange
{
   import game.ui.horseModules.horseChange.HorseChangePanelUI;
   import nslm2.modules.roleInfos.commons.IRoleSubPanel;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import nslm2.modules.scenes.commons.UIUnit3D;
   import nslm2.modules.cultivates.horse.comps.HorseTitleName;
   import nslm2.modules.cultivates.horse.HorseInfoPanel;
   import morn.core.components.List;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.cultivates.horse.HorseConsts;
   import flash.geom.Point;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import morn.core.components.View;
   import nslm2.modules.cultivates.skillChangePanels.SkillChangeModel;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.cultivates.horse.HorseService;
   import proto.PlayerChangeSaddleHorseReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSaddlehorseVo;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParamArr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.cultivates.horse.utils.HorseUtil;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.common.compsEffects.ListCellTweenEffect;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import proto.PlayerChangeSaddleHorseRes;
   import nslm2.modules.foundations.AlertUtil;
   import proto.PlayerActivateSaddleHorseReq;
   import proto.PlayerActivateSaddleHorseRes;
   import com.mz.core.utils.DisplayUtils;
   import proto.ProtocolStatusRes;
   import morn.customs.tests.TestTimerCount;
   import com.greensock.TweenLite;
   import morn.core.handlers.Handler;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.common.compsEffects.NumberBreathCtrl;
   import nslm2.common.ui.components.comps2d.pageBar.PageBarS3;
   import nslm2.modules.cultivates.skillChangePanels.SkillChangeCtrl;
   
   public class HorseChangePanel extends HorseChangePanelUI implements IRoleSubPanel, IViewStackPage, IObserver
   {
       
      
      private var panel3D:UIPanel3D;
      
      private var avatar:UIUnit3D;
      
      private var selectedStcHorseId:int;
      
      private var lvlUpEff:BmcSpriteSheet;
      
      private var btnEff:BmcSpriteSheet;
      
      public function HorseChangePanel()
      {
         avatar = new UIUnit3D();
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         BmcSpriteSheet.preload(new <int>[30300001,30300002,30300003]);
         this.parts.push(new NumberBreathCtrl(2,0).addHandler(new Handler(filterStrengthChanged)));
         this.list_horse.array = HorseService.ins.allHorseList;
         (this.list_selectHorseUI.pageBarUI as PageBarS3).bindList(this.list_horse);
         this.list_horse.selectedIndex = 0;
         this.list_horse.changeHandler = list_changeHandler;
         this.parts.push(new SkillChangeCtrl(this.activateNeed.btn_changeSkill));
         switchEventListeners(true);
      }
      
      public function get titleName() : HorseTitleName
      {
         return this.titleNameUI as HorseTitleName;
      }
      
      public function get infoPanel() : HorseInfoPanel
      {
         return this.infoPnaelUI as HorseInfoPanel;
      }
      
      public function get list_horse() : List
      {
         return this.list_selectHorseUI.list_horse;
      }
      
      public function viewStackIn() : void
      {
         ObserverMgr.ins.regObserver(this);
         if(avatar)
         {
            this.avatar.pos2d = HorseConsts.AVATAR3D_POS;
         }
         this.visible = true;
         switchEventListeners(true);
         this.show();
         this.fadeIn();
      }
      
      public function viewStackOut() : void
      {
         ObserverMgr.ins.unregObserver(this);
         if(avatar)
         {
            this.avatar.pos2d = HorseConsts.AVATAR3D_POS.add(new Point(800,0));
         }
         this.visible = false;
         switchEventListeners(false);
      }
      
      public function set modelRef(param1:RoleInfoModel) : void
      {
      }
      
      public function get subBarRef() : View
      {
         return null;
      }
      
      public function get activateNeed() : HorseActiveNeed
      {
         return this.render_activateNeed as HorseActiveNeed;
      }
      
      public function set layer3dRef(param1:UIPanel3D) : void
      {
         panel3D = param1;
         if(panel3D)
         {
            this.panel3D.addChild3D(avatar);
         }
      }
      
      private function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            this.render_activateNeed.renderPre.img_icon.addEventListener("click",needPreClick);
            this.render_activateNeed.renderMaster.img_icon.addEventListener("click",needMasterClick);
            this.render_activateNeed.renderCost.img_icon.addEventListener("click",needItemClick);
         }
         else
         {
            this.render_activateNeed.renderPre.img_icon.removeEventListener("click",needPreClick);
            this.render_activateNeed.renderMaster.img_icon.removeEventListener("click",needMasterClick);
            this.render_activateNeed.renderCost.img_icon.removeEventListener("click",needItemClick);
         }
      }
      
      private function filterStrengthChanged(param1:Number) : void
      {
         ObserverMgr.ins.sendNotice("heroTextFilterChange",param1);
      }
      
      public function show(param1:Boolean = false) : void
      {
         this.showInfo(this.list_horse.selectedItem as int);
         this.changeSkillRedPoint.visible = SkillChangeModel.ins.newAuraVec.length != 0;
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.render_activateNeed.btn0 !== _loc3_)
         {
            if(this.render_activateNeed.btn_changeSkill === _loc3_)
            {
               this.changeSkillRedPoint.visible = false;
            }
         }
         else
         {
            btnUseHandler();
         }
      }
      
      private function btnUseHandler() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         switch(int(HorseService.ins.getState(this.selectedStcHorseId)) - 1)
         {
            case 0:
               _loc2_ = new PlayerChangeSaddleHorseReq();
               _loc2_.id = 0;
               ServerEngine.ins.send(7073,_loc2_,onServerCpl_horseGetOff);
               break;
            case 1:
               _loc1_ = new PlayerChangeSaddleHorseReq();
               _loc1_.id = selectedStcHorseId;
               ServerEngine.ins.send(7073,_loc1_,onServerCpl_horseGetOn);
               break;
            case 2:
               this.onActivate();
               break;
            case 3:
               needMasterClick(null);
               break;
            case 4:
               needItemClick(null);
               break;
            case 5:
               needPreClick(null);
         }
      }
      
      private function needPreClick(param1:MouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc5_:Boolean = false;
         var _loc4_:StcSaddlehorseVo = StcMgr.ins.getSaddlehorseVo(selectedStcHorseId);
         if(_loc4_.prev)
         {
            _loc6_ = StcMgr.ins.getSaddlehorseVo(_loc4_.prev);
            _loc5_ = HorseService.ins.isActived(_loc4_.prev);
            if(_loc5_ == false)
            {
               _loc3_ = new ResGetPointModuleParam().initBySpecial(UrlLib.horseUrl(_loc4_.prev),_loc6_.quality,LocaleMgr.ins.getStr(_loc6_.name),0,1,renderPre_click);
               _loc2_ = new ResGetPointModuleParamArr(LocaleMgr.ins.getStr(999000052),[_loc3_]);
               ModuleMgr.ins.showModule(12101,_loc2_,ModuleMgr.ins.popLayer.curModuleId);
            }
         }
      }
      
      private function needMasterClick(param1:MouseEvent) : void
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc3_:StcSaddlehorseVo = StcMgr.ins.getSaddlehorseVo(selectedStcHorseId);
         if(HorseUtil.getRank(HorseService.ins.masterLevel) < _loc3_.rank)
         {
            _loc4_ = new ResGetPointModuleParam().initBySpecial(UrlLib.horseUrl(0),5,LocaleMgr.ins.getStr(30300010),HorseUtil.getRank(HorseService.ins.masterLevel),_loc3_.rank,renderMaster_click);
            _loc2_ = new ResGetPointModuleParamArr(LocaleMgr.ins.getStr(999000053),[_loc4_]);
            ModuleMgr.ins.showModule(12101,_loc2_,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      private function needItemClick(param1:MouseEvent) : void
      {
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc3_:StcSaddlehorseVo = StcMgr.ins.getSaddlehorseVo(selectedStcHorseId);
         var _loc4_:WealthVo = WealthUtil.parseCostStr(_loc3_.item);
         if(_loc4_.count > PlayerModel.ins.getCountByWealthVo(_loc4_))
         {
            _loc5_ = new ResGetPointModuleParam().initByWealth(_loc4_.kind,_loc4_.sid,_loc4_.count);
            _loc2_ = _loc5_;
            ModuleMgr.ins.showModule(12101,_loc2_,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      private function renderPre_click() : void
      {
         var _loc1_:StcSaddlehorseVo = StcMgr.ins.getSaddlehorseVo(selectedStcHorseId);
         ObserverMgr.ins.sendNotice("HORSE_CHANGE_SELECT",_loc1_.prev);
      }
      
      private function renderMaster_click() : void
      {
         ObserverMgr.ins.sendNotice("horse_change_master_page");
      }
      
      private function refreshList(param1:Boolean) : void
      {
         if(param1)
         {
            new ListCellTweenEffect(this.list_horse,HorseService.ins.allHorseList).set_duration(0.3).exec();
         }
         else
         {
            this.list_horse.array = HorseService.ins.allHorseList;
         }
      }
      
      private function list_changeHandler() : void
      {
         this.showInfo(this.list_horse.selectedItem as int);
      }
      
      private function showInfo(param1:int, param2:Boolean = false) : void
      {
         this.titleName.stcHorseId = param1;
         var _loc4_:StcSaddlehorseVo = StcMgr.ins.getSaddlehorseVo(param1);
         if(selectedStcHorseId != param1)
         {
            this.avatar.initHorseModel(int(_loc4_.model));
            this.avatar.pos2d = HorseConsts.AVATAR3D_POS;
            this.avatar.rotation = -145;
            this.selectedStcHorseId = param1;
         }
         this.infoPanel.refresh(param1,param2);
         this.activateNeed.show(param1);
         this.activateNeed.renderCost.wealthVo = WealthUtil.parseCostStr(_loc4_.item);
         var _loc3_:int = HorseService.ins.getState(param1);
         switch(int(_loc3_) - 1)
         {
            case 0:
               switchBtnEffect(false);
               this.render_activateNeed.btn0.label = LocaleMgr.ins.getStr(30300011);
               this.render_activateNeed.btn0.toolTip = LocaleMgr.ins.getStr(30300006);
               this.txt_state.color = 16046112;
               this.txt_state.text = LocaleMgr.ins.getStr(999000054);
               break;
            case 1:
               switchBtnEffect(false);
               this.render_activateNeed.btn0.label = LocaleMgr.ins.getStr(30300012);
               this.render_activateNeed.btn0.toolTip = LocaleMgr.ins.getStr(30300006);
               this.txt_state.color = 4827135;
               this.txt_state.text = LocaleMgr.ins.getStr(999000055);
               break;
            case 2:
               switchBtnEffect(true);
               this.render_activateNeed.btn0.label = LocaleMgr.ins.getStr(30300013);
               this.txt_state.color = 458496;
               this.txt_state.text = LocaleMgr.ins.getStr(999000056);
         }
      }
      
      override public function fadeView_fadeInCpl() : void
      {
         super.fadeView_fadeInCpl();
      }
      
      private function onServerCpl_horseGetOff(param1:PlayerChangeSaddleHorseRes) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(30300027));
         HorseService.ins.curHorseId = 0;
         refreshList(true);
         this.list_horse.selectedItem = selectedStcHorseId;
         this.showInfo(selectedStcHorseId);
         PlayerModel.ins.playerInfo.horse = 0;
         ObserverMgr.ins.sendNotice("HORSE_CHANGE",0);
      }
      
      private function onServerCpl_horseGetOn(param1:PlayerChangeSaddleHorseRes) : void
      {
         if(this.isDisposed)
         {
            return;
         }
         AlertUtil.float(LocaleMgr.ins.getStr(30300026));
         this.avatar.horseAvatar.action = "ride_3";
         HorseService.ins.curHorseId = this.selectedStcHorseId;
         refreshList(true);
         this.list_horse.selectedItem = this.selectedStcHorseId;
         this.showInfo(selectedStcHorseId);
         PlayerModel.ins.playerInfo.horse = selectedStcHorseId;
         ObserverMgr.ins.sendNotice("HORSE_CHANGE",selectedStcHorseId);
      }
      
      private function onActivate(... rest) : void
      {
         this.mouseEvent = false;
         var _loc2_:PlayerActivateSaddleHorseReq = new PlayerActivateSaddleHorseReq();
         _loc2_.id = selectedStcHorseId;
         ServerEngine.ins.send(7070,_loc2_,onServerCpl_horseActivate,onServerCpl_horseActivateErr);
      }
      
      private function onServerCpl_horseActivate(param1:PlayerActivateSaddleHorseRes) : void
      {
         playUpEff();
      }
      
      private function playUpEffCpl() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         this.mouseEvent = true;
         this.avatar.horseAvatar.action = "ride_3";
         AlertUtil.float(LocaleMgr.ins.getStr(999000058),DisplayUtils.globarCenter(this).add(HorseConsts.floatOffsetPoi),-1,null,null,1);
         HorseService.ins.addActivateHorse(selectedStcHorseId);
         this.changeSkillRedPoint.visible = true;
         refreshList(true);
         this.list_horse.selectedItem = selectedStcHorseId;
         this.showInfo(selectedStcHorseId,true);
      }
      
      private function onServerCpl_horseActivateErr(param1:ProtocolStatusRes) : void
      {
         this.mouseEvent = true;
         ServerEngine.ins.doDefaultErr(param1);
      }
      
      private function playUpEff(param1:int = 1) : void
      {
         var _loc2_:Point = new Point(this.render_activateNeed.btn0.x + this.render_activateNeed.x + this.render_activateNeed.btn0.width / 2,this.render_activateNeed.btn0.y + this.render_activateNeed.y + this.render_activateNeed.btn0.height / 2);
         switch(int(param1) - 1)
         {
            case 0:
               TestTimerCount.ins.start();
               lvlUpEff = new BmcSpriteSheet();
               lvlUpEff.setAnchor(0.5,0.5);
               lvlUpEff.init(30300001);
               addChild(lvlUpEff);
               lvlUpEff.x = _loc2_.x;
               lvlUpEff.y = _loc2_.y;
               TweenLite.to(lvlUpEff,0.3,{
                  "onComplete":this.playUpEff,
                  "onCompleteParams":[2]
               });
               break;
            case 1:
               TestTimerCount.ins.add();
               lvlUpEff = new BmcSpriteSheet();
               lvlUpEff.setAnchor(0.5,0.5);
               lvlUpEff.set_endHandler(new Handler(playUpEff,[3]));
               lvlUpEff.init(30300002);
               addChild(lvlUpEff);
               lvlUpEff.x = _loc2_.x;
               lvlUpEff.y = _loc2_.y - 50;
               TweenLite.to(lvlUpEff,0.3,{"y":_loc2_.y - 200});
               break;
            case 2:
               TestTimerCount.ins.add();
               lvlUpEff = new BmcSpriteSheet();
               lvlUpEff.setAnchor(0.5,0.5);
               lvlUpEff.set_endHandler(playUpEffCpl);
               lvlUpEff.init(30300003);
               addChild(lvlUpEff);
               lvlUpEff.x = _loc2_.x;
               lvlUpEff.y = _loc2_.y - 200;
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["HORSE_CHANGE_SELECT","MSG_HORSE_MASTER_MODULE_CLOSE","notice_refresh_module_need_resource_data"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc5_:* = param1;
         if("HORSE_CHANGE_SELECT" !== _loc5_)
         {
            if("MSG_HORSE_MASTER_MODULE_CLOSE" !== _loc5_)
            {
               if("notice_refresh_module_need_resource_data" === _loc5_)
               {
                  _loc3_ = StcMgr.ins.getSaddlehorseVo(selectedStcHorseId);
                  this.activateNeed.renderCost.wealthVo = WealthUtil.parseCostStr(_loc3_.item);
               }
            }
            else
            {
               this.refreshList(false);
               this.showInfo(this.selectedStcHorseId);
            }
         }
         else
         {
            _loc4_ = param2;
            this.list_horse.selectedItem = _loc4_;
            this.showInfo(_loc4_);
         }
      }
      
      private function switchBtnEffect(param1:Boolean) : void
      {
         if(param1)
         {
            if(btnEff == null)
            {
               btnEff = new BmcSpriteSheet();
               btnEff.x = -9;
               btnEff.y = -10;
               btnEff.init(115002,1,"all",true);
               this.render_activateNeed.btn0.addChild(btnEff);
            }
         }
         else if(btnEff)
         {
            btnEff.dispose();
            btnEff = null;
         }
      }
      
      override public function dispose() : void
      {
         switchBtnEffect(false);
         ObserverMgr.ins.sendNotice("MSG_HORSE_CHANGE_MODULE_CLOSE");
         switchEventListeners(false);
         super.dispose();
      }
   }
}
