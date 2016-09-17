package nslm2.modules.cultivates.pet
{
   import game.ui.petModule.PetSkinModuleUI;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import nslm2.modules.scenes.commons.UIUnit3D;
   import nslm2.modules.cultivates.pet.service.PetService;
   import nslm2.modules.cultivates.pet.view.render.PetSkinEquipRender;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import com.mz.core.utils.DisplayUtils;
   import com.mz.core.event.MzEvent;
   import flash.events.MouseEvent;
   import nslm2.modules.cultivates.fashion.FashionEffectVO;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.vos.StcPetStatusVo;
   import nslm2.modules.cultivates.pet.consts.PetConsts;
   import flash.events.Event;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.common.uiEffects.IconFlyEff;
   import morn.core.components.Image;
   import com.mz.core.utils.FilterUtil;
   import morn.core.handlers.Handler;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.utils.ArrayUtil;
   import game.ui.roleInfos.NpcPropVo;
   import flash.geom.Point;
   import game.ui.roleInfos.NpcProp2Vo;
   import proto.PetInfo;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import nslm2.modules.cultivates.pet.view.render.PetSkinPropTwoRender;
   
   public class PetSkinModule extends PetSkinModuleUI
   {
       
      
      private var petModel:PetModel;
      
      private var panel3D:UIPanel3D;
      
      private var avatar:UIUnit3D;
      
      public var _clothSelectedId:int;
      
      private var _effectIsShowingArr:Array;
      
      private var service:PetService;
      
      private var stcStatusArr:Array;
      
      public function PetSkinModule()
      {
         petModel = PetModel.ins;
         _effectIsShowingArr = [];
         service = PetService.ins;
         super();
         this.list_fashionProp.itemRender = PetSkinPropTwoRender;
      }
      
      public function get skinRender() : PetSkinEquipRender
      {
         return this.skinRenderRef as PetSkinEquipRender;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         (petSelectPanel.pageBarUI as IPageBar).bindList(petSelectPanel.list_pet);
         petSelectPanel.list_pet.dataSource = petModel.activatedPetArr;
         petSelectPanel.list_pet.selectHandler = changeSelectdPetHandler;
         petSelectPanel.list_pet.selectedIndex = petModel.activatedPetArr.indexOf(petModel.crtPetInfoVo);
         this.panelBg.titleImgId = this.moduleId;
         panel3D = new UIPanel3D(this);
         DisplayUtils.addChildAbove(panel3D,this.img_bg);
         panel3D.initByImage(img_bg,this.panelBg);
         panel3D.visible = false;
         avatar = new UIUnit3D();
         panel3D.addChild3D(avatar);
         refresh();
         super.preShowCpl();
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            this.skinRender.box_wealth.addEventListener("click",onClothClick);
            this.petModel.addEventListener("evtFashionUsingChange",serviceHandler);
            this.petModel.addEventListener("evtActivateCpl",onActivateCpl);
         }
         else
         {
            this.skinRender.removeEventListener("click",onClothClick);
            this.petModel.removeEventListener("evtFashionUsingChange",serviceHandler);
            this.petModel.removeEventListener("evtActivateCpl",onActivateCpl);
         }
         super.switchEventListeners(param1);
      }
      
      private function onActivateCpl(param1:MzEvent) : void
      {
         refresh(true);
      }
      
      private function onClothClick(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         if(this.skinRender.wealthVo)
         {
            _loc2_ = new FashionEffectVO();
            _loc2_.id = this.skinRender.wealthVo.sid;
            _loc2_.petSkinId = petModel.crtPetId;
            ObserverMgr.ins.sendNotice("evtSkinSelect",_loc2_);
         }
         else if(petModel.hasActivatedSkin())
         {
            AlertUtil.float(LocaleMgr.ins.getStr(51800108));
         }
         else
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(WealthUtil.costStrToVo((stcStatusArr[1] as StcPetStatusVo).item).stcItemVo.get_point)),32032);
            return;
         }
      }
      
      private function serviceHandler(param1:MzEvent) : void
      {
         var _loc2_:* = param1.type;
         if("evtFashionUsingChange" === _loc2_)
         {
            _loc2_ = param1.data[0];
            if("OK" === _loc2_)
            {
               refresh();
            }
         }
      }
      
      private function changeAvatar3D(param1:int, param2:int = 0) : void
      {
         if(this.avatar)
         {
            this.avatar.initByStcNpcId(param1,false,0,param2);
            this.avatar.pos2d = PetConsts.PET_AVATAR_POS_BASE;
            this.avatar.addEventListener("avatar_anim_all_complete",onHouseAvatarAnimAllComplete);
            this.avatar.rotation = -45;
            ObserverMgr.ins.sendNotice("pet_activate");
         }
      }
      
      protected function onHouseAvatarAnimAllComplete(param1:Event) : void
      {
         this.avatar.avatar.avatarMesh.forceRenderWithoutFrustum = true;
         this.avatar.avatar.needUpdateBounds = false;
      }
      
      private function changeSelectdPetHandler() : void
      {
         petModel.crtPetId = petSelectPanel.list_pet.selectedItem.id;
         ObserverMgr.ins.sendNotice("change_selected_pet",petSelectPanel.list_pet.selectedItem.id);
         refresh();
      }
      
      private function showSkinSelectEffect(param1:FashionEffectVO) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         if(param1.petSkinId == petModel.crtPetId && _clothSelectedId % petModel.crtPetId == 1)
         {
            this.showAddProp(false);
            return;
         }
         if(param1.id != WealthUtil.costStrToVo(StcMgr.ins.getPetStatusVo(_clothSelectedId).item).sid)
         {
            _effectIsShowingArr.push(param1.id);
            _loc3_ = IconFlyEff.copyImage(param1.image);
            _loc3_.filters = !!petModel.hasActivatedSkin()?null:[FilterUtil.grayFilter()];
            new IconFlyEff(_loc3_,param1.startPoint,this.skinRender.img_icon).addCompleteHandler(new Handler(clothEffCpl,[param1])).exec();
            petModel.curSkinVo = StcMgr.ins.getPetStatusVo(param1.petSkinId);
         }
         else
         {
            _loc2_ = petModel.initStatus();
            petModel.curSkinVo = StcMgr.ins.getPetStatusVo(_loc2_);
            if((petModel.isActive(param1.petSkinId) || petModel.isUsed(param1.petSkinId)) && petModel.isActive(_clothSelectedId))
            {
               service.clothesWear(_loc2_);
            }
            else
            {
               this._clothSelectedId = !!this.petModel.crtPetInfo?this.petModel.crtPetInfo.status:0;
               this.skinRender.dataSource = this._clothSelectedId == 0?null:petModel.getRenderVo(this._clothSelectedId);
               this.changeAvatar3D(petModel.crtPetId);
               this.showAddProp(false);
            }
         }
      }
      
      override public function show(param1:Object = null) : void
      {
         panel3D.visible = true;
         super.show(param1);
      }
      
      private function clothEffCpl(param1:FashionEffectVO) : void
      {
         this._clothSelectedId = param1.petSkinId;
         this.skinRender.dataSource = this._clothSelectedId == 0?null:petModel.getRenderVo(this._clothSelectedId);
         var _loc2_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc2_.x = this.skinRender.x - 34;
         _loc2_.y = this.skinRender.y - 34;
         _loc2_.init(1060);
         this.addChild(_loc2_);
         if(petModel.isActive(param1.petSkinId) && petModel.crtPetInfo && petModel.crtPetInfo.status != param1.petSkinId)
         {
            service.clothesWear(param1.petSkinId);
         }
         else
         {
            this.showAddProp();
            this.changeAvatar3D(petModel.crtPetId,StcMgr.ins.getPetStatusVo(param1.petSkinId).model);
         }
         ArrayUtil.removeItem(_effectIsShowingArr,param1.id);
      }
      
      private function showAddProp(param1:Boolean = false) : void
      {
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc10_:int = 0;
         var _loc5_:* = null;
         var _loc9_:uint = this.petModel.crtPetInfo.allStatus.length;
         var _loc3_:* = _loc9_;
         var _loc4_:uint = 0;
         if(_clothSelectedId != 0 && !(petModel.isActive(_clothSelectedId) || petModel.isUsed(_clothSelectedId)))
         {
            _loc4_++;
            _loc7_ = NpcPropVo.parseArrStr(StcMgr.ins.getPetStatusVo(_clothSelectedId).attr,"",null,0,true,true);
         }
         this.txt_propTitle.text = LocaleMgr.ins.getStr(32000057,[_loc3_]);
         var _loc2_:Array = NpcPropVo.addProp(_loc7_,[]);
         var _loc6_:Array = petModel.crtPetInfoVo.petSkinPropArr.concat();
         if(param1)
         {
            _loc8_ = _loc6_.length;
            _loc10_ = 0;
            while(_loc10_ < _loc8_)
            {
               _loc5_ = _loc6_[_loc10_];
               if(ModuleMgr.ins.popLayer.curModuleId == this.moduleId)
               {
                  _loc5_.floatPos = DisplayUtils.globarCenter(this).add(new Point(0,-50));
               }
               _loc10_++;
            }
         }
         this.list_fashionProp.dataSource = NpcProp2Vo.parseTwoPropArr(_loc6_,_loc2_);
      }
      
      private function refresh(param1:Boolean = false) : void
      {
         stcStatusArr = StcMgr.ins.getVoArrByColumnValue("static_pet_status","node",petModel.crtPetId);
         this.list_suit.dataSource = stcStatusArr;
         this._clothSelectedId = !!this.petModel.crtPetInfo?this.petModel.crtPetInfo.status:0;
         this.skinRender.kind = 14;
         this.skinRender.dataSource = this.petModel.crtPetInfo && this.petModel.crtPetInfo.status?petModel.getRenderVo(this._clothSelectedId):null;
         this.changeAvatar3D(petModel.crtPetId,!!petModel.crtPetInfo?StcMgr.ins.getPetStatusVo(petModel.crtPetInfo.status).model:0);
         this.showAddProp(param1);
         updatePetInfo(petModel.crtPetId);
      }
      
      private function updatePetInfo(param1:int) : void
      {
         var _loc2_:int = 1;
         var _loc4_:PetInfo = petModel.getPetInfo(param1);
         var _loc3_:int = 0;
         if(_loc4_)
         {
            _loc2_ = _loc4_.level;
            _loc3_ = _loc4_.grade;
         }
         txt_level.text = LocaleConsts.lvStr(_loc2_);
         txt_jinjie.text = LocaleMgr.ins.getStr(32000008,[_loc3_]);
         txt_name.text = WealthUtil.getNpcName(param1);
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["evtSkinSelect","change_selected_pet","pet_activate"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         if(param2 is FashionEffectVO)
         {
            if(_effectIsShowingArr.indexOf((param2 as FashionEffectVO).id) != -1)
            {
               return;
            }
         }
         var _loc3_:* = param1;
         if("evtSkinSelect" !== _loc3_)
         {
            if("change_selected_pet" !== _loc3_)
            {
               if("pet_activate" === _loc3_)
               {
                  if(avatar && avatar.isDispose == false)
                  {
                     avatar.avatarRandomActionCtrl.unitMouseTriggerHandler(null);
                  }
               }
            }
            else
            {
               updatePetInfo(param2);
               changeAvatar3D(param2);
            }
         }
         else
         {
            showSkinSelectEffect(param2 as FashionEffectVO);
         }
      }
      
      override public function preClose(param1:Object = null) : void
      {
         this.panel3D.dispose();
         this.panel3D = null;
         avatar.dispose();
         avatar = null;
         ObserverMgr.ins.sendNotice("lock_total_fight_value_change",false);
         super.preClose(param1);
      }
   }
}
