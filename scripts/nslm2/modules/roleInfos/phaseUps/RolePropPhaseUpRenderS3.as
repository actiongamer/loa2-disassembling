package nslm2.modules.roleInfos.phaseUps
{
   import game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS3UI;
   import nslm2.common.consts.NPCPropConsts;
   import game.ui.roleInfos.NpcPropVo;
   import flash.utils.setTimeout;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.handlers.Handler;
   import com.mz.core.utils.DisplayUtils;
   
   public class RolePropPhaseUpRenderS3 extends RolePropPhaseUpRenderS3UI
   {
       
      
      public var isShow:Boolean;
      
      public function RolePropPhaseUpRenderS3()
      {
         super();
      }
      
      override public function validateName() : void
      {
         if(this.ref_txt_name)
         {
            if(vo != null)
            {
               this.ref_txt_name.text = NPCPropConsts.ins.getLocaleName(vo.propId) + "：";
               this.ref_txt_name.commitMeasure();
               this.ref_txt_name.width = this.ref_txt_name.textWidth + 5;
               NpcPropVo.setLabelColor(ref_txt_value,vo);
               if(vo.value == 0)
               {
                  this.ref_txt_name.visible = false;
                  this.ref_txt_value.visible = false;
                  isShow = false;
               }
               else
               {
                  this.ref_txt_name.visible = true;
                  this.ref_txt_value.visible = true;
                  isShow = true;
               }
               this.img_propLine.visible = false;
            }
            else
            {
               this.ref_txt_name.text = "";
               isShow = false;
            }
         }
      }
      
      override public function showValue() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:* = NPCPropConsts.ins.showValue(vo.value,vo.preFix,vo.fixPos);
         if(vo.floatPos && isNaN(oldValue) == false)
         {
            _loc2_ = vo.value - oldValue;
            if(_loc2_)
            {
               setTimeout(showPropChangeTip,1,_loc2_,_loc1_);
            }
            oldValue = NaN;
         }
         else
         {
            this.ref_txt_value.text = _loc1_;
         }
      }
      
      protected function showPropChangeTip(param1:Number, param2:*) : void
      {
         AlertUtil.showPropChangeTip(LocaleMgr.ins.getStr(2000 + vo.propId),param1,new Handler(floatCpl,[vo,param2]),DisplayUtils.globarCenter(this.ref_txt_value),vo.floatPos);
      }
   }
}
