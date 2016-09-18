package nslm2.modules.foundations.activities.panel
{
   import game.ui.activities.panel.ActivityNormalPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import proto.StaticActivity;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.modules.foundations.activities.vo.ActivityInfoVo;
   import nslm2.modules.foundations.activities.model.ActivityModel;
   import nslm2.modules.foundations.activities.service.ActivityService;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.activities.utils.ActivityUtil;
   import nslm2.common.compsEffects.ListCellTweenEffect;
   import proto.StaticActivityReward;
   import proto.ActivityReward;
   import proto.ActivityProgress;
   import nslm2.utils.Uint64Util;
   import nslm2.utils.WealthUtil;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import flash.display.BitmapData;
   import nslm2.utils.TimeUtils;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.vip.model.VipModel;
   
   public class ActivityNormalPanel extends ActivityNormalPanelUI implements IViewStackPage, IObserver
   {
       
      
      private var _mainInfo:StaticActivity;
      
      private var _textCdCtrl:TextCDCtrlS2;
      
      private var _activityChanged:Boolean;
      
      private var repeatChargeActivityVo:ActivityInfoVo;
      
      private var rewardTime:int;
      
      public function ActivityNormalPanel()
      {
         super();
         this._textCdCtrl = new TextCDCtrlS2(this.txt_leftTime,textCDFormat,null);
         this.btn_charge.clickHandler = VipModel.ins.gotoCharge;
         this.btn_getReward.clickHandler = getReward;
         this.box_repeatCharge.visible = false;
         ObserverMgr.ins.regObserver(this);
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         this.txt_activityTime.visible = false;
         this.txt_rewardTime.visible = false;
         this.txt_rule.visible = false;
         if(_mainInfo != null && _mainInfo.id != ActivityModel.ins.nowShowActivity.id)
         {
            _activityChanged = true;
         }
         else
         {
            _activityChanged = false;
         }
         _mainInfo = ActivityModel.ins.nowShowActivity;
         if(_mainInfo)
         {
            this.show();
            _textCdCtrl.start(_mainInfo.endtm);
         }
         else
         {
            this.list_task.dataSource = [];
         }
         this.fadeIn(0,13000);
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
         _textCdCtrl.stop();
      }
      
      public function get model() : ActivityModel
      {
         return ActivityModel.ins;
      }
      
      public function get service() : ActivityService
      {
         return ActivityService.ins;
      }
      
      public function show() : void
      {
         var _loc8_:* = null;
         var _loc5_:* = null;
         var _loc7_:* = null;
         var _loc3_:int = 0;
         var _loc1_:int = 0;
         var _loc6_:int = 0;
         var _loc9_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         this.txt_activityTime.visible = true;
         this.txt_rewardTime.visible = true;
         this.txt_rule.visible = true;
         this.txt_activityName.text = _mainInfo.name;
         this.txt_activityTime.text = LocaleMgr.ins.getStr(60500002) + ActivityUtil.getStartTimeStr(_mainInfo.starttm) + ActivityUtil.getEndTimeStr(_mainInfo.endtm);
         this.txt_rewardTime.text = LocaleMgr.ins.getStr(60500001) + ActivityUtil.getStartTimeStr(_mainInfo.awardStarttm) + ActivityUtil.getEndTimeStr(_mainInfo.awardEndtm);
         this.txt_rule.height = NaN;
         this.txt_rule.text = LocaleMgr.ins.getStr(60500003) + _mainInfo.notice;
         if(panel_rule.vScrollBar && panel_rule.vScrollBar.slider)
         {
            txt_rule.commitMeasure();
            panel_rule.commitMeasure();
            panel_rule.vScrollBar.slider.visible = false;
            panel_rule.vScrollBar.scrollSize = 18;
         }
         if(!ActivityUtil.isRepeatExChangeEvent((model.getRewardVos(_mainInfo.id)[0] as ActivityInfoVo).staticActivityReward))
         {
            this.list_task.visible = true;
            this.box_repeatCharge.visible = false;
            if(_activityChanged == false)
            {
               new ListCellTweenEffect(this.list_task,model.getRewardVos(_mainInfo.id)).set_compareDataHandler(compareDataHandler).exec();
            }
            else
            {
               this.list_task.dataSource = model.getRewardVos(_mainInfo.id);
            }
         }
         else
         {
            repeatChargeActivityVo = model.getRewardVos(_mainInfo.id)[0];
            _loc8_ = repeatChargeActivityVo.staticActivityReward;
            _loc5_ = ActivityModel.ins.getReward(repeatChargeActivityVo.activityId,repeatChargeActivityVo.staticActivityReward.id);
            _loc7_ = _loc5_.progress[0];
            this.list_task.visible = false;
            this.box_repeatCharge.visible = true;
            _loc3_ = Uint64Util.toInt(_loc8_.__function[0].para1);
            this.txt_curCharge.text = LocaleMgr.ins.getStr(999902576,[_loc3_]);
            _loc1_ = Uint64Util.toInt(_loc7_.para1);
            this.txt_totalCharge.text = LocaleMgr.ins.getStr(999902577,[_loc1_]);
            _loc6_ = Uint64Util.toInt(_loc8_.__function[0].para2);
            _loc9_ = _loc1_ / _loc3_;
            rewardTime = (_loc6_ > _loc9_?_loc9_:int(_loc6_)) - Uint64Util.toInt(_loc7_.para2);
            rewardTime = rewardTime < 0?0:rewardTime;
            _loc4_ = Math.floor(Math.min(_loc1_ / _loc3_,_loc6_));
            this.txt_totalTimes.text = LocaleMgr.ins.getStr(999902578,[_loc6_ - Uint64Util.toInt(_loc7_.para2) + "/" + _loc6_]);
            this.txt_curTimes.text = LocaleMgr.ins.getStr(999902579,[rewardTime]);
            this.progress.value = _loc1_ > 0 && _loc1_ % _loc3_ == 0?1:Number(_loc1_ % _loc3_ / _loc3_);
            this.txt_progress.text = (_loc1_ > 0 && _loc1_ % _loc3_ == 0?_loc3_:_loc1_ % _loc3_) + "/" + _loc3_;
            if(this.repeatChargeActivityVo && this.repeatChargeActivityVo.staticActivityReward)
            {
               ActivityUtil.lastPay = this.repeatChargeActivityVo.staticActivityReward.pay;
               ActivityUtil.lastReward = this.repeatChargeActivityVo.staticActivityReward.reward;
               ActivityUtil.lastRewardId = this.repeatChargeActivityVo.staticActivityReward.id;
               this.list_reward_base.dataSource = WealthUtil.costStrToArr(_loc8_.reward);
               txt_tip.x = this.list_reward.x + WealthUtil.costStrToArr(_loc8_.reward).length * 60;
               if(rewardTime > 0)
               {
                  ActivityUtil.setActivityInfoVoCount(this.repeatChargeActivityVo,rewardTime);
               }
            }
            this.list_reward.dataSource = WealthUtil.costStrToArr(_loc8_.reward);
            if(_loc5_.status == 2)
            {
               this.btn_getReward.label = LocaleMgr.ins.getStr(60500004);
               this.btn_getReward.disabled = false;
            }
            else if(_loc5_.status == 1)
            {
               this.btn_getReward.label = LocaleMgr.ins.getStr(60500005);
               this.btn_getReward.disabled = true;
            }
            else if(_loc5_.status == 3)
            {
               this.btn_getReward.label = LocaleMgr.ins.getStr(41300087);
               this.btn_getReward.disabled = true;
            }
         }
         if(_mainInfo.pictures)
         {
            _loc2_ = _mainInfo.pictures;
            if(_loc2_.indexOf(",") != -1)
            {
               _loc2_ = _loc2_.split(",")[0];
            }
            ResMgr.ins.load(1,_loc2_,loadCpl);
         }
         else
         {
            this.img_bg.url = "png.uiActivity.img_titleInitBg";
         }
      }
      
      private function getReward() : void
      {
         ActivityService.ins.getReward(this.repeatChargeActivityVo,rewardTime);
      }
      
      private function compareDataHandler(param1:ActivityInfoVo) : int
      {
         return param1.staticActivityReward.id;
      }
      
      private function loadCpl(param1:String, param2:*) : void
      {
         if(param2)
         {
            this.img_bg.bitmapData = param2 as BitmapData;
         }
         else
         {
            this.img_bg.url = "png.uiActivity.img_titleInitBg";
         }
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(999000186) + TimeUtils.hisCNWithDay(param1);
      }
      
      public function getFocusNotices() : Array
      {
         return ["repeated_charge_updated"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("repeated_charge_updated" === _loc3_)
         {
            if(this.repeatChargeActivityVo != null)
            {
               show();
            }
         }
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
