package nslm2.modules.funnies.pkCrossSer.PKCrossComp
{
   import game.ui.pkCrossSer.cheer.CheerAwardRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcSwapActionVo;
   import nslm2.modules.funnies.pkCrossSer.PKCrossModel;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.LabelUtils;
   import proto.SwapActionInfo;
   import proto.SwapActionReq;
   import nslm2.nets.sockets.ServerEngine;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.alerts.FloatUtil;
   
   public class CheerAwardRender extends CheerAwardRenderUI
   {
       
      
      public function CheerAwardRender()
      {
         super();
         this.btn_award.clickHandler = btn_getHandler;
      }
      
      private function get stcVo() : StcSwapActionVo
      {
         return dataSource as StcSwapActionVo;
      }
      
      private function get model() : PKCrossModel
      {
         return PKCrossModel.ins;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         this.list_reward.array = WealthUtil.dropGroupIDToWealthVoArr(stcVo.drop_id);
         this.txt_desc.text = LocaleMgr.ins.getStr(50600013) + stcVo.condition1count;
         this.txt_desc1.text = LabelUtils.countNeedStr(model.cheerInfo.myCheerExp,stcVo.condition1count);
         this.img_got.visible = false;
         this.btn_award.visible = true;
         if(model.cheerInfo.myCheerExp >= stcVo.condition1count)
         {
            _loc2_ = model.getSwapInfo(stcVo.id);
            if(_loc2_)
            {
               if(_loc2_.count < stcVo.limit_count)
               {
                  this.btn_award.disabled = false;
                  this.btn_award.label = LocaleMgr.ins.getStr(41300099);
                  PKCrossCheerModule.img_red1.visible = true;
               }
               else
               {
                  this.img_got.visible = true;
                  this.btn_award.visible = false;
               }
            }
            else
            {
               this.btn_award.disabled = false;
               this.btn_award.label = LocaleMgr.ins.getStr(41300099);
               PKCrossCheerModule.img_red1.visible = true;
            }
         }
         else
         {
            this.btn_award.disabled = true;
            this.btn_award.label = LocaleMgr.ins.getStr(50200403);
         }
      }
      
      private function btn_getHandler() : void
      {
         this.server_swapAction(this.stcVo.id);
      }
      
      public function server_swapAction(param1:int) : void
      {
         var _loc2_:SwapActionReq = new SwapActionReq();
         _loc2_.id = param1;
         ServerEngine.ins.send(8008,_loc2_,server_swapAction_cpl);
      }
      
      private function server_swapAction_cpl() : void
      {
         ObserverMgr.ins.sendNotice("OPT_FINAL_CHEER_SWAPACTION");
         FloatUtil.showGetItemsDisplayPanel(this.list_reward.array);
      }
   }
}
