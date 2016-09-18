package nslm2.modules.foundations.activities.utils
{
   import nslm2.modules.foundations.activities.vo.ActivityInfoVo;
   import nslm2.modules.foundations.activities.model.ActivityModel;
   import proto.ActivityReward;
   import proto.ActivityProgress;
   import nslm2.modules.foundations.activities.consts.ActivityConsts;
   import nslm2.utils.Uint64Util;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import nslm2.utils.LabelUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.ServerTimer;
   import proto.StaticActivityReward;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.bag.itemModuels.BagModel;
   
   public class ActivityUtil
   {
      
      public static var lastRewardId:int;
      
      public static var lastPay:String;
      
      public static var lastReward:String;
      
      public static var hasChanged:Boolean;
       
      
      public function ActivityUtil()
      {
         super();
      }
      
      public static function getProgressStr(param1:ActivityInfoVo) : String
      {
         var _loc8_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:* = NaN;
         var _loc6_:* = NaN;
         var _loc2_:String = "";
         var _loc5_:ActivityReward = ActivityModel.ins.getReward(param1.activityId,param1.staticActivityReward.id);
         var _loc10_:int = 0;
         var _loc9_:* = _loc5_.progress;
         for each(var _loc4_ in _loc5_.progress)
         {
            if(ActivityConsts.exchangeArr.indexOf(_loc4_.kind) != -1 || ActivityConsts.newExchangeArr.indexOf(param1.staticActivityReward.id) != -1)
            {
               if(ActivityConsts.exchangeArr.indexOf(_loc4_.kind) != -1)
               {
                  _loc7_ = Uint64Util.toInt(param1.staticActivityReward.__function[0].para1);
                  _loc3_ = Number(Uint64Util.toInt(_loc4_.para1));
               }
               else
               {
                  _loc7_ = param1.staticActivityReward.swapTimes;
                  _loc3_ = Number(_loc5_.swapTimes);
               }
               _loc6_ = Number(_loc7_);
               _loc3_ = Number(_loc3_ > _loc6_?_loc6_:Number(_loc3_));
               _loc2_ = _loc2_ + TextFieldUtil.htmlText2(LocaleConsts.getNumberAbbr3(_loc3_.toString()) + "/" + LocaleConsts.getNumberAbbr3(_loc6_.toString()) + "\n",LabelUtils.getExchangeAvailColor(_loc3_,_loc6_));
            }
            else if(ActivityConsts.notShowProgressArr.indexOf(_loc4_.kind) == -1)
            {
               _loc8_ = Uint64Util.toInt(param1.staticActivityReward.__function[0].para2);
               _loc3_ = 0;
               _loc6_ = 0;
               if(ActivityConsts.showParam2Arr.indexOf(_loc4_.kind) != -1)
               {
                  _loc3_ = Number(Uint64Util.toInt(_loc4_.para2));
                  _loc6_ = Number(_loc8_);
                  _loc3_ = Number(_loc3_ > _loc6_?_loc6_:Number(_loc3_));
                  _loc2_ = _loc2_ + TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(999000187) + "(" + LocaleConsts.getNumberAbbr3(_loc3_.toString(),3) + "/" + LocaleConsts.getNumberAbbr3(_loc6_.toString(),2) + ")\n",LabelUtils.getCountNeedColor(_loc3_,_loc6_));
               }
               else if(ActivityConsts.exchangeArr.indexOf(_loc4_.kind) != -1)
               {
                  _loc7_ = Uint64Util.toInt(param1.staticActivityReward.__function[0].para1);
                  _loc3_ = Number(Uint64Util.toInt(_loc4_.para1));
                  _loc6_ = Number(_loc7_);
                  _loc3_ = Number(_loc3_ > _loc6_?_loc6_:Number(_loc3_));
                  _loc2_ = _loc2_ + TextFieldUtil.htmlText2(LocaleConsts.getNumberAbbr3(_loc3_.toString()) + "/" + LocaleConsts.getNumberAbbr3(_loc6_.toString()) + "\n",LabelUtils.getExchangeAvailColor(_loc3_,_loc6_));
               }
               else
               {
                  _loc7_ = Uint64Util.toInt(param1.staticActivityReward.__function[0].para1);
                  _loc3_ = Number(Uint64Util.toInt(_loc4_.para1));
                  _loc6_ = Number(_loc7_);
                  _loc3_ = Number(_loc3_ > _loc6_?_loc6_:Number(_loc3_));
                  _loc2_ = _loc2_ + TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(999000187) + "(" + _loc3_.toString() + "/" + LocaleConsts.getNumberAbbr3(_loc6_.toString(),2) + ")\n",LabelUtils.getCountNeedColor(_loc3_,_loc6_));
               }
            }
         }
         return _loc2_;
      }
      
      public static function getStartTimeStr(param1:int) : String
      {
         if(param1 == 0)
         {
            return LocaleMgr.ins.getStr(999000188) + "——";
         }
         return TimeUtils.getFullTimeStr(param1) + "——";
      }
      
      public static function getEndTimeStr(param1:int) : String
      {
         if(param1 == 0)
         {
            return LocaleMgr.ins.getStr(999000189);
         }
         return TimeUtils.getFullTimeStr(param1);
      }
      
      public static function getEventTimeRangeStatus(param1:int, param2:int) : int
      {
         var _loc3_:int = ServerTimer.ins.second;
         if(_loc3_ >= param1 && _loc3_ < param2)
         {
            return 2;
         }
         if(_loc3_ < param1)
         {
            return 1;
         }
         return 1;
      }
      
      public static function isComplete(param1:ActivityInfoVo) : Boolean
      {
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:ActivityReward = ActivityModel.ins.getReward(param1.activityId,param1.staticActivityReward.id);
         var _loc7_:int = 0;
         var _loc6_:* = _loc3_.progress;
         for each(var _loc2_ in _loc3_.progress)
         {
            if(ActivityConsts.notShowProgressArr.indexOf(_loc2_.kind) == -1)
            {
               _loc5_ = Uint64Util.toInt(param1.staticActivityReward.__function[0].para2);
               if(ActivityConsts.showParam2Arr.indexOf(_loc2_.kind) != -1)
               {
                  if(_loc2_.para2.toString() == _loc5_.toString())
                  {
                     return true;
                  }
               }
               else if(!ActivityUtil.isNewExChangeEvent(param1.staticActivityReward))
               {
                  _loc4_ = Uint64Util.toInt(param1.staticActivityReward.__function[0].para1);
                  if(_loc2_.para1.toString() == _loc4_.toString())
                  {
                     return true;
                  }
               }
            }
         }
         return false;
      }
      
      public static function isExChangeEvent(param1:StaticActivityReward) : Boolean
      {
         if(param1.kind == 2 && ActivityConsts.exchangeArr.indexOf(param1.__function[0].id) == -1 && ActivityConsts.newExchangeArr.indexOf(param1.id) == -1)
         {
            ActivityConsts.newExchangeArr.push(param1.id);
         }
         return isOldExChangeEvent(param1) || isNewExChangeEvent(param1);
      }
      
      public static function isOldExChangeEvent(param1:StaticActivityReward) : Boolean
      {
         return ActivityConsts.exchangeArr.indexOf(param1.__function[0].id) != -1;
      }
      
      public static function isNewExChangeEvent(param1:StaticActivityReward) : Boolean
      {
         return ActivityConsts.newExchangeArr.indexOf(param1.id) != -1;
      }
      
      public static function isRepeatExChangeEvent(param1:StaticActivityReward) : Boolean
      {
         return ActivityConsts.repeatExchangeArr.indexOf(param1.__function[0].id) != -1;
      }
      
      public static function isVipExChangeEventAvail(param1:ActivityInfoVo) : Boolean
      {
         var _loc8_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:* = NaN;
         var _loc6_:* = NaN;
         if(PlayerModel.ins.vip < Uint64Util.toInt(param1.staticActivityReward.__function[0].para2))
         {
            return false;
         }
         var _loc2_:String = "";
         var _loc5_:ActivityReward = ActivityModel.ins.getReward(param1.activityId,param1.staticActivityReward.id);
         var _loc10_:int = 0;
         var _loc9_:* = _loc5_.progress;
         for each(var _loc4_ in _loc5_.progress)
         {
            _loc8_ = Uint64Util.toInt(param1.staticActivityReward.__function[0].para2);
            _loc3_ = 0;
            _loc6_ = 0;
            if(ActivityConsts.exchangeArrWithVip.indexOf(_loc4_.kind) != -1)
            {
               _loc7_ = Uint64Util.toInt(param1.staticActivityReward.__function[0].para1);
               _loc3_ = Number(Uint64Util.toInt(_loc4_.para1));
               _loc6_ = Number(_loc7_);
               return _loc3_ < _loc6_ && _loc8_ <= Uint64Util.toInt(_loc4_.para2);
            }
         }
         return false;
      }
      
      public static function isChargeExChangeEventAvail(param1:ActivityInfoVo) : Boolean
      {
         var _loc8_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:* = NaN;
         var _loc6_:* = NaN;
         var _loc2_:String = "";
         var _loc5_:ActivityReward = ActivityModel.ins.getReward(param1.activityId,param1.staticActivityReward.id);
         var _loc10_:int = 0;
         var _loc9_:* = _loc5_.progress;
         for each(var _loc4_ in _loc5_.progress)
         {
            _loc8_ = Uint64Util.toInt(param1.staticActivityReward.__function[0].para2);
            _loc3_ = 0;
            _loc6_ = 0;
            if(ActivityConsts.exchangeArrWithCharge.indexOf(_loc4_.kind) != -1)
            {
               _loc7_ = Uint64Util.toInt(param1.staticActivityReward.__function[0].para1);
               _loc3_ = Number(Uint64Util.toInt(_loc4_.para1));
               _loc6_ = Number(_loc7_);
               return _loc3_ < _loc6_ && _loc8_ <= Uint64Util.toInt(_loc4_.para2);
            }
         }
         return false;
      }
      
      public static function isTimeLimitChargeEventAvail(param1:ActivityInfoVo) : Boolean
      {
         var _loc2_:String = "";
         var _loc4_:StaticActivityReward = param1.staticActivityReward;
         var _loc6_:int = 0;
         var _loc5_:* = _loc4_.__function;
         for each(var _loc3_ in _loc4_.__function)
         {
            if(ActivityConsts.autoFilterArr.indexOf(_loc3_.id) != -1)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function isExChangeEventWithVipCondition(param1:StaticActivityReward) : Boolean
      {
         return ActivityConsts.exchangeArrWithVip.indexOf(param1.__function[0].id) != -1;
      }
      
      public static function isExChangeEventWithChargeCondition(param1:StaticActivityReward) : Boolean
      {
         return ActivityConsts.exchangeArrWithCharge.indexOf(param1.__function[0].id) != -1;
      }
      
      public static function isGenderInfoEvent(param1:StaticActivityReward) : Boolean
      {
         return ActivityConsts.genderInfoArr.indexOf(param1.__function[0].id) != -1;
      }
      
      public static function isRightGender(param1:StaticActivityReward) : Boolean
      {
         var _loc2_:int = Uint64Util.toInt(param1.__function[0].para2);
         return _loc2_ == 0 || _loc2_ == PlayerModel.ins.sex;
      }
      
      public static function setActivityInfoVoCount(param1:ActivityInfoVo, param2:int = -1) : void
      {
         var _loc8_:* = null;
         var _loc4_:int = 0;
         var _loc7_:* = null;
         var _loc6_:int = 0;
         var _loc9_:String = "|";
         if(param2 != -1)
         {
            var _loc11_:int = 0;
            var _loc10_:* = lastPay.split("|");
            for each(var _loc5_ in lastPay.split("|"))
            {
               _loc8_ = _loc5_.split(":");
               _loc4_ = _loc8_.pop();
               _loc8_.push(_loc4_ * param2);
               _loc9_ = _loc9_ + ("|" + _loc8_.join(":"));
            }
            param1.staticActivityReward.pay = _loc9_.split("||").pop();
            _loc7_ = "|";
            var _loc13_:int = 0;
            var _loc12_:* = lastReward.split("|");
            for each(var _loc3_ in lastReward.split("|"))
            {
               _loc8_ = _loc3_.split(":");
               _loc6_ = _loc8_.pop();
               _loc8_.push(_loc6_ * param2);
               _loc7_ = _loc7_ + ("|" + _loc8_.join(":"));
            }
            param1.staticActivityReward.reward = _loc7_.split("||").pop();
            hasChanged = true;
         }
         else
         {
            if(param1 && param1.staticActivityReward)
            {
               param1.staticActivityReward.pay = lastPay;
               param1.staticActivityReward.reward = lastReward;
            }
            lastRewardId = 0;
            lastPay = null;
            lastReward = null;
            hasChanged = false;
         }
      }
      
      public static function exchangeArrRedPointCheck(param1:Array, param2:Boolean = false) : Boolean
      {
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            if(exchangeRedPointCheck(_loc3_,param2))
            {
               return true;
            }
         }
         return false;
      }
      
      public static function exchangeRedPointCheck(param1:ActivityInfoVo, param2:Boolean) : Boolean
      {
         var _loc7_:int = 0;
         var _loc4_:Number = NaN;
         var _loc6_:ActivityReward = ActivityModel.ins.getReward(param1.activityId,param1.staticActivityReward.id);
         if(_loc6_.status == 3)
         {
            return false;
         }
         if(!ActivityUtil.isExChangeEvent(param1.staticActivityReward))
         {
            return false;
         }
         if(ActivityUtil.isExChangeEventWithVipCondition(param1.staticActivityReward))
         {
            if(!ActivityUtil.isVipExChangeEventAvail(param1))
            {
               return false;
            }
         }
         else if(ActivityUtil.isExChangeEventWithChargeCondition(param1.staticActivityReward))
         {
            if(!ActivityUtil.isChargeExChangeEventAvail(param1))
            {
               return false;
            }
         }
         var _loc5_:ActivityProgress = _loc6_.progress[0];
         if(_loc5_.kind == 5007 || _loc5_.kind == 5008 || _loc5_.kind == 1029)
         {
            _loc7_ = Uint64Util.toInt(param1.staticActivityReward.__function[0].para2);
            _loc4_ = Uint64Util.toInt(_loc5_.para2);
            if(_loc4_ < _loc7_)
            {
               return false;
            }
         }
         else if(param1.staticActivityReward.kind == 2)
         {
            _loc7_ = Uint64Util.toInt(param1.staticActivityReward.__function[0].para1);
            _loc4_ = Uint64Util.toInt(_loc5_.para1);
            if(_loc4_ < _loc7_)
            {
               return false;
            }
         }
         var _loc9_:int = 0;
         var _loc8_:* = WealthUtil.costStrToArr(param1.staticActivityReward.pay);
         for each(var _loc3_ in WealthUtil.costStrToArr(param1.staticActivityReward.pay))
         {
            if(_loc3_.kind == 20)
            {
               if(_loc3_.showCount > BagModel.ins.getStcCount(_loc3_.sid))
               {
                  return false;
               }
            }
            else
            {
               if(_loc3_.kind == 3)
               {
                  if(param2)
                  {
                     if(_loc3_.showCount > PlayerModel.ins.diamond)
                     {
                        return false;
                     }
                     continue;
                  }
                  return false;
               }
               if(_loc3_.kind == 4)
               {
                  if(param2)
                  {
                     if(_loc3_.showCount > PlayerModel.ins.getWealthValue(4))
                     {
                        return false;
                     }
                     continue;
                  }
                  return false;
               }
               if(_loc3_.showCount > PlayerModel.ins.getCountByWealthVo(_loc3_))
               {
                  return false;
               }
            }
         }
         return true;
      }
      
      public static function filterExpired(param1:Array) : Array
      {
         var _loc5_:* = null;
         var _loc2_:Array = [];
         var _loc4_:int = 1;
         var _loc8_:int = 0;
         var _loc7_:* = param1;
         for each(var _loc6_ in param1)
         {
            _loc5_ = ActivityModel.ins.getReward(_loc6_.activityId,_loc6_.staticActivityReward.id);
            if(_loc5_.status == 3 || _loc5_.status == 2)
            {
               if(_loc5_.id > _loc4_)
               {
                  _loc4_ = Uint64Util.toInt((_loc6_.staticActivityReward.__function[0] as proto.StaticActivityReward.Function).para1);
               }
            }
         }
         var _loc12_:int = 0;
         var _loc11_:* = param1;
         for each(_loc6_ in param1)
         {
            _loc5_ = ActivityModel.ins.getReward(_loc6_.activityId,_loc6_.staticActivityReward.id);
            var _loc10_:int = 0;
            var _loc9_:* = _loc6_.staticActivityReward.__function;
            for each(var _loc3_ in _loc6_.staticActivityReward.__function)
            {
               if(_loc6_.staticActivityReward.startTm + TimeUtils.countDayToSecond(Uint64Util.toInt(_loc3_.para1)) >= ServerTimer.ins.curtimeZero || ServerTimer.ins.second < ServerTimer.ins.openServerTimeZero + TimeUtils.countDayToSecond(14))
               {
                  _loc2_.push(_loc6_);
               }
            }
         }
         return _loc2_;
      }
   }
}
