package nslm2.modules.cultivates.otherRoleInfos
{
   import game.ui.otherRoleInfos.OtherRoleInfoModuleUI;
   import morn.core.components.ViewStack;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import nslm2.modules.scenes.commons.UIUnit3D;
   import flash.events.MouseEvent;
   import com.greensock.TweenLite;
   import com.greensock.easing.Back;
   import morn.core.components.Button;
   import com.mz.core.mgrs.resMgrs.GetResTask;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import nslm2.utils.Uint64Util;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.common.ui.components.comps2d.others.FightValueBox;
   import nslm2.modules.cultivates.pet.vo.PetInfoVo;
   import proto.HeroInfo;
   import nslm2.modules.roleInfos.commons.IRoleSubPanel;
   import nslm2.modules.cultivates.roleTeam.view.render.TeamHeroListRender;
   import nslm2.modules.cultivates.roleTeam.vo.RoleTeamVo;
   import flash.utils.setTimeout;
   import nslm2.modules.footstones.tooltipsModules.TooltipHeroInfoCompare;
   import nslm2.modules.footstones.tooltipsModules.ToolTipHeroInfoDetailVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.cultivates.pet.consts.PetConsts;
   import flash.geom.Point;
   import flash.events.Event;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.common.model.PlayerModel;
   import morn.customs.expands.MornExpandUtil;
   
   public class OtherRoleInfoModule extends OtherRoleInfoModuleUI
   {
       
      
      public var subViewStack:ViewStack;
      
      private var panel3D:UIPanel3D;
      
      private var avatar:UIUnit3D;
      
      private var bgSkinArr:Array;
      
      private var isPetRenderClick:Boolean = false;
      
      private var heroInfoDetail:TooltipHeroInfoCompare;
      
      public function OtherRoleInfoModule()
      {
         subViewStack = new ViewStack();
         bgSkinArr = ["img_bg.jpg","img_bg.jpg","img_yjBg.png"];
         super();
         subViewStack.subViewClasses = [OtherRoleInfoPanel,OtherRolePetInfoPanel,OtherRoleYuanJunPanel];
         MornExpandUtil.addHandlerForBtnAll(this,btnHandler);
         panelBg.bgCustom.addChild(img_funBg);
         this.fadeViewId = 30810;
         this.petRender.addEventListener("click",petRender_click);
      }
      
      public function get petRender() : OtherRoleListPetRender
      {
         return this.petRenderUI as OtherRoleListPetRender;
      }
      
      private function get model() : OtherRoleInfoModel
      {
         return OtherRoleInfoModel.ins;
      }
      
      private function petRender_click(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(OtherRoleInfoModel.ins.pet)
         {
            isPetRenderClick = true;
            list_team.selectedIndex = -1;
            this.createAvatar3DPet();
            subViewStack.selectedIndex = 1;
            box_fightValue.visible = false;
            _loc2_ = petRender.y + -4;
            TweenLite.to(img_arrow,0.3,{
               "y":_loc2_,
               "ease":Back.easeOut
            });
         }
      }
      
      private function btnHandler(param1:Button) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = param1;
         if(btn_yuanjun === _loc3_)
         {
            list_team.selectedIndex = -1;
            avatar.visible = false;
            subViewStack.selectedIndex = 2;
            box_fightValue.visible = false;
            _loc2_ = box_opBtn.y + btn_yuanjun.y + -4 + 2;
            TweenLite.to(img_arrow,0.3,{
               "y":_loc2_,
               "ease":Back.easeOut
            });
            changeBg(1);
            updateHeroInfoTip();
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         new GetResTask(1,UrlLib.moduleImgAsset(30810,bgSkinArr[0])).addCompleteHandler(bgLoaded).exec();
      }
      
      private function changeBg(param1:int) : void
      {
         new GetResTask(1,UrlLib.moduleImgAsset(30810,bgSkinArr[param1])).addCompleteHandler(onLoadCpl).exec();
      }
      
      private function onLoadCpl(param1:GetResTask) : void
      {
         panel3D.changeBgImg(ResMgr.ins.getRes(param1.url));
      }
      
      public function bgLoaded(param1:GetResTask) : void
      {
         var _loc2_:* = null;
         this.img_funBg.url = param1.url;
         this.addChildAt(subViewStack,4);
         this.panelBg.titleImgId = this.moduleId;
         this.txt_otherFightValue.text = LocaleMgr.ins.getStr(11000810) + LocaleConsts.getNumberAbbr2(Uint64Util.toString(model.ability));
         panel3D = new UIPanel3D(this);
         DisplayUtils.addChildAbove(panel3D,this.img_funBg);
         panel3D.initByImage(img_funBg,this.panelBg);
         panel3D.visible = false;
         avatar = new UIUnit3D();
         this.avatar.addEventListener("avatar_anim_all_complete",onHouseAvatarAnimAllComplete);
         panel3D.addChild3D(avatar);
         this.createAvatar3D(model.playerHero);
         (this.fightValueBox as FightValueBox).tweenValue = Uint64Util.toNumber(model.playerHero.baseInfo.fightValue);
         subViewStack.x = 86;
         subViewStack.y = 81;
         this.img_arrow.y = list_team.y + list_team.getCell(0).y + -4;
         this.visible = false;
         this.switchListeners(true);
         list_team.dataSource = OtherRoleInfoModel.ins.teamHeroArr;
         if(OtherRoleInfoModel.ins.pet)
         {
            _loc2_ = new PetInfoVo(OtherRoleInfoModel.ins.pet.id);
            _loc2_.petInfo = OtherRoleInfoModel.ins.pet;
            this.petRender.dataSource = _loc2_;
         }
         else
         {
            this.petRender.dataSource = null;
         }
         this.petRender.visible = 0;
         this.preShowCpl();
      }
      
      private function heroInfoNotifyHander2(param1:HeroInfo) : void
      {
         model.crtHeroId = param1.baseInfo.id;
         this.createAvatar3D(param1);
         (this.fightValueBox as FightValueBox).tweenValue = Uint64Util.toNumber(param1.baseInfo.fightValue);
         if(this.subViewStack.selection)
         {
            (this.subViewStack.selection as IRoleSubPanel).show();
         }
      }
      
      override protected function moduleFadeInTypeCpl() : void
      {
         if(this.canRun == false)
         {
            return;
         }
         subViewStack.selectedIndex = 0;
         super.moduleFadeInTypeCpl();
      }
      
      private function onListSelectHero(param1:int, param2:int) : void
      {
         if(list_team.selectedIndex == -1)
         {
            return;
         }
         var _loc5_:TeamHeroListRender = list_team.selection as TeamHeroListRender;
         var _loc4_:RoleTeamVo = model.teamHeroArr[param1] as RoleTeamVo;
         if(param1 == param2 || param1 == 0 && param2 == -1 && this.avatar && this.avatar.visible == true)
         {
            showHeroInfoDetail(_loc4_,"mouseDown");
         }
         if(param1 == param2 || _loc4_.heroData == null)
         {
            return;
         }
         subViewStack.selectedIndex = 0;
         changeBg(0);
         box_fightValue.visible = true;
         avatar.visible = true;
         var _loc3_:int = list_team.y + list_team.selection.y + -4;
         TweenLite.to(img_arrow,0.3,{
            "y":_loc3_,
            "ease":Back.easeOut
         });
         model.selectedPos = list_team.selectedIndex + 1;
         if(_loc4_.heroData && (!Uint64Util.equal(model.heroInfo.baseInfo.id,_loc4_.heroData.id) || isPetRenderClick))
         {
            isPetRenderClick = false;
            model.heroInfo = model.getHeroInfo(_loc4_.heroData.id);
            heroInfoNotifyHander2(model.heroInfo);
            this.fightValueBox.visible = true;
         }
         return;
         §§push(setTimeout(updateHeroInfoTip,1,param2));
      }
      
      private function showHeroInfoDetail(param1:RoleTeamVo, param2:String) : void
      {
         if(heroInfoDetail && heroInfoDetail.isDisposed == false)
         {
            return;
         }
         if(param1.heroData == null)
         {
            return;
         }
         heroInfoDetail = new TooltipHeroInfoCompare(param2);
         var _loc3_:ToolTipHeroInfoDetailVo = new ToolTipHeroInfoDetailVo(param1);
         heroInfoDetail.x = 135;
         heroInfoDetail.y = this.y - 15;
         this.addChild(heroInfoDetail);
         heroInfoDetail.show(_loc3_);
      }
      
      private function updateHeroInfoTip(param1:int = 0) : void
      {
         var _loc4_:int = 0;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         _loc4_ = 0;
         while(_loc4_ < list_team.cells.length)
         {
            _loc2_ = avatar && avatar.visible && (_loc4_ == list_team.selectedIndex || _loc4_ == 0 && list_team.selectedIndex == -1);
            if(_loc2_)
            {
               list_team.cells[_loc4_].toolTip = LocaleMgr.ins.getStr(999001110);
               _loc3_ = param1 == -1 && _loc4_ == 0;
               if(list_team.selectedIndex != -1 && _loc3_ == false)
               {
                  ObserverMgr.ins.sendNotice("msg_tooltip_click",list_team.cells[_loc4_].toolTip);
               }
            }
            else
            {
               list_team.cells[_loc4_].toolTip = null;
            }
            _loc4_++;
         }
      }
      
      override public function preClose(param1:Object = null) : void
      {
         if(avatar)
         {
            avatar.removeEventListener("avatar_anim_all_complete",onHouseAvatarAnimAllComplete);
         }
         this.panel3D.dispose();
         this.panel3D = null;
         super.preClose(param1);
      }
      
      override public function show(param1:Object = null) : void
      {
         petRender.visible = true;
         petRender.alpha = 0;
         TweenLite.to(this.petRender,0.3,{"alpha":1});
         panel3D.visible = true;
         super.show(param1);
      }
      
      public function switchListeners(param1:Boolean) : void
      {
         if(param1)
         {
            list_team.changeHandler = onListSelectHero;
         }
         else
         {
            list_team.changeHandler = null;
         }
      }
      
      private function createAvatar3DPet() : void
      {
         if(this.avatar)
         {
            this.avatar.visible = true;
            this.avatar.initByStcNpcId(OtherRoleInfoModel.ins.pet.id,false,0,StcMgr.ins.getPetStatusVo(OtherRoleInfoModel.ins.pet.status).model);
            this.avatar.pos2d = PetConsts.PET_AVATAR_POS_BASE.add(new Point(40,0));
            this.avatar.rotation = -45;
         }
      }
      
      protected function onHouseAvatarAnimAllComplete(param1:Event) : void
      {
         var _loc2_:StcNpcVo = StcMgr.ins.getNpcVo(this.avatar.stcNpcId);
         if(_loc2_.kind == 21)
         {
            this.avatar.avatar.avatarMesh.forceRenderWithoutFrustum = true;
            this.avatar.avatar.needUpdateBounds = false;
         }
         else
         {
            this.avatar.avatar.avatarMesh.forceRenderWithoutFrustum = false;
            this.avatar.avatar.needUpdateBounds = true;
         }
      }
      
      private function createAvatar3D(param1:HeroInfo) : void
      {
         if(this.avatar)
         {
            this.avatar.visible = true;
            if(model.isPlayerHero(param1.baseInfo.id))
            {
               this.avatar.stcNpcId = param1.baseInfo.baseId;
               PlayerModel.ins.changePlayerView(this.avatar,model.playerHero.baseInfo.baseId,model.clothId,model.wingId);
            }
            else
            {
               this.avatar.initByStcNpcId(param1.baseInfo.baseId,false,param1.baseInfo.skin);
            }
            this.avatar.pos2d = new Point(-40,-130);
            this.avatar.rotation = -90;
         }
      }
      
      override public function dispose() : void
      {
         switchListeners(false);
         super.dispose();
      }
   }
}
