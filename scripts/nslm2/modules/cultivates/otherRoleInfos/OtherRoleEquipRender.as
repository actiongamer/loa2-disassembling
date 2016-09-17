package nslm2.modules.cultivates.otherRoleInfos
{
   import game.ui.otherRoleInfos.render.OtherRoleEquipRenderUI;
   import morn.core.components.Label;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.roleInfos.equipPanels.HeroEquipVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcEquipStrengthVo;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.consts.QualityConsts;
   import nslm2.utils.WealthUtil;
   import com.mz.core.mediators.RollHighLightMediator;
   
   public class OtherRoleEquipRender extends OtherRoleEquipRenderUI
   {
       
      
      private var starNum:Label;
      
      public function OtherRoleEquipRender()
      {
         starNum = new Label();
         super();
         this.buttonMode = true;
         img_icon.smoothing = true;
         this.parts.push(new RollHighLightMediator(this));
      }
      
      override public function get wealthVo() : WealthVo
      {
         if(equipVo)
         {
            return equipVo.wealthVo;
         }
         return null;
      }
      
      public function get equipVo() : HeroEquipVo
      {
         return dataSource as HeroEquipVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(equipVo)
         {
            this.img_bg.skin = "png.a5.commonImgs.img_equipRenderBg" + equipVo.place;
         }
         if(!wealthVo)
         {
            box_lvl.visible = false;
            list_stars.visible = false;
            starNum.visible = false;
            this.label_jinglian.visible = false;
         }
         else
         {
            box_lvl.visible = true;
            if(equipVo.place < 8)
            {
               _loc2_ = StcMgr.ins.getEquipStrengthVo(wealthVo.item.strengthId);
               if(_loc2_)
               {
                  txt_lvl.text = _loc2_.level + "";
               }
               else
               {
                  txt_lvl.text = "0";
               }
            }
            else
            {
               txt_lvl.text = wealthVo.treasure.level + "";
            }
            if(FuncOpenAutoCtrl.checkOpen(30501) && wealthVo.item && StcMgr.ins.getEquipJinglianVo(wealthVo.item.jinglianId).level > 0)
            {
               this.label_jinglian.visible = true;
               if(ClientConfig.isChineseLang())
               {
                  label_jinglian.text = StcMgr.ins.getEquipJinglianVo(wealthVo.item.jinglianId).level + LocaleMgr.ins.getStr(999001135);
               }
               else
               {
                  label_jinglian.text = LocaleMgr.ins.getStr(999001135) + StcMgr.ins.getEquipJinglianVo(wealthVo.item.jinglianId).level;
               }
               label_jinglian.color = QualityConsts.getQuColor(wealthVo.quality);
            }
            else
            {
               this.label_jinglian.visible = false;
            }
            txt_name.x = this.width - txt_name.width >> 1;
            label_jinglian.x = txt_name.x + txt_name.width + 5;
            WealthUtil.changeQualitySkin(this.img_lvlBg,wealthVo.quality);
         }
      }
      
      override protected function validateQuality() : void
      {
         if(this.ref_img_quality)
         {
            if(wealthVo && wealthVo.kind != 0)
            {
               WealthUtil.changeQualitySkin(this.ref_img_quality,wealthVo.quality);
               ref_img_quality.visible = true;
            }
            else
            {
               WealthUtil.changeQualitySkin(this.ref_img_quality,1);
            }
         }
      }
   }
}
