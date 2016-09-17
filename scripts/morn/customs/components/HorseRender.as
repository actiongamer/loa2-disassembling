package morn.customs.components
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import com.mz.core.logging.logs.LogFatalBase;
   import nslm2.mgrs.stcMgrs.vos.StcSaddlehorseVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   
   public class HorseRender extends View
   {
      
      public static const IMG_ICON:String = "img_icon";
      
      public static const IMG_QUALITY:String = "img_quality";
      
      public static const TXT_NAME:String = "txt_name";
      
      public static const TXT_STATE:String = "txt_state";
       
      
      private var _stcSaddlehorseId:int;
      
      protected var stcSaddlehorseVo:StcSaddlehorseVo;
      
      public function HorseRender()
      {
         super();
      }
      
      public function get ref_img_icon() : Image
      {
         return getRef("img_icon");
      }
      
      public function get ref_img_quality() : Image
      {
         return getRef("img_quality");
      }
      
      public function get ref_txt_name() : Label
      {
         return getRef("txt_name");
      }
      
      public function get ref_txt_state() : Label
      {
         return getRef("txt_state");
      }
      
      protected function getRef(param1:String) : *
      {
         if(this.hasOwnProperty(param1))
         {
            return this[param1];
         }
         return null;
      }
      
      public function get stcSaddlehorseId() : int
      {
         return _stcSaddlehorseId as int;
      }
      
      public function set stcSaddlehorseId(param1:int) : void
      {
         _stcSaddlehorseId = param1;
         if(this.stcSaddlehorseId)
         {
            stcSaddlehorseVo = StcMgr.ins.getSaddlehorseVo(this.stcSaddlehorseId);
            if(stcSaddlehorseVo == null)
            {
               new LogFatalBase(this,"static_saddlehorse缺少ID:" + this.stcSaddlehorseId);
            }
         }
         else
         {
            stcSaddlehorseVo = null;
         }
         this.validateAll();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(dataSource is int)
         {
            this.stcSaddlehorseId = dataSource as int;
         }
      }
      
      protected function validateAll() : void
      {
         this.validateImgIcon();
         this.validateTooltip();
         this.validateTxtName();
         this.validateTxtState();
         this.validateQuality();
      }
      
      protected function validateImgIcon() : void
      {
         if(this.ref_img_icon != null)
         {
            if(stcSaddlehorseVo)
            {
               this.ref_img_icon.url = UrlLib.horseUrl(this.stcSaddlehorseId);
            }
            else
            {
               this.ref_img_icon.url = null;
            }
         }
      }
      
      protected function validateTxtState() : void
      {
      }
      
      protected function validateTxtName() : void
      {
         if(this.ref_txt_name != null)
         {
            if(stcSaddlehorseVo)
            {
               this.ref_txt_name.color = ColorLib.qualityColor(stcSaddlehorseVo.quality);
               this.ref_txt_name.text = LocaleMgr.ins.getStr(this.stcSaddlehorseVo.name);
               this.ref_txt_name.visible = true;
            }
            else
            {
               this.ref_txt_name.visible = false;
            }
         }
      }
      
      protected function validateQuality() : void
      {
         if(this.ref_img_quality)
         {
            if(stcSaddlehorseVo)
            {
               WealthUtil.changeQualitySkin(this.ref_img_quality,stcSaddlehorseVo.quality);
               ref_img_quality.visible = true;
            }
            else
            {
               ref_img_quality.visible = false;
            }
         }
      }
      
      protected function validateTooltip() : void
      {
         if(stcSaddlehorseVo)
         {
            this.toolTip = stcSaddlehorseVo;
         }
         else
         {
            this.toolTip = null;
         }
      }
   }
}
