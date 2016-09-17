package nslm2.modules.foundations.miniTasks.model
{
   import com.mz.core.interFace.IObserver;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import proto.RetrivalInfoRes;
   import nslm2.modules.foundations.miniTasks.vo.TaskVo;
   import com.mz.core.utils.DictHash;
   import nslm2.nets.sockets.ServerEngine;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.dailyTask.vo.DailyTaskScoreRewardVo;
   import nslm2.mgrs.stcMgrs.vos.StcSwapActionVo;
   import proto.TaskInfo;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import nslm2.utils.ServerTimer;
   import nslm2.modules.foundations.dailyTask.DailyTaskBtnCtrl;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.miniTasks.service.TaskService;
   import org.manager.DateUtils;
   
   public class TaskModel implements IObserver
   {
      
      private static var _ins:nslm2.modules.foundations.miniTasks.model.TaskModel;
      
      private static var TIME_AJUST:int = 1;
       
      
      public var resourceBackRes:RetrivalInfoRes;
      
      private var _mainTasksArr:Array;
      
      private var _dailyTaskArr:Array;
      
      private var _achiveTaskArr:Array;
      
      private var _crtTaskVo:TaskVo;
      
      public var needShowTaskPanel:Boolean;
      
      private var taskDic:DictHash;
      
      public var receiveNewTask:Boolean;
      
      private var _hasDailyTaskReward:Boolean;
      
      private var _hasAchiveTaskReward:Boolean;
      
      private var _hasResBackReward:Boolean;
      
      private var dailyTaskSocreRewardArr:Array;
      
      public var gotTaskScoreRewardIDArr:Array;
      
      private var needCheckTime:Boolean = true;
      
      public function TaskModel()
      {
         _mainTasksArr = [];
         gotTaskScoreRewardIDArr = [];
         super();
         ObserverMgr.ins.regObserver(this);
      }
      
      public static function get ins() : nslm2.modules.foundations.miniTasks.model.TaskModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.miniTasks.model.TaskModel();
         }
         return _ins;
      }
      
      public static function getIndex(param1:int) : int
      {
         var _loc2_:String = param1.toString();
         var _loc3_:Array = _loc2_.split("");
         return _loc3_.pop();
      }
      
      public static function getTaskType(param1:int) : int
      {
         return StcMgr.ins.getTaskVo(param1).kind;
      }
      
      public function reqResourceBack() : void
      {
         ServerEngine.ins.send(5370,null,onInfoRet);
      }
      
      private function onInfoRet(param1:RetrivalInfoRes) : void
      {
         resourceBackRes = param1;
         checkResourceBack();
         updateRedPointStatus();
         ObserverMgr.ins.sendNotice("TASK_NOTICE_UPDATE_RESOURCE_BACK");
      }
      
      public function checkResourceBack() : void
      {
         var _loc1_:int = 0;
         if(resourceBackRes == null)
         {
            _hasResBackReward = false;
            return;
         }
         _loc1_ = 0;
         while(_loc1_ < resourceBackRes.nowNum.length)
         {
            if(resourceBackRes.nowNum[_loc1_].value == 0)
            {
               _hasResBackReward = true;
               return;
            }
            _loc1_++;
         }
         _hasResBackReward = false;
      }
      
      public function updateGottedRewardArr(param1:int) : void
      {
         var _loc2_:int = getIndex(param1);
         gotTaskScoreRewardIDArr.push(_loc2_);
      }
      
      public function get crtTaskScoreRewardArr() : Array
      {
         if(!dailyTaskSocreRewardArr)
         {
            initDailyTaskSocreRewardArr();
         }
         var _loc1_:int = PlayerModel.ins.level;
         var _loc2_:Array = [];
         var _loc5_:int = 0;
         var _loc4_:* = dailyTaskSocreRewardArr;
         for each(var _loc3_ in dailyTaskSocreRewardArr)
         {
            if(_loc3_.needLvl <= _loc1_)
            {
               _loc2_.push(_loc3_);
            }
         }
         _loc2_.sort(sortScoreVo);
         _loc2_.length = 4;
         updateRewardStatus(_loc2_);
         return _loc2_;
      }
      
      private function updateRewardStatus(param1:Array) : void
      {
         var _loc2_:int = PlayerModel.ins.getWealthValue(22);
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            _loc3_.status = -1;
            if(gotTaskScoreRewardIDArr.indexOf(getIndex(_loc3_.id)) >= 0)
            {
               _loc3_.status = 1;
            }
            if(_loc2_ >= _loc3_.needScore)
            {
               if(_loc3_.status < 1)
               {
                  _loc3_.status = 0;
               }
            }
         }
      }
      
      private function sortScoreVo(param1:DailyTaskScoreRewardVo, param2:DailyTaskScoreRewardVo) : int
      {
         if(param1.needLvl > param2.needLvl)
         {
            return -1;
         }
         if(param1.needLvl < param2.needLvl)
         {
            return 1;
         }
         if(param1.needScore < param2.needScore)
         {
            return -1;
         }
         return 1;
      }
      
      private function initDailyTaskSocreRewardArr() : void
      {
         var _loc2_:* = null;
         dailyTaskSocreRewardArr = [];
         var _loc1_:Array = StcMgr.ins.getVoArrByColumnValue("static_swap_action","kind",2);
         var _loc5_:int = 0;
         var _loc4_:* = _loc1_;
         for each(var _loc3_ in _loc1_)
         {
            _loc2_ = new DailyTaskScoreRewardVo();
            _loc2_.pareseInfo(_loc3_.condition);
            _loc2_.dropID = _loc3_.drop_id;
            _loc2_.id = _loc3_.id;
            dailyTaskSocreRewardArr.push(_loc2_);
         }
      }
      
      public function updateTaskInfo(param1:TaskInfo) : void
      {
         var _loc3_:int = 0;
         if(!taskDic)
         {
            taskDic = new DictHash();
         }
         var _loc2_:TaskVo = taskDic.getValue(param1.id);
         if(_loc2_)
         {
            _loc3_ = _loc2_.status;
            _loc2_.updateInfo(param1);
         }
         else
         {
            _loc2_ = new TaskVo();
            _loc2_.updateInfo(param1);
            taskDic.put(_loc2_.id,_loc2_);
         }
         switch(int(_loc2_.type) - 1)
         {
            case 0:
               updateAchiveTask();
               break;
            case 1:
               updateDailyTask();
         }
         updateRedPointStatus();
         ObserverMgr.ins.sendNotice("task_notice_update_task");
      }
      
      public function updateRedPointStatus() : void
      {
         if(hasAchiveTaskReward || hasDailyTaskReward || hasResBackReward)
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(13000,true,0));
         }
         else
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(13000,false,0));
         }
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
            _loc2_ = new TaskVo();
            _loc2_.updateInfo(_loc3_);
            taskDic.put(_loc2_.id,_loc2_);
            _loc5_++;
         }
         updateDailyTask();
         updateAchiveTask();
         if(needCheckTime)
         {
            checkTimeTask(ServerTimer.ins.second);
         }
         ObserverMgr.ins.sendNotice("task_notice_update_task");
         updateRedPointStatus();
         needCheckTime = true;
      }
      
      private function updateDailyTask() : void
      {
         _dailyTaskArr = getTaskArrByType(2);
         _dailyTaskArr.sort(sortTask);
      }
      
      private function updateAchiveTask() : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         _achiveTaskArr = getTaskArrByType(1);
         _achiveTaskArr.sort(sortTask);
         var _loc2_:int = _achiveTaskArr.length;
         var _loc1_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = _achiveTaskArr[_loc4_];
            if(_loc1_.indexOf(_loc3_.groupId) >= 0)
            {
               _achiveTaskArr.splice(_loc4_,1);
               _loc4_--;
               _loc2_--;
            }
            _loc1_.push(_loc3_.groupId);
            _loc4_++;
         }
      }
      
      public function updateTaskStatus(param1:int, param2:int) : void
      {
         var _loc3_:TaskVo = taskDic.getValue(param1);
         if(_loc3_)
         {
            _loc3_.status = param2;
            if(_loc3_.type == 2)
            {
               updateDailyTask();
            }
            else
            {
               updateAchiveTask();
            }
         }
         updateRedPointStatus();
      }
      
      public function refreshTaskAfterLvlUp() : void
      {
         updateDailyTask();
         updateAchiveTask();
         ObserverMgr.ins.sendNotice("task_notice_update_task");
         updateRedPointStatus();
      }
      
      public function removeFinishedTask(param1:int) : void
      {
         taskDic.remove(param1);
      }
      
      private function sortTask(param1:TaskVo, param2:TaskVo) : int
      {
         if(param1.status == 2 && param2.status != 2)
         {
            return -1;
         }
         if(param1.status != 2 && param2.status == 2)
         {
            return 1;
         }
         if(param1.status == 1 && param2.status != 1)
         {
            return -1;
         }
         if(param1.status != 1 && param2.status == 1)
         {
            return 1;
         }
         if(param1.status == 3 && param2.status == 3 && param1.type == 1 && param2.type == 1)
         {
            if(param1.id > param2.id)
            {
               return -1;
            }
            return 1;
         }
         if(DailyTaskBtnCtrl.checkIsYueKaTask(param1.targetType) && !DailyTaskBtnCtrl.checkIsYueKaTask(param2.targetType))
         {
            return -1;
         }
         if(!DailyTaskBtnCtrl.checkIsYueKaTask(param1.targetType) && DailyTaskBtnCtrl.checkIsYueKaTask(param2.targetType))
         {
            return 1;
         }
         if(param1.vipLimit > 0 && PlayerModel.ins.vip >= param1.vipLimit && param2.vipLimit == 0)
         {
            return -1;
         }
         if(param2.vipLimit > 0 && PlayerModel.ins.vip >= param2.vipLimit && param1.vipLimit == 0)
         {
            return 1;
         }
         if(PlayerModel.ins.vip < param1.vipLimit && param2.vipLimit == 0)
         {
            return 1;
         }
         if(PlayerModel.ins.vip < param2.vipLimit && param1.vipLimit == 0)
         {
            return -1;
         }
         if(param1.id < param2.id)
         {
            return -1;
         }
         return 1;
      }
      
      public function get crtTaskVo() : TaskVo
      {
         var _loc2_:int = 0;
         _mainTasksArr = getTaskArrByType(1);
         _mainTasksArr.sort(sortTask);
         var _loc1_:int = _mainTasksArr.length;
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            _crtTaskVo = _mainTasksArr[_loc2_];
            if(_crtTaskVo && _crtTaskVo.groupId == 100 && _crtTaskVo.status != 3)
            {
               return _crtTaskVo;
            }
            _loc2_++;
         }
         return null;
      }
      
      private function getTaskArrByType(param1:int) : Array
      {
         if(!taskDic)
         {
            return [];
         }
         var _loc3_:Array = taskDic.array;
         var _loc2_:Array = [];
         _hasDailyTaskReward = false;
         _hasAchiveTaskReward = false;
         var _loc6_:int = 0;
         var _loc5_:* = _loc3_;
         for each(var _loc4_ in _loc3_)
         {
            if(_loc4_.taskStcVO.show_level <= PlayerModel.ins.level && FuncOpenAutoCtrl.checkOpen(_loc4_.taskStcVO.function_id))
            {
               if(_loc4_.status == 2)
               {
                  if(_loc4_.type == 2)
                  {
                     _hasDailyTaskReward = true;
                  }
                  if(_loc4_.type == 1)
                  {
                     _hasAchiveTaskReward = true;
                  }
               }
               if(_loc4_.type == param1)
               {
                  _loc2_.push(_loc4_);
               }
            }
         }
         return _loc2_;
      }
      
      public function autoTrak() : void
      {
         var _loc1_:int = 0;
         if(crtTaskVo)
         {
            if(crtTaskVo.status == 2)
            {
               ModuleMgr.ins.showModule(10421);
            }
            else
            {
               if(crtTaskVo.targetType == 101)
               {
                  _loc1_ = 100;
               }
               ObserverMgr.ins.sendNotice("task_notice_auto_track",_loc1_);
            }
         }
      }
      
      public function get achiveTaskArr() : Array
      {
         return _achiveTaskArr;
      }
      
      public function get dailyTaskArr() : Array
      {
         return _dailyTaskArr;
      }
      
      public function get hasDailyTaskReward() : Boolean
      {
         return _hasDailyTaskReward;
      }
      
      public function get hasAchiveTaskReward() : Boolean
      {
         return _hasAchiveTaskReward;
      }
      
      public function get hasResBackReward() : Boolean
      {
         return _hasResBackReward;
      }
      
      public function get mainTasksArr() : Array
      {
         return _mainTasksArr;
      }
      
      public function get finishedTaskCnt() : int
      {
         return finishedDailyTaskCnt + finishedAchiveTaskCnt;
      }
      
      public function get finishedDailyTaskCnt() : int
      {
         return getFinishCnt(_dailyTaskArr);
      }
      
      public function get finishedAchiveTaskCnt() : int
      {
         return getFinishCnt(_achiveTaskArr);
      }
      
      private function getFinishCnt(param1:Array) : int
      {
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            if(_loc3_.status == 2)
            {
               _loc2_++;
            }
         }
         return _loc2_;
      }
      
      public function getFocusNotices() : Array
      {
         return ["time_notice_hour","server_time_notice_5"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         if(param1 == "time_notice_hour")
         {
            checkTimeTask(ServerTimer.ins.second);
         }
         if(param1 == "server_time_notice_5")
         {
            PlayerModel.ins.changeWealth(22,0);
            gotTaskScoreRewardIDArr = [];
            TaskService.ins.getCrtTasksInfo();
         }
      }
      
      public function checkTimeTask(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:Boolean = false;
         var _loc6_:DateUtils = ServerTimer.ins.date;
         _loc6_.hours = 0;
         _loc6_.minutes = 0;
         _loc6_.seconds = 0;
         _loc6_.milliseconds = 0;
         var _loc5_:int = _loc6_.time / 1000 - DateUtils.timeZone * 3600;
         var _loc9_:int = 0;
         var _loc8_:* = dailyTaskArr;
         for each(var _loc4_ in dailyTaskArr)
         {
            if(_loc4_.targetType == 1001)
            {
               _loc2_ = _loc4_.taskStcVO.check_point_1.split(":")[2];
               _loc7_ = _loc4_.taskStcVO.check_point_1.split(":")[3];
               if(param1 >= _loc5_ + _loc2_ - TIME_AJUST && param1 < _loc5_ + _loc7_ - TIME_AJUST)
               {
                  if(_loc4_.status != 3)
                  {
                     _loc4_.status = 2;
                     if(!_hasDailyTaskReward)
                     {
                        _hasDailyTaskReward = true;
                        ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(13000,true,0));
                     }
                     _loc3_ = true;
                  }
               }
               else if(_loc4_.status == 2)
               {
                  _loc4_.status = 1;
                  _loc3_ = true;
               }
            }
         }
         if(_loc3_)
         {
            _dailyTaskArr.sort(sortTask);
            ObserverMgr.ins.sendNotice("task_notice_update_task");
         }
      }
   }
}
