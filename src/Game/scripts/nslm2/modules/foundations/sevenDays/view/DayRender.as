package nslm2.modules.foundations.sevenDays.view
{
   import game.ui.sevenDayModule.view.DayRenderUI;
   import nslm2.common.uiEffects.RoleGrowFilterMed;
   import nslm2.mgrs.stcMgrs.vos.StcSevendayRewardVo;
   import nslm2.mgrs.stcMgrs.vos.Stc14DayTaskVo;
   import nslm2.modules.foundations.sevenDays.model.SevenDaysModel;
   import nslm2.modules.foundations.fourteenDays.model.FourteenDaysModel;
   import nslm2.mgrs.skins.Effect2DUtils;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.utils.FilterUtil;
   
   public class DayRender extends DayRenderUI
   {
       
      
      private var _data;
      
      private var filterMed:RoleGrowFilterMed;
      
      private var _isRoll:Boolean;
      
      public function DayRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(param1 is StcSevendayRewardVo)
         {
            _data = param1 as StcSevendayRewardVo;
         }
         else
         {
            _data = param1 as Stc14DayTaskVo;
         }
         if(_data)
         {
            if(_data is StcSevendayRewardVo)
            {
               _loc3_ = SevenDaysModel.ins.getAvailNumByDay(_data.id - 1);
            }
            else
            {
               _loc3_ = FourteenDaysModel.ins.getAvailNumByDay(_data.id - 1);
            }
            if(_loc3_ > 0 && (_data is StcSevendayRewardVo || _data is Stc14DayTaskVo && _data.id - 1 <= FourteenDaysModel.ins.actualDay))
            {
               _loc2_ = Effect2DUtils.showBtnEff_btnBig(this).setScaleXY(1.65,1.8);
               _loc2_.x = -14;
               _loc2_.y = -14;
               this.red_point.visible = true;
               this.red_point.txt_count.text = _loc3_.toString();
               DisplayUtils.addChildAbove(this.red_point,_loc2_);
            }
            else
            {
               hideRed_point();
            }
            if(_data is StcSevendayRewardVo)
            {
               this.text_title.text = LocaleMgr.ins.getStr(_data.title_id);
               day_label.text = LocaleMgr.ins.getStr(_data.desc_id);
               this.img_bg.skin = UrlLib.sevenDayIcon(_data.id);
               this.img_icon.skin = UrlLib.sevenDayTitleIcon(_data.id);
               if(_data.id > SevenDaysModel.ins.actualDay + 1)
               {
                  this.disabled = true;
               }
               else
               {
                  this.disabled = false;
               }
            }
            else
            {
               this.text_title.text = LocaleMgr.ins.getStr(_data.name);
               day_label.text = LocaleMgr.ins.getStr(_data.des);
               this.img_bg.skin = UrlLib.sevenDayIcon(_data.id - 7);
               this.img_icon.skin = UrlLib.fourteenDayTitleIcon(_data.id - 7);
               if(_data.id > FourteenDaysModel.ins.actualDay + 1)
               {
                  this.disabled = true;
               }
               else
               {
                  this.disabled = false;
               }
            }
         }
      }
      
      public function hideRed_point() : void
      {
         Effect2DUtils.hideBtnEff_btnBig(this);
         this.red_point.visible = false;
      }
      
      override public function changeSelectState(param1:int) : void
      {
         super.changeSelectState(param1);
         if(param1 == 2 || param1 == 3)
         {
            this.img_bg.filters = [FilterUtil.highLightFilter(20)];
         }
         else
         {
            this.img_bg.filters = [];
         }
      }
   }
}
