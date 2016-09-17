package nslm2.modules.cultivates.roleTeam.view.panel
{
   import game.ui.roleTeam.panel.RoleTeamEquipPanelUI;
   import nslm2.modules.roleInfos.commons.IRoleSubPanel;
   import com.mz.core.interFace.IObserver;
   import com.mz.core.interFace.IViewStackPage;
   import morn.customs.components.PlayerTitleRender;
   import com.netease.protobuf.UInt64;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import nslm2.modules.roleInfos.equipPanels.RoleSelectEquipPanel;
   import game.ui.roleInfos.equipPanels.RoleEquipSubBarUI;
   import morn.core.components.View;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.roleInfos.equipPanels.RoleMengYuePanel;
   import nslm2.modules.roleInfos.equipPanels.SkillInfoPanel;
   import nslm2.modules.roleInfos.equipPanels.EquipPetVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.tipMenus.TipMenuMsg;
   import nslm2.common.ui.components.comps2d.others.RedPoint;
   import nslm2.modules.cultivates.fashion.FashionModel;
   import com.mz.core.utils.DisplayUtils;
   import morn.core.components.Button;
   import nslm2.modules.cultivates.roleTeam.model.RoleTeamModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcFunctionVo;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.roleInfos.vo.RoleInfoModuleParam;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.roleInfos.equipPanels.MengYuePropVo;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.common.model.HeroModel;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import flash.events.MouseEvent;
   import morn.core.components.Component;
   import nslm2.modules.roleInfos.equipPanels.HeroEquipVo;
   import nslm2.modules.roleInfos.equipPanels.EquipHeroPosVo;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.cultivates.roleTeam.util.RoleTeamUtil;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.cultivates.skin.SkinModel;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.common.consts.NPCPropConsts;
   import morn.customs.components.NpcPropRender;
   import morn.core.handlers.Handler;
   import flash.geom.Point;
   import nslm2.utils.Uint64Util;
   import proto.HeroBaseInfo;
   import nslm2.modules.roleInfos.tupos.RoleTupoUtil;
   import nslm2.modules.roleInfos.levelUps.RoleLevelUpUtil;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.compsEffects.FloatZoomInEffCtrl;
   import nslm2.utils.YuanFenUtil;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import proto.HeroInfo;
   import proto.Item;
   import nslm2.modules.cultivates.pet.vo.PetInfoVo;
   import proto.BaoWu;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import nslm2.modules.cultivates.roleTeam.service.RoleTeamService;
   import nslm2.modules.roleInfos.equipPanels.MengYueEffectVo;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import nslm2.common.ui.components.comps2d.BmcS1;
   import nslm2.modules.roleInfos.equipPanels.RoleDetailPropPanel;
   import proto.EquipChangeReq;
   import nslm2.mgrs.SoundMgr;
   import proto.ItemReduce;
   import nslm2.modules.footstones.quickUseModules.QuickUseModel;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.roleInfos.equipPanels.RoleEquipRender;
   import morn.customs.expands.MornExpandUtil;
   import com.mz.core.mediators.RollMediator;
   import com.mz.core.utils.LocalData;
   import nslm2.modules.cultivates.skillChangePanels.SkillChangeCtrl;
   
   public class RoleTeamEquipPanel extends RoleTeamEquipPanelUI implements IRoleSubPanel, IObserver, IViewStackPage
   {
       
      
      private var _nowSelectedId:UInt64;
      
      private var floatEff:FloatUpDownEffCtrl;
      
      public var model:RoleInfoModel;
      
      public var equipSelect:RoleSelectEquipPanel;
      
      public var subBar:RoleEquipSubBarUI;
      
      private var wareEquipEffect:BmcSpriteSheet;
      
      private var mengYuePanel:RoleMengYuePanel;
      
      private var skillInfoPanel:SkillInfoPanel;
      
      private var selectTeamMemberPanel:nslm2.modules.cultivates.roleTeam.view.panel.SelectTeamMemberPanel;
      
      private var fashionRedPoint:RedPoint;
      
      private var _redPoint:RedPoint;
      
      private var equipingItem:Item;
      
      private var equipingPet:PetInfoVo;
      
      private var equipingTreasure:BaoWu;
      
      private var selectedRender:Component;
      
      private var selectedVO:HeroEquipVo;
      
      private var equipSelectRender:Component;
      
      private var mengYueEffect:BmcS1;
      
      private var detailPropPanel:RoleDetailPropPanel;
      
      public function RoleTeamEquipPanel()
      {
         var _loc1_:* = null;
         model = RoleInfoModel.ins;
         subBar = new RoleEquipSubBarUI();
         _redPoint = new RedPoint();
         super();
         this.playerTitleRender.isShowTitleName = true;
         list_equip.itemRender = RoleEquipRender;
         ObserverMgr.ins.regObserver(this);
         list_equip.useMouseDown = false;
         list_equip.mouseHandler = list_equip_mouseHandler;
         list_treasure.mouseHandler = list_treasreMouseHandelr;
         MornExpandUtil.addHandlerForBtnAll(this,btnClickHandler);
         this.parts.push(new RollMediator(box_yuanfen,showMengYuePanel));
         if(LocalData.insCurPlayer.load("fashion_acc") == null)
         {
            LocalData.insCurPlayer.save("fashion_acc",false);
         }
         refreshFashionRedPoint();
         if(!LocalData.insCurPlayer.load("evtSkinSelect",false) || SkinModel.ins.inactiveArr.length > 0)
         {
            _loc1_ = new RedPoint();
            _loc1_.top = -2;
            _loc1_.right = -2;
            _loc1_.scale = 2;
            this.btn_skin.addChild(_loc1_);
         }
         this.parts.push(new SkillChangeCtrl(this.btn_skill));
      }
      
      public function get playerTitleRender() : PlayerTitleRender
      {
         return this.playerTitleRenderUI as PlayerTitleRender;
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         this.show(false);
         this.fadeIn();
      }
      
      public function viewStackOut() : void
      {
         disposeMengYuePanel();
         disposeDetailPropPanel();
         disposeEquipSelectPanel();
         this.visible = false;
      }
      
      public function set modelRef(param1:RoleInfoModel) : void
      {
         model = param1;
      }
      
      public function get subBarRef() : View
      {
         return subBar;
      }
      
      private function showPetTipMenu(param1:EquipPetVo) : void
      {
         ObserverMgr.ins.sendNotice("MSG_TIP_MENU_SHOW",new TipMenuMsg(123,param1));
      }
      
      private function refreshFashionRedPoint() : void
      {
         if(FashionModel.ins.newFashionArr.length > 0 || FashionModel.ins.hasNewUnequipedFashionAcc() || FashionModel.ins.hasNewAccCanSyn())
         {
            fashionRedPoint = new RedPoint();
            fashionRedPoint.top = -2;
            fashionRedPoint.right = -2;
            this.btn_left.addChild(fashionRedPoint);
         }
         else if(fashionRedPoint)
         {
            DisplayUtils.removeSelf(fashionRedPoint);
         }
      }
      
      private function btnClickHandler(param1:Button) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc4_:* = param1;
         if(btn_left !== _loc4_)
         {
            if(btn_right !== _loc4_)
            {
               if(btn_sz !== _loc4_)
               {
                  if(btn_qhds !== _loc4_)
                  {
                     if(btn_recommand !== _loc4_)
                     {
                        if(btn_skin === _loc4_)
                        {
                           _loc2_ = new RoleInfoModuleParam();
                           _loc2_.heroInfo = RoleInfoModel.ins.heroInfo;
                           ModuleMgr.ins.showModule(31100,_loc2_);
                        }
                     }
                     else
                     {
                        ModuleMgr.ins.showModule(14000,null,30810);
                     }
                  }
                  else
                  {
                     if(model.heroInfo.items.length < 4)
                     {
                        AlertUtil.float(LocaleMgr.ins.getStr(30100050));
                        return;
                     }
                     ModuleMgr.ins.showModule(30811,null,30810);
                  }
               }
               else
               {
                  showSelectTeamMemberPanel();
               }
            }
            else
            {
               _loc2_ = new RoleInfoModuleParam();
               _loc2_.heroInfo = RoleInfoModel.ins.heroInfo;
               _loc2_.subPanelId = 30100;
               ModuleMgr.ins.showModule(30100,_loc2_,30810);
            }
         }
         else if(RoleTeamModel.ins.selectedPos == 1)
         {
            _loc3_ = StcMgr.ins.getFunctionVo(30200);
            if(FuncOpenAutoCtrl.checkOpen(30200))
            {
               ModuleMgr.ins.showModule(30200,null,30810);
            }
            else
            {
               AlertUtil.lackLevel(_loc3_.level);
            }
         }
         else
         {
            showSelectTeamMemberPanel();
         }
      }
      
      private function showEquipModule() : void
      {
         ModuleMgr.ins.showModule(30500);
      }
      
      private function showMengYuePanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(!MengYuePropVo.getMaxMengYueCnt(HeroInfoUtil.getNodeId(model.heroInfo.baseInfo.baseId)))
            {
               return;
            }
            disposeDetailPropPanel();
            disposeEquipSelectPanel();
            mengYuePanel = new RoleMengYuePanel();
            parent.parent.addChild(mengYuePanel);
            mengYuePanel.updateMengYueData(MengYuePropVo.idArrToVoArr(HeroInfoUtil.getNodeId(model.heroInfo.baseInfo.baseId),model.heroInfo.baseInfo.mengyue));
            mengYuePanel.x = 735 - mengYuePanel.img_bg2.width - 122;
            mengYuePanel.y = 438 - mengYuePanel.img_bg2.height + 90;
            mengYuePanel.panelFadeIn();
         }
         else
         {
            disposeMengYuePanel();
         }
      }
      
      private function disposeMengYuePanel(... rest) : void
      {
         if(mengYuePanel)
         {
            mengYuePanel.removeEventListener("close",disposeMengYuePanel);
            mengYuePanel.panelFadeOutAndDispose();
            mengYuePanel = null;
         }
      }
      
      private function showSelectTeamMemberPanel() : void
      {
         if(!HeroModel.ins.hasCanJoinTeamHero())
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.HERO_LESS_ID)),30810);
            return;
         }
         if(this.selectTeamMemberPanel)
         {
            disposeSelectTeamMemberPanel();
         }
         else
         {
            disposeEquipSelectPanel();
            selectTeamMemberPanel = new nslm2.modules.cultivates.roleTeam.view.panel.SelectTeamMemberPanel();
            parent.parent.addChild(selectTeamMemberPanel);
            selectTeamMemberPanel.x = 130;
            selectTeamMemberPanel.y = 40;
            selectTeamMemberPanel.show();
            selectTeamMemberPanel.addEventListener("close",disposeSelectTeamMemberPanel);
            selectTeamMemberPanel.panelFadeIn();
         }
      }
      
      private function disposeSelectTeamMemberPanel(... rest) : void
      {
         if(selectTeamMemberPanel)
         {
            selectTeamMemberPanel.removeEventListener("close",disposeSelectTeamMemberPanel);
            selectTeamMemberPanel.panelFadeOutAndDispose();
            selectTeamMemberPanel = null;
         }
      }
      
      protected function baowuClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:HeroEquipVo = (param1.target as Component).dataSource as HeroEquipVo;
         var _loc3_:uint = _loc2_.place;
         if(_loc2_.wealthVo)
         {
            equipingTreasure = _loc2_.wealthVo.treasure;
         }
         var _loc4_:Component = param1.target as Component;
         selectedRender = _loc4_;
         selectedVO = _loc2_;
         if(_loc2_.wealthVo && _loc2_.wealthVo.treasure)
         {
            showTipMenue(new EquipHeroPosVo(model.heroInfo.baseInfo.id,_loc2_.place,_loc2_.wealthVo != null,swapEquipHandler),true);
         }
         else
         {
            showSelectEquipPanel(_loc4_,_loc2_,2);
         }
      }
      
      private function showTipMenue(param1:EquipHeroPosVo, param2:Boolean = false, param3:WealthVo = null) : void
      {
         var _loc4_:int = 0;
         if(param2)
         {
            _loc4_ = 112;
            if(param3 && TreasureModel.ins.hasBetterTreasure(param3))
            {
               _loc4_ = 115;
            }
         }
         else
         {
            _loc4_ = 103;
            if(param3 && BagModel.ins.hasBetterEquip(param3,model.heroInfo.baseInfo.baseId))
            {
               _loc4_ = 113;
            }
         }
         ObserverMgr.ins.sendNotice("MSG_TIP_MENU_SHOW",new TipMenuMsg(_loc4_,param1));
      }
      
      public function show(param1:Boolean = false) : void
      {
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc8_:int = 0;
         var _loc11_:* = null;
         var _loc2_:* = null;
         var _loc7_:int = 0;
         var _loc4_:int = 0;
         var _loc12_:int = 0;
         if(!model.heroInfo)
         {
            box_sz.visible = true;
            list_skill.dataSource = [];
            list_YuanFen.dataSource = [];
            list_propBase.dataSource = [];
            var _loc15_:* = true;
            box_qianghuadashi.disabled = _loc15_;
            _loc15_ = _loc15_;
            btn_right.disabled = _loc15_;
            btn_left.disabled = _loc15_;
            playerTitleRender.visible = false;
            list_equip.dataSource = RoleTeamUtil.toEquipVoArr([]);
            list_treasure.dataSource = RoleTeamUtil.toEquipBaoWuVoArr([]);
            if(!floatEff)
            {
               floatEff = new FloatUpDownEffCtrl();
               floatEff.init(btn_sz);
            }
            box_skillBtn.visible = false;
            box_skin.visible = false;
            return;
         }
         if(floatEff)
         {
            floatEff.dispose();
            floatEff = null;
         }
         if(RoleTeamModel.ins.selectedPos == 1)
         {
            btn_left.label = "  " + LocaleMgr.ins.getStr(30100037);
            if(EnvConfig.ins.hideForBS)
            {
               this.img_fashion.visible = false;
               this.btn_left.visible = false;
            }
            box_skillBtn.visible = true;
            box_skin.visible = false;
            FuncOpenAutoCtrl.checkFuncBtnNew(31220,this.img_fashion);
         }
         else
         {
            btn_left.label = "  " + LocaleMgr.ins.getStr(30100040);
            if(EnvConfig.ins.hideForBS)
            {
               this.img_fashion.visible = true;
               this.btn_left.visible = true;
            }
            box_skillBtn.visible = false;
            if(FuncOpenAutoCtrl.checkOpen(31100) && SkinModel.ins.getSkinAvailArrByNpcId(model.heroInfo.baseInfo.baseId).length > 0)
            {
               box_skin.visible = true;
            }
            else
            {
               box_skin.visible = false;
            }
            FuncOpenAutoCtrl.hideFuncBtnNew(this.img_fashion);
         }
         _loc15_ = false;
         box_qianghuadashi.disabled = _loc15_;
         _loc15_ = _loc15_;
         btn_right.disabled = _loc15_;
         btn_left.disabled = _loc15_;
         playerTitleRender.visible = true;
         box_sz.visible = false;
         list_equip.dataSource = RoleTeamUtil.toEquipVoArr(model.heroInfo.items,0,model.heroInfo.baseInfo.baseId);
         updateTreasuerInfo();
         playerTitleRender.heroInfo = model.heroInfo;
         var _loc14_:StcNpcVo = StcMgr.ins.getNpcVo(model.heroInfo.baseInfo.baseId);
         var _loc13_:Array = HeroInfoUtil.toBasePropList(RoleInfoModel.ins.heroInfo.prop);
         var _loc6_:Array = HeroInfoUtil.getHeroAllSkillVoArr(model.heroInfo.baseInfo);
         list_skill.repeatX = _loc6_.length;
         list_skill.dataSource = _loc6_;
         list_skill.x = box_skill.width - list_skill.width >> 1;
         if(param1)
         {
            _loc9_ = NPCPropConsts.ins.baseProp5List.length;
            _loc10_ = 0;
            while(_loc10_ < _loc9_)
            {
               _loc8_ = NPCPropConsts.ins.baseProp5List[_loc10_];
               _loc11_ = NPCPropConsts.ins.getProtobufPropertyName(_loc8_);
               _loc2_ = this.list_propBase.getCell(_loc10_) as NpcPropRender;
               _loc7_ = 0;
               if(_loc2_.vo)
               {
                  _loc7_ = _loc2_.vo.value;
               }
               _loc4_ = RoleInfoModel.ins.heroInfo.prop[_loc11_];
               _loc12_ = _loc4_ - _loc7_;
               if(_loc12_ != 0)
               {
                  AlertUtil.showPropChangeTip(LocaleMgr.ins.getStr(2000 + _loc8_),_loc12_,new Handler(alertFloatCpl,[_loc2_,_loc8_]),DisplayUtils.globarCenter(_loc2_),DisplayUtils.globarCenter(this).add(new Point(0,-50)));
               }
               _loc10_++;
            }
         }
         else
         {
            this.list_propBase.dataSource = _loc13_;
         }
         if(!Uint64Util.equal(_nowSelectedId,model.heroInfo.baseInfo.id))
         {
            refreshRoleData(model.heroInfo);
            _nowSelectedId = Uint64Util.clone(model.heroInfo.baseInfo.id);
            disposeMengYuePanel();
            disposeDetailPropPanel();
            disposeEquipSelectPanel();
         }
         var _loc3_:HeroBaseInfo = model.heroInfo.baseInfo;
         var _loc5_:StcNpcVo = StcMgr.ins.getNpcVo(_loc3_.baseId);
         if(!RoleInfoModel.ins.updateYuanFenDataAfterEffect)
         {
            updateYuanFenData();
         }
         showTupoRedPoint();
      }
      
      private function showTupoRedPoint() : void
      {
         if(RoleTupoUtil.needShowRedPoint(model.heroInfo,false) || RoleLevelUpUtil.checkNeedPromptLevelUp(model.heroInfo.baseInfo))
         {
            return;
         }
      }
      
      private function alertFloatCpl(param1:NpcPropRender, param2:int) : void
      {
         if(this.isDisposed)
         {
            return;
         }
         var _loc3_:String = NPCPropConsts.ins.getProtobufPropertyName(param2);
         param1.vo = new NpcPropVo(param2,int(RoleInfoModel.ins.heroInfo.prop[_loc3_]));
         this.list_propBase.dataSource = HeroInfoUtil.toBasePropList(RoleInfoModel.ins.heroInfo.prop);
         return;
         §§push(new FloatZoomInEffCtrl(param1.ref_txt_value));
      }
      
      private function updateYuanFenData() : void
      {
         var _loc1_:Array = MengYuePropVo.idArrToVoArr(HeroInfoUtil.getNodeId(model.heroInfo.baseInfo.baseId),model.heroInfo.baseInfo.mengyue);
         _loc1_.sort(YuanFenUtil.sortYuanfen);
         list_YuanFen.dataSource = _loc1_;
      }
      
      public function set layer3dRef(param1:UIPanel3D) : void
      {
      }
      
      private function refreshRoleData(param1:HeroInfo) : void
      {
         var _loc2_:int = param1.baseInfo.mengyue.length;
      }
      
      private function updateTreasuerInfo() : void
      {
         var _loc1_:Array = RoleTeamUtil.toEquipBaoWuVoArr(model.heroInfo.baowu,0,model.heroInfo.baseInfo.baseId);
         list_treasure.dataSource = _loc1_;
      }
      
      private function list_equip_mouseHandler(param1:MouseEvent, param2:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = 0;
         var _loc5_:* = null;
         if(param1.type == "click")
         {
            _loc3_ = list_equip.getItem(param2) as HeroEquipVo;
            _loc4_ = uint(_loc3_.place);
            equipingItem = ArrayUtil.findByAttr(model.heroInfo.items,Item.PLACE.name,_loc4_);
            _loc5_ = list_equip.getCell(param2);
            selectedRender = _loc5_;
            selectedVO = _loc3_;
            if(equipingItem)
            {
               showTipMenue(new EquipHeroPosVo(model.heroInfo.baseInfo.id,_loc3_.place,_loc3_.wealthVo != null,swapEquipHandler),false,_loc3_.wealthVo);
            }
            else
            {
               showSelectEquipPanel(_loc5_,_loc3_);
            }
         }
      }
      
      private function list_treasreMouseHandelr(param1:MouseEvent, param2:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = 0;
         var _loc5_:* = null;
         if(param1.type == "click")
         {
            _loc3_ = list_treasure.getItem(param2) as HeroEquipVo;
            _loc4_ = uint(_loc3_.place);
            if(_loc3_.wealthVo)
            {
               equipingTreasure = _loc3_.wealthVo.treasure;
            }
            else
            {
               equipingTreasure = null;
            }
            _loc5_ = list_treasure.getCell(param2);
            selectedRender = _loc5_;
            selectedVO = _loc3_;
            if(_loc3_.wealthVo && _loc3_.wealthVo.treasure)
            {
               showTipMenue(new EquipHeroPosVo(model.heroInfo.baseInfo.id,_loc3_.place,_loc3_.wealthVo != null,swapEquipHandler),true,_loc3_.wealthVo);
            }
            else if(TreasureModel.ins.hasTreasureInBg(_loc3_.place))
            {
               showSelectEquipPanel(_loc5_,_loc3_,2);
            }
            else
            {
               ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.TREASURE_LESS_ID)),30810);
            }
         }
      }
      
      private function swapEquipHandler() : void
      {
         var _loc1_:* = null;
         if(selectedRender.dataSource is HeroEquipVo)
         {
            _loc1_ = selectedRender.dataSource as HeroEquipVo;
            if(_loc1_.place > 5)
            {
               showSelectEquipPanel(selectedRender,selectedVO,2);
            }
            else if(_loc1_.place > 0)
            {
               showSelectEquipPanel(selectedRender,selectedVO,1);
            }
         }
         else if(selectedRender.dataSource is PetInfoVo)
         {
            showSelectEquipPanel(selectedRender,selectedVO,3);
         }
      }
      
      private function showSelectEquipPanel(param1:Component, param2:HeroEquipVo, param3:int = 1) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         if(param3 == 1 && !BagModel.ins.hasEquipInBg(param2.place))
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.EQUIP_LESS_ID_PREFIX) + param2.place),30810);
            return;
         }
         if(param3 == 2 && !TreasureModel.ins.hasTreasureInBg(param2.place))
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.TREASURE_LESS_ID)),30810);
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
            this.disposeMengYuePanel();
            this.disposeDetailPropPanel();
            _loc4_ = DisplayUtils.localToTarget(param1,this.parent.parent);
            _loc4_.x = _loc4_.x + param1.width / 2;
            equipSelect = new RoleSelectEquipPanel();
            this.equipSelect.addEventListener("close",disposeEquipSelectPanel);
            if(param3 == 1)
            {
               equipSelect.panelBg.titleImgId = 30101;
            }
            else if(param3 == 2)
            {
               equipSelect.panelBg.titleImgId = 30102;
            }
            else if(param3 == 3)
            {
               equipSelect.panelBg.titleImgId = 32031;
            }
            this.parent.parent.addChild(equipSelect);
            this.equipSelect.x = _loc4_.x - this.equipSelect.width / 2;
            _loc5_ = localToGlobal(_loc4_).y + this.equipSelect.height;
            if(_loc5_ > stage.stageHeight - EnvConfig.ins.shellY)
            {
               this.equipSelect.y = _loc4_.y + 70 - (_loc5_ - stage.stageHeight - EnvConfig.ins.shellY);
            }
            else
            {
               this.equipSelect.y = _loc4_.y + 70;
            }
            if(param3 == 3)
            {
               this.equipSelect.show(new EquipPetVo(model.heroInfo.baseInfo.id,model.heroInfo.baseInfo.position),param1,1.3);
            }
            else
            {
               this.equipSelect.show(new EquipHeroPosVo(model.heroInfo.baseInfo.id,param2.place,param2 && param2.wealthVo != null),param1,1.3);
            }
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["msgRoleInfo_ChangeEquip","msg_role_info_change_mengyue","msg_role_info_change_treasure","msg_role_info_show_change_equip_panel","role_team_notice_select_new_member","role_team_show_select_team_member_panel","ROLE_TEAM_CLOSE_SELECT_TEAM_MEMBER_PANEL","msg_role_info_change_pet","acc_make_cpl","MSG_SWITCH_MODULE_REN_POINT"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if("msgRoleInfo_ChangeEquip" !== _loc4_)
         {
            if("msg_role_info_change_treasure" !== _loc4_)
            {
               if("msg_role_info_change_pet" !== _loc4_)
               {
                  if("msg_role_info_change_mengyue" !== _loc4_)
                  {
                     if("msg_role_info_show_change_equip_panel" !== _loc4_)
                     {
                        if("role_team_notice_select_new_member" !== _loc4_)
                        {
                           if("role_team_show_select_team_member_panel" !== _loc4_)
                           {
                              if("ROLE_TEAM_CLOSE_SELECT_TEAM_MEMBER_PANEL" !== _loc4_)
                              {
                                 if("acc_make_cpl" !== _loc4_)
                                 {
                                    if("MSG_SWITCH_MODULE_REN_POINT" === _loc4_)
                                    {
                                       _loc3_ = param2 as SwitchModuleRedPointMsg;
                                       if(_loc3_.moduleId == 31200)
                                       {
                                          refreshFashionRedPoint();
                                       }
                                    }
                                 }
                                 else
                                 {
                                    refreshFashionRedPoint();
                                 }
                              }
                              else
                              {
                                 disposeSelectTeamMemberPanel();
                              }
                           }
                           else
                           {
                              showSelectTeamMemberPanel();
                           }
                        }
                        else
                        {
                           selectNewHeroHandler(param2);
                        }
                     }
                     else
                     {
                        showSelectEquipPanel(param2[0],param2[1],param2[2]);
                     }
                  }
                  else
                  {
                     showMengYueFloatEffect(param2);
                  }
               }
               else
               {
                  onPetChange(param2[0]);
               }
            }
            else
            {
               onTreasureChange(param2[0]);
            }
         }
         else
         {
            onEquipChange(param2[0]);
         }
      }
      
      private function selectNewHeroHandler(param1:UInt64) : void
      {
         RoleTeamModel.ins.selectedHeroId = param1;
         RoleTeamService.ins.changeTeamMember(RoleTeamModel.ins.selectedPos,param1);
         disposeSelectTeamMemberPanel();
      }
      
      private function showMengYueFloatEffect(param1:*) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         if(param1 != null)
         {
            _loc3_ = param1 as MengYueEffectVo;
            _loc2_ = MengYuePropVo.idArrToVoArr(HeroInfoUtil.getNodeId(model.heroInfo.baseInfo.baseId),model.heroInfo.baseInfo.mengyue);
            _loc2_.sort(YuanFenUtil.sortYuanfen);
            _loc4_ = ArrayUtil.indexByAttr(_loc2_,"mengYueId",_loc3_.mengYueId);
            _loc5_ = list_YuanFen.getCell(_loc4_);
            if(_loc5_ != null)
            {
               AlertUtil.float(TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30100011,[TextFieldUtil.htmlText(_loc3_.getMengYueName(),new TextFormat(null,null,16046112))]),new TextFormat(null,19,458496)) + "\n" + TextFieldUtil.htmlText(_loc3_.getMengYueDesc(),new TextFormat(null,18,458496)),this.localToGlobal(new Point(this.width / 2,this.height / 2)),-1,new Handler(onFLoatEffectCpl),_loc5_.localToGlobal(new Point(10,_loc5_.height / 2)),1);
            }
            else
            {
               onFLoatEffectCpl();
            }
         }
      }
      
      private function onFLoatEffectCpl() : void
      {
         RoleInfoModel.ins.updateYuanFenDataAfterEffect = false;
         updateYuanFenData();
      }
      
      private function showMenyueEffect() : void
      {
         mengYueEffect = new BmcS1();
         mengYueEffect.mouseChildren = false;
         mengYueEffect.mouseEnabled = false;
         parent.parent.addChild(mengYueEffect);
         mengYueEffect.x = this.parent.x + 333;
         mengYueEffect.y = this.parent.y + 400;
         mengYueEffect.init(1130,1,false);
         refreshRoleData(model.heroInfo);
      }
      
      private function showDetialPropPanel() : void
      {
         if(detailPropPanel)
         {
            this.disposeDetailPropPanel();
         }
         else
         {
            disposeMengYuePanel();
            disposeEquipSelectPanel();
            detailPropPanel = new RoleDetailPropPanel();
            detailPropPanel.x = 442;
            detailPropPanel.y = 75;
            parent.parent.addChild(detailPropPanel);
            detailPropPanel.show(RoleInfoModel.ins.heroInfo);
            detailPropPanel.addEventListener("close",disposeDetailPropPanel);
            detailPropPanel.panelFadeIn();
         }
      }
      
      private function disposeDetailPropPanel(... rest) : void
      {
         if(detailPropPanel)
         {
            detailPropPanel.removeEventListener("close",disposeDetailPropPanel);
            detailPropPanel.panelFadeOutAndDispose();
            detailPropPanel = null;
         }
      }
      
      private function onEquipChange(param1:EquipChangeReq) : void
      {
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         if(RoleTeamModel.ins.blockFloatMsg && !ModuleMgr.ins.isShow(30500) && !ModuleMgr.ins.isShow(30600) && !ModuleMgr.ins.isShow(30100))
         {
            RoleTeamModel.ins.blockFloatMsg = false;
         }
         if(RoleTeamModel.ins.blockFloatMsg)
         {
            return;
         }
         if(Uint64Util.isZero(param1.item))
         {
            if(detailPropPanel)
            {
               detailPropPanel.show(RoleInfoModel.ins.heroInfo);
            }
         }
         else
         {
            SoundMgr.ins.playTexiaoSound("change_tab");
            _loc5_ = BagModel.ins.getItemById(param1.item);
            _loc5_.place = param1.place;
            _loc5_.isEquiped = true;
         }
         if(equipingItem != null)
         {
            equipingItem.isEquiped = false;
            equipingItem.suit = [];
            BagModel.ins.add([equipingItem]);
            equipingItem = null;
         }
         if(_loc5_)
         {
            _loc2_ = new ItemReduce();
            _loc2_.id = _loc5_.id;
            _loc2_.count = 1;
            QuickUseModel.ins.removeQuickUseById(_loc5_.id);
            BagModel.ins.reduce([_loc2_]);
         }
         if(Uint64Util.equal(model.heroInfo.baseInfo.id,param1.hero))
         {
            _loc4_ = ArrayUtil.indexByAttr(list_equip.array,"place",param1.place);
            _loc3_ = list_equip.getItem(_loc4_) as HeroEquipVo;
            if(_loc5_)
            {
               list_equip.getCell(_loc4_).addChild(getWeareEquipEffect());
               _loc3_.wealthVo = WealthUtil.itemToVo(_loc5_);
               _loc3_.wealthVo.extraData = model.heroInfo.baseInfo.baseId;
            }
            else
            {
               _loc3_.wealthVo = null;
            }
            list_equip.refreshItem(_loc4_);
         }
      }
      
      private function onPetChange(param1:UInt64) : void
      {
         if(RoleTeamModel.ins.blockFloatMsg && !ModuleMgr.ins.isShow(30500) && !ModuleMgr.ins.isShow(30600) && !ModuleMgr.ins.isShow(30810))
         {
            RoleTeamModel.ins.blockFloatMsg = false;
         }
         if(RoleTeamModel.ins.blockFloatMsg)
         {
            return;
         }
      }
      
      private function getWeareEquipEffect(param1:Number = 1) : BmcSpriteSheet
      {
         if(!wareEquipEffect)
         {
            wareEquipEffect = new BmcSpriteSheet();
         }
         wareEquipEffect.x = -31;
         wareEquipEffect.y = -27;
         wareEquipEffect.scale = param1;
         wareEquipEffect.init(1060);
         return wareEquipEffect;
      }
      
      private function onTreasureChange(param1:int) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(RoleTeamModel.ins.blockFloatMsg && !ModuleMgr.ins.isShow(30500) && !ModuleMgr.ins.isShow(30600) && !ModuleMgr.ins.isShow(30100))
         {
            RoleTeamModel.ins.blockFloatMsg = false;
         }
         if(RoleTeamModel.ins.blockFloatMsg)
         {
            return;
         }
         var _loc4_:Array = RoleTeamUtil.toEquipBaoWuVoArr(model.heroInfo.baowu,0,model.heroInfo.baseInfo.baseId);
         list_treasure.dataSource = _loc4_;
         if(param1 == 8)
         {
            _loc2_ = list_treasure.getCell(0);
            _loc3_ = (_loc4_[0] as HeroEquipVo).wealthVo;
         }
         else
         {
            _loc2_ = list_treasure.getCell(1);
            _loc3_ = (_loc4_[1] as HeroEquipVo).wealthVo;
         }
         if(_loc3_ && _loc3_.treasure)
         {
            SoundMgr.ins.playTexiaoSound("change_tab");
            _loc2_.addChild(getWeareEquipEffect());
            _loc3_.extraData = model.heroInfo.baseInfo.baseId;
            TreasureModel.ins.updateTreasureData(_loc3_.treasure,2);
         }
         if(equipingTreasure)
         {
            TreasureModel.ins.updateTreasureData(equipingTreasure,1);
            equipingTreasure = null;
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
      
      override public function dispose() : void
      {
         disposeMengYuePanel();
         disposeDetailPropPanel();
         disposeEquipSelectPanel();
         ObserverMgr.ins.unregObserver(this);
         if(FashionModel.ins.newFashionArr.length > 0)
         {
            FashionModel.ins.newFashionArr = new Vector.<uint>();
         }
         super.dispose();
      }
   }
}
