package nslm2.modules.foundations.recycle.view.panel.petReborn
{
   import game.ui.recycleModules.heroReborn.HeroRebornPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.foundations.recycle.view.I3DSubPanel;
   import nslm2.modules.foundations.recycle.model.RecycleModel;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import nslm2.modules.scenes.commons.UIUnit3D;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import com.greensock.TweenLite;
   import nslm2.modules.foundations.recycle.service.RecycleService;
   import proto.RecyclePetDecomposeRes;
   import nslm2.utils.WealthUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.globals.GlobalRef;
   import morn.customs.components.WealthRender;
   import morn.customs.expands.MornExpandUtil;
   import morn.core.components.Button;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.common.vo.WealthVo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.cultivates.pet.vo.PetInfoVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import flash.events.Event;
   
   public class PetRebornPanel extends HeroRebornPanelUI implements IViewStackPage, IObserver, I3DSubPanel
   {
       
      
      private var recModel:RecycleModel;
      
      private var recEff:BmcSpriteSheet;
      
      private var bgEff:BmcSpriteSheet;
      
      private var _uiPanel3D:UIPanel3D;
      
      private var avatar:UIUnit3D;
      
      private var rebornCostArr:Array;
      
      private var _rightBg:Image3D;
      
      public function PetRebornPanel()
      {
         super();
         recModel = RecycleModel.ins;
      }
      
      public function getFocusNotices() : Array
      {
         return ["recycle_notice_update_selected_item","recycle_notice_confirm"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("recycle_notice_update_selected_item" !== _loc3_)
         {
            if("recycle_notice_confirm" === _loc3_)
            {
               moveIconEndHandler();
            }
         }
         else
         {
            this.iconRender.dataSource = recModel.selectedRebornItem;
            iconRender.btn_remove.visible = false;
            refeshCost();
         }
      }
      
      private function moveIconEndHandler() : void
      {
         recEff = new BmcSpriteSheet();
         recEff.x = 280;
         recEff.y = -30;
         recEff.init(1130002);
         addChild(recEff);
         TweenLite.delayedCall(0.6,requestService);
      }
      
      private function requestService() : void
      {
         RecycleService.ins.recyclePetReborn([recModel.selectedRebornItem.petInfoVo.id],true,PetDecomposeHandler,null,1);
      }
      
      private function PetDecomposeHandler(param1:RecyclePetDecomposeRes) : void
      {
         var _loc2_:Array = [];
         if(param1)
         {
            _loc2_ = WealthUtil.rewardArrToWealthVoArr(param1.res);
         }
         ObserverMgr.ins.sendNotice("recycle_notice_show_reward",_loc2_);
         recModel.selectedRebornItem = null;
         iconRender.dataSource = null;
         (GlobalRef.playerHeader_icon_diamond as WealthRender).refreshData();
         refeshCost();
      }
      
      public function viewStackIn() : void
      {
         MornExpandUtil.addHandlerForBtnAll(this,btnHandler);
         ObserverMgr.ins.regObserver(this);
         this.visible = true;
         refeshCost();
         bgEff = new BmcSpriteSheet();
         bgEff.x = 233;
         bgEff.y = 113;
         bgEff.init(1130003,1,"all",true);
         addChildAt(bgEff,1);
         this.render_recycle.dataSource = 11309;
      }
      
      private function btnHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btn_reborn === _loc2_)
         {
            if(PlayerModel.ins.getCountByWealthVo(costRender.wealthVo) < costRender.wealthVo.count)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(300004041));
            }
            else if(recModel.selectedRebornItem)
            {
               ModuleMgr.ins.showModule(11304,null,11300);
            }
            else
            {
               AlertUtil.float(LocaleMgr.ins.getStr(32000055));
            }
         }
      }
      
      private function refeshCost() : void
      {
         var _loc1_:int = 0;
         if(recModel.selectedRebornItem)
         {
            _loc1_ = recModel.selectedRebornItem.petInfoVo.petInfo.grade;
         }
         if(_loc1_ > 0)
         {
            _loc1_--;
         }
         costRender.wealthVo = WealthVo.parseCostStr(String(DefindConsts.PET_REBORN_COST).split("|")[_loc1_]);
         if(PlayerModel.ins.getCountByWealthVo(costRender.wealthVo) < costRender.wealthVo.count)
         {
            costRender.txt_num.color = 16723968;
         }
         else
         {
            costRender.txt_num.color = 458496;
         }
      }
      
      public function viewStackOut() : void
      {
         ObserverMgr.ins.unregObserver(this);
         this.iconRender.dataSource = null;
         this.visible = false;
         recModel.selectedRebornItem = null;
         bgEff.dispose();
         bgEff = null;
         if(avatar)
         {
            avatar.dispose();
            avatar = null;
         }
      }
      
      public function set layer3dRef(param1:UIPanel3D) : void
      {
         _uiPanel3D = param1;
      }
      
      private function changeAvatar3D(param1:PetInfoVo) : void
      {
         if(!this.avatar)
         {
            avatar = new UIUnit3D();
            _uiPanel3D.addChild3D(avatar);
            this.avatar.rotation = -45;
            avatar.y = -460;
         }
         avatar.visible = true;
         this.avatar.initByStcNpcId(param1.id,false,0,StcMgr.ins.getPetStatusVo(param1.petInfo.status).model);
         this.avatar.addEventListener("avatar_anim_all_complete",onHouseAvatarAnimAllComplete);
         this.avatar.rotation = -45;
      }
      
      protected function onHouseAvatarAnimAllComplete(param1:Event) : void
      {
         this.avatar.avatar.avatarMesh.forceRenderWithoutFrustum = true;
         this.avatar.avatar.needUpdateBounds = false;
      }
   }
}
