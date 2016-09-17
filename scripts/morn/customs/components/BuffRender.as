package morn.customs.components
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import nslm2.mgrs.stcMgrs.vos.StcBuffVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.common.vo.BuffHasLayersVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class BuffRender extends View
   {
      
      public static const IMG_ICON:String = "img_icon";
      
      public static const IMG_QUALITY:String = "img_quality";
      
      public static const TXT_LAYERS:String = "txt_layers";
      
      public static const TXT_NAME:String = "txt_name";
      
      public static const TXT_DES:String = "txt_des";
       
      
      public var needShowValidBg:Boolean;
      
      public var ori_img_quality_skin:String;
      
      private var _layers:int = 1;
      
      public function BuffRender()
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
      
      public function get ref_txt_layers() : Label
      {
         return getRef("txt_layers");
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
      
      protected function getRef(param1:String) : *
      {
         if(this.hasOwnProperty(param1))
         {
            return this[param1];
         }
         return null;
      }
      
      public function get layers() : int
      {
         return _layers;
      }
      
      public function set layers(param1:int) : void
      {
         _layers = Math.min(stcBuffVo.max_layer,param1);
         validateTxtLayers();
      }
      
      public function get stcBuffId() : int
      {
         return dataSource as int;
      }
      
      public function set stcBuffId(param1:int) : void
      {
         .super.dataSource = param1;
         validateImgIcon();
         validateTxtLayers();
         validateTxtName();
         validateTxtDes();
         validateQuality();
         validateTooltip();
      }
      
      public function get stcBuffVo() : StcBuffVo
      {
         return StcMgr.ins.getBuffVo(this.stcBuffId);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         if(param1 is int)
         {
            stcBuffId = param1 as int;
         }
         if(param1 is BuffHasLayersVo)
         {
            stcBuffId = (param1 as BuffHasLayersVo).buffId;
            layers = (param1 as BuffHasLayersVo).layers;
         }
      }
      
      protected function validateTxtLayers() : void
      {
         if(this.ref_txt_layers)
         {
            if(stcBuffId && layers > 0)
            {
               this.ref_txt_layers.text = layers == 1?"":layers.toString();
            }
            else
            {
               this.ref_txt_layers.text = "";
            }
         }
      }
      
      protected function validateTxtName() : void
      {
         if(this.ref_txt_name)
         {
            if(stcBuffId && layers > 0)
            {
               this.ref_txt_name.text = LocaleMgr.ins.getStr(stcBuffVo.name);
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
            if(stcBuffId && layers > 0)
            {
               this.ref_img_icon.url = UrlLib.buffIcon(int(stcBuffVo.icon_id));
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
            if(stcBuffId && layers > 0)
            {
               this.ref_txt_des.text = LocaleMgr.ins.getStr(stcBuffVo.desc);
            }
            else
            {
               this.ref_txt_des.text = "";
            }
         }
      }
      
      protected function validateQuality() : void
      {
         if(this.ref_img_quality && this.ori_img_quality_skin)
         {
            if(stcBuffId && layers > 0)
            {
               this.ref_img_quality.skin = ori_img_quality_skin + stcBuffVo.quality;
               ref_img_quality.visible = true;
            }
            else
            {
               this.ref_img_quality.skin = ori_img_quality_skin + 1;
               ref_img_quality.visible = needShowValidBg;
            }
         }
      }
      
      protected function validateTooltip() : void
      {
         if(stcBuffId)
         {
            this.toolTip = stcBuffVo;
         }
         else
         {
            this.toolTip = null;
         }
      }
   }
}
