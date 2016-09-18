package nslm2.modules.foundations.activities
{
   import game.ui.activities.ActivityExchangeUI;
   import nslm2.modules.foundations.activities.vo.ActivityInfoVo;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.activities.utils.ActivityUtil;
   import nslm2.utils.WealthUtil;
   import nslm2.common.model.PlayerModel;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.foundations.activities.model.ActivityModel;
   import proto.ActivityReward;
   import proto.ActivityProgress;
   import nslm2.utils.Uint64Util;
   import flash.events.Event;
   import nslm2.modules.foundations.activities.service.ActivityService;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class ActivityExchange extends ActivityExchangeUI
   {
       
      
      private var lastNum:int;
      
      private var fromExchangeButton:Boolean = false;
      
      public function ActivityExchange()
      {
         super();
      }
      
      private function get vo() : ActivityInfoVo
      {
         return this.dataSource as ActivityInfoVo;
      }
      
      public function get numBarRef() : NumBarS1
      {
         return this.numBar as NumBarS1;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         var _loc10_:int = 0;
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(999000190);
         this.dataSource = param1;
         ActivityUtil.lastPay = this.vo.staticActivityReward.pay;
         ActivityUtil.lastReward = this.vo.staticActivityReward.reward;
         ActivityUtil.lastRewardId = this.vo.staticActivityReward.id;
         var _loc8_:Array = WealthUtil.costStrToArr(this.vo.staticActivityReward.pay).sortOn("sid");
         this.numBarRef.addEventListener("evt_numbar_value_change",numBarRef_change);
         var _loc4_:int = PlayerModel.ins.getCountByWealthVo(_loc8_[0]) / _loc8_[0].showCount;
         var _loc12_:int = 0;
         var _loc11_:* = _loc8_;
         for each(var _loc7_ in _loc8_)
         {
            _loc5_ = PlayerModel.ins.getCountByWealthVo(_loc7_);
            _loc2_ = _loc5_ / _loc7_.showCount;
            _loc4_ = _loc4_ > _loc2_?_loc2_:int(_loc4_);
         }
         var _loc9_:ActivityReward = ActivityModel.ins.getReward(this.vo.activityId,this.vo.staticActivityReward.id);
         var _loc14_:int = 0;
         var _loc13_:* = _loc9_.progress;
         for each(var _loc6_ in _loc9_.progress)
         {
            if(ActivityUtil.isOldExChangeEvent(this.vo.staticActivityReward))
            {
               _loc10_ = Uint64Util.toInt(this.vo.staticActivityReward.__function[0].para1);
               _loc5_ = Math.abs(Uint64Util.toInt(_loc6_.para1) - _loc10_);
            }
            else
            {
               _loc10_ = this.vo.staticActivityReward.swapTimes;
               _loc5_ = Math.abs(_loc9_.swapTimes - _loc10_);
            }
            _loc4_ = _loc4_ > _loc5_?_loc5_:int(_loc4_);
         }
         _loc8_ = WealthUtil.costStrToArr(this.vo.staticActivityReward.pay).sortOn("sid");
         this.list_cost.repeatX = _loc8_.length;
         this.list_cost.dataSource = _loc8_;
         this.img_arrow.x = 55 + this.list_cost.width - 54;
         this.list_reward.x = 110 + this.list_cost.width - 54;
         this.box_exchange.width = 98 + this.list_cost.width - 54 - 44;
         this.img_arrow.visible = true;
         this.list_cost.visible = true;
         this.lastNum = _loc4_;
         var _loc3_:Array = WealthUtil.costStrToArr(this.vo.staticActivityReward.reward);
         _loc3_.sort(WealthUtil.rewardSortFun);
         this.list_reward.repeatX = _loc3_.length;
         this.list_reward.dataSource = _loc3_;
         this.box_exchange.x = 92 - (this.list_cost.width - 54 - 44 + (this.list_reward.repeatX - 1) * 60) / 2;
         this.numBarRef.init(1,_loc4_,1);
         this.btn_ok.label = LocaleMgr.ins.getStr(999000190);
         this.btn_ok.clickHandler = clickHandler;
         super.preShow(param1);
      }
      
      private function numBarRef_change(param1:Event) : void
      {
         ActivityUtil.setActivityInfoVoCount(this.vo,this.numBarRef.nowNum);
         var _loc3_:Array = WealthUtil.costStrToArr(this.vo.staticActivityReward.pay).sortOn("sid");
         this.list_cost.repeatX = _loc3_.length;
         this.list_cost.dataSource = _loc3_;
         var _loc2_:Array = WealthUtil.costStrToArr(this.vo.staticActivityReward.reward);
         _loc2_.sort(WealthUtil.rewardSortFun);
         this.list_reward.repeatX = _loc2_.length;
         this.list_reward.dataSource = _loc2_;
         this.lastNum = this.numBarRef.nowNum;
      }
      
      private function clickHandler() : void
      {
         ActivityService.ins.getReward(this.vo,this.numBarRef.nowNum);
         this.fromExchangeButton = true;
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      override public function preClose(param1:Object = null) : void
      {
         if(!fromExchangeButton)
         {
            ActivityUtil.setActivityInfoVoCount(this.vo);
         }
         super.preClose(param1);
      }
   }
}
