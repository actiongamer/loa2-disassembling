package nslm2.modules.funnies.secretExplore
{
   import nslm2.modules.funnies.arenas.scores.ArenaScoreRender;
   import nslm2.mgrs.stcMgrs.vos.StcSwapActionVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.common.model.PlayerModel;
   import morn.core.utils.ObjectUtils;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import flash.events.Event;
   
   public class SEScoreRender extends ArenaScoreRender
   {
       
      
      public function SEScoreRender()
      {
         super();
         this.txt_tip.text = LocaleMgr.ins.getStr(50700031);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = undefined;
         var _loc4_:int = 0;
         .super.dataSource = param1;
         if(this.vo)
         {
            _loc3_ = this.vo.stcVo;
            if(_loc3_)
            {
               this.image_line.visible = true;
               this.txt_tip.visible = false;
               this.list_reward.visible = true;
               this.num_label.toolTip = LocaleMgr.ins.getStr(999000402,[_loc3_.condition1count]);
               this.num_label.text = String(_loc3_.condition1count);
               this.list_reward.array = WealthUtil.dropGroupIDToWealthVoArr(_loc3_.drop_id);
               if(this.vo.count < _loc3_.limit_count)
               {
                  if(PlayerModel.ins.level >= _loc3_.conditionLevel)
                  {
                     _loc2_ = PlayerModel.ins.getWealthValue(34);
                     _loc4_ = _loc2_ == null?0:_loc2_;
                     if(_loc4_ >= _loc3_.condition1count)
                     {
                        this.btn_get.label = LocaleMgr.ins.getStr(999000240);
                        this.btn_get.disabled = false;
                        this.btn_get.visible = true;
                        this.have_got.visible = false;
                        this.image_line.disabled = false;
                        this.image_icon.disabled = false;
                        ObjectUtils.gray(this.num_label,false);
                     }
                     else
                     {
                        this.btn_get.label = LocaleMgr.ins.getStr(50200403);
                        this.btn_get.disabled = true;
                        this.btn_get.visible = true;
                        this.have_got.visible = false;
                        this.image_line.disabled = true;
                        this.image_icon.disabled = true;
                        ObjectUtils.gray(this.num_label,true);
                     }
                  }
                  else
                  {
                     this.btn_get.label = LocaleMgr.ins.getStr(999000403) + LocaleConsts.lvStr(_loc3_.conditionLevel);
                     this.btn_get.disabled = true;
                     this.btn_get.visible = true;
                     this.have_got.visible = false;
                     this.image_line.disabled = true;
                     this.image_icon.disabled = true;
                     ObjectUtils.gray(this.num_label,true);
                  }
               }
               else
               {
                  this.have_got.visible = true;
                  this.btn_get.visible = false;
                  this.image_line.disabled = false;
                  this.image_icon.disabled = false;
                  ObjectUtils.gray(this.num_label,false);
               }
            }
            else
            {
               this.num_label.toolTip = "";
               this.image_line.visible = false;
               this.image_icon.disabled = false;
               ObjectUtils.gray(this.num_label,false);
               this.list_reward.visible = false;
               this.txt_tip.visible = true;
               this.num_label.text = "0";
               this.btn_get.visible = false;
               this.have_got.visible = false;
            }
         }
         showOrHideBtnEffect();
      }
      
      override protected function server_swapAction_cpl() : void
      {
         this.vo.info.count++;
         SEModel.ins.checkScoreCanGet();
         FloatUtil.showGetItemsDisplayPanel(this.list_reward.array);
         this.dataSource = this.vo;
         SEModel.ins.dispatchEvent(new Event("ArenaService.EVT_UPDATE_ONE_CLICK"));
      }
   }
}
