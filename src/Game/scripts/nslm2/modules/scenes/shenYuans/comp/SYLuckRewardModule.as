package nslm2.modules.scenes.shenYuans.comp
{
   import game.ui.lotteryHeroModules.getRewards.LotteryHeroGetRewardModuleUI;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.scenes.shenYuans.model.ShenYuanModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.cultivates.lotteryHeroModules.getRewards.GetRewardRender;
   import morn.customs.expands.MornExpandUtil;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.ShenYuanGetLuckyBoxReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ShenYuanGetLuckyBoxRes;
   import nslm2.nets.sockets.ServerEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import com.greensock.TweenLite;
   import nslm2.modules.footstones.alerts.FloatUtil;
   
   public class SYLuckRewardModule extends LotteryHeroGetRewardModuleUI
   {
       
      
      private var canGet:Boolean;
      
      private var type:int;
      
      private var luckParam:Array;
      
      public function SYLuckRewardModule()
      {
         super();
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(41500133);
         this.pageBar.bindList(list_reward);
         this.pageBar.pageTo(0,false);
         this.list_kind.visible = false;
         this.list_reward.visible = true;
         this.btn_return.visible = false;
         this.btn_getReward.visible = false;
         this.pageBar.visible = true;
         this.render_cost.visible = false;
         this.btn_getReward.labelMargin = "0";
         this.btn_getReward.centerX = 0;
      }
      
      public function get pageBar() : IPageBar
      {
         return this.pageBarUI as IPageBar;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc7_:int = 0;
         var _loc4_:* = null;
         var _loc8_:int = 0;
         var _loc2_:* = null;
         type = param1.type;
         luckParam = param1.luckParam;
         if(type == 0)
         {
            _loc7_ = luckParam[1];
            _loc4_ = StcMgr.ins.getItemVo(_loc7_);
            canGet = ShenYuanModel.ins.luckValue >= luckParam[0];
         }
         else if(type == 1)
         {
            _loc7_ = luckParam[3];
            _loc4_ = StcMgr.ins.getItemVo(_loc7_);
            canGet = ShenYuanModel.ins.luckValue >= luckParam[2];
         }
         this.txt_prompt.text = LocaleMgr.ins.getStr(41500134,[type == 0?luckParam[0]:luckParam[2]]);
         var _loc3_:Array = [];
         this.list_reward.selectedIndex = -1;
         var _loc6_:Array = _loc4_.lotteryGetRewardHeroIdArr;
         var _loc5_:int = _loc6_.length;
         _loc8_ = 0;
         while(_loc8_ < _loc5_)
         {
            _loc7_ = _loc6_[_loc8_];
            _loc3_.push(WealthUtil.createItemVo(_loc7_));
            _loc8_++;
         }
         this.list_reward.changeHandler = list_reward_change;
         this.list_reward.array = _loc3_;
         if(this.list_reward.length > 1)
         {
            this.list_spliteLine.spaceX = 120;
            this.list_spliteLine.repeatX = 3;
            this.list_spliteLine.centerX = 0;
         }
         else
         {
            this.list_spliteLine.visible = false;
         }
         this.list_reward.commitMeasure();
         _loc5_ = list_reward.cells.length;
         _loc8_ = 0;
         while(_loc8_ < _loc5_)
         {
            _loc2_ = list_reward.cells[_loc8_] as GetRewardRender;
            _loc2_.canGet = canGet;
            _loc8_++;
         }
         this.btn_getReward.visible = this.canGet;
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         super.preShow(param1);
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_getReward === _loc3_)
         {
            if(this.canGet)
            {
               if(this.list_reward.selectedIndex == -1)
               {
                  AlertUtil.floatErr(LocaleMgr.ins.getStr(11900040));
               }
               else
               {
                  lotteryGetReward((this.list_reward.selectedItem as WealthVo).sid);
               }
            }
            else
            {
               ModuleMgr.ins.closeModule(this.moduleId);
            }
         }
      }
      
      public function lotteryGetReward(param1:uint) : void
      {
         var _loc2_:ShenYuanGetLuckyBoxReq = new ShenYuanGetLuckyBoxReq();
         _loc2_.itemId = param1;
         _loc2_.groupId = type == 0?luckParam[1]:luckParam[3];
         ServerEngine.ins.send(6088,_loc2_,server_getReward);
      }
      
      private function server_getReward(param1:ShenYuanGetLuckyBoxRes, param2:ServerEvent) : void
      {
         ShenYuanModel.ins.luckValue = param1.jifen;
         ObserverMgr.ins.sendNotice("SHENYUAN_REFRESH_LUCK_VALUE");
         TweenLite.delayedCall(0.2,FloatUtil.showGetItemsDisplayPanel,[[this.list_reward.selectedItem as WealthVo]]);
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      private function list_reward_change(param1:int) : void
      {
         if(!this.canGet)
         {
            AlertUtil.floatErr(LocaleMgr.ins.getStr(41500135));
         }
      }
   }
}
