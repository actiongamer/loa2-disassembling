package nslm2.modules.foundations.recycle.view.panel.heroMirror
{
   import game.ui.recycleModules.heroMirror.HeroMirrorPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.foundations.recycle.view.I3DSubPanel;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import nslm2.modules.scenes.commons.UIUnit3D;
   import org.specter3d.display.particle.SpecterEffect;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.Button;
   import nslm2.modules.foundations.recycle.model.RecycleModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.common.model.PlayerModel;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.foundations.recycle.RecycleUtil;
   import proto.HeroTransReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ProtocolStatusRes;
   import com.mz.core.mgrs.ObserverMgr;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.utils.Effect3DUtils;
   import com.greensock.TweenLite;
   import nslm2.modules.foundations.recycle.consts.RecycleConsts;
   import nslm2.modules.foundations.heroChoose.HeroChooseInitVo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.foundations.heroChoose.HeroChooseUtil;
   import nslm2.modules.foundations.recycle.vo.RecycleVo;
   import morn.customs.components.PlayerTitleRender;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import flash.events.Event;
   import morn.customs.expands.MornExpandUtil;
   import flash.events.MouseEvent;
   
   public class HeroMirrorPanel extends HeroMirrorPanelUI implements IViewStackPage, IObserver, I3DSubPanel
   {
       
      
      private var _rightBg:Image3D;
      
      private var _uiPanel3D:UIPanel3D;
      
      private var _rewardHero:UIUnit3D;
      
      private var _state:int;
      
      private var _leftEffect:SpecterEffect;
      
      private var _rightEffect:SpecterEffect;
      
      private var _middleEffect:SpecterEffect;
      
      public function HeroMirrorPanel()
      {
         super();
         initLanguage();
         _rightBg = new Image3D(null,img_rightBg.width,this.img_rightBg.height,3900);
         _rightBg.showByBmd(img_rightBg.bitmapData);
         _rightBg.x = RecycleConsts.MIRROR_RIGHT_BG_POS.x;
         _rightBg.y = RecycleConsts.MIRROR_RIGHT_BG_POS.y;
         img_rightBg.visible = false;
      }
      
      private function initLanguage() : void
      {
         this.txt_30609005.text = LocaleMgr.ins.getStr(30609005);
         this.btn_change.label = LocaleMgr.ins.getStr(109001002);
         this.txt_109001009.text = LocaleMgr.ins.getStr(109001009);
         this.txt_109001017.text = LocaleMgr.ins.getStr(109001017);
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc8_:* = null;
         var _loc5_:* = null;
         var _loc10_:int = 0;
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc9_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc7_:int = 0;
         var _loc11_:* = param1;
         if(this.btn_change !== _loc11_)
         {
            if(changeBtn !== _loc11_)
            {
               if(this.btn_getHero !== _loc11_)
               {
                  if(this.btn_help === _loc11_)
                  {
                     RecycleUtil.showHelp();
                  }
               }
            }
            ModuleMgr.ins.showModule(12002,initHeroVo(),ModuleMgr.ins.popLayer.curModuleId);
         }
         else if(RecycleModel.ins.getCountRewardHeroIdArr() == 0)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(109001003));
         }
         else if(RecycleModel.ins.rewardHeroId == 0)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(109001004));
         }
         else
         {
            _loc8_ = this.list_cost.dataSource as Array;
            _loc10_ = 0;
            while(_loc10_ < _loc8_.length)
            {
               if(PlayerModel.ins.getCountByWealthVo(_loc8_[_loc10_]) < _loc8_[_loc10_].count)
               {
                  _loc5_ = _loc8_[_loc10_];
                  break;
               }
               _loc10_++;
            }
            if(_loc5_ && _loc5_.kind == 4)
            {
               AlertUtil.showRechargeAlert();
            }
            else if(_loc5_)
            {
               ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealthVo(_loc5_),ModuleMgr.ins.popLayer.curModuleId);
            }
            else
            {
               _loc2_ = [];
               _loc6_ = [];
               _loc4_ = WealthUtil.createNpcVo(RecycleModel.ins.rewardHeroId);
               _loc3_ = RecycleModel.ins.getChangeRecycleVoArr();
               _loc7_ = 0;
               while(_loc7_ < _loc3_.length)
               {
                  _loc9_ = WealthUtil.createNpcVo(_loc3_[_loc7_].heroBaseInfo.baseId);
                  _loc2_.push(_loc9_);
                  _loc6_.push(_loc4_);
                  _loc7_++;
               }
               AlertUtil.comfirm(new HeroMirrorConfirmView(_loc2_,_loc6_,list_cost.dataSource as Array),doChange);
            }
         }
      }
      
      private function doChange() : void
      {
         var _loc1_:HeroTransReq = new HeroTransReq();
         _loc1_.oldId = RecycleModel.ins.getChangeArr();
         _loc1_.toId = RecycleModel.ins.rewardHeroId;
         ServerEngine.ins.send(6272,_loc1_,onServerCpl_mirrorSystem);
      }
      
      private function onServerCpl_mirrorSystem(param1:ProtocolStatusRes) : void
      {
         ObserverMgr.ins.sendNotice("changeMouseEvent",false);
         showLeftEffect();
      }
      
      private function showLeftEffect() : void
      {
         _leftEffect = EffectManager.createEffect(Effect3DUtils.getUrlBySid(700131),true);
         TweenLite.to(this.headItemBox,0.5,{
            "alpha":0,
            "onComplete":onHeroDispear
         });
         this._uiPanel3D.addChild3D(_leftEffect);
         _leftEffect.rotationX = 10;
         _leftEffect.scaleAll = 3.5;
         _leftEffect.x = RecycleConsts.MIRROR_LEFT_BG_POS.x;
         _leftEffect.y = RecycleConsts.MIRROR_LEFT_BG_POS.y - headItemBox.height / 2;
      }
      
      private function onHeroDispear() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = 0;
         headItemBox.visible = false;
         _loc1_ = uint(0);
         while(_loc1_ < 5)
         {
            _loc2_ = headItemBox.getChildByName("item" + _loc1_) as HeroHeadItemView;
            if(_loc2_)
            {
               _loc2_.show();
            }
            _loc1_++;
         }
         RecycleModel.ins.rewardHeroIdArr = [null,null,null,null,null];
         headItemBox.alpha = 1;
         showRightEffect();
      }
      
      private function showRightEffect() : void
      {
         _rightEffect = EffectManager.createEffect(Effect3DUtils.getUrlBySid(700132),true,null,onEffectCpl);
         this._uiPanel3D.addChild3D(_rightEffect);
         _rightEffect.scaleAll = 3.5;
         _rightEffect.x = _rewardHero.x;
         _rightEffect.y = _rewardHero.y;
         _rewardHero.avatarRandomActionCtrl.unitMouseTriggerHandler(null);
         AlertUtil.float(LocaleMgr.ins.getStr(109001007));
      }
      
      private function onEffectCpl(param1:SpecterEffect) : void
      {
         _state = 3;
         refresh();
         ObserverMgr.ins.sendNotice("changeMouseEvent",true);
         RecycleModel.ins.rewardHeroId = 0;
      }
      
      private function initHeroVo() : HeroChooseInitVo
      {
         var _loc2_:* = null;
         var _loc1_:HeroChooseInitVo = new HeroChooseInitVo();
         if(PlayerModel.ins.level >= DefindConsts.HERO_CHANGE_LV_LIMIT)
         {
            _loc1_.alert = LocaleMgr.ins.getStr(109001005,[DefindConsts.HERO_CHANGE_LV_LIMIT]);
            _loc1_.fengbaoArr = HeroChooseUtil.getNpcVoArr(1,[5],RecycleModel.ins.getChangeIdArr());
            _loc1_.zhenbaoArr = HeroChooseUtil.getNpcVoArr(3,[5],RecycleModel.ins.getChangeIdArr());
            _loc1_.shenshengArr = HeroChooseUtil.getNpcVoArr(2,[5],RecycleModel.ins.getChangeIdArr());
         }
         else
         {
            _loc1_.alert = LocaleMgr.ins.getStr(109001006,[DefindConsts.HERO_CHANGE_LV_LIMIT]);
            _loc2_ = RecycleModel.ins.getChangeRecycleVoArr()[0] as RecycleVo;
            switch(int(_loc2_.wealthVo.stcNpcVo.group) - 1)
            {
               case 0:
                  _loc1_.fengbaoArr = HeroChooseUtil.getNpcVoArr(1,[5],RecycleModel.ins.getChangeIdArr());
                  break;
               case 1:
                  _loc1_.shenshengArr = HeroChooseUtil.getNpcVoArr(2,[5],RecycleModel.ins.getChangeIdArr());
                  break;
               case 2:
                  _loc1_.zhenbaoArr = HeroChooseUtil.getNpcVoArr(3,[5],RecycleModel.ins.getChangeIdArr());
            }
         }
         return _loc1_;
      }
      
      private function refresh() : void
      {
         var _loc3_:* = null;
         var _loc1_:* = null;
         var _loc4_:int = 0;
         var _loc2_:* = 0;
         switch(int(_state))
         {
            case 0:
               headItemBox.visible = true;
               this._rewardHero.visible = false;
               this.title_rewardHero.visible = false;
               this.box_reward.visible = false;
               this.img_arrow.visible = false;
               this.box_costWealth.visible = false;
               this.btn_change.visible = true;
               this.changeBtn.visible = false;
               break;
            case 1:
               this._rewardHero.visible = false;
               this.box_reward.visible = true;
               this.img_arrow.visible = false;
               this.box_costWealth.visible = false;
               this.btn_change.visible = true;
               this.changeBtn.visible = false;
               break;
            case 2:
               this.img_arrow.visible = true;
               this.title_rewardHero.visible = true;
               (this.title_rewardHero as PlayerTitleRender).setHeroLevel(1).dataSource = StcMgr.ins.getNpcVo(RecycleModel.ins.rewardHeroId);
               (this.title_rewardHero as PlayerTitleRender).box_level.visible = false;
               this._rewardHero.visible = true;
               this.box_reward.visible = false;
               _loc3_ = WealthUtil.costStrToArr(String(DefindConsts.HERO_CHANGE_EXPEND));
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  _loc1_ = _loc3_[_loc4_] as WealthVo;
                  if(_loc1_)
                  {
                     _loc1_.count = _loc1_.count * RecycleModel.ins.getChangeIdArr().length;
                  }
                  _loc4_++;
               }
               this.list_cost.dataSource = _loc3_;
               this.box_costWealth.visible = true;
               this.btn_change.visible = true;
               this.changeBtn.visible = true;
               break;
            case 3:
               this.img_arrow.visible = false;
               this.title_rewardHero.visible = true;
               (this.title_rewardHero as PlayerTitleRender).setHeroLevel(1).dataSource = StcMgr.ins.getNpcVo(RecycleModel.ins.rewardHeroId);
               (this.title_rewardHero as PlayerTitleRender).box_level.visible = false;
               this._rewardHero.visible = true;
               this.box_reward.visible = false;
               this.box_costWealth.visible = false;
               this.btn_change.visible = false;
               this.changeBtn.visible = false;
               _state = 0;
               this.addEventListener("click",onClick);
               _uiPanel3D.bgImage3d.addEventListener("click3d",onClick);
               _uiPanel3D.buttonMode = true;
               this.buttonMode = true;
         }
         if(box_reward.visible)
         {
            countTxt.text = "";
         }
         else
         {
            _loc2_ = uint(RecycleModel.ins.getCountRewardHeroIdArr());
            if(_loc2_ > 0)
            {
               countTxt.text = "X " + RecycleModel.ins.getCountRewardHeroIdArr();
            }
            else
            {
               countTxt.text = "";
            }
         }
      }
      
      protected function onClick(param1:Event) : void
      {
         this.removeEventListener("click",onClick);
         _uiPanel3D.bgImage3d.removeEventListener("click3d",onClick);
         _uiPanel3D.buttonMode = false;
         this.buttonMode = false;
         refresh();
      }
      
      public function getFocusNotices() : Array
      {
         return ["recycle_notice_update_list","heroChooseConfirmed","CLEAN_HERO_MIRROR_SELCET"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc6_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc7_:* = param1;
         if("recycle_notice_update_list" !== _loc7_)
         {
            if("heroChooseConfirmed" !== _loc7_)
            {
               if("CLEAN_HERO_MIRROR_SELCET" === _loc7_)
               {
                  _loc4_ = RecycleModel.ins.rewardHeroIdArr[param2];
                  if(_loc4_)
                  {
                     _loc7_ = false;
                     _loc4_.isSelected = _loc7_;
                     §§push(_loc7_);
                  }
                  else
                  {
                     §§push(0);
                  }
                  §§pop();
                  RecycleModel.ins.rewardHeroIdArr[param2] = null;
                  if(RecycleModel.ins.isEmptyRewardHeroIdArr())
                  {
                     RecycleModel.ins.rewardHeroId = 0;
                     _state = 0;
                  }
                  else if(RecycleModel.ins.getCountRewardHeroIdArr() == 0)
                  {
                     _state = 1;
                  }
                  _loc5_ = 0;
                  while(_loc5_ < 5)
                  {
                     _loc6_ = headItemBox.getChildByName("item" + _loc5_) as HeroHeadItemView;
                     if(_loc6_)
                     {
                        _loc6_.agianResume();
                     }
                     _loc5_++;
                  }
                  refresh();
               }
            }
            else
            {
               RecycleModel.ins.rewardHeroId = param2 as int;
               this._rewardHero.initByStcNpcId(RecycleModel.ins.rewardHeroId);
               _state = 2;
               refresh();
            }
         }
         else
         {
            _loc3_ = RecycleModel.ins.rewardHeroIdArr;
            if(PlayerModel.ins.level < DefindConsts.HERO_CHANGE_LV_LIMIT)
            {
               _loc5_ = 0;
               while(_loc5_ < _loc3_.length)
               {
                  _loc4_ = _loc3_[_loc5_] as RecycleVo;
                  if(_loc4_ && !RecycleModel.ins.cheakGroup(_loc4_))
                  {
                     AlertUtil.float(LocaleMgr.ins.getStr(109001021,[DefindConsts.HERO_CHANGE_LV_LIMIT]));
                     return;
                  }
                  _loc5_++;
               }
            }
            _loc5_ = 0;
            while(_loc5_ < 5)
            {
               if(_loc5_ < _loc3_.length)
               {
                  _loc4_ = _loc3_[_loc5_] as RecycleVo;
                  if(_loc4_)
                  {
                     _loc6_ = headItemBox.getChildByName("item" + _loc5_) as HeroHeadItemView;
                     if(_loc6_)
                     {
                        _loc6_.dataSource = _loc4_;
                     }
                  }
                  else
                  {
                     _loc6_ = headItemBox.getChildByName("item" + _loc5_) as HeroHeadItemView;
                     if(_loc6_)
                     {
                        _loc6_.cleanBtnClick(null);
                     }
                  }
               }
               _loc5_++;
            }
            if(RecycleModel.ins.isEmptyRewardHeroIdArr())
            {
               _state = 0;
            }
            else if(RecycleModel.ins.getCountRewardHeroIdArr() > 0 && _state == 0)
            {
               _state = 1;
            }
            refresh();
         }
      }
      
      public function set layer3dRef(param1:UIPanel3D) : void
      {
         _uiPanel3D = param1;
         _uiPanel3D.addChild3D(_rightBg);
      }
      
      public function viewStackIn() : void
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         var _loc4_:* = null;
         var _loc3_:* = 0;
         addListeners();
         _loc1_ = 0;
         while(_loc1_ < RecycleModel.ins.rewardHeroIdArr.length)
         {
            _loc2_ = RecycleModel.ins.rewardHeroIdArr[_loc1_];
            if(_loc2_)
            {
               var _loc5_:Boolean = false;
               _loc2_.isSelected = _loc5_;
               §§push(_loc5_);
            }
            else
            {
               §§push(0);
            }
            §§pop();
            RecycleModel.ins.rewardHeroIdArr[_loc1_] = null;
            _loc1_++;
         }
         RecycleModel.ins.rewardHeroIdArr = [null,null,null,null,null];
         RecycleModel.ins.rewardHeroId = 0;
         _loc3_ = uint(0);
         while(_loc3_ < 5)
         {
            _loc4_ = headItemBox.getChildByName("item" + _loc3_) as HeroHeadItemView;
            if(_loc4_)
            {
               _loc4_.show();
            }
            _loc3_++;
         }
         this.visible = true;
         _rightBg.visible = true;
         _rewardHero = new UIUnit3D();
         _rewardHero.pos2d = RecycleConsts.MIRROR_REWARDHERO_POS;
         _rewardHero.scaleAll = 0.9;
         if(_uiPanel3D)
         {
            _uiPanel3D.addChild3D(_rewardHero);
         }
         refresh();
         ObserverMgr.ins.regObserver(this);
      }
      
      public function viewStackOut() : void
      {
         var _loc4_:* = null;
         var _loc3_:* = 0;
         var _loc2_:* = null;
         var _loc1_:int = 0;
         removeListeners();
         _loc3_ = uint(0);
         while(_loc3_ < 5)
         {
            _loc4_ = headItemBox.getChildByName("item" + _loc3_) as HeroHeadItemView;
            if(_loc4_)
            {
               _loc4_.hide();
            }
            _loc3_++;
         }
         this.visible = false;
         _rightBg.visible = false;
         if(_rewardHero)
         {
            _rewardHero.dispose();
            _rewardHero = null;
         }
         RecycleModel.ins.selectedRebornItem = null;
         _loc1_ = 0;
         while(_loc1_ < RecycleModel.ins.rewardHeroIdArr.length)
         {
            _loc2_ = RecycleModel.ins.rewardHeroIdArr[_loc1_];
            if(_loc2_)
            {
               var _loc5_:Boolean = false;
               _loc2_.isSelected = _loc5_;
               §§push(_loc5_);
            }
            else
            {
               §§push(0);
            }
            §§pop();
            RecycleModel.ins.rewardHeroIdArr[_loc1_] = null;
            _loc1_++;
         }
         RecycleModel.ins.rewardHeroIdArr = [null,null,null,null,null];
         RecycleModel.ins.rewardHeroId = 0;
         _state = 0;
      }
      
      private function addListeners() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = 0;
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         _loc1_ = uint(0);
         while(_loc1_ < 5)
         {
            _loc2_ = headItemBox.getChildByName("item" + _loc1_) as HeroHeadItemView;
            if(_loc2_)
            {
               _loc2_.addEventListener("click",heroHeadItemViewClick);
            }
            _loc1_++;
         }
      }
      
      protected function heroHeadItemViewClick(param1:MouseEvent) : void
      {
         ObserverMgr.ins.sendNotice("recycle_notice_show_select_panel");
      }
      
      private function removeListeners() : void
      {
         ObserverMgr.ins.unregObserver(this);
         if(this.hasEventListener("click"))
         {
            this.removeEventListener("click",onClick);
         }
         if(_uiPanel3D.bgImage3d.hasEventListener("click3d"))
         {
            _uiPanel3D.bgImage3d.removeEventListener("click3d",onClick);
         }
         _uiPanel3D.buttonMode = false;
         this.buttonMode = false;
      }
   }
}
