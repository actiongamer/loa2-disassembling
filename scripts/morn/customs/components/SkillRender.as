package morn.customs.components
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import nslm2.common.vo.SkillRenderVo;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import com.mz.core.utils.FilterUtil;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import nslm2.mgrs.skins.ColorLib;
   
   public class SkillRender extends View
   {
      
      public static const IMG_ICON:String = "img_icon";
      
      public static const IMG_QUALITY:String = "img_quality";
      
      public static const TXT_LEVEL:String = "txt_level";
      
      public static const TXT_NAME:String = "txt_name";
      
      public static const TXT_DES:String = "txt_des";
      
      public static const TXT_KIND:String = "txt_kind";
       
      
      public var needShowValidBg:Boolean;
      
      public var ori_img_quality_skin:String;
      
      private var _skillRenderVo:SkillRenderVo;
      
      public function SkillRender()
      {
         super();
         ref_img_icon.smoothing = true;
         if(this.ref_img_quality)
         {
            ori_img_quality_skin = this.ref_img_quality.skin.substr(0,this.ref_img_quality.skin.length - 1);
         }
      }
      
      public function get ref_img_icon() : Image
      {
         return getRef("img_icon");
      }
      
      public function get ref_txt_level() : Label
      {
         return getRef("txt_level");
      }
      
      public function get ref_txt_name() : Label
      {
         return getRef("txt_name");
      }
      
      public function get ref_txt_des() : Label
      {
         return getRef("txt_des");
      }
      
      public function get ref_img_quality() : Image
      {
         return getRef("img_quality");
      }
      
      public function get ref_txt_kind() : Label
      {
         return getRef("txt_kind");
      }
      
      protected function getRef(param1:String) : *
      {
         if(this.hasOwnProperty(param1))
         {
            return this[param1];
         }
         return null;
      }
      
      public function get stcSkillId() : int
      {
         return dataSource as int;
      }
      
      public function set stcSkillId(param1:int) : void
      {
         .super.dataSource = param1;
         validateImgIcon();
         validateTxtLevel();
         validateTxtName();
         validateTxtDes();
         validateTxtKind();
         validateQuality();
         validateTooltip();
      }
      
      public function get skillRenderVo() : SkillRenderVo
      {
         return _skillRenderVo;
      }
      
      public function set skillRenderVo(param1:SkillRenderVo) : void
      {
         _skillRenderVo = param1;
         this.stcSkillId = _skillRenderVo.stcSkillId;
         if(_skillRenderVo.isHero && HeroInfoUtil.hasUnlockedSkill(_skillRenderVo.stcSkillId,_skillRenderVo.stcNpcId) == false)
         {
            if(this.ref_img_icon)
            {
               this.ref_img_icon.filters = [FilterUtil.grayFilter()];
            }
         }
         else
         {
            this.ref_img_icon.filters = null;
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         if(param1 is int)
         {
            stcSkillId = param1 as int;
         }
         else if(param1 is SkillRenderVo)
         {
            skillRenderVo = param1 as SkillRenderVo;
         }
      }
      
      protected function validateTxtLevel() : void
      {
         if(this.ref_txt_level)
         {
            if(stcSkillId)
            {
               this.ref_txt_level.text = LocaleConsts.lvStr(StcMgr.ins.getSkillVo(stcSkillId).level);
            }
            else
            {
               this.ref_txt_level.text = "";
            }
         }
      }
      
      protected function validateTxtName() : void
      {
         if(this.ref_txt_name)
         {
            if(stcSkillId)
            {
               this.ref_txt_name.text = LocaleMgr.ins.getStr(StcMgr.ins.getSkillVo(stcSkillId).name);
            }
            else
            {
               this.ref_txt_name.text = "";
            }
         }
      }
      
      protected function validateImgIcon() : void
      {
         if(this.ref_img_icon != null)
         {
            if(stcSkillId)
            {
               this.ref_img_icon.url = UrlLib.skillIcon(int(StcMgr.ins.getSkillVo(stcSkillId).skill_icon));
            }
            else
            {
               this.ref_img_icon.url = null;
            }
         }
      }
      
      protected function validateTxtDes() : void
      {
         if(this.ref_txt_des != null)
         {
            if(stcSkillId)
            {
               this.ref_txt_des.text = LocaleMgr.ins.getStr(StcMgr.ins.getSkillVo(stcSkillId).skill_description1);
            }
            else
            {
               this.ref_txt_des.text = "";
            }
         }
      }
      
      protected function validateTxtKind() : void
      {
         var _loc1_:* = null;
         if(this.ref_txt_kind != null)
         {
            if(stcSkillId)
            {
               _loc1_ = StcMgr.ins.getSkillVo(stcSkillId);
               this.ref_txt_kind.text = LocaleMgr.ins.getStr(4300 + _loc1_.show_type);
            }
            else
            {
               this.ref_txt_kind.text = "";
            }
         }
      }
      
      protected function validateQuality() : void
      {
         var _loc1_:* = null;
         if(this.ref_img_quality && this.ori_img_quality_skin)
         {
            if(stcSkillId)
            {
               _loc1_ = StcMgr.ins.getSkillVo(stcSkillId);
               this.ref_img_quality.skin = ori_img_quality_skin + _loc1_.quality;
               ref_img_quality.visible = true;
            }
            else
            {
               this.ref_img_quality.skin = ori_img_quality_skin + 1;
               ref_img_quality.visible = needShowValidBg;
            }
            if(this.ref_txt_name && stcSkillId)
            {
               this.ref_txt_name.color = ColorLib.qualityColor(_loc1_.quality);
            }
         }
      }
      
      protected function validateTooltip() : void
      {
         if(skillRenderVo)
         {
            this.toolTip = skillRenderVo;
         }
         else if(stcSkillId)
         {
            this.toolTip = StcMgr.ins.getSkillVo(stcSkillId);
         }
         else
         {
            this.toolTip = null;
         }
      }
   }
}
