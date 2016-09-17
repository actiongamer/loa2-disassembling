package nslm2.modules.roleInfos.equipPanels
{
   import game.ui.roleInfos.equipPanels.RoleEquipPanelUI;
   import nslm2.modules.roleInfos.commons.IRoleSubPanel;
   import com.mz.core.interFace.IObserver;
   import com.mz.core.interFace.IViewStackPage;
   import com.netease.protobuf.UInt64;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import game.ui.roleInfos.equipPanels.RoleEquipSubBarUI;
   import morn.core.components.View;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import flash.events.Event;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.tooltipsModules.TooltipNpcSkillVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import flash.events.MouseEvent;
   import morn.core.components.Component;
   import nslm2.common.vo.WealthVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.tipMenus.TipMenuMsg;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.common.consts.NPCPropConsts;
   import morn.customs.components.NpcPropRender;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.handlers.Handler;
   import com.mz.core.utils.DisplayUtils;
   import flash.geom.Point;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.Uint64Util;
   import proto.HeroBaseInfo;
   import nslm2.mgrs.skins.ColorLib;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.compsEffects.FloatZoomInEffCtrl;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import proto.HeroInfo;
   import com.mz.core.utils.ArrayUtil;
   import proto.Item;
   import nslm2.utils.WealthUtil;
   import proto.BaoWu;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import nslm2.common.ui.components.comps2d.BmcS1;
   import proto.EquipChangeReq;
   import nslm2.mgrs.SoundMgr;
   import proto.ItemReduce;
   import nslm2.modules.footstones.quickUseModules.QuickUseModel;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import com.mz.core.mediators.RollMediator;
   
   public class RoleEquipPanel extends RoleEquipPanelUI implements IRoleSubPanel, IObserver, IViewStackPage
   {
      
      public static var placeArr:Array = [1,3,2,4];
      
      public static var baowuPlaceArr:Array = [8,9];
       
      
      private var _nowSelectedId:UInt64;
      
      public var model:RoleInfoModel;
      
      public var equipSelect:nslm2.modules.roleInfos.equipPanels.RoleSelectEquipPanel;
      
      public var subBar:RoleEquipSubBarUI;
      
      private var wareEquipEffect:BmcSpriteSheet;
      
      private var mengYuePanel:nslm2.modules.roleInfos.equipPanels.RoleMengYuePanel;
      
      private var skillInfoPanel:nslm2.modules.roleInfos.equipPanels.SkillInfoPanel;
      
      private var equipingItem:Item;
      
      private var equipingTreasure:BaoWu;
      
      private var selectedRender:Component;
      
      private var selectedVO:nslm2.modules.roleInfos.equipPanels.HeroEquipVo;
      
      private var equipSelectRender:Component;
      
      private var mengYueEffect:BmcS1;
      
      private var detailPropPanel:nslm2.modules.roleInfos.equipPanels.RoleDetailPropPanel;
      
      public function RoleEquipPanel()
      {
         model = RoleInfoModel.ins;
         subBar = new RoleEquipSubBarUI();
         super();
         list_equip.itemRender = RoleEquipRender;
         ObserverMgr.ins.regObserver(this);
         list_equip.useMouseDown = false;
         list_equip.mouseHandler = list_equip_mouseHandler;
         list_treasure.mouseHandler = list_treasreMouseHandelr;
         this.parts.push(new RollMediator(box_yuanfen,showMengYuePanel));
         BmcSpriteSheet.preload(new <int>[1060,1150]);
         linkBtn_detail.clickHandler = showDetialPropPanel;
         btn_equip.clickHandler = showEquipModule;
         btn_skill.addEventListener("click",btn_skill_handler);
         var _loc1_:StcNpcVo = StcMgr.ins.getNpcVo(model.heroInfo.baseInfo.baseId);
         if(_loc1_ && _loc1_.group)
         {
            img_group.toolTip = LocaleMgr.ins.getStr(30100310 + _loc1_.group);
         }
         else
         {
            img_group.toolTip = null;
         }
         lvlRender.toolTip = LocaleMgr.ins.getStr(30100997);
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         refreshRoleData(model.heroInfo);
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
      
      private function btn_skill_mouseDown(param1:Event) : void
      {
         param1.stopPropagation();
      }
      
      private function btn_skill_handler(param1:Event) : void
      {
         param1.stopPropagation();
         if(skillInfoPanel)
         {
            disposeSkillInfoPanel();
         }
         else
         {
            disposeEquipSelectPanel();
            skillInfoPanel = new nslm2.modules.roleInfos.equipPanels.SkillInfoPanel();
            skillInfoPanel.x = 438;
            skillInfoPanel.y = 148;
            parent.parent.addChild(skillInfoPanel);
            skillInfoPanel.show(model.getHeroSkillDataArr());
            skillInfoPanel.addEventListener("close",disposeSkillInfoPanel);
            skillInfoPanel.panelFadeIn();
         }
      }
      
      private function disposeSkillInfoPanel(... rest) : void
      {
         if(skillInfoPanel)
         {
            skillInfoPanel.removeEventListener("close",disposeSkillInfoPanel);
            skillInfoPanel.panelFadeOutAndDispose();
            skillInfoPanel = null;
         }
      }
      
      private function showEquipModule() : void
      {
         ModuleMgr.ins.showModule(30500);
      }
      
      private function getSkillToolTip() : TooltipNpcSkillVo
      {
         var _loc2_:TooltipNpcSkillVo = new TooltipNpcSkillVo();
         var _loc1_:StcNpcVo = StcMgr.ins.getNpcVo(model.heroInfo.baseInfo.baseId);
         _loc2_.npcVO = _loc1_;
         _loc2_.skillID = model.heroInfo.baseInfo.skill;
         return _loc2_;
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
            mengYuePanel = new nslm2.modules.roleInfos.equipPanels.RoleMengYuePanel();
            parent.parent.addChild(mengYuePanel);
            mengYuePanel.updateMengYueData(MengYuePropVo.idArrToVoArr(HeroInfoUtil.getNodeId(model.heroInfo.baseInfo.baseId),model.heroInfo.baseInfo.mengyue));
            mengYuePanel.x = 735 - mengYuePanel.img_bg2.width;
            mengYuePanel.y = 438 - mengYuePanel.img_bg2.height;
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
      
      protected function baowuClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:nslm2.modules.roleInfos.equipPanels.HeroEquipVo = (param1.target as Component).dataSource as nslm2.modules.roleInfos.equipPanels.HeroEquipVo;
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
         }
         else
         {
            _loc4_ = 103;
         }
         ObserverMgr.ins.sendNotice("MSG_TIP_MENU_SHOW",new TipMenuMsg(_loc4_,param1));
      }
      
      public function show(param1:Boolean = false) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc7_:int = 0;
         var _loc10_:* = null;
         var _loc2_:* = null;
         var _loc6_:int = 0;
         var _loc4_:int = 0;
         var _loc11_:int = 0;
         list_equip.dataSource = toEquipVoArr(model.heroInfo.items);
         updateTreasuerInfo();
         var _loc13_:StcNpcVo = StcMgr.ins.getNpcVo(model.heroInfo.baseInfo.baseId);
         var _loc12_:Array = HeroInfoUtil.toBasePropList(RoleInfoModel.ins.heroInfo.prop);
         if(_loc13_.group)
         {
            img_group.url = UrlLib.npcGroupImg(_loc13_.group);
            img_group.visible = true;
         }
         else
         {
            img_group.visible = false;
         }
         if(_loc13_.career_id)
         {
            img_type.url = UrlLib.npcTypeImg(_loc13_.career_id);
         }
         _loc12_.unshift(null);
         if(param1)
         {
            _loc8_ = NPCPropConsts.ins.baseProp5List.length;
            _loc9_ = 0;
            while(_loc9_ < _loc8_)
            {
               _loc7_ = NPCPropConsts.ins.baseProp5List[_loc9_];
               _loc10_ = NPCPropConsts.ins.getProtobufPropertyName(_loc7_);
               _loc2_ = this.list_propBase.getCell(_loc9_ + 1) as NpcPropRender;
               _loc6_ = _loc2_.vo.value;
               _loc4_ = RoleInfoModel.ins.heroInfo.prop[_loc10_];
               _loc11_ = _loc4_ - _loc6_;
               if(_loc11_ != 0)
               {
                  AlertUtil.showPropChangeTip(LocaleMgr.ins.getStr(2000 + _loc7_),_loc11_,new Handler(alertFloatCpl,[_loc2_,_loc7_]),DisplayUtils.globarCenter(_loc2_),DisplayUtils.globarCenter(this).add(new Point(0,-50)));
               }
               _loc9_++;
            }
         }
         else
         {
            this.list_propBase.dataSource = _loc12_;
         }
         lvlRender.txt_name.text = LocaleMgr.ins.getStr(10000015) + "：";
         lvlRender.txt_value.text = model.heroInfo.baseInfo.level + "/" + PlayerModel.ins.level;
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
         this.txt_Name.color = ColorLib.qualityColor(_loc5_.quality);
         this.txt_Name.text = HeroInfoUtil.getNameHasTupoLevel(_loc3_.baseId);
         if(!RoleInfoModel.ins.updateYuanFenDataAfterEffect)
         {
            updateYuanFenData();
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
         return;
         §§push(new FloatZoomInEffCtrl(param1.ref_txt_value));
      }
      
      private function updateYuanFenData() : void
      {
         var _loc1_:Array = MengYuePropVo.idArrToVoArr(HeroInfoUtil.getNodeId(model.heroInfo.baseInfo.baseId),model.heroInfo.baseInfo.mengyue);
         _loc1_.sort(sortYuanfen);
         list_YuanFen.dataSource = _loc1_;
      }
      
      public function set layer3dRef(param1:UIPanel3D) : void
      {
      }
      
      private function sortYuanfen(param1:MengYuePropVo, param2:MengYuePropVo) : int
      {
         if(param1.isActivate && param2.isActivate)
         {
            if(param1.mengYueId > param2.mengYueId)
            {
               return 1;
            }
            return -1;
         }
         if(param1.isActivate)
         {
            return -1;
         }
         if(param2.isActivate)
         {
            return 1;
         }
         if(param1.mengYueId > param2.mengYueId)
         {
            return 1;
         }
         return -1;
      }
      
      private function refreshRoleData(param1:HeroInfo) : void
      {
         var _loc2_:int = param1.baseInfo.mengyue.length;
      }
      
      private function updateTreasuerInfo() : void
      {
         var _loc1_:Array = toEquipBaoWuVoArr(model.heroInfo.baowu);
         list_treasure.dataSource = _loc1_;
      }
      
      private function toEquipVoArr(param1:Array) : Array
      {
         var _loc6_:int = 0;
         var _loc3_:* = null;
         var _loc5_:* = null;
         if(param1 == null)
         {
            param1 = [];
         }
         var _loc2_:Array = [];
         var _loc4_:int = placeArr.length;
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc3_ = new nslm2.modules.roleInfos.equipPanels.HeroEquipVo();
            _loc3_.place = placeArr[_loc6_];
            _loc5_ = ArrayUtil.findByAttr(param1,Item.PLACE.name,_loc3_.place);
            if(_loc5_)
            {
               _loc3_.wealthVo = WealthUtil.itemToVo(_loc5_);
            }
            _loc2_.push(_loc3_);
            _loc6_++;
         }
         return _loc2_;
      }
      
      private function toEquipBaoWuVoArr(param1:Array) : Array
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc3_:* = null;
         if(param1 == null)
         {
            param1 = [];
         }
         var _loc2_:Array = [];
         var _loc5_:int = baowuPlaceArr.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = new nslm2.modules.roleInfos.equipPanels.HeroEquipVo();
            _loc4_.place = baowuPlaceArr[_loc6_];
            _loc3_ = getTreauseByPos(param1,_loc4_.place);
            if(_loc3_)
            {
               _loc4_.wealthVo = WealthUtil.treasureToVo(_loc3_);
            }
            _loc2_.push(_loc4_);
            _loc6_++;
         }
         return _loc2_;
      }
      
      private function getTreauseByPos(param1:Array, param2:int) : BaoWu
      {
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:* = param1;
         for each(var _loc3_ in param1)
         {
            _loc4_ = StcMgr.ins.getItemVo(_loc3_.baseId).kind;
            if(_loc4_ == param2)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      private function list_equip_mouseHandler(param1:MouseEvent, param2:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = 0;
         var _loc5_:* = null;
         if(param1.type == "click")
         {
            _loc3_ = list_equip.getItem(param2) as nslm2.modules.roleInfos.equipPanels.HeroEquipVo;
            _loc4_ = uint(_loc3_.place);
            equipingItem = ArrayUtil.findByAttr(model.heroInfo.items,Item.PLACE.name,_loc4_);
            _loc5_ = list_equip.getCell(param2);
            selectedRender = _loc5_;
            selectedVO = _loc3_;
            if(equipingItem)
            {
               showTipMenue(new EquipHeroPosVo(model.heroInfo.baseInfo.id,_loc3_.place,_loc3_.wealthVo != null,swapEquipHandler),false,_loc3_.wealthVo);
            }
            else if(BagModel.ins.hasEquipInBg(_loc3_.place))
            {
               showSelectEquipPanel(_loc5_,_loc3_);
            }
            else
            {
               ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.EQUIP_LESS_ID)),30100);
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
            _loc3_ = list_treasure.getItem(param2) as nslm2.modules.roleInfos.equipPanels.HeroEquipVo;
            _loc4_ = uint(_loc3_.place);
            if(_loc3_.wealthVo)
            {
               equipingTreasure = _loc3_.wealthVo.treasure;
            }
            _loc5_ = list_treasure.getCell(param2);
            selectedRender = _loc5_;
            selectedVO = _loc3_;
            if(_loc3_.wealthVo && _loc3_.wealthVo.treasure)
            {
               showTipMenue(new EquipHeroPosVo(model.heroInfo.baseInfo.id,_loc3_.place,_loc3_.wealthVo != null,swapEquipHandler),true);
            }
            else
            {
               showSelectEquipPanel(_loc5_,_loc3_,2);
            }
         }
      }
      
      private function swapEquipHandler() : void
      {
         showSelectEquipPanel(selectedRender,selectedVO);
      }
      
      private function showSelectEquipPanel(param1:Component, param2:nslm2.modules.roleInfos.equipPanels.HeroEquipVo, param3:int = 1) : void
      {
         var _loc4_:* = null;
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
            equipSelect = new nslm2.modules.roleInfos.equipPanels.RoleSelectEquipPanel();
            this.equipSelect.addEventListener("close",disposeEquipSelectPanel);
            if(param3 == 1)
            {
               equipSelect.panelBg.titleImgId = 30101;
            }
            else
            {
               equipSelect.panelBg.titleImgId = 30102;
            }
            this.parent.parent.addChild(equipSelect);
            this.equipSelect.x = _loc4_.x - this.equipSelect.width / 2;
            this.equipSelect.y = _loc4_.y + 70;
            this.equipSelect.show(new EquipHeroPosVo(model.heroInfo.baseInfo.id,param2.place,param2.wealthVo != null),param1,1.1);
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["msgRoleInfo_ChangeEquip","msg_role_info_change_mengyue","msg_role_info_change_treasure","msg_role_info_show_change_equip_panel"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("msgRoleInfo_ChangeEquip" !== _loc3_)
         {
            if("msg_role_info_change_treasure" !== _loc3_)
            {
               if("msg_role_info_change_mengyue" !== _loc3_)
               {
                  if("msg_role_info_show_change_equip_panel" === _loc3_)
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
               onTreasureChange(param2[0]);
            }
         }
         else
         {
            onEquipChange(param2[0]);
         }
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
            _loc2_.sort(sortYuanfen);
            _loc4_ = ArrayUtil.indexByAttr(_loc2_,"mengYueId",_loc3_.mengYueId);
            _loc5_ = list_YuanFen.getCell(_loc4_);
            if(_loc5_ != null)
            {
               AlertUtil.float(TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30100011,[TextFieldUtil.htmlText(_loc3_.getMengYueName(),new TextFormat(null,null,16046112))]),new TextFormat(null,16,458496)),this.localToGlobal(new Point(this.width / 2,this.height / 2)),-1,new Handler(onFLoatEffectCpl),_loc5_.localToGlobal(new Point(10,_loc5_.height / 2)),1);
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
            detailPropPanel = new nslm2.modules.roleInfos.equipPanels.RoleDetailPropPanel();
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
         if(Uint64Util.toNumber(param1.item) == 0)
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
            _loc5_.isEquiped = true;
         }
         if(equipingItem != null)
         {
            equipingItem.isEquiped = false;
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
            _loc3_ = list_equip.getItem(_loc4_) as nslm2.modules.roleInfos.equipPanels.HeroEquipVo;
            if(_loc5_)
            {
               if(!wareEquipEffect)
               {
                  wareEquipEffect = new BmcSpriteSheet();
               }
               wareEquipEffect.x = -38;
               wareEquipEffect.y = -40;
               list_equip.getCell(_loc4_).addChild(wareEquipEffect);
               wareEquipEffect.init(1060);
               _loc3_.wealthVo = WealthUtil.itemToVo(_loc5_);
            }
            else
            {
               _loc3_.wealthVo = null;
            }
            list_equip.refreshItem(_loc4_);
         }
      }
      
      private function onTreasureChange(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc5_:Array = toEquipBaoWuVoArr(model.heroInfo.baowu);
         list_treasure.dataSource = _loc5_;
         if(_loc3_ && _loc3_.treasure)
         {
            SoundMgr.ins.playTexiaoSound("change_tab");
            if(!wareEquipEffect)
            {
               wareEquipEffect = new BmcSpriteSheet();
            }
            wareEquipEffect.x = -30;
            wareEquipEffect.y = -42;
            wareEquipEffect.init(1060);
            _loc2_.addChild(wareEquipEffect);
            TreasureModel.ins.reduceArr([_loc3_.treasure.id]);
         }
         if(equipingTreasure)
         {
            TreasureModel.ins.addArr([equipingTreasure]);
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
         super.dispose();
      }
   }
}
