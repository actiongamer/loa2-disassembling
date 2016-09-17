package nslm2.modules.roleInfos.tupos
{
   import game.ui.roleInfos.tupos.RoleTupoPanelUI;
   import nslm2.modules.roleInfos.commons.IRoleSubPanel;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import nslm2.common.ctrls.TSMDict;
   import nslm2.modules.scenes.commons.UIUnit3D;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import flash.display.Sprite;
   import flash.geom.Point;
   import nslm2.modules.footstones.tooltipsModules.TooltipTianfuVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.newerAlertModules.NewerAlertModel;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import morn.core.components.View;
   import flash.events.Event;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.stcMgrs.vos.StcTupoVo;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import proto.HeroTuPoItemEquipReq;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ProtocolStatusRes;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.utils.DisplayUtils;
   import com.greensock.TweenLite;
   import nslm2.modules.cultivates.roleTeam.ctrl.CheckRoleTeamRedPointCtrl;
   import nslm2.mgrs.SoundMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.roleInfos.vo.RoleTupoNeedVo;
   import nslm2.common.vo.WealthVo;
   import nslm2.utils.WealthUtil;
   import com.mz.core.logging.Log;
   import com.mz.core.utils.ListUtil;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import proto.HeroTuPoReq;
   import com.mz.core.event.MzEvent;
   import morn.customs.components.PlayerTitleRender;
   import nslm2.modules.roleInfos.RoleInfoConsts;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   import com.mz.core.mgrs.resMgrs.GetResEffect3DTask;
   import nslm2.utils.Effect3DUtils;
   import nslm2.common.ctrls.TSM;
   import com.mz.core.configs.ClientConfig;
   
   public class RoleTupoPanel extends RoleTupoPanelUI implements IRoleSubPanel, IViewStackPage, IObserver
   {
      
      public static const TUPO:String = "tupo";
       
      
      public var model:RoleInfoModel;
      
      private var _tsms:TSMDict;
      
      private var _avatar:UIUnit3D;
      
      private var _panel3D:UIPanel3D;
      
      private var _tianfuPanel:nslm2.modules.roleInfos.tupos.RoleTianfuPanel;
      
      private var _conver:Sprite;
      
      private var _canTupoEffect:BmcSpriteSheet;
      
      private var _tupoEffect:BmcSpriteSheet;
      
      private var currRenderVo:nslm2.modules.roleInfos.tupos.RoleTupoNeedRender;
      
      private var currIndex:int;
      
      private var showAlert:Boolean = true;
      
      private var breathArr:Array;
      
      private var status:int;
      
      private const CAN_TUPO:int = 1;
      
      private const CAN_EQUIP:int = 0;
      
      public function RoleTupoPanel()
      {
         _tsms = new TSMDict();
         breathArr = [];
         super();
         playerNowRender.isShowTitleName = true;
         playerNextRender.isShowTitleName = true;
         BmcSpriteSheet.preload(new <int>[1117]);
         this.subBar.txt_desc2.mouseEvent = false;
         this._avatar = new UIUnit3D();
         this._avatar.x = 1600;
         this._avatar.y = RoleInfoConsts.AVATAR_Y + 65;
         this._avatar.rotationY = 0;
         this._avatar.scaleAll = 0.7;
         BmcSpriteSheet.preload(new <int>[1112,1111]);
         MornExpandUtil.addHandlerForBtnAll(subBar,btn_handler);
         this.parts.push(new FloatUpDownEffCtrl().config(0.4).init(this.list_up,this.list_up.y,2,2));
         new GetResEffect3DTask(Effect3DUtils.getUrlBySid(12103)).exec();
         this.btn_tianfu.addEventListener("mouseDown",btn_skill_mouseDown);
         this.btn_tianfu.addEventListener("click",btn_skill_handler);
         this.playerNext.visible = false;
         this.playerNextRender.showLevel(false);
         this.playerNowRender.showLevel(false);
         DisplayUtils.addChildFromGlobal(this.subBar.btn_tupo,this.subBar.render_needItem);
         _tsms.put(this.subBar.box_heroCost,new TSM(this.subBar.box_heroCost,0.3).addState(2,{}).addState(1,{
            "bottom":-100,
            "alpha":0
         }));
         _tsms.put(this.subBar.box_tupoBtns,new TSM(this.subBar.box_tupoBtns,0.4).addState(2,{})).addState(1,{"x":216.5});
         _conver = new Sprite();
         _conver.graphics.beginFill(0,0);
         _conver.graphics.drawRect(0,0,ClientConfig.SCENE_FIXED_W,ClientConfig.SCENE_FIXED_H);
         _conver.graphics.endFill();
         _conver.x = this.width - ClientConfig.SCENE_FIXED_W >> 1;
         _conver.y = this.height - ClientConfig.SCENE_FIXED_H >> 1;
      }
      
      public function viewStackIn() : void
      {
         this._avatar.pos2d = new Point(300,this._avatar.y);
         if(_tianfuPanel)
         {
            _tianfuPanel.show(new TooltipTianfuVo(model.heroInfo.baseInfo.baseId));
            _tianfuPanel.panelFadeIn();
         }
         ObserverMgr.ins.regObserver(this);
         NewerAlertModel.ins.canShowNewerTupoAlert = false;
         this.visible = true;
         this.show();
         this.fadeIn();
      }
      
      public function viewStackOut() : void
      {
         if(_tianfuPanel)
         {
            this.disposeTianfuPanel();
         }
         this._avatar.pos2d = new Point(1600,this._avatar.y);
         this.visible = false;
         NewerAlertModel.ins.canShowNewerTupoAlert = true;
         ObserverMgr.ins.unregObserver(this);
      }
      
      override public function fadeView_fadeInCpl() : void
      {
         super.fadeView_fadeInCpl();
         NGUtil.checkModuleShow(30100,ModuleMgr.ins.getModule(30100),true);
      }
      
      public function set modelRef(param1:RoleInfoModel) : void
      {
         model = param1;
      }
      
      public function get subBarRef() : View
      {
         return subBar;
      }
      
      public function set layer3dRef(param1:UIPanel3D) : void
      {
         _panel3D = param1;
         this._panel3D.addChild3D(_avatar);
      }
      
      private function btn_skill_mouseDown(param1:Event) : void
      {
         param1.stopPropagation();
      }
      
      private function btn_skill_handler(param1:Event) : void
      {
         param1.stopPropagation();
         if(_tianfuPanel)
         {
            disposeTianfuPanel();
         }
         else
         {
            _tianfuPanel = new nslm2.modules.roleInfos.tupos.RoleTianfuPanel();
            _tianfuPanel.x = 411;
            _tianfuPanel.y = 73;
            _tianfuPanel.show(new TooltipTianfuVo(model.heroInfo.baseInfo.baseId));
            _tianfuPanel.addEventListener("close",disposeTianfuPanel);
            _tianfuPanel.panelFadeIn();
            parent.parent.addChild(_tianfuPanel);
         }
      }
      
      private function disposeTianfuPanel(... rest) : void
      {
         if(_tianfuPanel)
         {
            _tianfuPanel.removeEventListener("close",disposeTianfuPanel);
            _tianfuPanel.panelFadeOutAndDispose();
            _tianfuPanel = null;
         }
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc5_:* = null;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc6_:* = param1;
         if(subBar.btn_tupo === _loc6_)
         {
            if(this.status == 1)
            {
               ObserverMgr.ins.sendNotice("msg_role_info_show_change_page_turning",false);
               _loc5_ = StcMgr.ins.getNpcVo(this.model.heroInfo.baseInfo.baseId);
               _loc4_ = _loc5_.tupo;
               _loc3_ = RoleTupoUtil.getStcTupoVo(_loc5_.node,_loc4_);
               RoleTupoUtil.doTupo(_loc3_,doTupo);
            }
            else if(this.status == CAN_EQUIP)
            {
               this.subBar.render_needItem.visible = false;
               currIndex = 0;
               showAlert = true;
               breathArr = [];
               send_equip_req(currIndex);
            }
         }
      }
      
      private function send_equip_req(param1:int) : void
      {
         var _loc2_:* = null;
         currRenderVo = this.subBar.list_need.cells[param1] as nslm2.modules.roleInfos.tupos.RoleTupoNeedRender;
         if(RoleTupoUtil.getGodhoodEquipState(HeroInfoUtil.heroBaseInfoToPanelBaseInfo(RoleInfoModel.ins.heroInfo.baseInfo),currRenderVo.vo.sid) == 3)
         {
            showAlert = false;
            _loc2_ = new HeroTuPoItemEquipReq();
            _loc2_.hero = RoleInfoModel.ins.heroInfo.baseInfo.id;
            _loc2_.item = BagModel.ins.getIdBySid(currRenderVo.vo.sid);
            ServerEngine.ins.send(5015,_loc2_,server_onEquipCpl);
         }
         else
         {
            if(RoleTupoUtil.getGodhoodEquipState(HeroInfoUtil.heroBaseInfoToPanelBaseInfo(RoleInfoModel.ins.heroInfo.baseInfo),currRenderVo.vo.sid) != 1)
            {
               breathArr.push(currRenderVo);
            }
            nextRenderReq();
         }
      }
      
      private function server_onEquipCpl(param1:ProtocolStatusRes) : void
      {
         var _loc2_:Array = NpcPropVo.filterZeroProp(NpcPropVo.parseItemVo(currRenderVo.vo.stcItemVo));
         AlertUtil.showPropArrChangeTip(_loc2_,null,null,DisplayUtils.globarCenter(this).add(new Point(0,-100)));
         ObserverMgr.ins.sendNotice("msg_role_godhood_equip_cpl",currRenderVo.vo);
         TweenLite.delayedCall(0.3,nextRenderReq);
         CheckRoleTeamRedPointCtrl.ins.checkAndSwitchHeroShowRedPoi();
         SoundMgr.ins.playTexiaoSound("role_tupoGodhood");
      }
      
      private function nextRenderReq() : void
      {
         currIndex = Number(currIndex) + 1;
         if(currIndex < this.subBar.list_need.cells.length)
         {
            send_equip_req(currIndex);
         }
         else if(showAlert)
         {
            AlertUtil.alert(LocaleMgr.ins.getStr(30100316),handlerYes);
         }
      }
      
      private function handlerYes() : void
      {
         if(breathArr.length > 0)
         {
            var _loc3_:int = 0;
            var _loc2_:* = breathArr;
            for each(var _loc1_ in breathArr)
            {
               _loc1_.addBreath();
            }
         }
      }
      
      private function breath_cb(param1:Array) : void
      {
         this.subBar.render_hero.filters = param1;
      }
      
      public function show(param1:Boolean = false) : void
      {
         var _loc9_:* = null;
         var _loc2_:* = null;
         var _loc7_:* = null;
         var _loc6_:int = 0;
         if(param1)
         {
            return;
         }
         var _loc12_:StcNpcVo = StcMgr.ins.getNpcVo(this.model.heroInfo.baseInfo.baseId);
         var _loc11_:int = _loc12_.tupo;
         var _loc5_:StcNpcVo = RoleTupoUtil.getStcNpcVoByNodeAndTupoLv(_loc12_.node,_loc11_ + 1);
         var _loc10_:StcTupoVo = RoleTupoUtil.getStcTupoVo(_loc12_.node,_loc11_);
         var _loc4_:StcTupoVo = RoleTupoUtil.getStcTupoVo(_loc12_.node,_loc11_ + 1);
         var _loc8_:Array = RoleTupoUtil.getHeroPropVoArr(_loc12_);
         _loc8_ = RoleTupoUtil.addNextPropVoArr(_loc8_,_loc5_);
         this.playerNowRender.dataSource = model.heroInfo;
         if(_loc10_)
         {
            this.txt_tupoNow.text = LocaleMgr.ins.getStr(30100006) + "+" + _loc10_.tupo_level;
         }
         else
         {
            this.txt_tupoNow.text = LocaleMgr.ins.getStr(30100006) + "+0";
         }
         var _loc3_:Array = NpcPropVo.calNpcBaseProp(model.heroInfo.baseInfo.baseId,model.heroInfo.baseInfo.level);
         NpcPropVo.unshowAllPropColor(_loc3_);
         this.list_propBase.dataSource = _loc3_.sortOn("propId",16);
         if(_loc5_ != null && _loc4_ != null)
         {
            this.playerNextRender.dataSource = _loc5_;
            this.subBar.visible = true;
            this.subBar.txt_unlock.text = LocaleMgr.ins.getStr(30100014) + LocaleMgr.ins.getStr(int(_loc4_.name)) + _loc4_.tupo_level;
            this.subBar.txt_desc2.text = "(" + HeroInfoUtil.getTupoDesc(_loc4_.attr) + ")";
            _loc9_ = RoleTupoUtil.getTupoNeedItem(_loc4_);
            this.subBar.list_need.repeatX = _loc9_.length;
            this.subBar.list_need.dataSource = RoleTupoNeedVo.voArrFromWealthVoArr(_loc9_,HeroInfoUtil.heroBaseInfoToPanelBaseInfo(RoleInfoModel.ins.heroInfo.baseInfo));
            this.subBar.list_need.x = this.subBar.box_need.width - this.subBar.list_need.width >> 1;
            _loc2_ = RoleTupoUtil.getTupoNeedHero(_loc4_);
            if(_loc2_.count != 0)
            {
               this.subBar.render_hero.dataSource = _loc2_;
               _tsms.toState(2);
            }
            else
            {
               _tsms.toState(1);
            }
            this.subBar.render_needItem.dataSource = WealthUtil.costStrToArrOnlyGold(_loc10_.cost_res);
            _loc7_ = NpcPropVo.calNpcBaseProp(_loc5_.id,model.heroInfo.baseInfo.level);
            this.box_next.visible = true;
            this.list_propNext.dataSource = _loc7_.sortOn("propId",16);
            this.txt_tupoNext.text = LocaleMgr.ins.getStr(30100006) + "+" + _loc4_.tupo_level;
            this.list_up.visible = true;
            _loc6_ = RoleTupoUtil.getUnlockSkillId(_loc5_.id);
            if(_loc6_ != 0)
            {
               this.render_unlockSkill.dataSource = _loc6_;
               this.render_unlockSkill.visible = true;
               this.subBar.img_unlockbg.y = -80;
               this.subBar.txt_unlock.y = -73;
               this.subBar.txt_desc2.y = -54;
            }
            else
            {
               this.render_unlockSkill.visible = false;
               this.subBar.img_unlockbg.y = -125;
               this.subBar.txt_unlock.y = -118;
               this.subBar.txt_desc2.y = -99;
            }
         }
         else
         {
            this.box_next.visible = false;
            this.render_unlockSkill.visible = false;
            this.subBar.visible = false;
            this.subBar.txt_desc2.text = "";
            this.playerNext.visible = false;
            this._avatar.visible = false;
            if(_loc5_ != null || _loc4_ != null)
            {
               Log.fatal(this,"英雄突破下一级数据错误",_loc12_.node,_loc11_);
            }
            this.list_up.visible = false;
         }
         if(_loc11_ == 0 && _loc4_ == null)
         {
            this.btn_tianfu.visible = false;
         }
         else
         {
            this.btn_tianfu.visible = true;
            this.subBar.txt_unlock.toolTip = new TooltipTianfuVo(model.heroInfo.baseInfo.baseId);
         }
         this.list_propNext.commitMeasure();
         this.list_up.x = this.box_next.x + ListUtil.getLongestTextLength(this.list_propNext,"txt_value") + 55;
         showCanTupoEffect();
      }
      
      private function showCanTupoEffect() : void
      {
         var _loc1_:Boolean = false;
         if(RoleTupoUtil.canTupo(this.model.heroInfo,false))
         {
            if(_canTupoEffect == null)
            {
               _canTupoEffect = new BmcSpriteSheet();
               _canTupoEffect.x = -9;
               _canTupoEffect.y = -10;
               _canTupoEffect.init(115002,1,"all",true);
               this.subBar.btn_tupo.addChild(_canTupoEffect);
               this.subBar.btn_tupo.label = LocaleMgr.ins.getStr(999000511);
               this.status = 1;
               this.subBar.render_needItem.visible = true;
            }
         }
         else
         {
            _loc1_ = true;
            var _loc4_:int = 0;
            var _loc3_:* = this.subBar.list_need.cells;
            for each(var _loc2_ in this.subBar.list_need.cells)
            {
               if(_loc2_.status != 1)
               {
                  _loc1_ = false;
               }
            }
            if(_loc1_)
            {
               this.subBar.btn_tupo.label = LocaleMgr.ins.getStr(999000511);
               this.status = 1;
               this.subBar.render_needItem.visible = true;
            }
            else
            {
               this.subBar.btn_tupo.label = LocaleMgr.ins.getStr(999000512);
               this.status = CAN_EQUIP;
               this.subBar.render_needItem.visible = false;
            }
            if(_canTupoEffect)
            {
               _canTupoEffect.dispose();
               _canTupoEffect = null;
            }
         }
      }
      
      private function doTupo(param1:HeroTuPoReq) : void
      {
         ServerEngine.ins.send(5002,param1,onServer_Tupo,onServerErr_Tupo);
      }
      
      private function onServer_Tupo(param1:ProtocolStatusRes) : void
      {
         this.addChild(_conver);
         _tupoEffect = new BmcSpriteSheet();
         _tupoEffect.x = 209;
         _tupoEffect.y = 0;
         _tupoEffect.scaleAll = 1;
         _tupoEffect.addEndHandler(eff2d_cpl).init(1117);
         addChild(_tupoEffect);
         SoundMgr.ins.playTexiaoSound("role_tupoSuccess");
         CheckRoleTeamRedPointCtrl.ins.checkAll();
         NewerAlertModel.ins.checkCanTupo();
      }
      
      private function showEffect2() : void
      {
         DisplayUtils.removeSelf(_tupoEffect);
         var _loc1_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc1_.x = 344;
         _loc1_.y = -69;
         _loc1_.scaleAll = 1.6;
         _loc1_.addEndHandler(eff2d_cpl).init(1112);
         this.addChild(_loc1_);
      }
      
      private function onServerErr_Tupo(param1:ProtocolStatusRes = null) : void
      {
         ObserverMgr.ins.sendNotice("msg_role_info_show_change_page_turning",true);
         ServerEngine.ins.doDefaultErr(param1);
      }
      
      private function eff2d_cpl() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         ObserverMgr.ins.sendNotice("msg_role_info_show_change_page_turning",true);
         var _loc1_:RoleTupoSuccessInitVo = new RoleTupoSuccessInitVo(model.heroInfo.baseInfo.baseId,"png.uiRoleInfo.tupo.img_tupoSuccessTitle",new RoleTupoSuccessPanel(model.heroInfo.baseInfo.baseId,model.heroInfo.baseInfo.level),500,246);
         ModuleMgr.ins.showModule(30103,_loc1_,ModuleMgr.ins.popLayer.curModuleId);
         this.dispatchEvent(new MzEvent("tupo",model.heroInfo.baseInfo,true));
         DisplayUtils.removeSelf(_conver);
         show();
      }
      
      private function get playerNowRender() : PlayerTitleRender
      {
         return this.playerNow as PlayerTitleRender;
      }
      
      private function get playerNextRender() : PlayerTitleRender
      {
         return this.playerNext as PlayerTitleRender;
      }
      
      public function getFocusNotices() : Array
      {
         return ["notice_refresh_module_need_resource_data","msg_role_godhood_equip_cpl","tupoModuleClose"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("msg_role_godhood_equip_cpl" !== _loc3_)
         {
            if("notice_refresh_module_need_resource_data" !== _loc3_)
            {
               if("tupoModuleClose" === _loc3_)
               {
                  NGUtil.checkModuleShow(30100,ModuleMgr.ins.getModule(30100),true);
               }
            }
            else
            {
               show();
               NGUtil.checkModuleShow(30100,ModuleMgr.ins.getModule(30100));
            }
         }
         else
         {
            showCanTupoEffect();
         }
      }
      
      override public function dispose() : void
      {
         NewerAlertModel.ins.canShowNewerTupoAlert = true;
         ObserverMgr.ins.unregObserver(this);
         ObserverMgr.ins.sendNotice("heroEquippedChanged");
         super.dispose();
      }
   }
}
