package nslm2.modules.foundations.miniTasks.service
{
   import com.mz.core.interFace.IDispose;
   import proto.TaskInfoNotify;
   import nslm2.modules.foundations.miniTasks.model.TaskModel;
   import proto.TaskGetCurInfoReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.TaskGetCurInfoRes;
   import proto.TaskFinishReq;
   import proto.GetSwapActionsReq;
   import proto.GetSwapActionsRes;
   import proto.SwapActionInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSwapActionVo;
   import proto.SwapActionReq;
   
   public class TaskService implements IDispose
   {
      
      private static var _ins:nslm2.modules.foundations.miniTasks.service.TaskService;
      
      public static const DAILY_TASK_TYPE:int = 2;
       
      
      public function TaskService()
      {
         super();
         ServerEngine.ins.addAlwayHandler(8302,taskInfoNotifyHander);
         ServerEngine.ins.addAlwayHandler(8007,getScoreRewardStatusHandler);
      }
      
      public static function get ins() : nslm2.modules.foundations.miniTasks.service.TaskService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.miniTasks.service.TaskService();
         }
         return _ins;
      }
      
      private function taskInfoNotifyHander(param1:TaskInfoNotify) : void
      {
         TaskModel.ins.updateTaskInfo(param1.info);
      }
      
      public function getCrtTasksInfo() : void
      {
         var _loc1_:TaskGetCurInfoReq = new TaskGetCurInfoReq();
         _loc1_.kinds = [1,2];
         ServerEngine.ins.send(8300,_loc1_,crtTasksInfoHandler);
      }
      
      public function crtTasksInfoHandler(param1:TaskGetCurInfoRes) : void
      {
         if(param1)
         {
            TaskModel.ins.initTasksArr(param1.info);
         }
      }
      
      public function taskFinish(param1:uint, param2:Function) : void
      {
         var _loc3_:TaskFinishReq = new TaskFinishReq();
         _loc3_.id = param1;
         ServerEngine.ins.send(8301,_loc3_,param2);
      }
      
      public function getScoreRewardStatus(param1:Array) : void
      {
         var _loc2_:GetSwapActionsReq = new GetSwapActionsReq();
         _loc2_.ids = param1;
         ServerEngine.ins.send(8007,_loc2_,getScoreRewardStatusHandler);
      }
      
      private function getScoreRewardStatusHandler(param1:GetSwapActionsRes) : void
      {
         var _loc5_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         TaskModel.ins.gotTaskScoreRewardIDArr = [];
         if(param1 && param1.info)
         {
            _loc3_ = param1.info.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc2_ = param1.info[_loc4_];
               if(_loc2_.count > 0)
               {
                  _loc5_ = StcMgr.ins.getSwapActionVo(_loc2_.id);
                  if(_loc5_.kind == 2)
                  {
                     TaskModel.ins.gotTaskScoreRewardIDArr.push(TaskModel.getIndex(_loc2_.id));
                  }
               }
               _loc4_++;
            }
            ServerEngine.ins.removeAlwayHandler(8007,getScoreRewardStatusHandler);
         }
      }
      
      public function requestGetScoreReward(param1:uint, param2:Function) : void
      {
         var _loc3_:SwapActionReq = new SwapActionReq();
         _loc3_.id = param1;
         ServerEngine.ins.send(8008,_loc3_,param2);
      }
      
      public function dispose() : void
      {
         ServerEngine.ins.removeAlwayHandler(8302,taskInfoNotifyHander);
      }
   }
}
