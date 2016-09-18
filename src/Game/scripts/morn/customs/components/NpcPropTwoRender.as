package morn.customs.components
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import game.ui.roleInfos.NpcProp2Vo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.consts.NPCPropConsts;
   import nslm2.modules.foundations.AlertUtil;
   import morn.core.handlers.Handler;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.common.compsEffects.FloatZoomInEffCtrl;
   
   public class NpcPropTwoRender extends View
   {
      
      public static const IMG_ICON:String = "img_icon";
      
      public static const TXT_NAME:String = "txt_name";
      
      public static const TXT_VALUE:String = "txt_value";
      
      public static const TXT_VALUE2:String = "txt_value2";
       
      
      protected var oldValue:Number;
      
      public function NpcPropTwoRender()
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
      
      public function get ref_txt_value2() : Label
      {
         return getRef("txt_value2");
      }
      
      protected function getRef(param1:String) : *
      {
         if(this.hasOwnProperty(param1))
         {
            return this[param1];
         }
         return null;
      }
      
      public function get vo() : NpcProp2Vo
      {
         return dataSource as NpcProp2Vo;
      }
      
      public function set vo(param1:NpcProp2Vo) : void
      {
         this.dataSource = param1;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         if(param1 && (param1 as NpcProp2Vo).floatPos && vo != null && vo.propId == (param1 as NpcProp2Vo).propId)
         {
            oldValue = vo.value;
         }
         .super.dataSource = param1;
         validateIcon();
         validateName();
         validateValue();
         validateValue2();
         validateTooltip();
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
               showName();
            }
            else
            {
               this.ref_txt_name.text = "";
            }
         }
      }
      
      public function showName() : void
      {
         this.ref_txt_name.text = NPCPropConsts.ins.getLocaleName(vo.propId);
      }
      
      public function validateValue() : void
      {
         if(this.ref_txt_value)
         {
            if(vo && !isNaN(vo.value) && vo.value != 0)
            {
               this.ref_txt_value.color = vo.getValueColor();
               showValue();
            }
            else
            {
               this.ref_txt_value.color = 458496;
               this.ref_txt_value.text = "0";
            }
         }
      }
      
      public function showValue() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:* = NPCPropConsts.ins.showValue(vo.value,vo.preFix);
         if(vo.floatPos && isNaN(oldValue) == false)
         {
            _loc2_ = vo.value - oldValue;
            if(_loc2_ != 0)
            {
               AlertUtil.showPropChangeTip(LocaleMgr.ins.getStr(2000 + vo.propId),_loc2_,new Handler(floatCpl,[vo,_loc1_]),DisplayUtils.globarCenter(this.ref_txt_value),vo.floatPos);
               oldValue = NaN;
            }
            else
            {
               this.ref_txt_value.text = _loc1_;
            }
         }
         else
         {
            this.ref_txt_value.text = _loc1_;
         }
      }
      
      private function floatCpl(param1:*, param2:*) : void
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
      
      public function validateValue2() : void
      {
         if(this.ref_txt_value2)
         {
            if(vo && !isNaN(vo.valueNext) && vo.valueNext != 0)
            {
               showValue2();
            }
            else
            {
               this.ref_txt_value2.text = "";
            }
         }
      }
      
      public function showValue2() : void
      {
         this.ref_txt_value2.text = "+" + NPCPropConsts.ins.showValue(vo.valueNext);
      }
   }
}
