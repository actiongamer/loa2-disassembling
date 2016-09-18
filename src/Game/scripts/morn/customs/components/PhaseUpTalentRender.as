package morn.customs.components
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import nslm2.modules.roleInfos.phaseUps.talents.PhaseUpTalentVo;
   import morn.customs.FilterLib;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class PhaseUpTalentRender extends View
   {
      
      public static const IMG_ICON:String = "img_icon";
      
      public static const IMG_QUALITY:String = "img_quality";
      
      public static const TXT_LEVEL:String = "txt_level";
      
      public static const TXT_NAME:String = "txt_name";
       
      
      public function PhaseUpTalentRender()
      {
         super();
         if(this.ref_img_icon)
         {
            ref_img_icon.smoothing = true;
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
      
      public function get ref_img_quality() : Image
      {
         return getRef("img_quality");
      }
      
      protected function getRef(param1:String) : *
      {
         if(this.hasOwnProperty(param1))
         {
            return this[param1];
         }
         return null;
      }
      
      public function get stcTablentId() : int
      {
         return vo == null?0:vo.stcTablentId;
      }
      
      public function get vo() : PhaseUpTalentVo
      {
         return dataSource as PhaseUpTalentVo;
      }
      
      public function set vo(param1:PhaseUpTalentVo) : void
      {
         .super.dataSource = param1;
         validateImgIcon();
         validateTxtLevel();
         validateTxtName();
         validateTooltip();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         if(param1 is PhaseUpTalentVo)
         {
            vo = param1 as PhaseUpTalentVo;
         }
      }
      
      protected function validateImgIcon() : void
      {
         if(this.ref_img_icon != null)
         {
            if(stcTablentId)
            {
               if(this.vo.lv > 0)
               {
                  this.ref_img_icon.filters = null;
               }
               else
               {
                  this.ref_img_icon.filters = FilterLib.ins.getFilterArr(402);
               }
               this.ref_img_icon.url = UrlLib.phaseUpTalentIcon(StcMgr.ins.getHeroTalentInfoVo(stcTablentId).icon);
            }
            else
            {
               this.ref_img_icon.url = null;
            }
         }
      }
      
      protected function validateTxtLevel() : void
      {
         if(this.ref_txt_level)
         {
            if(stcTablentId)
            {
               this.ref_txt_level.text = LocaleConsts.lvStr(this.vo.lv);
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
            if(vo)
            {
               this.ref_txt_name.text = LocaleMgr.ins.getStr(StcMgr.ins.getHeroTalentInfoVo(stcTablentId).name);
            }
            else
            {
               this.ref_txt_name.text = "";
            }
         }
      }
      
      protected function validateTooltip() : void
      {
         if(vo)
         {
            this.toolTip = this.vo;
         }
         else
         {
            this.toolTip = null;
         }
      }
   }
}
