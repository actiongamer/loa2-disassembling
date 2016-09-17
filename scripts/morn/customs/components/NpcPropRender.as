package morn.customs.components
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.HBox;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.consts.NPCPropConsts;
   import nslm2.modules.foundations.AlertUtil;
   import morn.core.handlers.Handler;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.common.compsEffects.FloatZoomInEffCtrl;
   
   public class NpcPropRender extends View
   {
      
      public static const IMG_ICON:String = "img_icon";
      
      public static const TXT_NAME:String = "txt_name";
      
      public static const TXT_VALUE:String = "txt_value";
      
      public static const HBOX_NUM:String = "hbox_num";
      
      public static const TXT_ADDVALUE:String = "txt_addValue";
      
      public static const IMG_ARROW:String = "img_arrowUp";
       
      
      protected var oldValue:Number;
      
      public function NpcPropRender()
      {
         super();
      }
      
      public function get ref_img_icon() : Image
      {
         return getRef("img_icon");
      }
      
      public function get ref_txt_name() : Label
      {
         return getRef("txt_name");
      }
      
      public function get ref_txt_value() : Label
      {
         return getRef("txt_value");
      }
      
      public function get ref_hbox_num() : HBox
      {
         return getRef("hbox_num");
      }
      
      public function get ref_txt_addValue() : Label
      {
         return getRef("txt_addValue");
      }
      
      public function get ref_img_arrow() : Image
      {
         return getRef("img_arrowUp");
      }
      
      protected function getRef(param1:String) : *
      {
         if(this.hasOwnProperty(param1))
         {
            return this[param1];
         }
         return null;
      }
      
      public function get vo() : NpcPropVo
      {
         return dataSource as NpcPropVo;
      }
      
      public function set vo(param1:NpcPropVo) : void
      {
         this.dataSource = param1;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         if(param1 && (param1 as NpcPropVo).floatPos && vo != null && vo.propId == (param1 as NpcPropVo).propId)
         {
            oldValue = vo.value;
         }
         .super.dataSource = param1;
         validateIcon();
         validateName();
         validateValue();
         validateAddValue();
         validateTooltip();
         if(vo && vo.showArrow && ref_img_arrow)
         {
            this.ref_img_arrow.visible = true;
            this.parts.push(new FloatUpDownEffCtrl().init(this.ref_img_arrow,NaN,2,2));
         }
      }
      
      public function validateIcon() : void
      {
         if(this.ref_img_icon)
         {
            if(vo != null)
            {
               this.ref_img_icon.url = UrlLib.propIcon(vo.propId);
            }
            else
            {
               this.ref_img_icon.url = null;
            }
         }
      }
      
      public function validateTooltip() : void
      {
         if(vo != null)
         {
            this.toolTip = LocaleMgr.ins.getStr(30100900 + this.vo.propId);
         }
         else
         {
            this.toolTip = null;
         }
      }
      
      public function validateName() : void
      {
         if(this.ref_txt_name)
         {
            if(vo != null)
            {
               this.showTxtName(NPCPropConsts.ins.getLocaleName(vo.propId));
            }
            else
            {
               this.ref_txt_name.text = "";
            }
         }
      }
      
      protected function showTxtName(param1:String) : void
      {
         this.ref_txt_name.text = param1;
      }
      
      public function validateValue() : void
      {
         if(this.ref_txt_value)
         {
            if(vo != null)
            {
               showValue();
            }
            else
            {
               this.ref_txt_value.text = "";
            }
         }
         if(this.ref_hbox_num != null)
         {
            this.ref_hbox_num.refresh();
            this.changeSize();
         }
      }
      
      public function validateAddValue() : void
      {
         var _loc1_:* = undefined;
         if(this.ref_txt_addValue)
         {
            if(vo != null)
            {
               _loc1_ = NPCPropConsts.ins.showValue(vo.value,vo.preFix);
               if(vo.value != 0)
               {
                  this.ref_txt_addValue.text = "+" + _loc1_;
                  this.ref_txt_addValue.style = "重要提示绿";
               }
               else
               {
                  this.ref_txt_addValue.num = vo.value;
                  this.ref_txt_addValue.style = "普通说明";
               }
            }
            else
            {
               this.ref_txt_addValue.text = "";
            }
         }
      }
      
      public function showValue() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:* = NPCPropConsts.ins.showValue(vo.value,vo.preFix,vo.fixPos,vo.isPercent);
         NpcPropVo.setLabelColor(ref_txt_value,vo);
         if(vo.floatPos && isNaN(oldValue) == false)
         {
            _loc2_ = vo.value - oldValue;
            if(_loc2_)
            {
               AlertUtil.showPropChangeTip(LocaleMgr.ins.getStr(2000 + vo.propId),_loc2_,new Handler(floatCpl,[vo,_loc1_]),DisplayUtils.globarCenter(this.ref_txt_value),vo.floatPos);
            }
            oldValue = NaN;
         }
         else
         {
            this.ref_txt_value.text = _loc1_;
         }
      }
      
      public function floatCpl(param1:*, param2:*) : void
      {
         if(this.isDisposed)
         {
            return;
         }
         if(vo.floatPos == null)
         {
            return;
         }
         this.ref_txt_value.text = param2;
         return;
         §§push(new FloatZoomInEffCtrl(this.ref_txt_value));
      }
   }
}
