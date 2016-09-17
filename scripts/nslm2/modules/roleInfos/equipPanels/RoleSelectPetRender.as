package nslm2.modules.roleInfos.equipPanels
{
   import game.ui.roleInfos.equipPanels.RoleSelectPetRenderUI;
   import nslm2.modules.cultivates.pet.vo.PetInfoVo;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.mediators.RollHighLightMediator;
   
   public class RoleSelectPetRender extends RoleSelectPetRenderUI
   {
       
      
      private var _data:PetInfoVo;
      
      private var eff:BmcSpriteSheet;
      
      private var petModel:PetModel;
      
      private var ori_img_quality_skin:String;
      
      public function RoleSelectPetRender()
      {
         petModel = PetModel.ins;
         super();
         this.parts.push(new RollHighLightMediator(this));
         ori_img_quality_skin = this.img_quality.skin.substr(0,this.img_quality.skin.length - 1);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         _data = param1 as PetInfoVo;
         if(_data)
         {
            updateStatus();
         }
         else
         {
            this.toolTip = null;
         }
         .super.dataSource = param1;
      }
      
      private function updateStatus() : void
      {
         if(_data.id != 0)
         {
            box_lvl.visible = true;
            txt_lvl.text = _data.petInfo.level + "";
            img_icon.url = UrlLib.headIcon(_data.stcVo.head_id);
            img_quality.url = ori_img_quality_skin + _data.stcVo.quality;
            this.toolTip = _data;
            txt_name.text = LocaleMgr.ins.getStr(_data.stcVo.name);
         }
         else
         {
            box_lvl.visible = false;
            txt_name.visible = false;
            img_quality.url = ori_img_quality_skin + 0;
         }
      }
   }
}
