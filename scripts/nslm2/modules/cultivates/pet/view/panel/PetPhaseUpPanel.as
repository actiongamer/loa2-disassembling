package nslm2.modules.cultivates.pet.view.panel
{
   import game.ui.petModule.phaseUp.PetPhaseUpPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import morn.core.components.View;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.greensock.TweenLite;
   import nslm2.common.ctrls.ProgressBarCtrl;
   import org.specter3d.display.particle.SpecterEffect;
   import flash.events.Event;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import com.mz.core.configs.EnvConfig;
   import nslm2.mgrs.SoundMgr;
   import proto.PetGradeUpRes;
   import com.mz.core.utils.DisplayUtils;
   import com.mz.core.utils.FilterUtil;
   import morn.core.components.Image;
   import nslm2.common.uiEffects.IconFlyEff;
   import proto.ProtocolStatusRes;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import proto.PetGradeUpReq;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.utils.Effect3DUtils;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcHeroShengjieVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.cultivates.pet.util.PetUtil;
   import nslm2.modules.roleInfos.phaseUps.PhaseUpUtil;
   import nslm2.modules.roleInfos.phaseUps.PhaseUpRatingVo;
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
   import flash.geom.Point;
   import flash.display.Sprite;
   import nslm2.common.ui.components.comps2d.HorseLampH;
   import nslm2.common.model.HeroModel;
   import game.ui.roleInfos.phaseUps.HorseShowRenderUI;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   
   public class PetPhaseUpPanel extends PetPhaseUpPanelUI implements IViewStackPage, IObserver
   {
       
      
      private var isAutoPhaseUp:Boolean;
      
      private var normalEff:BmcSpriteSheet;
      
      private var upgradeEffect:BmcSpriteSheet;
      
      private var _tujianPanel:nslm2.modules.cultivates.pet.view.panel.PetGradeUpMannualPanel;
      
      private var processCtrl:ProgressBarCtrl;
      
      private var eff:SpecterEffect;
      
      private var _horseLampBaseId:uint;
      
      private var _horseLampSjLevel:uint;
      
      private var nextMask:Sprite;
      
      private var nextUpMask:Sprite;
      
      private var _horseShowArr:Array;
      
      private var _horseLamp:HorseLampH;
      
      public function PetPhaseUpPanel()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         BmcSpriteSheet.preload(new <int>[32000000,32000001]);
         this.parts.push(new FloatUpDownEffCtrl().config(0.4).init(this.list_up,this.list_up.y,2,2));
         this.btn_tujian.clickHandler = showTujianPanel;
         processCtrl = new ProgressBarCtrl(this.progressBar,0.93,false);
         this.parts.push(processCtrl);
         DisplayUtils.addChildBelow(this.img_progressBg,this.progressBar.getChildAt(this.progressBar.numChildren - 1));
         this.img_progressBg.x = this.img_progressBg.x - 17;
         this.costRender.ref_txt_num.buttonMode = true;
         this.btn_horseShow.clickHandler = showNext;
         this.icon_showHide.rotation = 0;
         DisplayUtils.addChildFromGlobal(this.btn_phaseUpOne,this.costRender);
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
         NGUtil.checkModuleShow(32000,ModuleMgr.ins.popLayer.getModule(32000));
      }
      
      private function get model() : PetModel
      {
         return PetModel.ins;
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
      
      private function showTujianPanel(param1:Object) : void
      {
         if(_tujianPanel)
         {
            this.disposeTujianPanel();
         }
         else
         {
            _tujianPanel = new nslm2.modules.cultivates.pet.view.panel.PetGradeUpMannualPanel();
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
         else if(EnvConfig.ins.showDebugModule)
         {
            showUpgradeEffect();
         }
         else
         {
            doPhaseUp();
         }
      }
      
      private function server_phaseUp_cpl(param1:PetGradeUpRes) : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         if(param1.ok)
         {
            showUpgradeEffect();
            SoundMgr.ins.playTexiaoSound("role_phaseUp");
            stopAutoPhaseUp();
            ObserverMgr.ins.sendNotice("pet_activate");
         }
         if(isAutoPhaseUp)
         {
            this.btn_phaseUpAll.visible = false;
            DisplayUtils.addChildFromGlobal(this,this.costRender);
            DisplayUtils.mouseEnabled(this.btn_phaseUpOne,false);
            this.btn_phaseUpOne.filters = [FilterUtil.grayFilter()];
            this.btn_stop.visible = true;
            while(_loc3_ < Math.min(this.costRender.wealthVo.showCount,5))
            {
               _loc2_ = new Image(this.costRender.ref_img_icon.skin);
               _loc2_.scale = 0.25;
               new IconFlyEff(_loc2_,this.costRender.ref_img_icon,this.img_flyTarget,"gravity").exec();
               _loc3_++;
            }
         }
         if(!normalEff)
         {
            normalEff = new BmcSpriteSheet();
            normalEff.x = 187;
            normalEff.y = 135;
            normalEff.init(32000000,1,"all",isAutoPhaseUp,1,0,effEndFucnton);
            DisplayUtils.addChildBelow(normalEff,this.box_subBar);
         }
         this.refresh(param1.ok);
         if(this.isDisposed == false && isAutoPhaseUp)
         {
            TweenLite.killDelayedCallsTo(this.autoPhaseUp);
            TweenLite.delayedCall(0.3,autoPhaseUp);
         }
         else
         {
            ObserverMgr.ins.sendNotice("set_pet_list_enable",true);
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
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealth(20,costRender.wealthVo.sid),32000);
            stopAutoPhaseUp();
         }
         ObserverMgr.ins.sendNotice("set_pet_list_enable",true);
      }
      
      public function stopAutoPhaseUp() : void
      {
         TweenLite.killDelayedCallsTo(this.autoPhaseUp);
         this.btn_phaseUpAll.visible = true;
         DisplayUtils.mouseEnabled(this.btn_phaseUpOne,true);
         this.btn_phaseUpOne.filters = null;
         btn_stop.visible = false;
         isAutoPhaseUp = false;
         if(normalEff)
         {
            normalEff.dispose();
            normalEff = null;
         }
         SoundMgr.ins.clearTexiao("role_phaseUpWater");
         ObserverMgr.ins.sendNotice("set_pet_list_enable",true);
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
         ObserverMgr.ins.sendNotice("set_pet_list_enable",false);
         var _loc1_:PetGradeUpReq = new PetGradeUpReq();
         _loc1_.id = model.crtPetInfo.id;
         ServerEngine.ins.send(5362,_loc1_,server_phaseUp_cpl,phaseUpErrorCpl);
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
         if(normalEff)
         {
            normalEff.dispose();
            normalEff = null;
         }
         eff = EffectManager.createEffect(Effect3DUtils.getUrlBySid(700130),true,null,onLoaded);
         eff.scaleAll = 5;
         model.panel3D.addChild3D(eff);
      }
      
      private function onLoaded(param1:SpecterEffect) : void
      {
         param1.y = param1.y - 125;
         param1.x = param1.x + 42;
      }
      
      private function effEndFucnton() : void
      {
         if(normalEff)
         {
            normalEff.dispose();
            normalEff = null;
         }
      }
      
      private function refresh(param1:Boolean = false) : void
      {
         var _loc7_:* = 0;
         var _loc11_:* = null;
         var _loc3_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc6_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc14_:int = model.crtPetInfo.grade;
         if(!param1)
         {
         }
         var _loc2_:StcHeroShengjieVo = StcMgr.ins.getVoByMultiColumnValue("static_hero_shengjie",["level","kind"],[_loc14_,2]) as StcHeroShengjieVo;
         var _loc9_:StcHeroShengjieVo = StcMgr.ins.getVoByMultiColumnValue("static_hero_shengjie",["level","kind"],[_loc14_ + 1,2]) as StcHeroShengjieVo;
         this.txt_phaseNow.text = LocaleMgr.ins.getStr(int(_loc2_.name));
         var _loc8_:Array = PetUtil.getPetAllSkillVoArr(model.crtPetId,_loc14_);
         this.list_nowSkill.dataSource = _loc8_;
         if(_loc9_)
         {
            this.txt_phaseNext.text = LocaleMgr.ins.getStr(int(_loc9_.name));
         }
         if(_loc9_)
         {
            _loc7_ = uint(StcMgr.ins.getNpcVo(model.crtPetId).node);
            requestPhaseRecord(_loc7_,_loc14_);
            _loc11_ = PhaseUpUtil.getRatingArr(_loc2_);
            _loc3_ = (_loc11_[_loc11_.length - 1] as PhaseUpRatingVo).exp;
            _loc12_ = Uint64Util.toNumber(model.crtPetInfo.gradeExp);
            this.progressBar.value = _loc12_ / _loc3_;
            this.txt_progress.text = LocaleMgr.ins.getStr(32000049,[_loc12_]);
            this.txt_progress.visible = true;
            if(_loc12_ == 0)
            {
               this.processCtrl.light.visible = false;
            }
            else
            {
               this.processCtrl.light.visible = true;
            }
            costRender.visible = true;
            costRender.wealthVo = WealthVo.parseCostStr(_loc2_.item);
            costRender.txt_num.color = LabelUtils.getCountColor(PlayerModel.ins.getCountByWealthVo(costRender.wealthVo),costRender.wealthVo.count);
            this.hasRenderer.wealthVo = WealthUtil.toStcCountVo(WealthVo.parseCostStr(_loc2_.item));
            _loc13_ = getRatingNow(_loc11_,Uint64Util.toNumber(model.crtPetInfo.gradeExp));
            if(StringUtils.isNull(DefindConsts.SHENGJIE_REDUCE))
            {
               txt_desc.text = LocaleMgr.ins.getStr(32000339,[LocaleConsts.getRatingStr(_loc13_.percent)]);
            }
            else
            {
               txt_desc.text = LocaleMgr.ins.getStr(32000014,[LocaleConsts.getRatingStr(_loc13_.percent),LocaleConsts.percentStr(Number(DefindConsts.SHENGJIE_REDUCE))]);
            }
            _loc6_ = [];
            var _loc16_:int = 0;
            var _loc15_:* = _loc8_;
            for each(var _loc10_ in _loc8_)
            {
               _loc4_ = StcMgr.ins.getSkillVo(_loc10_.stcSkillId);
               _loc5_ = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[_loc4_.node_id,_loc9_.skill_level]);
               if(_loc5_)
               {
                  _loc6_.push(new SkillRenderVo(_loc5_.id,_loc10_.stcNpcId));
               }
            }
            this.list_nextSKill.dataSource = _loc6_;
            this.list_nextSKill.visible = true;
            this.box_next.visible = true;
            this.box_subBar.visible = true;
         }
         else
         {
            removeHorseLamp();
            this.progressBar.value = 1;
            this.processCtrl.light.visible = false;
            this.txt_progress.visible = false;
            this.list_up.visible = false;
            this.list_nextSKill.visible = false;
            this.box_next.visible = false;
            this.box_subBar.visible = false;
            this.costRender.visible = false;
         }
         showPropPanel(_loc2_,_loc9_,param1);
         this.list_propNext.commitMeasure();
         this.list_up.x = this.box_next.x + ListUtil.getLongestTextLength(this.list_propNext,"txt_value") + 87;
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
      
      private function showPropPanel(param1:StcHeroShengjieVo, param2:StcHeroShengjieVo, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(param2)
         {
            if(StringUtils.isNull(param1.add_attr))
            {
               _loc4_ = NpcPropVo.getEmptyPopArr(11,15,0.00001,"+");
            }
            else
            {
               _loc4_ = NpcPropVo.parseArrStr(param1.add_attr,"+",null,0,true,true);
            }
            _loc5_ = NpcPropVo.parseArrStr(param2.add_attr,"+",null,0,true,true);
            _loc5_.push(new NpcPropVo(99,param2.glory_rating,"+",null,0,true));
            this.list_propNext.dataSource = _loc5_;
         }
         else
         {
            _loc4_ = NpcPropVo.parseArrStr(param1.add_attr,"+",null,0,true,true);
            _loc5_ = [];
         }
         _loc4_.push(new NpcPropVo(99,param1.glory_rating,"+",null,0,true));
         if(param3)
         {
            _loc4_.forEach(setFloatPos);
         }
         this.list_propNow.dataSource = _loc4_;
      }
      
      private function setFloatPos(param1:NpcPropVo, param2:int, param3:Array) : void
      {
         param1.floatPos = DisplayUtils.globarCenter(this).add(new Point(0,-50));
      }
      
      public function getFocusNotices() : Array
      {
         return ["msg_stop_auto_phase_up","msg_init_phase_up_horse_lamp","notice_refresh_module_need_resource_data","change_selected_pet","msg_init_phase_up_horse_lamp"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("msg_stop_auto_phase_up" !== _loc3_)
         {
            if("notice_refresh_module_need_resource_data" !== _loc3_)
            {
               if("msg_init_phase_up_horse_lamp" !== _loc3_)
               {
                  if("change_selected_pet" === _loc3_)
                  {
                     refresh();
                  }
               }
               else
               {
                  creatHorseLamp(param2 as Array);
               }
            }
            else if(costRender.wealthVo)
            {
               costRender.txt_num.color = LabelUtils.getCountColor(PlayerModel.ins.getCountByWealthVo(costRender.wealthVo),costRender.wealthVo.count);
            }
         }
         else
         {
            stopAutoPhaseUp();
         }
      }
      
      override public function fadeOut() : void
      {
         stopAutoPhaseUp();
         super.fadeOut();
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
                  (this.list_horseLamp.cells[_loc1_] as HorseShowRenderUI).horseLampBg.width = 375;
                  (this.list_horseLamp.cells[_loc1_] as HorseShowRenderUI).txt.width = 375;
                  _loc1_++;
               }
            }
            else
            {
               if((_horseShowArr[0] as String).indexOf("前无古人") != -1)
               {
                  (this.list_horseLamp.cells[_loc1_] as HorseShowRenderUI).txt.multiline = true;
                  (this.list_horseLamp.cells[_loc1_] as HorseShowRenderUI).txt.wordWrap = true;
                  (this.list_horseLamp.cells[_loc1_] as HorseShowRenderUI).horseLampBg.height = 32;
                  (this.list_horseLamp.cells[_loc1_] as HorseShowRenderUI).height = 32;
               }
               (this.list_horseLamp.cells[_loc1_] as HorseShowRenderUI).txt.text = _horseShowArr[0];
               (this.list_horseLamp.cells[_loc1_] as HorseShowRenderUI).horseLampBg.width = 375;
               (this.list_horseLamp.cells[_loc1_] as HorseShowRenderUI).txt.width = 375;
            }
         }
      }
      
      private function enableButton() : void
      {
         switchHorseListVisible();
         this.btn_horseShow.mouseEvent = true;
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
      
      override public function dispose() : void
      {
         stopAutoPhaseUp();
         super.dispose();
      }
   }
}
