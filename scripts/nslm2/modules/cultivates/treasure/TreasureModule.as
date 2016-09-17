package nslm2.modules.cultivates.treasure
{
   import game.ui.treasures.TreasureModuleUI;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideCheckHandler;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import com.netease.protobuf.UInt64;
   import morn.core.components.ViewStack;
   import nslm2.modules.roleInfos.equipPanels.RoleSelectEquipPanel;
   import morn.core.components.Component;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import nslm2.modules.scenes.commons.UIWeapon3D;
   import flash.events.MouseEvent;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcFunctionVo;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.cultivates.treasure.consts.TreasureConsts;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.cultivates.treasure.view.TreasureStrenPanel;
   import nslm2.modules.cultivates.treasure.view.TreasureInlayPanel;
   import nslm2.modules.cultivates.treasure.view.RuneBagView;
   import nslm2.modules.cultivates.treasure.view.TreasureKeyinPanel;
   import nslm2.modules.cultivates.treasure.view.TreasureFuwenKeyinPanel;
   import nslm2.common.ui.components.comp3ds.lightAndShadows.LightAndShadowCtrl3;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.common.model.HeroModel;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.cultivates.treasure.service.TreasureService;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.cultivates.roleTeam.model.RoleTeamModel;
   import com.greensock.TweenLite;
   import proto.HeroInfo;
   import morn.core.components.List;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import proto.BaoWu;
   import nslm2.utils.Uint64Util;
   import morn.core.events.UIEvent;
   import nslm2.modules.roleInfos.equipPanels.HeroEquipVo;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.cultivates.treasure.view.ITreasurePanel;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.stcMgrs.vos.StcFashionSynVo;
   import nslm2.mgrs.stcMgrs.vos.StcModelVo;
   import morn.core.utils.StringUtils;
   import nslm2.utils.ConfigUtil;
   import flash.geom.Vector3D;
   import com.greensock.easing.Cubic;
   import nslm2.common.ui.components.debug3d.DebugWeaponBox;
   import flash.geom.Point;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.roleInfos.equipPanels.EquipHeroPosVo;
   import flash.display.DisplayObjectContainer;
   import proto.HeroInfoNotify;
   import nslm2.common.consts.NPCPropConsts;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import nslm2.mgrs.stcMgrs.vos.StcEquipLiansuoVo;
   import game.ui.roleInfos.NpcPropVo;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import morn.core.components.VBox;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import flash.display.BitmapData;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import nslm2.modules.cultivates.treasure.util.TreasureUtil;
   
   public class TreasureModule extends TreasureModuleUI implements INewerGuideCheckHandler
   {
       
      
      private var model:TreasureModel;
      
      private var selectHeroID:UInt64;
      
      private var selectEquipPos:int;
      
      private var selectedTabIndex:int;
      
      public var subViewStack:ViewStack;
      
      public var equipSelect:RoleSelectEquipPanel;
      
      private var equipSelectRender:Component;
      
      private var wareEquipEffect:BmcSpriteSheet;
      
      private var panel3D:UIPanel3D;
      
      private var weapon3d:UIWeapon3D;
      
      private var crtWeaonID:int;
      
      private var lineEff:BmcSpriteSheet;
      
      private var starsEff:BmcSpriteSheet;
      
      private var activateEff:BmcSpriteSheet;
      
      private var RUNE_KIND:Array;
      
      private var _curSubIdArr:Array;
      
      public var debugWeaponBox:DebugWeaponBox;
      
      public function TreasureModule()
      {
         model = TreasureModel.ins;
         RUNE_KIND = [];
         super();
         subViewStack = new ViewStack();
         tabBar.selectHandler = onTabBarSelected;
         tabBar.labels = LocaleMgr.ins.getStr(30600007);
         list_runeCategory.selectHandler = changeRuneCategoryHandler;
         model.list_category = list_runeCategory;
         txt_goAuction.addEventListener("click",openAuction);
         txt_goAuction.visible = false;
      }
      
      protected function openAuction(param1:MouseEvent) : void
      {
         var _loc2_:StcFunctionVo = StcMgr.ins.getFunctionVo(30610);
         if(FuncOpenAutoCtrl.checkOpen(30610))
         {
            ModuleMgr.ins.showModule(30610,null,ModuleMgr.ins.popLayer.curModuleId);
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(30610903));
            AlertUtil.lackLevel(_loc2_.level);
         }
      }
      
      private function changeRuneCategoryHandler(param1:int) : void
      {
         ObserverMgr.ins.sendNotice("treasure_update_rune_bag",list_runeCategory.selectedItem);
         model.selectedRuneKind = param1;
      }
      
      private function onTabBarSelected(param1:int) : void
      {
         var _loc2_:int = curSubIdArr[param1];
         subViewStack.selectedIndex = TreasureConsts.subViewStackIdArr.indexOf(_loc2_);
         if(weapon3d)
         {
            weapon3d.visible = TreasureConsts.ins.getVo(_loc2_).needShow3D;
         }
         this.img_circle.visible = false;
         if(_loc2_ != 30608)
         {
            refreshSelectedPanel();
            equipSelector.visible = true;
            list_runeCategory.visible = false;
            if(model.selectedTreasure)
            {
               subViewStack.visible = true;
            }
            else
            {
               subViewStack.visible = false;
            }
            list_runeCategory.selectedIndex = -1;
         }
         else
         {
            if(_loc2_ == 30614)
            {
               this.img_circle.visible = true;
            }
            equipSelector.visible = false;
            list_runeCategory.visible = true;
            list_runeCategory.dataSource = model.runeCategoryArr;
            list_runeCategory.selectedIndex = 0;
            subViewStack.visible = true;
         }
         changeBgs(param1);
      }
      
      private function changeBgs(param1:int) : void
      {
         img_funBg.skin = TreasureConsts.subViewBgs[param1];
         if(panel3D)
         {
            panel3D.initByImage(img_funBg,this.panelBg);
         }
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         model.sortIdleTreasure();
         this.moduleServerCpl();
      }
      
      private function get curSelectedId() : int
      {
         return curSubIdArr[tabBar.selectedIndex];
      }
      
      public function get curSubIdArr() : Array
      {
         return _curSubIdArr;
      }
      
      public function set curSubIdArr(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         if(_curSubIdArr == null || ArrayUtil.equal(_curSubIdArr,param1) == false)
         {
            _curSubIdArr = param1;
            _loc4_ = _curSubIdArr.length;
            _loc2_ = [];
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc3_ = _curSubIdArr[_loc5_];
               _loc2_.push(TreasureConsts.ins.getVo(_loc3_).name);
               _loc5_++;
            }
            this.tabBar.labels = _loc2_.join(",");
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         subViewStack.subViewClasses = [TreasureStrenPanel];
         TreasureConsts.subViewStackIdArr = [30600];
         this.curSubIdArr = [30600];
         if(FuncOpenAutoCtrl.checkOpen(30607))
         {
            subViewStack.subViewClasses = [TreasureStrenPanel,TreasureInlayPanel];
            TreasureConsts.subViewStackIdArr = [30600,30607];
            this.curSubIdArr = [30600,30607];
         }
         if(FuncOpenAutoCtrl.checkOpen(30608))
         {
            subViewStack.subViewClasses = [TreasureStrenPanel,TreasureInlayPanel,RuneBagView];
            TreasureConsts.subViewStackIdArr = [30600,30607,30608];
            this.curSubIdArr = [30600,30607,30608];
         }
         if(FuncOpenAutoCtrl.checkOpen(30609))
         {
            subViewStack.subViewClasses = [TreasureStrenPanel,TreasureInlayPanel,RuneBagView,TreasureKeyinPanel];
            TreasureConsts.subViewStackIdArr = [30600,30607,30608,30609];
            this.curSubIdArr = [30600,30607,30608,30609];
         }
         if(FuncOpenAutoCtrl.checkOpen(30616))
         {
            subViewStack.subViewClasses = [TreasureStrenPanel,TreasureInlayPanel,RuneBagView,TreasureKeyinPanel,TreasureFuwenKeyinPanel];
            TreasureConsts.subViewStackIdArr = [30600,30607,30608,30609,30616];
            this.curSubIdArr = [30600,30607,30608,30609,30616];
         }
         var _loc2_:Array = TreasureConsts.subViewStackIdArr.slice();
         _loc2_[0] = -1;
         FuncOpenAutoCtrl.checkFuncTabNew(_loc2_,tabBar);
         if(param1)
         {
            selectHeroID = param1["heroId"];
            selectEquipPos = param1["pos"];
            selectedTabIndex = param1["tabIndex"];
         }
         this.panelBg.titleImgId = this.moduleId;
         panel3D = new UIPanel3D(this);
         panel3D.antiAlias = 4;
         panel3D.lightCtrl = new LightAndShadowCtrl3(panel3D.layer3D);
         DisplayUtils.addChildAbove(panel3D,this.img_funBg);
         panel3D.initByImage(img_funBg,this.panelBg);
         panel3D.visible = false;
         subViewStack.x = 233;
         subViewStack.y = 61;
         tabBar.selectedIndex = selectedTabIndex;
         subViewStack.selectedIndex = selectedTabIndex;
         addChild(subViewStack);
         model.heroInfoArr = HeroModel.ins.teamHeroInfoArr;
         model.initAllTreasureList();
         equipSelector.dataSource = model.heroInfoArr;
         equipSelector.subArray = model.allTreasureArr;
         selecteDefault();
         refreshSelectedPanel();
         ServerEngine.ins.addAlwayHandler(5011,refreshPlayerData);
         equipSelector.addEventListener("accordion_change_sub_selected_data",selectEquipHandler);
         equipSelector.selectHandler = changeSelectedHero;
         TreasureService.ins.getCombineNotice();
         ObserverMgr.ins.sendNotice("lock_total_fight_value_change",true);
         PlayerModel.ins.autoUpdateHeroInfo = false;
         RoleTeamModel.ins.blockFloatMsg = true;
         this.panelBg.img_rimBg.addChild(this.img_circle);
         model.module_panelBg = this.panelBg;
         onTabBarSelected(this.tabBar.selectedIndex);
         super.preShow(param1);
      }
      
      override public function preClose(param1:Object = null) : void
      {
         this.panel3D.dispose();
         TweenLite.killDelayedCallsTo(playeStarsMoveEff);
         TweenLite.killDelayedCallsTo(playActivateEff);
         TweenLite.killDelayedCallsTo(updateLianSuoLvl);
         RoleTeamModel.ins.blockFloatMsg = false;
         super.preClose(param1);
      }
      
      private function changeSelectedHero() : void
      {
         var _loc2_:int = equipSelector.selectedIndex;
         var _loc1_:int = model.getDefaultSelectedEquipIndex(_loc2_);
         if(_loc1_ >= 0)
         {
            updateSelectedHeroInfo(equipSelector.selectedItem as HeroInfo);
            model.selectedTreasure = model.defaultSelectTreasure;
            (equipSelector.subSelection as List).selectedIndex = _loc1_;
            refreshSelectedPanel();
         }
         ObserverMgr.ins.sendNotice("msg_role_select_changed",equipSelector.selectedItem as HeroInfo);
      }
      
      private function updateSelectedHeroInfo(param1:HeroInfo) : void
      {
         model.selectedHeroInfo = param1;
         RoleInfoModel.ins.heroInfo = param1;
         if(model.selectedTreasure)
         {
            var _loc4_:int = 0;
            var _loc3_:* = param1.baowu;
            for each(var _loc2_ in param1.baowu)
            {
               if(Uint64Util.equal(model.selectedTreasure.id,_loc2_.id))
               {
                  model.selectedTreasure = _loc2_;
               }
            }
         }
      }
      
      protected function selectEquipHandler(param1:UIEvent) : void
      {
         var _loc2_:WealthVo = (param1.data as HeroEquipVo).wealthVo;
         if(model.selectedTreasure != _loc2_.treasure)
         {
            model.selectedTreasure = _loc2_.treasure;
            updateSelectedHeroInfo(equipSelector.selectedItem as HeroInfo);
            var _loc5_:int = 0;
            var _loc4_:* = equipSelector.subCells;
            for each(var _loc3_ in equipSelector.subCells)
            {
               if(equipSelector.subSelection != _loc3_)
               {
                  _loc3_.selectedIndex = -1;
               }
            }
            refreshSelectedPanel();
         }
      }
      
      private function selecteDefault() : void
      {
         var _loc1_:int = model.getDefaultSelectedHeroIndex(selectHeroID);
         equipSelector.selectedIndex = _loc1_ < 0?0:_loc1_;
         (equipSelector.subSelection as List).selectedIndex = model.getDefaultSelectedEquipIndex(_loc1_,selectEquipPos);
         updateSelectedHeroInfo(model.defaultSelectHero);
         model.selectedTreasure = model.defaultSelectTreasure;
      }
      
      private function refreshSelectedPanel() : void
      {
         var _loc5_:* = null;
         var _loc1_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         ObserverMgr.ins.sendNotice("SIMPLE_STR_MSG_FLOAT_MSG_STOP");
         _loc5_ = subViewStack.selection as ITreasurePanel;
         var _loc2_:Boolean = TreasureConsts.ins.getVo(curSelectedId).needShow3D;
         if(model.selectedTreasure)
         {
            subViewStack.visible = true;
            if(weapon3d)
            {
               weapon3d.visible = _loc2_;
            }
         }
         else
         {
            subViewStack.visible = false;
            if(weapon3d)
            {
               weapon3d.visible = false;
            }
         }
         if(model.selectedTreasure && _loc2_)
         {
            if(curSelectedId == 30613 && StcMgr.ins.getItemVo(TreasureModel.ins.selectedTreasure.baseId).quality == 6)
            {
               _loc3_ = StcMgr.ins.getItemVo(TreasureModel.ins.selectedTreasure.baseId);
               _loc4_ = StcMgr.ins.getFashionSynVo(_loc3_.combineFashionSynId);
               _loc1_ = StcMgr.ins.getItemVo(_loc4_.item).show_id;
            }
            else
            {
               _loc1_ = StcMgr.ins.getItemVo(model.selectedTreasure.baseId).show_id;
            }
            changeEquipModel(_loc1_);
         }
         if(_loc5_)
         {
            _loc5_.show();
            _loc5_.weaoponRef = weapon3d;
         }
      }
      
      private function changeEquipModel(param1:int) : void
      {
         var _loc2_:* = null;
         if(true || crtWeaonID != param1)
         {
            crtWeaonID = param1;
            if(weapon3d != null)
            {
               disposeWeapon(weapon3d);
            }
            weapon3d = new UIWeapon3D();
            _loc2_ = StcMgr.ins.getModelVo(param1);
            if(_loc2_ && StringUtils.isNull(_loc2_.extra) == false)
            {
               ConfigUtil.setWeaponUIExtra(weapon3d,_loc2_.extra);
            }
            else
            {
               weapon3d.position = new Vector3D(0,-40,0);
               weapon3d.scaleAll = 1.21;
            }
            weapon3d.x = weapon3d.x + TreasureConsts.ins.getVo(curSelectedId).offset.x;
            weapon3d.y = weapon3d.y + TreasureConsts.ins.getVo(curSelectedId).offset.y;
            weapon3d.initByModelId(param1);
            if(this.debugWeaponBox)
            {
               debugWeaponBox.bindWeapon(weapon3d);
            }
            if(panel3D)
            {
               panel3D.addChild3D(weapon3d);
            }
            weapon3d.changeEff(_loc2_.effect_id);
            TweenLite.from(weapon3d,0.6,{
               "x":-500,
               "ease":Cubic.easeOut
            });
         }
      }
      
      private function disposeWeapon(param1:UIWeapon3D) : void
      {
         TweenLite.killTweensOf(param1);
         param1.dispose();
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["MSG_GM_CMD","treasure_show_selecte_treasure_panel","treasure_show_liansuo_lvlup_effect","treasure_update_rune_data","treasure_wear","notice_refresh_module_equip_grow_data","treasure_freeze_selector"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         super.handleNotices(param1,param2);
         var _loc5_:* = param1;
         if("MSG_GM_CMD" !== _loc5_)
         {
            if("treasure_show_selecte_treasure_panel" !== _loc5_)
            {
               if("treasure_show_selecte_treasure_panel" !== _loc5_)
               {
                  if("treasure_wear" !== _loc5_)
                  {
                     if("treasure_show_liansuo_lvlup_effect" !== _loc5_)
                     {
                        if("treasure_update_rune_data" !== _loc5_)
                        {
                           if("notice_refresh_module_equip_grow_data" !== _loc5_)
                           {
                              if("treasure_freeze_selector" !== _loc5_)
                              {
                                 if("treasure_phase_up" === _loc5_)
                                 {
                                    _loc4_ = DisplayUtils.globarCenter(this.subViewStack).add(new Point(model.floatOffSet,-50));
                                    AlertUtil.float(LocaleMgr.ins.getStr(30600906),_loc4_);
                                    refreshSelectedPanel();
                                 }
                              }
                           }
                           else if(param2)
                           {
                              selectEquipPos = param2["pos"];
                              _loc3_ = 0;
                              _loc3_ = param2["tabIndex"];
                              tabBar.selectedIndex = _loc3_;
                              selecteDefault();
                           }
                           equipSelector.mouseEnabled = param2;
                           equipSelector.mouseChildren = param2;
                        }
                        else
                        {
                           list_runeCategory.dataSource = model.runeCategoryArr;
                           ObserverMgr.ins.sendNotice("treasure_rune_data_change",list_runeCategory.selectedItem);
                        }
                     }
                     else
                     {
                        liansuoLevelUpHandler(param2[0],param2[1]);
                     }
                  }
                  else
                  {
                     wearEquipHander(param2[0],param2[1]);
                  }
               }
               else if(checkAddEquip())
               {
                  showSelectEquipPanel(param2[0],param2[1]);
               }
            }
            else if(checkAddEquip())
            {
               showSelectEquipPanel(param2[0],param2[1]);
            }
         }
         else if(param2 == "debug3d")
         {
            if(debugWeaponBox == null)
            {
               debugWeaponBox = new DebugWeaponBox(this.panel3D);
               debugWeaponBox.bindWeapon(weapon3d);
            }
         }
      }
      
      private function checkAddEquip() : Boolean
      {
         if(model.idleTreasureList.length == 0)
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.TREASURE_LESS_ID)),30600);
            return false;
         }
         return true;
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         panel3D.visible = true;
         NGUtil.checkModuleShow(this.moduleId,this);
      }
      
      private function showSelectEquipPanel(param1:Component, param2:HeroEquipVo, param3:int = 2) : void
      {
         var _loc4_:* = null;
         if(!model.selectedHeroInfo)
         {
            return;
         }
         if(equipSelectRender == param1 && equipSelect)
         {
            disposeEquipSelectPanel();
         }
         else
         {
            disposeEquipSelectPanel();
            equipSelectRender = param1;
            _loc4_ = DisplayUtils.localToTarget(param1,this);
            _loc4_.x = _loc4_.x + param1.width / 2;
            equipSelect = new RoleSelectEquipPanel();
            this.equipSelect.addEventListener("close",disposeEquipSelectPanel);
            if(param3 == 1)
            {
               equipSelect.panelBg.titleImgId = 30101;
            }
            else
            {
               equipSelect.panelBg.titleImgId = 30102;
            }
            this.addChild(equipSelect);
            this.equipSelect.x = _loc4_.x - this.equipSelect.width / 2 + 30 - 41;
            if(localToGlobal(_loc4_).y + 60 + this.equipSelect.height > stage.stageHeight - EnvConfig.ins.shellY)
            {
               this.equipSelect.y = _loc4_.y - 1 - this.equipSelect.height;
            }
            else
            {
               this.equipSelect.y = _loc4_.y + 60;
            }
            if(model.selectedHeroInfo)
            {
               this.equipSelect.show(new EquipHeroPosVo(model.selectedHeroInfo.baseInfo.id,param2.place,param2.wealthVo != null),param1);
               model.crtTakOffTreasure = param2.wealthVo.treasure;
            }
         }
      }
      
      private function disposeEquipSelectPanel(... rest) : void
      {
         if(this.equipSelect != null)
         {
            this.equipSelect.removeEventListener("close",disposeEquipSelectPanel);
            this.equipSelect.panelFadeOutAndDispose();
            this.equipSelect = null;
         }
         equipSelectRender = null;
      }
      
      private function wearEquipHander(param1:DisplayObjectContainer, param2:BaoWu) : void
      {
         wareEquipEffect = new BmcSpriteSheet();
         var _loc3_:Point = DisplayUtils.localToTarget(param1,this,new Point(0,0));
         wareEquipEffect.x = _loc3_.x - 41;
         wareEquipEffect.y = _loc3_.y - 38;
         this.addChild(wareEquipEffect);
         wareEquipEffect.init(1060);
         if(model.crtTakOffTreasure)
         {
            TreasureModel.ins.updateTreasureData(model.crtTakOffTreasure,1);
         }
         if(param2)
         {
            TreasureModel.ins.updateTreasureData(param2,2);
         }
         model.selectedTreasure = param2;
         if(model.needShowLiansuoEffect)
         {
            if(this.subViewStack.selectedIndex == 0)
            {
               liansuoLevelUpHandler(3,model.selectedHeroInfo);
            }
            else
            {
               liansuoLevelUpHandler(4,model.selectedHeroInfo);
            }
         }
         refreshSelectedPanel();
      }
      
      private function refreshPlayerData(param1:HeroInfoNotify) : void
      {
         var _loc3_:Number = NaN;
         var _loc8_:int = 0;
         var _loc10_:int = 0;
         var _loc7_:int = 0;
         var _loc2_:* = null;
         var _loc5_:* = NaN;
         var _loc4_:* = NaN;
         var _loc9_:HeroInfo = model.selectedHeroInfo;
         var _loc6_:Point = DisplayUtils.globarCenter(this.subViewStack).add(new Point(model.floatOffSet,-50));
         if(_loc9_ && Uint64Util.equal(_loc9_.baseInfo.id,param1.info.baseInfo.id) && !TreasureModel.ins.blockHeroNotifyTips)
         {
            if(!Uint64Util.equal(_loc9_.baseInfo.fightValue,param1.info.baseInfo.fightValue))
            {
               _loc3_ = Uint64Util.toNumber(param1.info.baseInfo.fightValue) - Uint64Util.toNumber(_loc9_.baseInfo.fightValue);
               AlertUtil.showFightPowerChangeTip(_loc3_,null,null,_loc6_);
            }
            _loc8_ = NPCPropConsts.ins.allPorpList.length;
            _loc10_ = 0;
            while(_loc10_ < _loc8_)
            {
               _loc7_ = NPCPropConsts.ins.allPorpList[_loc10_];
               _loc2_ = NPCPropConsts.ins.getProtobufPropertyName(_loc7_);
               _loc5_ = Number(_loc9_.prop[_loc2_]);
               if(!_loc5_)
               {
                  _loc5_ = 0;
               }
               _loc4_ = Number(param1.info.prop[_loc2_]);
               if(!_loc4_)
               {
                  _loc4_ = 0;
               }
               if(NPCPropConsts.PERCENT_PROP_ID.indexOf(_loc7_) < 0)
               {
                  _loc4_ = Number(int(_loc4_));
                  _loc5_ = Number(int(_loc5_));
               }
               _loc3_ = _loc4_ - _loc5_;
               if(_loc3_)
               {
                  AlertUtil.showPropChangeTip(LocaleMgr.ins.getStr(2000 + _loc7_),_loc3_,null,null,_loc6_);
               }
               _loc10_++;
            }
         }
         if(model.selectedHeroInfo && model.selectedHeroInfo.baseInfo)
         {
            if(model.selectedHeroInfo.baseInfo.baowuStrLs < param1.info.baseInfo.baowuStrLs)
            {
               model.needShowLiansuoEffect = true;
            }
            if(model.selectedHeroInfo.baseInfo.baowuFumLs < param1.info.baseInfo.baowuFumLs)
            {
               model.needShowLiansuoEffect = true;
            }
         }
         if(false && EnvConfig.ins.showDebugModule)
         {
            liansuoLevelUpHandler(3,param1.info);
         }
         HeroModel.ins.onChangeOne(param1.info);
         model.updateHeroInfo(param1.info);
         updateSelectedHeroInfo(param1.info);
         equipSelector.dataSource = model.heroInfoArr;
         model.initAllTreasureList();
         updateEquipList();
      }
      
      private function liansuoLevelUpHandler(param1:int, param2:HeroInfo) : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc8_:* = null;
         if(param1 == 4)
         {
            return;
         }
         model.needShowLiansuoEffect = false;
         if(!lineEff)
         {
            lineEff = new BmcSpriteSheet();
            lineEff.init(5003);
            lineEff.x = 278;
            lineEff.y = 220;
            addChild(lineEff);
         }
         if(param1 == 3)
         {
            _loc5_ = param2.baseInfo.baowuStrLs;
            _loc4_ = LocaleMgr.ins.getStr(30500011,[TextFieldUtil.htmlText(_loc5_,new TextFormat(null,null,458496))]);
         }
         else if(param1 == 4)
         {
            _loc5_ = param2.baseInfo.baowuFumLs;
            _loc4_ = LocaleMgr.ins.getStr(30500017,[TextFieldUtil.htmlText(_loc5_,new TextFormat(null,null,458496))]);
         }
         _loc8_ = StcMgr.ins.getVoByMultiColumnValue("static_equip_liansuo",["kind","level"],[param1,_loc5_]);
         if(!_loc8_)
         {
            return;
         }
         var _loc3_:Array = NpcPropVo.parseArrStr(_loc8_.add_growth);
         var _loc6_:Bitmap = getTipBmp(_loc4_,_loc3_);
         var _loc7_:Sprite = new Sprite();
         _loc7_.addChild(_loc6_);
         _loc6_.x = -_loc6_.width >> 1;
         _loc6_.y = -_loc6_.height >> 1;
         _loc7_.x = 504;
         _loc7_.y = 245 + _loc7_.height / 2;
         addChild(_loc7_);
         TweenLite.from(_loc7_,0.2,{"alpha":0});
         TweenLite.to(_loc7_,0.3,{
            "delay":1,
            "scaleX":2,
            "scaleY":2,
            "alpha":0,
            "y":_loc7_.y - 30,
            "onComplete":tweenComplete,
            "onCompleteParams":[_loc7_,_loc6_]
         });
         TweenLite.delayedCall(1,playeStarsMoveEff);
         TweenLite.delayedCall(1.5,playActivateEff);
         TweenLite.delayedCall(1.8,updateLianSuoLvl,[_loc5_]);
      }
      
      private function updateLianSuoLvl(param1:int) : void
      {
         var _loc2_:* = null;
         _loc2_ = subViewStack.selection as ITreasurePanel;
         if(_loc2_)
         {
            _loc2_.updateLiansuoLvl();
         }
      }
      
      private function playActivateEff() : void
      {
         activateEff = new BmcSpriteSheet();
         activateEff.init(5005);
         activateEff.x = 177;
         activateEff.y = 8;
         addChild(activateEff);
      }
      
      private function playeStarsMoveEff() : void
      {
         starsEff = new BmcSpriteSheet();
         starsEff.init(5004);
         starsEff.x = 268;
         starsEff.y = 105;
         addChild(starsEff);
      }
      
      private function tweenComplete(param1:Sprite, param2:Bitmap) : void
      {
         if(param2 != null && param2.bitmapData != null)
         {
            param2.bitmapData.dispose();
            param2 = null;
         }
      }
      
      private function getTipBmp(param1:String, param2:Array) : Bitmap
      {
         var _loc5_:* = null;
         AlertUtil.float(param1,DisplayUtils.globarCenter(this.subViewStack).add(new Point(model.floatOffSet,-50)),-1,null,DisplayUtils.globarCenter((subViewStack.selection as ITreasurePanel).liansuoTxt),1);
         var _loc7_:VBox = new VBox();
         _loc7_.space = 4;
         _loc7_.align = "center";
         var _loc6_:Label = new Label();
         _loc6_.isHtml = true;
         _loc6_.color = 16777215;
         _loc6_.stroke = "0x0";
         _loc6_.labelFilterKind = "黑色1像素描边";
         _loc6_.size = 24;
         _loc6_.text = param1;
         _loc7_.addChild(_loc6_);
         var _loc9_:Box = new Box();
         _loc9_.height = 8;
         _loc7_.addChild(_loc9_);
         var _loc11_:int = 0;
         var _loc10_:* = param2;
         for each(var _loc8_ in param2)
         {
            _loc5_ = new Label();
            _loc5_.size = 16;
            _loc5_.color = 3997440;
            _loc5_.labelFilterKind = "黑色1像素描边";
            _loc5_.text = NPCPropConsts.ins.getLocaleName(_loc8_.propId) + " +" + _loc8_.value;
            _loc7_.addChild(_loc5_);
            AlertUtil.showPropChangeTip(NPCPropConsts.ins.getLocaleNameNormal(_loc8_.propId),_loc8_.value,null,DisplayUtils.globarCenter((subViewStack.selection as ITreasurePanel).liansuoTxt),DisplayUtils.globarCenter(this.subViewStack).add(new Point(model.floatOffSet,-50)));
         }
         var _loc3_:BitmapData = new BitmapData(_loc7_.width,_loc7_.height,true,0);
         var _loc4_:Bitmap = new Bitmap(_loc3_);
         return _loc4_;
      }
      
      private function updateEquipList() : void
      {
         equipSelector.subArray = model.allTreasureArr;
      }
      
      public function ngCheck(param1:int, param2:Array, param3:StcGuideVo) : int
      {
         if(!(int(param1) - 20026))
         {
            if(TreasureUtil.checkCanRuneNg(false,true) && tabBar.selectedIndex == 1)
            {
               return 1;
            }
            return 0;
         }
         return 1;
      }
      
      override public function dispose() : void
      {
         if(debugWeaponBox)
         {
            debugWeaponBox.dispose();
            debugWeaponBox = null;
         }
         ObserverMgr.ins.sendNotice("SIMPLE_STR_MSG_FLOAT_MSG_STOP");
         ServerEngine.ins.removeAlwayHandler(5011,refreshPlayerData);
         model.dispose();
         model = null;
         if(weapon3d)
         {
            weapon3d.dispose();
            weapon3d = null;
         }
         ObserverMgr.ins.sendNotice("lock_total_fight_value_change",false);
         PlayerModel.ins.autoUpdateHeroInfo = true;
         super.dispose();
      }
   }
}
