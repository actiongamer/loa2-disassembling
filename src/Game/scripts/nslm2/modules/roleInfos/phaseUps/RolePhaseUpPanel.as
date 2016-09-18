package nslm2.modules.roleInfos.phaseUps
{
   import game.ui.roleInfos.phaseUps.RolePhaseUpPanelUI;
   import nslm2.modules.roleInfos.commons.IRoleSubPanel;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.roleInfos.phaseUps.talents.RolePhaseUpPanelTalentMediator;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import nslm2.common.ui.components.comps2d.HorseLampH;
   import morn.core.components.View;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.common.ui.components.comps2d.BmcS1;
   import com.greensock.TweenLite;
   import game.ui.roleInfos.phaseUps.HorseShowRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.events.Event;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import com.mz.core.configs.EnvConfig;
   import nslm2.mgrs.SoundMgr;
   import proto.HeroShengjieRes;
   import com.mz.core.utils.DisplayUtils;
   import com.mz.core.utils.FilterUtil;
   import morn.core.components.Image;
   import nslm2.common.uiEffects.IconFlyEff;
   import proto.ProtocolStatusRes;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import proto.HeroShengjieReq;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import nslm2.modules.roleInfos.tupos.RoleTupoSuccessInitVo;
   import morn.customs.components.PlayerTitleRender;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcHeroShengjieVo;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.utils.Uint64Util;
   import nslm2.common.vo.WealthVo;
   import nslm2.utils.LabelUtils;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.WealthUtil;
   import morn.core.utils.StringUtils;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import nslm2.common.vo.SkillRenderVo;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import com.mz.core.utils.ListUtil;
   import game.ui.roleInfos.NpcPropVo;
   import flash.display.Sprite;
   import nslm2.common.model.HeroModel;
   import nslm2.modules.roleInfos.phaseUps.talents.PhaseUpPanelTalentRender;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   
   public class RolePhaseUpPanel extends RolePhaseUpPanelUI implements IRoleSubPanel, IViewStackPage, IObserver
   {
       
      
      private var talentMediator:RolePhaseUpPanelTalentMediator;
      
      public var model:RoleInfoModel;
      
      private var isAutoPhaseUp:Boolean;
      
      private var _horseLamp:HorseLampH;
      
      private var expCtrl:nslm2.modules.roleInfos.phaseUps.ExpBoxCtrl;
      
      private var ballEffect:BmcSpriteSheet;
      
      private var waterEffect:BmcSpriteSheet;
      
      private var upgradeEffect:BmcS1;
      
      private var _tujianPanel:nslm2.modules.roleInfos.phaseUps.RoleShenjieTujianPanel;
      
      private var _horseLampBaseId:uint;
      
      private var _horseLampSjLevel:uint;
      
      private var nextMask:Sprite;
      
      private var nextUpMask:Sprite;
      
      private var _horseShowArr:Array;
      
      public function RolePhaseUpPanel()
      {
         super();
         this.playerTitleRender.isShowTitleName = true;
         this.list_talent.itemRender = PhaseUpPanelTalentRender;
         this.expCtrl = new nslm2.modules.roleInfos.phaseUps.ExpBoxCtrl(this.expBox);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         BmcSpriteSheet.preload(new <int>[1151,1150]);
         BmcS1.preload(1116);
         ballEffect = new BmcSpriteSheet();
         ballEffect.y = 34;
         ballEffect.x = 0;
         ballEffect.init(1150,1,"all",true);
         ballEffect.mask = expBox.img_mask;
         waterEffect = new BmcSpriteSheet();
         waterEffect.init(1151,1,"all",true);
         waterEffect.y = 143;
         waterEffect.x = 2;
         expBox.addChildAt(ballEffect,1);
         expBox.addChildAt(waterEffect,2);
         expCtrl.waterEffBaseY = 177;
         expCtrl.waterEff = waterEffect;
         waterEffect.mask = expBox.mask_water;
         this.parts.push(new FloatUpDownEffCtrl().config(0.4).init(this.list_up,this.list_up.y,2,2));
         this.btn_tujian.clickHandler = showTujianPanel;
         this.btn_horseShow.clickHandler = showNext;
         this.icon_showHide.rotation = 0;
         var _loc1_:Boolean = false;
         costRender.mouseEnabled = _loc1_;
         costRender.mouseChildren = _loc1_;
         this.playerTitleRender.showLevel(false);
      }
      
      public function viewStackIn() : void
      {
         ObserverMgr.ins.regObserver(this);
         this.visible = true;
         if(_tujianPanel)
         {
            _tujianPanel.updateInfo();
            _tujianPanel.panelFadeIn();
         }
         if(talentMediator == null)
         {
            talentMediator = new RolePhaseUpPanelTalentMediator(this);
         }
         this.show();
         this.fadeIn();
      }
      
      public function viewStackOut() : void
      {
         ObserverMgr.ins.unregObserver(this);
         this.visible = false;
      }
      
      override public function fadeView_fadeInCpl() : void
      {
         super.fadeView_fadeInCpl();
         NGUtil.checkModuleShow(30100,ModuleMgr.ins.popLayer.getModule(30100));
      }
      
      public function set modelRef(param1:RoleInfoModel) : void
      {
         model = param1;
      }
      
      public function get subBarRef() : View
      {
         return null;
      }
      
      private function showNext() : void
      {
         this.btn_horseShow.mouseEvent = false;
         this.list_up.visible = true;
         if(this.icon_showHide.rotation == 0)
         {
            refreshHorseList();
            TweenLite.to(this.icon_showHide,0.5,{
               "rotation":-180,
               "onComplete":enableButton
            });
         }
         else
         {
            this.list_horseLamp.visible = false;
            TweenLite.to(this.icon_showHide,0.5,{
               "rotation":0,
               "onComplete":enableButton
            });
         }
      }
      
      private function refreshHorseList() : void
      {
         var _loc1_:int = 0;
         if(_horseShowArr)
         {
            this.list_horseLamp.repeatY = _horseShowArr.length;
            if(_horseShowArr.length > 1)
            {
               _loc1_ = 0;
               while(_loc1_ < _horseShowArr.length)
               {
                  (this.list_horseLamp.cells[_loc1_] as HorseShowRenderUI).txt.text = _horseShowArr[_loc1_];
                  _loc1_++;
               }
            }
            else
            {
               if((_horseShowArr[0] as String).indexOf(LocaleMgr.ins.getStr(999000508)) != -1)
               {
                  (this.list_horseLamp.cells[_loc1_] as HorseShowRenderUI).txt.multiline = true;
                  (this.list_horseLamp.cells[_loc1_] as HorseShowRenderUI).txt.wordWrap = true;
                  (this.list_horseLamp.cells[_loc1_] as HorseShowRenderUI).horseLampBg.height = 32;
                  (this.list_horseLamp.cells[_loc1_] as HorseShowRenderUI).height = 32;
               }
               (this.list_horseLamp.cells[_loc1_] as HorseShowRenderUI).txt.text = _horseShowArr[0];
            }
         }
      }
      
      private function switchHorseListVisible() : void
      {
         if(this.icon_showHide.rotation == 0)
         {
            this.list_horseLamp.visible = false;
         }
         else
         {
            this.list_horseLamp.visible = true;
         }
      }
      
      private function enableButton() : void
      {
         switchHorseListVisible();
         this.btn_horseShow.mouseEvent = true;
      }
      
      private function showTujianPanel(param1:Object) : void
      {
         if(_tujianPanel)
         {
            this.disposeTujianPanel();
         }
         else
         {
            _tujianPanel = new nslm2.modules.roleInfos.phaseUps.RoleShenjieTujianPanel();
            _tujianPanel.x = 435;
            _tujianPanel.y = 82;
            _tujianPanel.updateInfo();
            parent.parent.addChild(_tujianPanel);
            _tujianPanel.addEventListener("close",disposeTujianPanel);
            _tujianPanel.panelFadeIn();
         }
      }
      
      protected function disposeTujianPanel(param1:Event = null) : void
      {
         if(_tujianPanel)
         {
            _tujianPanel.removeEventListener("close",disposeTujianPanel);
            _tujianPanel.panelFadeOutAndDispose();
            _tujianPanel = null;
         }
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(btn_phaseUpOne !== _loc3_)
         {
            if(btn_phaseUpAll !== _loc3_)
            {
               if(btn_stop === _loc3_)
               {
                  stopAutoPhaseUp();
               }
            }
            else
            {
               isAutoPhaseUp = true;
               SoundMgr.ins.playTexiaoSound("role_phaseUpWater",0);
               doPhaseUp();
            }
         }
         else if(EnvConfig.ins.showDebugModule && false)
         {
            effEndFucnton();
         }
         else
         {
            doPhaseUp();
         }
      }
      
      private function server_phaseUp_cpl(param1:HeroShengjieRes) : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         if(param1.ok)
         {
            showUpgradeEffect();
            SoundMgr.ins.playTexiaoSound("role_phaseUp");
            stopAutoPhaseUp();
            this.mouseEvent = false;
         }
         if(isAutoPhaseUp)
         {
            this.btn_phaseUpAll.visible = false;
            DisplayUtils.mouseEnabled(this.btn_phaseUpOne,false);
            this.btn_phaseUpOne.filters = [FilterUtil.grayFilter()];
            this.btn_stop.visible = true;
         }
         model.heroInfo.baseInfo.sjExp = param1.zhufu;
         while(_loc3_ < Math.min(this.costRender.wealthVo.showCount,5))
         {
            _loc2_ = new Image(this.costRender.ref_img_icon.skin);
            _loc2_.scale = 0.25;
            new IconFlyEff(_loc2_,this.costRender.ref_img_icon,this.img_exp,"gravity").exec();
            _loc3_++;
         }
         this.refresh();
         if(this.isDisposed == false && isAutoPhaseUp)
         {
            TweenLite.killDelayedCallsTo(this.autoPhaseUp);
            TweenLite.delayedCall(0.3,autoPhaseUp);
         }
      }
      
      private function phaseUpErrorCpl(param1:ProtocolStatusRes) : void
      {
         if(param1.errCode == 350000009)
         {
            ServerEngine.ins.doDefaultErr(param1);
         }
         else
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealth(20,costRender.wealthVo.sid),30100);
            stopAutoPhaseUp();
         }
      }
      
      public function stopAutoPhaseUp() : void
      {
         TweenLite.killDelayedCallsTo(this.autoPhaseUp);
         this.btn_phaseUpAll.visible = true;
         DisplayUtils.mouseEnabled(this.btn_phaseUpOne,true);
         this.btn_phaseUpOne.filters = null;
         btn_stop.visible = false;
         isAutoPhaseUp = false;
         SoundMgr.ins.clearTexiao("role_phaseUpWater");
      }
      
      private function autoPhaseUp() : void
      {
         if(this.isDisposed == false && isAutoPhaseUp)
         {
            doPhaseUp();
         }
      }
      
      private function doPhaseUp() : void
      {
         var _loc1_:HeroShengjieReq = new HeroShengjieReq();
         _loc1_.hero = model.heroInfo.baseInfo.id;
         ServerEngine.ins.send(5009,_loc1_,server_phaseUp_cpl,phaseUpErrorCpl);
      }
      
      public function set layer3dRef(param1:UIPanel3D) : void
      {
      }
      
      public function show(param1:Boolean = false) : void
      {
         this.stopAutoPhaseUp();
         this.refresh();
      }
      
      private function showUpgradeEffect() : void
      {
         upgradeEffect = new BmcS1();
         upgradeEffect.x = 388;
         upgradeEffect.y = 290;
         parent.parent.addChild(upgradeEffect);
         upgradeEffect.init(1116,1,false,1,0,effEndFucnton);
      }
      
      private function effEndFucnton() : void
      {
         if(upgradeEffect)
         {
            upgradeEffect.parent.removeChild(upgradeEffect);
            upgradeEffect.dispose();
            upgradeEffect = null;
         }
         var _loc1_:RoleTupoSuccessInitVo = new RoleTupoSuccessInitVo(model.heroInfo.baseInfo.baseId,"png.uiRoleInfo.shenjie.img_shengjieSuccess",new RoleShenjieSuccessPanel(),500,246);
         ModuleMgr.ins.showModule(30103,_loc1_,ModuleMgr.ins.popLayer.curModuleId);
         this.mouseEvent = true;
      }
      
      private function get playerTitleRender() : PlayerTitleRender
      {
         return this.playerTitleRenderUI as PlayerTitleRender;
      }
      
      private function refresh() : void
      {
         var _loc10_:* = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc6_:* = null;
         var _loc2_:* = null;
         this.playerTitleRender.dataSource = model.heroInfo;
         var _loc11_:int = model.heroInfo.baseInfo.sjLevel;
         var _loc3_:StcHeroShengjieVo = StcMgr.ins.getVoByMultiColumnValue("static_hero_shengjie",["kind","level"],[1,_loc11_]) as StcHeroShengjieVo;
         var _loc5_:StcHeroShengjieVo = StcMgr.ins.getVoByMultiColumnValue("static_hero_shengjie",["kind","level"],[1,_loc11_ + 1]) as StcHeroShengjieVo;
         this.txt_phaseNow.text = LocaleMgr.ins.getStr(int(_loc3_.name));
         this.txt_titlePhaseNow.text = LocaleMgr.ins.getStr(999000509) + LocaleMgr.ins.getStr(int(_loc3_.name));
         var _loc1_:Array = HeroInfoUtil.getHeroActiveSkillVoArr(model.heroInfo.baseInfo);
         this.list_nowSkill.dataSource = _loc1_;
         if(_loc5_)
         {
            this.txt_phaseNext.text = LocaleMgr.ins.getStr(int(_loc5_.name));
         }
         if(_loc5_)
         {
            _loc10_ = uint(StcMgr.ins.getNpcVo(model.heroInfo.baseInfo.baseId).node);
            requestPhaseRecord(_loc10_,_loc11_);
            _loc7_ = PhaseUpUtil.getRatingArr(_loc3_);
            this.expCtrl.max = (_loc7_[_loc7_.length - 1] as PhaseUpRatingVo).exp;
            this.expCtrl.exp = Uint64Util.toNumber(model.heroInfo.baseInfo.sjExp);
            DisplayUtils.addChildFromGlobal(costRender.parent,this.costRender);
            costRender.visible = true;
            costRender.wealthVo = WealthVo.parseCostStr(_loc3_.item);
            costRender.txt_num.color = LabelUtils.getCountColor(PlayerModel.ins.getCountByWealthVo(costRender.wealthVo),costRender.wealthVo.count);
            this.hasRenderer.wealthVo = WealthUtil.toStcCountVo(WealthVo.parseCostStr(_loc3_.item));
            _loc8_ = getRatingNow(_loc7_,Uint64Util.toNumber(model.heroInfo.baseInfo.sjExp));
            if(StringUtils.isNull(DefindConsts.SHENGJIE_REDUCE))
            {
               txt_upProbability.text = LocaleMgr.ins.getStr(30100212,[LocaleConsts.getRatingStr(_loc8_.percent)]);
            }
            else
            {
               txt_upProbability.text = LocaleMgr.ins.getStr(30100201,[LocaleConsts.getRatingStr(_loc8_.percent),LocaleConsts.percentStr(Number(DefindConsts.SHENGJIE_REDUCE))]);
            }
            _loc9_ = [];
            var _loc13_:int = 0;
            var _loc12_:* = _loc1_;
            for each(var _loc4_ in _loc1_)
            {
               _loc6_ = StcMgr.ins.getSkillVo(_loc4_.stcSkillId);
               _loc2_ = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[_loc6_.node_id,_loc5_.skill_level]);
               _loc9_.push(new SkillRenderVo(_loc2_.id,_loc4_.stcNpcId));
            }
            this.list_nextSKill.dataSource = _loc9_;
            this.list_nextSKill.visible = true;
            this.box_next.visible = true;
            this.box_subBar.visible = true;
         }
         else
         {
            removeHorseLamp();
            this.expCtrl.showLevelTop();
            this.list_up.visible = false;
            this.list_nextSKill.visible = false;
            this.box_next.visible = false;
            this.box_subBar.visible = false;
         }
         showPropPanel(_loc3_,_loc5_);
         this.list_propNext.commitMeasure();
         this.list_up.x = this.box_next.x + ListUtil.getLongestTextLength(this.list_propNext,"txt_value") + 55;
         this.talentMediator.refresh();
      }
      
      private function getRatingNow(param1:Array, param2:Number) : PhaseUpRatingVo
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = param1.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            if(param2 <= _loc3_.exp)
            {
               return _loc3_;
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      private function showPropPanel(param1:StcHeroShengjieVo, param2:StcHeroShengjieVo) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param2)
         {
            if(StringUtils.isNull(param1.add_attr))
            {
               _loc3_ = NpcPropVo.getEmptyPopArr(11,15,0.00001,"+");
            }
            else
            {
               _loc3_ = NpcPropVo.parseArrStr(param1.add_attr,"+");
            }
            _loc4_ = NpcPropVo.parseArrStr(param2.add_attr,"+");
            this.list_propNext.dataSource = _loc4_;
         }
         else
         {
            _loc3_ = NpcPropVo.parseArrStr(param1.add_attr);
            _loc4_ = [];
         }
         NpcPropVo.unshowAllPropColor(_loc3_);
         this.list_propNow.dataSource = _loc3_;
      }
      
      public function getFocusNotices() : Array
      {
         return ["msg_stop_auto_phase_up","msg_init_phase_up_horse_lamp","notice_refresh_module_need_resource_data"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("msg_stop_auto_phase_up" !== _loc3_)
         {
            if("msg_init_phase_up_horse_lamp" !== _loc3_)
            {
               if("notice_refresh_module_need_resource_data" === _loc3_)
               {
                  if(costRender.wealthVo)
                  {
                     costRender.txt_num.color = LabelUtils.getCountColor(PlayerModel.ins.getCountByWealthVo(costRender.wealthVo),costRender.wealthVo.count);
                  }
               }
            }
            else
            {
               creatHorseLamp(param2 as Array);
            }
         }
         else
         {
            stopAutoPhaseUp();
         }
      }
      
      private function requestPhaseRecord(param1:uint, param2:uint) : void
      {
         if(_horseLampBaseId != param1 || _horseLampSjLevel != param2)
         {
            _horseLampBaseId = param1;
            _horseLampSjLevel = param2;
            HeroModel.ins.getPhaseRecord(param1,param2);
         }
      }
      
      private function creatHorseLamp(param1:Array) : void
      {
         _horseShowArr = param1;
         removeHorseLamp();
         _horseLamp = new HorseLampH();
         _horseLamp.width = horseLampBg.width;
         _horseLamp.show(param1);
         DisplayUtils.addChildAbove(_horseLamp,this.horseLampBg);
         _horseLamp.width = this.horseLampBg.width;
         _horseLamp.x = this.horseLampBg.x;
         _horseLamp.y = this.horseLampBg.y;
         refreshHorseList();
         switchHorseListVisible();
      }
      
      private function removeHorseLamp() : void
      {
         if(_horseLamp)
         {
            _horseLamp.dispose();
         }
      }
      
      override public function fadeOut() : void
      {
         stopAutoPhaseUp();
         super.fadeOut();
      }
      
      override public function dispose() : void
      {
         if(talentMediator)
         {
            talentMediator.dispose();
            talentMediator = null;
         }
         stopAutoPhaseUp();
         super.dispose();
      }
   }
}
