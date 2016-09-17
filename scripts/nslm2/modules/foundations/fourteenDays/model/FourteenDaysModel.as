package nslm2.modules.foundations.fourteenDays.model
{
   import nslm2.modules.foundations.fourteenDays.vo.FourteenDaysVo;
   import com.mz.core.utils.DictHash;
   import proto.FourteenDayTaskInfo;
   import nslm2.modules.foundations.fourteenDays.vo.FourteenDayTaskVo;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.FourteenDayAvailInfo;
   import nslm2.modules.foundations.fourteenDays.vo.FourteenDayAvailVo;
   import proto.SevenDayTaskInfo;
   import nslm2.modules.foundations.sevenDays.vo.SevenDayTaskVo;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import proto.FourteenDayLoginInfo;
   
   public class FourteenDaysModel
   {
      
      private static var _ins:nslm2.modules.foundations.fourteenDays.model.FourteenDaysModel;
       
      
      public var startTime:uint;
      
      public var endTime:uint;
      
      public var rewardEndTime:uint;
      
      private var _currentDay:int = 0;
      
      public var actualDay:int = 0;
      
      private var _taskArr1:Array;
      
      private var _taskArr2:Array;
      
      private var taskDic:DictHash;
      
      private var _currentDayRewardVo:FourteenDaysVo;
      
      private var _hasLoginBonus:Boolean;
      
      private var _hasTask1Reward:Boolean;
      
      private var _hasTask2Reward:Boolean;
      
      private var _hasHalfPrice:Boolean;
      
      private var availDic:DictHash;
      
      private var loginDic:DictHash;
      
      public function FourteenDaysModel()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.foundations.fourteenDays.model.FourteenDaysModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.fourteenDays.model.FourteenDaysModel();
         }
         return _ins;
      }
      
      public function set currentDay(param1:int) : void
      {
         _currentDay = param1;
         _currentDayRewardVo = new FourteenDaysVo(_currentDay);
      }
      
      public function get currentDay() : int
      {
         return _currentDay;
      }
      
      public function get mainTaskArray() : Array
      {
         return _taskArr1;
      }
      
      public function get enhanceTaskArray() : Array
      {
         return _taskArr2;
      }
      
      public function get currentDayRewardVo() : FourteenDaysVo
      {
         if(_currentDayRewardVo == null)
         {
            _currentDayRewardVo = new FourteenDaysVo(currentDay);
         }
         return _currentDayRewardVo;
      }
      
      public function get hasTask1Reward() : Boolean
      {
         return _hasTask1Reward;
      }
      
      public function set hasTask1Reward(param1:Boolean) : void
      {
         _hasTask1Reward = param1;
      }
      
      public function get hasTask2Reward() : Boolean
      {
         return _hasTask2Reward;
      }
      
      public function set hasTask2Reward(param1:Boolean) : void
      {
         _hasTask2Reward = param1;
      }
      
      public function get hasHalfPrice() : Boolean
      {
         return _hasHalfPrice;
      }
      
      public function set hasHalfPrice(param1:Boolean) : void
      {
         _hasHalfPrice = param1;
      }
      
      public function get hasLoginBonus() : Boolean
      {
         return _hasLoginBonus;
      }
      
      public function set hasLoginBonus(param1:Boolean) : void
      {
         _hasLoginBonus = param1;
      }
      
      public function initTasksArr(param1:Array) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc5_:int = 0;
         taskDic = new DictHash();
         var _loc4_:int = param1.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            _loc2_ = new FourteenDayTaskVo();
            _loc2_.updateInfo(_loc3_);
            taskDic.put(_loc2_.id,_loc2_);
            _loc5_++;
         }
         updateTask1();
         updateTask2();
         ObserverMgr.ins.sendNotice("sevenday_notice_update_task");
      }
      
      public function initAvailArr(param1:Array) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc6_:int = 0;
         var _loc2_:Boolean = false;
         availDic = new DictHash();
         var _loc5_:int = param1.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = param1[_loc6_];
            _loc3_ = new FourteenDayAvailVo();
            _loc3_.updateInfo(_loc4_);
            availDic.put(_loc3_.day,_loc3_.number);
            if(_loc3_.day <= this._currentDay && _loc3_.number > 0)
            {
               _loc2_ = true;
            }
            _loc6_++;
         }
         updateRedPointStatus(_loc2_);
      }
      
      public function getAvailNumByDay(param1:int) : int
      {
         if(!availDic)
         {
            return 0;
         }
         return availDic.getValue(param1);
      }
      
      public function updateTaskInfo(param1:SevenDayTaskInfo) : void
      {
         if(!taskDic)
         {
            taskDic = new DictHash();
         }
         var _loc2_:SevenDayTaskVo = taskDic.getValue(param1.id);
         if(_loc2_)
         {
            _loc2_.updateInfo(param1);
         }
         else
         {
            _loc2_ = new SevenDayTaskVo();
            _loc2_.updateInfo(param1);
            taskDic.put(_loc2_.id,_loc2_);
         }
         updateTask1();
         ObserverMgr.ins.sendNotice("sevenday_notice_update_task");
      }
      
      public function updateRedPointStatus(param1:Boolean) : void
      {
         if(!param1)
         {
            NpcFuncService.ins.changeCount(13300,0);
         }
         else
         {
            NpcFuncService.ins.changeCount(13300,1);
         }
      }
      
      public function isTask1(param1:FourteenDayTaskVo) : Boolean
      {
         var _loc2_:int = currentDayRewardVo.sdStcVO.taskcontent.indexOf(String(param1.id));
         return _loc2_ != -1;
      }
      
      public function isTask2(param1:FourteenDayTaskVo) : Boolean
      {
         var _loc2_:int = currentDayRewardVo.sdStcVO.taskContent_1.indexOf(String(param1.id));
         return _loc2_ != -1;
      }
      
      private function getTaskArrByType(param1:int) : Array
      {
         if(!taskDic)
         {
            return [];
         }
         var _loc3_:Array = taskDic.array;
         var _loc2_:Array = [];
         _hasTask1Reward = false;
         _hasTask2Reward = false;
         var _loc6_:int = 0;
         var _loc5_:* = _loc3_;
         for each(var _loc4_ in _loc3_)
         {
            if(isTask1(_loc4_))
            {
               if(_loc4_.status == 1)
               {
                  _hasTask1Reward = true;
               }
               if(param1 == 0)
               {
                  _loc2_.push(_loc4_);
               }
            }
            if(isTask2(_loc4_))
            {
               if(_loc4_.status == 1)
               {
                  _hasTask2Reward = true;
               }
               if(param1 == 1)
               {
                  _loc2_.push(_loc4_);
               }
            }
         }
         return _loc2_;
      }
      
      private function updateTask1() : void
      {
         _taskArr1 = getTaskArrByType(0);
         _taskArr1.sort();
      }
      
      private function updateTask2() : void
      {
         _taskArr2 = getTaskArrByType(1);
         _taskArr2.sort();
      }
      
      public function initLoginBonusArr(param1:Array) : void
      {
         loginDic = new DictHash();
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            if(_loc2_.day - 1 == currentDay)
            {
               initLoginBonus(_loc2_);
            }
            loginDic.put(_loc2_.day,_loc2_.status);
         }
      }
      
      public function getLoginBonusStatus(param1:int) : int
      {
         if(loginDic)
         {
            return loginDic.getValue(param1 + 1);
         }
         return -1;
      }
      
      public function initLoginBonus(param1:FourteenDayLoginInfo) : void
      {
         _hasLoginBonus = false;
         currentDayRewardVo.updateInfo(param1);
         if(!currentDayRewardVo.loginBonusStatus)
         {
            _hasLoginBonus = true;
         }
         ObserverMgr.ins.sendNotice("sevenday_notice_update_login",currentDay);
      }
      
      public function initShop(param1:Array) : void
      {
         _hasHalfPrice = false;
         currentDayRewardVo.updateInfo(param1);
         ObserverMgr.ins.sendNotice("sevenday_notice_update_shop");
      }
   }
}
