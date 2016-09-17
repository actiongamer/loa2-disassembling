package nslm2.modules.foundations.activities.model
{
   import flash.events.EventDispatcher;
   import com.mz.core.configs.EnvConfig;
   import nslm2.utils.ServerTimer;
   import com.mz.core.utils.DictHash;
   import proto.StaticActivity;
   import proto.StaticActivitysRes;
   import proto.StaticActivityReward;
   import proto.ActivityGetInfosRes;
   import proto.ActivityInfo;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.foundations.activities.utils.ActivityTimeManager;
   import proto.ActivityReward;
   import proto.ActivityRewardNotify;
   import nslm2.modules.foundations.activities.consts.ActivityConsts;
   import proto.ActivityProgress;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.activities.vo.ActivityInfoVo;
   import nslm2.modules.foundations.activities.utils.ActivityUtil;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import org.manager.DateUtils;
   import nslm2.utils.Uint64Util;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNewFunctionVo;
   
   public class ActivityModel extends EventDispatcher
   {
      
      public static const EVENT_HERO_PRAC_DROP_REWARD:int = 1009;
      
      public static const EVENT_ARENA_SHENGWANG_REWARD:int = 1010;
      
      public static const EVENT_SHENYUAN_COIN_REWARD:int = 1011;
      
      public static const EVENT_STAGE_DROP_REWARD:int = 1012;
      
      public static const EVENT_ELITE_STAGE_DROP_REWARD:int = 1013;
      
      public static const EVENT_SHENYUAN_CHEST:int = 1023;
      
      public static const EVENT_HERO_AWAKEN:int = 1025;
      
      public static const EVENT_HERO_GRADEUP:int = 1036;
      
      public static const ONLY_ITEM_DOUBLE_KIND:Array = [1025];
      
      private static var _ins:nslm2.modules.foundations.activities.model.ActivityModel;
       
      
      private var haveIdLib:Object;
      
      public var staticActivityMainInfoDict:DictHash;
      
      public var staticActivityDict:DictHash;
      
      public var activityInfoDict:DictHash;
      
      public var nowShowActivity:StaticActivity;
      
      public var needHotUpdate:Boolean;
      
      public var initForeshowFuncId:int;
      
      private var foreshowFuncIds:Array;
      
      public function ActivityModel()
      {
         haveIdLib = {};
         foreshowFuncIds = [];
         super();
      }
      
      public static function get ins() : nslm2.modules.foundations.activities.model.ActivityModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.activities.model.ActivityModel();
         }
         return _ins;
      }
      
      public function have(param1:int) : Boolean
      {
         var _loc2_:* = null;
         if(EnvConfig.ins.showDebugModule)
         {
            return true;
         }
         if(haveIdLib[param1])
         {
            _loc2_ = haveIdLib[param1];
            if(ServerTimer.ins.second >= uint(_loc2_[0]) && ServerTimer.ins.second < uint(_loc2_[1]))
            {
               return true;
            }
         }
         return false;
      }
      
      public function initStaticData(param1:StaticActivitysRes) : void
      {
         haveIdLib = {};
         staticActivityMainInfoDict = new DictHash();
         staticActivityDict = new DictHash();
         if(param1 != null)
         {
            var _loc4_:int = 0;
            var _loc3_:* = param1.acs;
            for each(var _loc2_ in param1.acs)
            {
               this.onStaticChangeOne(_loc2_);
            }
         }
      }
      
      private function onStaticChangeOne(param1:StaticActivity) : void
      {
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:* = undefined;
         var _loc6_:DictHash = new DictHash();
         var _loc8_:int = 0;
         var _loc7_:* = param1.ar;
         for each(var _loc4_ in param1.ar)
         {
            _loc3_ = _loc4_.__function.length;
            _loc5_ = 0;
            while(_loc5_ < _loc3_)
            {
               _loc2_ = _loc4_.__function[_loc5_];
               if(_loc2_ && _loc2_.hasOwnProperty("id"))
               {
                  haveIdLib[_loc2_.id] = [param1.starttm,param1.endtm];
               }
               _loc5_++;
            }
            _loc6_.put(_loc4_.id,_loc4_);
         }
         staticActivityMainInfoDict.put(param1.id,param1);
         staticActivityDict.put(param1.id,_loc6_);
      }
      
      public function onInfoChange(param1:ActivityGetInfosRes) : void
      {
         activityInfoDict = new DictHash();
         if(param1 != null)
         {
            var _loc4_:int = 0;
            var _loc3_:* = param1.info;
            for each(var _loc2_ in param1.info)
            {
               this.onInfoChangeOne(_loc2_);
            }
         }
         this.dispatchEvent(new MzEvent("evtGetInfoCpl"));
         ActivityTimeManager.ins.init();
         this.changeEventTimeRangeState();
         this.checkHasCanReward();
      }
      
      public function onInfoChangeOne(param1:ActivityInfo) : void
      {
         var _loc3_:DictHash = new DictHash();
         var _loc5_:int = 0;
         var _loc4_:* = param1.reward;
         for each(var _loc2_ in param1.reward)
         {
            _loc3_.put(_loc2_.id,_loc2_);
         }
         activityInfoDict.put(param1.id,_loc3_);
      }
      
      public function onRewardChangeOne(param1:ActivityRewardNotify) : void
      {
         var _loc2_:DictHash = this.activityInfoDict.getValue(param1.aid);
         _loc2_.put(param1.reward.id,param1.reward);
         if(param1.reward.status == 2 && param1.reward.progress.length > 0 && ActivityConsts.repeatExchangeArr.indexOf((param1.reward.progress[0] as ActivityProgress).kind) != -1)
         {
            ObserverMgr.ins.sendNotice("repeated_charge_updated");
         }
      }
      
      public function onRewardCpl(param1:ActivityInfoVo) : void
      {
         var _loc2_:ActivityReward = getReward(param1.activityId,param1.staticActivityReward.id);
         if(!ActivityUtil.isExChangeEvent(param1.staticActivityReward) || ActivityUtil.isComplete(param1))
         {
            _loc2_.status = 3;
         }
         this.dispatchEvent(new MzEvent("evtRewardCpl",param1));
         checkHasCanReward();
      }
      
      public function getStaticActivity(param1:int) : StaticActivity
      {
         return staticActivityMainInfoDict.getValue(param1);
      }
      
      public function getReward(param1:int, param2:int) : ActivityReward
      {
         var _loc3_:DictHash = activityInfoDict.getValue(param1);
         return _loc3_.getValue(param2);
      }
      
      public function getRewardVos(param1:int) : Array
      {
         var _loc2_:Array = [];
         var _loc4_:DictHash = staticActivityDict.getValue(param1);
         var _loc6_:int = 0;
         var _loc5_:* = _loc4_.array;
         for each(var _loc3_ in _loc4_.array)
         {
            if(ActivityUtil.isGenderInfoEvent(_loc3_))
            {
               if(ActivityUtil.isRightGender(_loc3_))
               {
                  _loc2_.push(new ActivityInfoVo(param1,_loc3_));
               }
            }
            else
            {
               _loc2_.push(new ActivityInfoVo(param1,_loc3_));
            }
         }
         _loc2_.sort(sortFunc);
         return _loc2_;
      }
      
      public function setExchange(param1:int, param2:DictHash, param3:Boolean = false) : void
      {
         var _loc6_:* = null;
         var _loc5_:int = 0;
         var _loc8_:* = null;
         var _loc12_:int = 0;
         var _loc11_:* = param2.array;
         for each(var _loc7_ in param2.array)
         {
            _loc6_ = WealthUtil.costStrToArr(_loc7_.pay);
            var _loc10_:int = 0;
            var _loc9_:* = _loc6_;
            for each(var _loc4_ in _loc6_)
            {
               _loc5_ = PlayerModel.ins.getCountByWealthVo(_loc4_);
               if(_loc5_ > 0)
               {
                  _loc8_ = nslm2.modules.foundations.activities.model.ActivityModel.ins.getReward(param1,_loc7_.id);
                  if(_loc4_.showCount > _loc5_ && _loc8_.status == 2)
                  {
                     _loc8_.status = 1;
                  }
                  if(param3 == false && _loc8_.status == 2 && (_loc4_.kind == 3 || _loc4_.kind == 4))
                  {
                     _loc8_.status = 1;
                  }
               }
            }
         }
      }
      
      public function activityHasCanReward(param1:int, param2:Boolean = false) : Boolean
      {
         var _loc5_:DictHash = activityInfoDict.getValue(param1);
         var _loc3_:DictHash = staticActivityDict.getValue(param1);
         if(_loc3_.array.length > 0 && ActivityUtil.isExChangeEvent(_loc3_.array[0]))
         {
            setExchange(param1,_loc3_,param2);
         }
         var _loc7_:int = 0;
         var _loc6_:* = _loc5_.array;
         for each(var _loc4_ in _loc5_.array)
         {
            if(_loc4_.status == 2)
            {
               return true;
            }
         }
         return false;
      }
      
      public function checkHasCanReward() : Boolean
      {
         var _loc1_:Boolean = false;
         var _loc4_:int = 0;
         var _loc3_:* = staticActivityMainInfoDict.array;
         for each(var _loc2_ in staticActivityMainInfoDict.array)
         {
            _loc1_ = activityNeedShow(_loc2_) && (activityHasCanReward(_loc2_.id) || ActivityUtil.exchangeArrRedPointCheck(getRewardVos(_loc2_.id)));
            if(_loc1_ == true)
            {
               ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(60500,true));
               return true;
            }
         }
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(60500,false));
         return false;
      }
      
      public function changeEventTimeRangeState() : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         var _loc8_:int = 0;
         var _loc5_:Array = staticActivityMainInfoDict.array;
         var _loc14_:int = 0;
         var _loc13_:* = _loc5_;
         for each(var _loc7_ in _loc5_)
         {
            var _loc12_:int = 0;
            var _loc11_:* = _loc7_.ar;
            for each(var _loc6_ in _loc7_.ar)
            {
               if(getReward(_loc7_.id,_loc6_.id).status != 3)
               {
                  var _loc10_:int = 0;
                  var _loc9_:* = _loc6_.__function;
                  for each(var _loc4_ in _loc6_.__function)
                  {
                     if(_loc4_.id == 1001)
                     {
                        _loc3_ = ServerTimer.ins.date;
                        _loc2_ = new Date(_loc3_.fullYear,_loc3_.month,_loc3_.date).time / 1000 + Uint64Util.toInt(_loc4_.para1);
                        _loc1_ = new Date(_loc3_.fullYear,_loc3_.month,_loc3_.date).time / 1000 + Uint64Util.toInt(_loc4_.para2);
                        _loc8_ = ServerTimer.ins.second;
                        getReward(_loc7_.id,_loc6_.id).status = ActivityUtil.getEventTimeRangeStatus(_loc2_,_loc1_);
                     }
                  }
                  continue;
               }
            }
         }
      }
      
      public function filterStaticActivities() : Array
      {
         var _loc1_:Array = [];
         var _loc4_:int = 0;
         var _loc3_:* = staticActivityMainInfoDict.array;
         for each(var _loc2_ in staticActivityMainInfoDict.array)
         {
            if(activityNeedShow(_loc2_))
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_.sort(sortActivityFunc);
      }
      
      private function sortActivityFunc(param1:StaticActivity, param2:StaticActivity) : int
      {
         if(param1.order == 0 && param2.order == 0)
         {
            return 0;
         }
         if(param1.order == 0)
         {
            return 1;
         }
         if(param2.order == 0)
         {
            return -1;
         }
         if(param1.order == param2.order)
         {
            return sortSubFunc(param1,param2);
         }
         if(param1.order < param2.order)
         {
            return -1;
         }
         if(param1.order > param2.order)
         {
            return 1;
         }
         return sortSubFunc(param1,param2);
      }
      
      private function sortSubFunc(param1:StaticActivity, param2:StaticActivity) : int
      {
         if(param1.id < param2.id)
         {
            return -1;
         }
         if(param1.id > param2.id)
         {
            return 1;
         }
         return 0;
      }
      
      public function getOpenModuleId(param1:int) : int
      {
         var _loc3_:StaticActivity = this.getStaticActivity(param1);
         if(_loc3_ == null)
         {
            return 0;
         }
         var _loc2_:Array = _loc3_.actLink.split(":");
         if(_loc2_.length >= 2 && _loc2_[0] == "moduleId")
         {
            return _loc2_[1];
         }
         return 0;
      }
      
      public function getForeshowFuncList() : Array
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         var _loc4_:Array = StcMgr.ins.getNewFunctionTable().array;
         var _loc1_:Array = [];
         while(_loc3_ < _loc4_.length)
         {
            _loc2_ = _loc4_[_loc3_] as StcNewFunctionVo;
            if(ServerTimer.ins.isNowInFormStr(_loc2_.timebegin,_loc2_.timeend) && _loc2_.open)
            {
               _loc1_.push(_loc2_);
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function getForeshowFuncIds() : Array
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         var _loc3_:Array = getForeshowFuncList();
         foreshowFuncIds = [];
         while(_loc2_ < _loc3_.length)
         {
            _loc1_ = (_loc3_[_loc2_] as StcNewFunctionVo).function_id;
            if(foreshowFuncIds.indexOf(_loc1_) < 0)
            {
               foreshowFuncIds.push(_loc1_);
            }
            _loc2_++;
         }
         return foreshowFuncIds;
      }
      
      public function isFuncInForeshow(param1:uint) : Boolean
      {
         return foreshowFuncIds.indexOf(param1) >= 0;
      }
      
      private function activityNeedShow(param1:StaticActivity) : Boolean
      {
         var _loc2_:int = ServerTimer.ins.second;
         if(_loc2_ >= param1.noticeStarttm && _loc2_ <= param1.endtm)
         {
            return true;
         }
         return false;
      }
      
      private function sortFunc(param1:ActivityInfoVo, param2:ActivityInfoVo) : int
      {
         var _loc3_:ActivityReward = getReward(param1.activityId,param1.staticActivityReward.id);
         var _loc4_:ActivityReward = getReward(param2.activityId,param2.staticActivityReward.id);
         if(_loc3_ && _loc4_)
         {
            if(_loc3_.status == 2 && _loc4_.status != 2)
            {
               return -1;
            }
            if(_loc3_.status != 2 && _loc4_.status == 2)
            {
               return 1;
            }
            if(_loc3_.status != 3 && _loc4_.status == 3)
            {
               return -1;
            }
            if(_loc3_.status == 3 && _loc4_.status != 3)
            {
               return 1;
            }
            if(_loc3_.id < _loc4_.id)
            {
               return -1;
            }
            if(_loc3_.id > _loc4_.id)
            {
               return 1;
            }
            return 0;
         }
         return 0;
      }
   }
}
