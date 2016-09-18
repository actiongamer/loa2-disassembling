package nslm2.modules.cultivates.roleTeam.view.render
{
   import game.ui.roleTeam.render.RoleTeamPetEquipRenderUI;
   import com.mz.core.interFace.IObserver;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.cultivates.pet.vo.PetInfoVo;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import nslm2.modules.roleInfos.equipPanels.HeroEquipVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import com.mz.core.mediators.RollHighLightMediator;
   
   public class RoleTeamPetEquipRender extends RoleTeamPetEquipRenderUI implements IObserver
   {
       
      
      private var eff:BmcSpriteSheet;
      
      private var _data:PetInfoVo;
      
      private var petModel:PetModel;
      
      private var ori_img_quality_skin:String;
      
      public function RoleTeamPetEquipRender()
      {
         petModel = PetModel.ins;
         super();
         this.buttonMode = true;
         img_icon.smoothing = true;
         img_redPoint.mouseEnabled = true;
         img_redPoint.addEventListener("click",showSelectEquipPanel);
         this.parts.push(new RollHighLightMediator(this));
         ori_img_quality_skin = this.img_quality.skin.substr(0,this.img_quality.skin.length - 1);
      }
      
      protected function showSelectEquipPanel(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         ObserverMgr.ins.sendNotice("msg_role_info_show_change_equip_panel",[this,null,3]);
      }
      
      public function get equipVo() : HeroEquipVo
      {
         return dataSource as HeroEquipVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         _data = param1 as PetInfoVo;
         img_redPoint.visible = false;
         if(_data)
         {
            updateStatus();
         }
         else
         {
            this.toolTip = null;
         }
         .super.dataSource = param1;
         ObserverMgr.ins.regObserver(this);
      }
      
      private function updateStatus() : void
      {
         if(_data.id != 0)
         {
            box_lvl.visible = true;
            txt_lvl.text = _data.petInfo.level + "";
            img_icon.url = UrlLib.headIcon(_data.stcVo.head_id);
            img_quality.url = ori_img_quality_skin + _data.stcVo.quality;
            img_redPoint.visible = false;
            this.toolTip = _data;
            txt_name.text = LocaleMgr.ins.getStr(_data.stcVo.name);
            removeEff();
            this.img_bg.visible = false;
         }
         else
         {
            if(!eff)
            {
               eff = new BmcSpriteSheet();
               eff.x = -11;
               eff.y = -10;
               eff.scale = 0.93;
               eff.init(1050,1,"all",true);
               addChild(eff);
            }
            else
            {
               eff.gotoAndPlay(1);
            }
            if(RoleInfoModel.ins.heroInfo && petModel.haveProtectPetList())
            {
               img_redPoint.visible = true;
            }
            else
            {
               removeEff();
               img_redPoint.visible = false;
            }
            this.toolTip = null;
            img_icon.url = "png.comp.image";
            img_quality.url = ori_img_quality_skin + 1;
            box_lvl.visible = false;
            txt_name.visible = false;
            this.img_bg.visible = true;
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["notice_refresh_module_need_resource_data"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         ObserverMgr.ins.regObserver(this);
         var _loc3_:* = param1;
         if("notice_refresh_module_need_resource_data" === _loc3_)
         {
            updateStatus();
         }
      }
      
      private function removeEff() : void
      {
         if(eff)
         {
            eff.dispose();
            eff = null;
         }
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
