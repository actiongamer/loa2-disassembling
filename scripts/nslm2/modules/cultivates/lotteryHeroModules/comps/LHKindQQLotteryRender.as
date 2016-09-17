package nslm2.modules.cultivates.lotteryHeroModules.comps
{
   import game.ui.lotteryHeroModules.kindPanels.LHKindQQLotteryRenderUI;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.cultivates.lotteryHeroModules.LHModel;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import com.mz.core.logging.Log;
   
   public class LHKindQQLotteryRender extends LHKindQQLotteryRenderUI
   {
       
      
      public function LHKindQQLotteryRender()
      {
         super();
         this.box_qqFirstLottery.visible = false;
      }
      
      override protected function validateCost() : void
      {
         var _loc3_:Boolean = false;
         var _loc2_:* = NaN;
         var _loc1_:* = null;
         if(cost.kind > 0)
         {
            _loc2_ = 1;
            if(EnvConfig.ins.showQQModule && this.lotteryVo.id == 2010 && LHModel.ins.panelInfo && LHModel.ins.panelInfo.hasfirst == false)
            {
               _loc3_ = true;
               _loc2_ = 0.8;
            }
            else
            {
               _loc3_ = false;
            }
            if(cost.count * _loc2_ <= PlayerModel.ins.getCountByWealthVo(cost))
            {
               if(this.ref_txt_num)
               {
                  this.ref_txt_num.color = 16775367;
               }
               this._isHad = true;
            }
            else
            {
               if(this.ref_txt_num)
               {
                  this.ref_txt_num.color = 16723968;
               }
               this._isHad = false;
            }
            if(_loc3_)
            {
               this.box_qqFirstLottery.visible = true;
               this.render_ori.wealthVo = cost;
               _loc1_ = WealthUtil.createWealthVo(cost.kind,cost.sid,cost.count * 0.8);
               .super.wealthVo = _loc1_;
            }
            else
            {
               this.box_qqFirstLottery.visible = false;
               .super.wealthVo = cost;
            }
         }
         else
         {
            Log.fatal(this,"lottery的cost_res错误",this.lotteryVo.id);
         }
      }
   }
}
