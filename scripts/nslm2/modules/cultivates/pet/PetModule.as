package nslm2.modules.cultivates.pet
{
   import game.ui.petModule.PetModuleUI;
   import morn.core.components.ViewStack;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import nslm2.modules.scenes.commons.UIUnit3D;
   import nslm2.modules.cultivates.pet.service.PetService;
   import nslm2.modules.cultivates.pet.view.panel.PetBaseInfoPanel;
   import nslm2.modules.cultivates.pet.view.panel.PetLevelUpPanel;
   import nslm2.modules.cultivates.pet.view.panel.PetStarUpPanel;
   import nslm2.modules.cultivates.pet.view.panel.PetPhaseUpPanel;
   import nslm2.modules.roleInfos.vo.RoleInfoSubConfigVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.cultivates.roleTeam.model.RoleTeamModel;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import proto.PetInfo;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.cultivates.pet.util.PetUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import flash.events.MouseEvent;
   import morn.core.handlers.Handler;
   import nslm2.utils.Uint64Util;
   import morn.core.utils.StringUtils;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.foundations.AlertUtil;
   import flash.events.Event;
   import nslm2.modules.cultivates.pet.consts.PetConsts;
   import nslm2.modules.cultivates.pet.vo.PetInfoVo;
   import org.specter3d.display.particle.SpecterEffect;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.utils.Effect3DUtils;
   import com.mz.core.utils.DictHash;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   
   public class PetModule extends PetModuleUI
   {
       
      
      private var vs:ViewStack;
      
      private var tabArr:Array;
      
      private var subViewClassArr:Array;
      
      private var subIdArr:Array;
      
      private var petModel:PetModel;
      
      private var panel3D:UIPanel3D;
      
      private var avatar:UIUnit3D;
      
      private var service:PetService;
      
      private var _lastTabId:uint;
      
      private var bgImgArr:Array;
      
      private var avatPosArr:Array;
      
      private var avatVisible:Array;
      
      private var petListVisible:Array;
      
      private var crtSubIdArr:Array;
      
      private var initTabIndex:int;
      
      private var crtUsedBgImg:String;
      
      private var _isShowingAlert:Boolean;
      
      private var magicCircleEff:SpecterEffect;
      
      private var subLib:DictHash;
      
      public function PetModule()
      {
         tabArr = [LocaleMgr.ins.getStr(32000001)];
         subViewClassArr = [PetBaseInfoPanel,PetLevelUpPanel,PetStarUpPanel,PetPhaseUpPanel];
         subIdArr = [32000,32010,32030,32020];
         petModel = PetModel.ins;
         service = PetService.ins;
         bgImgArr = ["png.uiPet.bg","png.uiPet.img_bgLevelUp","png.uiPet.img_bgLevelUp","png.uiPet.img_bgLevelUp"];
         avatPosArr = [PetConsts.PET_AVATAR_POS_BASE,PetConsts.PET_AVATAR_POS_CULTIVATE,PetConsts.PET_AVATAR_POS_CULTIVATE,PetConsts.PET_AVATAR_POS_CULTIVATE];
         avatVisible = [true,true,true,true];
         petListVisible = [true,true,true,true];
         crtSubIdArr = [];
         subLib = new DictHash();
         super();
         initTab();
         parts.push(service);
         parts.push(petModel);
         panelBg.bgCustom.addChild(img_bg);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc7_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         subViewClassArr = [PetBaseInfoPanel,PetLevelUpPanel,PetStarUpPanel,PetPhaseUpPanel];
         crtSubIdArr = getSubViewIdArr();
         var _loc6_:int = crtSubIdArr.length;
         var _loc5_:Array = [];
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc4_ = crtSubIdArr[_loc7_];
            _loc5_.push((subLib.getValue(_loc4_) as RoleInfoSubConfigVo).nameCN);
            _loc7_++;
         }
         tabBar.labels = _loc5_.join(",");
         var _loc2_:int = crtSubIdArr.indexOf(32000);
         service.acivate();
         panelBg.txt_titleName.text = LocaleMgr.ins.getStr(32000000);
         if(param1)
         {
            _loc3_ = param1[0];
            petModel.crtPetId = _loc3_;
            initTabIndex = int(param1[1]);
         }
         ObserverMgr.ins.regObserver(this);
         panel3D = new UIPanel3D(this);
         DisplayUtils.addChildAbove(panel3D,this.img_bg);
         panel3D.initByImage(img_bg,this.panelBg);
         panel3D.visible = false;
         avatar = new UIUnit3D();
         panel3D.addChild3D(avatar);
         petModel.avatar = avatar;
         petModel.panel3D = panel3D;
         vs = new ViewStack();
         vs.subViewClasses = subViewClassArr;
         vs.x = 20;
         vs.y = 63;
         DisplayUtils.addChildBelow(vs,this.petSelectPanel);
         tabBar.selectHandler = tabBarChangeHandler;
         tabBar.preCondHandler = tabBarChangeCondHandler;
         (petSelectPanel.pageBarUI as IPageBar).bindList(petSelectPanel.list_pet);
         petSelectPanel.list_pet.dataSource = petModel.petListArr;
         petSelectPanel.list_pet.selectHandler = changeSelectdPetHandler;
         petSelectPanel.list_pet.preCondHandler = petListChandgeCondHandler;
         if(_loc3_ > 0)
         {
            petSelectPanel.list_pet.selectedIndex = ArrayUtil.indexByAttr(petSelectPanel.list_pet.dataSource,"id",_loc3_);
         }
         else
         {
            petSelectPanel.list_pet.selectedIndex = 0;
         }
         ObserverMgr.ins.sendNotice("lock_total_fight_value_change",true);
         RoleTeamModel.ins.blockFloatMsg = true;
         super.preShow(param1);
      }
      
      override public function show(param1:Object = null) : void
      {
         panel3D.visible = true;
         super.show(param1);
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["update_pet_info","change_selected_pet","refresh_pet_list","set_pet_list_enable","levelUp","pet_activate","MSG_SWITCH_MODULE_REN_POINT","goto_awake_panel"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc3_:int = 0;
         var _loc6_:* = param1;
         if("update_pet_info" !== _loc6_)
         {
            if("change_selected_pet" !== _loc6_)
            {
               if("refresh_pet_list" !== _loc6_)
               {
                  if("set_pet_list_enable" !== _loc6_)
                  {
                     if("levelUp" !== _loc6_)
                     {
                        if("pet_activate" !== _loc6_)
                        {
                           if("MSG_SWITCH_MODULE_REN_POINT" !== _loc6_)
                           {
                              if("goto_awake_panel" !== _loc6_)
                              {
                                 if("update_bless_pet" !== _loc6_)
                                 {
                                 }
                              }
                              else
                              {
                                 _loc3_ = param2;
                                 petModel.crtPetId = _loc3_;
                                 petSelectPanel.list_pet.selectedIndex = ArrayUtil.indexByAttr(petSelectPanel.list_pet.dataSource,"id",_loc3_);
                                 tabBar.selectedIndex = crtSubIdArr.indexOf(32050);
                              }
                           }
                           else if((param2 as SwitchModuleRedPointMsg).moduleId == 32000)
                           {
                              updateRedPoint();
                              petSelectPanel.list_pet.refresh();
                           }
                        }
                        else if(avatar && avatar.isDispose == false)
                        {
                           avatar.avatarRandomActionCtrl.unitMouseTriggerHandler(null);
                        }
                     }
                     else if(avatar && avatar.isDispose == false)
                     {
                        avatar.avatarRandomActionCtrl.unitMouseTriggerHandler(null);
                        _loc5_ = new BmcSpriteSheet();
                        _loc5_.init(1113);
                        _loc5_.x = 262;
                        _loc5_.y = 130;
                        this.addChild(_loc5_);
                     }
                  }
                  else
                  {
                     tabBar.mouseEvent = param2;
                     petSelectPanel.mouseEvent = param2;
                  }
               }
               else
               {
                  _loc4_ = ArrayUtil.indexByAttr(petModel.petListArr,"id",petModel.crtPetId);
                  petSelectPanel.list_pet.refresh();
                  petSelectPanel.list_pet.selectedIndex = _loc4_;
                  updateRedPoint();
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
            updatePetInfo(petModel.crtPetId);
            petSelectPanel.list_pet.refresh();
         }
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
         updateRedPoint();
      }
      
      private function updateRedPoint() : void
      {
         redPoint4.visible = false;
         if(petModel.crtPetInfo && petModel.crtPetIsUsed())
         {
            redPoint1.visible = PetUtil.checkCanLvlUp(petModel.crtPetInfo);
            redPoint2.visible = PetUtil.checkCanStarUp(petModel.crtPetInfo);
            redPoint3.visible = PetUtil.checkCanAwake(petModel.crtPetInfo);
         }
         else
         {
            var _loc1_:* = false;
            redPoint3.visible = _loc1_;
            _loc1_ = _loc1_;
            redPoint2.visible = _loc1_;
            redPoint1.visible = _loc1_;
         }
         if(petModel.checkHaveUnEquipPet())
         {
            redPoint0.visible = true;
         }
         else
         {
            redPoint0.visible = false;
         }
      }
      
      private function changeAvatar3D(param1:int) : void
      {
         if(this.avatar)
         {
            this.avatar.initByStcNpcId(param1,false,0,!!petModel.crtPetInfo?StcMgr.ins.getPetStatusVo(petModel.crtPetInfo.status).model:0);
            this.avatar.pos2d = avatPosArr[tabBar.selectedIndex >= 0?tabBar.selectedIndex:0];
            this.avatar.visible = avatVisible[tabBar.selectedIndex >= 0?tabBar.selectedIndex:0];
            this.avatar.addEventListener("avatar_anim_all_complete",onHouseAvatarAnimAllComplete);
            this.avatar.rotation = -45;
         }
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         this.alertPhaseUp(new Handler(super.btnCloseHandler,[param1]),false);
      }
      
      private function alertPhaseUp(param1:*, param2:Boolean) : void
      {
         if(petModel.crtPetInfo && Uint64Util.toNumber(petModel.crtPetInfo.gradeExp) != 0 && _lastTabId == 32020 && !StringUtils.isNull(DefindConsts.SHENGJIE_REDUCE))
         {
            if(param2 && this.tabBar.selectedIndex == 3)
            {
               Handler.execute(param1);
            }
            else
            {
               this.tabBar.selectedIndex = 3;
               ObserverMgr.ins.sendNotice("msg_stop_auto_phase_up");
               AlertUtil.comfirm(LocaleMgr.ins.getStr(32000044,[LocaleConsts.percentStr(Number(DefindConsts.SHENGJIE_REDUCE))]) + "\r\n" + LocaleMgr.ins.getStr(32000045),$confirmHandler,param1,null,LocaleMgr.ins.getStr(30100210),LocaleMgr.ins.getStr(30100209));
            }
         }
         else if(param1)
         {
            Handler.execute(param1);
         }
      }
      
      override protected function moduleFadeInTypeCpl() : void
      {
         tabBar.selectedIndex = initTabIndex;
         super.moduleFadeInTypeCpl();
      }
      
      private function confirmTabBarChange(param1:int) : void
      {
         var _loc2_:int = crtSubIdArr.indexOf(param1);
         this.tabBar.selectedIndex = _loc2_;
         var _loc3_:int = this.subIdArr[_loc2_];
         _lastTabId = _loc3_;
         ObserverMgr.ins.sendNotice("SIMPLE_STR_MSG_FLOAT_MSG_STOP");
         vs.selectedIndex = subIdArr.indexOf(crtSubIdArr[tabBar.selectedIndex]);
         _isShowingAlert = false;
      }
      
      private function $confirmHandler() : void
      {
         _isShowingAlert = false;
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
      }
      
      private function tabBarChangeHandler(param1:int) : void
      {
         var _loc2_:int = subIdArr.indexOf(crtSubIdArr[tabBar.selectedIndex]);
         vs.selectedIndex = _loc2_;
         if(this.avatar)
         {
            this.avatar.pos2d = avatPosArr[_loc2_ >= 0?_loc2_:0];
            this.avatar.visible = avatVisible[_loc2_ >= 0?_loc2_:0];
         }
         if(panel3D)
         {
            if(crtUsedBgImg != bgImgArr[_loc2_])
            {
               this.panel3D.changeBgImg(App.asset.getBitmapData(bgImgArr[_loc2_]));
            }
            crtUsedBgImg = bgImgArr[_loc2_];
         }
         if(!_isShowingAlert)
         {
            _isShowingAlert = true;
            this.alertPhaseUp(new Handler(confirmTabBarChange,[crtSubIdArr[tabBar.selectedIndex]]),true);
         }
         petSelectPanel.visible = petListVisible[_loc2_];
         box_title.visible = petListVisible[_loc2_];
         box_title.x = PetConsts.NAME_TILE_BOX_X[_loc2_];
      }
      
      private function tabBarChangeCondHandler(param1:int) : Boolean
      {
         if(param1 > 0)
         {
            if(!petModel.crtPetInfo)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(32000038));
               return false;
            }
         }
         return true;
      }
      
      private function petListChandgeCondHandler(param1:int) : Boolean
      {
         var _loc2_:* = null;
         if(vs.selectedIndex > 0)
         {
            _loc2_ = petModel.petListArr[param1];
            if(petModel.getPetInfo(_loc2_.id))
            {
               return true;
            }
            AlertUtil.float(LocaleMgr.ins.getStr(32000038));
            return false;
         }
         return true;
      }
      
      private function addMagicCircleEff() : void
      {
         magicCircleEff = EffectManager.createEffect(Effect3DUtils.getUrlBySid(700133),true,null,null,0,true,1);
         magicCircleEff.rotationX = 180;
         panel3D.addChild3D(magicCircleEff);
      }
      
      override public function preClose(param1:Object = null) : void
      {
         if(avatar)
         {
            avatar.removeEventListener("avatar_anim_all_complete",onHouseAvatarAnimAllComplete);
         }
         if(panel3D)
         {
            panel3D.dispose();
            panel3D = null;
         }
         service.dispose();
         ObserverMgr.ins.sendNotice("lock_total_fight_value_change",false);
         RoleTeamModel.ins.blockFloatMsg = false;
         super.preClose(param1);
      }
      
      private function initTab() : void
      {
         var _loc1_:* = null;
         _loc1_ = new RoleInfoSubConfigVo();
         _loc1_.subId = 32000;
         _loc1_.nameCN = LocaleMgr.ins.getStr(32000001);
         subLib.put(_loc1_.subId,_loc1_);
         _loc1_ = new RoleInfoSubConfigVo();
         _loc1_.subId = 32010;
         _loc1_.nameCN = LocaleMgr.ins.getStr(32000002);
         subLib.put(_loc1_.subId,_loc1_);
         _loc1_ = new RoleInfoSubConfigVo();
         _loc1_.subId = 32020;
         _loc1_.nameCN = LocaleMgr.ins.getStr(32000004);
         subLib.put(_loc1_.subId,_loc1_);
         _loc1_ = new RoleInfoSubConfigVo();
         _loc1_.subId = 32030;
         _loc1_.nameCN = LocaleMgr.ins.getStr(32000003);
         subLib.put(_loc1_.subId,_loc1_);
      }
      
      public function getSubViewIdArr() : Array
      {
         var _loc1_:Array = [];
         var _loc4_:int = 0;
         var _loc3_:* = subIdArr;
         for each(var _loc2_ in subIdArr)
         {
            if(FuncOpenAutoCtrl.checkOpen(_loc2_))
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
   }
}
