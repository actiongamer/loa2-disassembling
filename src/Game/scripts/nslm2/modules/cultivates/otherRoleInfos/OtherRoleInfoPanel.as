package nslm2.modules.cultivates.otherRoleInfos
{
   import game.ui.otherRoleInfos.panel.OtherRoleInfoPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.modules.roleInfos.commons.IRoleSubPanel;
   import morn.customs.components.PlayerTitleRender;
   import com.netease.protobuf.UInt64;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import game.ui.roleInfos.equipPanels.RoleEquipSubBarUI;
   import morn.core.components.View;
   import nslm2.modules.roleInfos.equipPanels.RoleMengYuePanel;
   import morn.core.components.Button;
   import nslm2.modules.foundations.friendModules.FriendService;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.friendModules.FriendUtils;
   import nslm2.modules.roleInfos.equipPanels.MengYuePropVo;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.cultivates.roleTeam.util.RoleTeamUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.utils.Uint64Util;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.HeroBaseInfo;
   import nslm2.utils.RTools;
   import morn.customs.components.NpcPropRender;
   import nslm2.common.consts.NPCPropConsts;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.compsEffects.FloatZoomInEffCtrl;
   import nslm2.utils.YuanFenUtil;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import morn.customs.expands.MornExpandUtil;
   import com.mz.core.mediators.RollMediator;
   
   public class OtherRoleInfoPanel extends OtherRoleInfoPanelUI implements IViewStackPage, IRoleSubPanel
   {
       
      
      private var _nowSelectedId:UInt64;
      
      private var model:nslm2.modules.cultivates.otherRoleInfos.OtherRoleInfoModel;
      
      public var subBar:RoleEquipSubBarUI;
      
      private var mengYuePanel:RoleMengYuePanel;
      
      public function OtherRoleInfoPanel()
      {
         model = nslm2.modules.cultivates.otherRoleInfos.OtherRoleInfoModel.ins;
         subBar = new RoleEquipSubBarUI();
         super();
         list_equip.useMouseDown = false;
         MornExpandUtil.addHandlerForBtnAll(this,btnClickHandler);
         this.parts.push(new RollMediator(box_yuanfen,showMengYuePanel));
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
         this.visible = false;
      }
      
      public function set modelRef(param1:RoleInfoModel) : void
      {
      }
      
      public function get subBarRef() : View
      {
         return subBar;
      }
      
      private function btnClickHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btn_addFriend !== _loc2_)
         {
            if(btn_heroCompare === _loc2_)
            {
               ModuleMgr.ins.showModule(11700,null,ModuleMgr.ins.popLayer.curModuleId);
            }
         }
         else if(FriendService.ins.isFriend(nslm2.modules.cultivates.otherRoleInfos.OtherRoleInfoModel.ins.roleId))
         {
            ModuleMgr.ins.showModule(10621,null,ModuleMgr.ins.popLayer.curModuleId);
         }
         else
         {
            FriendUtils.friendApply(nslm2.modules.cultivates.otherRoleInfos.OtherRoleInfoModel.ins.roleId,nslm2.modules.cultivates.otherRoleInfos.OtherRoleInfoModel.ins.name);
         }
      }
      
      private function showMengYuePanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(!MengYuePropVo.getMaxMengYueCnt(HeroInfoUtil.getNodeId(model.heroInfo.baseInfo.baseId)))
            {
               return;
            }
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
      
      public function show(param1:Boolean = false) : void
      {
         DisplayUtils.addChildFromGlobal(this.btn_heroCompare,img_compare);
         DisplayUtils.addChildFromGlobal(this.btn_addFriend,img_addFriend);
         if(!model.heroInfo)
         {
            list_skill.dataSource = [];
            list_YuanFen.dataSource = [];
            list_propBase.dataSource = [];
            playerTitleRender.visible = false;
            list_equip.dataSource = RoleTeamUtil.toEquipVoArr([]);
            list_treasure.dataSource = RoleTeamUtil.toEquipBaoWuVoArr([]);
            return;
         }
         playerTitleRender.visible = true;
         list_equip.dataSource = RoleTeamUtil.toEquipVoArr(model.heroInfo.items,0,model.heroInfo.baseInfo.baseId);
         updateTreasuerInfo();
         playerTitleRender.setName(model.getNameHasTupoLevel(model.heroInfo,true)).setPlayerLevel(model.playerHero.baseInfo.level).setMilitary(model.military).heroInfo = model.heroInfo;
         var _loc7_:StcNpcVo = StcMgr.ins.getNpcVo(model.heroInfo.baseInfo.baseId);
         var _loc3_:Boolean = model.playerHero && Uint64Util.equal(model.playerHero.baseInfo.id,model.heroInfo.baseInfo.id);
         if(model.familyName && _loc3_)
         {
            playerTitleRender.txt_name.multiline = true;
            playerTitleRender.txt_name.wordWrap = true;
            playerTitleRender.txt_name.bold = false;
            playerTitleRender.txt_name.text = TextFieldUtil.htmlText2(playerTitleRender.txt_name.text,null,null,true);
            playerTitleRender.txt_name.text = playerTitleRender.txt_name.text + ("\n" + TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(999000565) + model.familyName,16773888,12));
            playerTitleRender.txt_name.y = 0;
         }
         else
         {
            playerTitleRender.txt_name.bold = true;
         }
         var _loc6_:Array = HeroInfoUtil.toBasePropList(model.heroInfo.prop);
         var _loc5_:Array = HeroInfoUtil.getHeroAllSkillVoArr(model.heroInfo.baseInfo);
         list_skill.repeatX = _loc5_.length;
         list_skill.dataSource = _loc5_;
         list_skill.x = box_skill.width - list_skill.width >> 1;
         this.list_propBase.dataSource = _loc6_;
         if(!Uint64Util.equal(_nowSelectedId,model.heroInfo.baseInfo.id))
         {
            _nowSelectedId = Uint64Util.clone(model.heroInfo.baseInfo.id);
            disposeMengYuePanel();
         }
         var _loc2_:HeroBaseInfo = model.heroInfo.baseInfo;
         var _loc4_:StcNpcVo = StcMgr.ins.getNpcVo(_loc2_.baseId);
         if(!RoleInfoModel.ins.updateYuanFenDataAfterEffect)
         {
            updateYuanFenData();
         }
         this.btn_addFriend.labelMargin = RTools.cl("35","10");
         if(FriendService.ins.isFriend(nslm2.modules.cultivates.otherRoleInfos.OtherRoleInfoModel.ins.roleId))
         {
            this.btn_addFriend.label = LocaleMgr.ins.getStr(999000077);
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
      
      private function updateTreasuerInfo() : void
      {
         var _loc1_:Array = RoleTeamUtil.toEquipBaoWuVoArr(model.heroInfo.baowu,0,model.heroInfo.baseInfo.baseId);
         list_treasure.dataSource = _loc1_;
      }
      
      override public function dispose() : void
      {
         disposeMengYuePanel();
         super.dispose();
      }
   }
}
