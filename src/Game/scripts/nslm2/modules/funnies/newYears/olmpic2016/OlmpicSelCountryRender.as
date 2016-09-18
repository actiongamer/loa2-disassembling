package nslm2.modules.funnies.newYears.olmpic2016
{
   import game.ui.newYears.olmpic2016.OlmpicSelCountryRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcCountryIconVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.utils.ObjectUtils;
   
   public class OlmpicSelCountryRender extends OlmpicSelCountryRenderUI
   {
       
      
      public var data:StcCountryIconVo;
      
      public function OlmpicSelCountryRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         data = param1 as StcCountryIconVo;
         if(data)
         {
            this.img_flag.skin = UrlLib.olmpicCountryFlagUrl(data.icon);
            this.txt_name.text = LocaleMgr.ins.getStr(data.name);
            this.img_current.visible = false;
            if(OlmpicSelCountryModel.ins.selCountry > 0)
            {
               this.mouseChildren = false;
               this.mouseEnabled = false;
               if(OlmpicSelCountryModel.ins.selCountry == data.country)
               {
                  this.img_current.visible = true;
                  this.selectBoxAll.visible = true;
                  ObjectUtils.gray(this,false);
               }
               else
               {
                  ObjectUtils.gray(this);
               }
            }
         }
      }
   }
}
