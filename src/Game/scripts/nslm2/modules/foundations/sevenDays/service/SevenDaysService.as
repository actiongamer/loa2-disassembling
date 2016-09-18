package nslm2.modules.foundations.sevenDays.service
{
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.modules.foundations.sevenDays.model.SevenDaysModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.utils.ServerTimer;
   import proto.SevenDayTaskInfo;
   import proto.FunctionTimesNotify;
   import nslm2.nets.sockets.ServerEvent;
   import proto.FunctionTimesInfo;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import proto.SevenDayAvaiNumRes;
   import proto.SevenDayGetRewardReq;
   import nslm2.nets.sockets.ServerEngine;
   
   public class SevenDaysService
   {
      
      private static var _ins:nslm2.modules.foundations.sevenDays.service.SevenDaysService;
       
      
      private var _deadline:int;
      
      public function SevenDaysService()
      {
         super();
         ServerEngine.ins.addAlwayHandler(4072,taskInfoNotifyHander);
         ServerEngine.ins.addAlwayHandler(4102,server_residualTimes_cpl);
      }
      
      public static function get ins() : nslm2.modules.foundations.sevenDays.service.SevenDaysService
      {
         if(!_ins)
         {
            _ins = new nslm2.modules.foundations.sevenDays.service.SevenDaysService();
         }
         return _ins;
      }
      
      public function get deadline() : int
      {
         return _deadline;
      }
      
      public function set deadline(param1:int) : void
      {
         if(_deadline != param1)
         {
            _deadline = param1;
            if(this.isDead == false)
            {
               TimerManager.ins.doLoop(5,this.checkDead);
            }
         }
         SevenDaysModel.ins.startTime = param1 - 864000 + 1;
         SevenDaysModel.ins.endTime = param1 - 259200;
         SevenDaysModel.ins.rewardEndTime = param1;
      }
      
      private function checkDead() : void
      {
         if(this.isDead)
         {
            TimerManager.ins.clearTimer(this.checkDead);
            ObserverMgr.ins.sendNotice("sevenday_notice_event_not_avail");
         }
      }
      
      public function get isDead() : Boolean
      {
         return ServerTimer.ins.second >= this.deadline;
      }
      
      private function taskInfoNotifyHander(param1:SevenDayTaskInfo) : void
      {
         SevenDaysModel.ins.updateRedPointStatus(true);
      }
      
      private function server_residualTimes_cpl(param1:FunctionTimesNotify, param2:ServerEvent) : void
      {
         if(param1.timesInfos)
         {
            var _loc5_:int = 0;
            var _loc4_:* = param1.timesInfos;
            for each(var _loc3_ in param1.timesInfos)
            {
               if(_loc3_.funcId == 13100)
               {
                  SevenDaysModel.ins.updateRedPointStatus(_loc3_.times > 0);
               }
            }
         }
      }
      
      public function getInitSevenDayInfo() : void
      {
         SevenDaysModel.ins.updateRedPointStatus(NpcFuncService.ins.getVo(13100).count > 0);
      }
      
      private function cplHandler(param1:SevenDayAvaiNumRes) : void
      {
      }
      
      public function getLoginReward(param1:int, param2:int = 0, param3:* = null, param4:* = null) : void
      {
         var _loc5_:SevenDayGetRewardReq = new SevenDayGetRewardReq();
         _loc5_.day = param1 + 1;
         _loc5_.kind = 1;
         _loc5_.id = param2;
         ServerEngine.ins.send(4071,_loc5_,param3,param4);
      }
      
      public function getTaskReward(param1:int, param2:int, param3:* = null, param4:* = null) : void
      {
         var _loc5_:SevenDayGetRewardReq = new SevenDayGetRewardReq();
         _loc5_.day = param1 + 1;
         _loc5_.kind = 3;
         _loc5_.id = param2;
         ServerEngine.ins.send(4071,_loc5_,param3,param4);
      }
      
      public function getCrtTasksInfo() : void
      {
         ServerEngine.ins.send(4070,null);
      }
      
      public function getShopReward(param1:int, param2:int = 0, param3:int = 1, param4:* = null, param5:* = null) : void
      {
         var _loc6_:SevenDayGetRewardReq = new SevenDayGetRewardReq();
         _loc6_.day = param1 + 1;
         _loc6_.kind = 2;
         _loc6_.id = param2;
         _loc6_.buyCount = param3;
         ServerEngine.ins.send(4071,_loc6_,param4,param5);
      }
      
      public function getTasksInfo() : void
      {
         ServerEngine.ins.send(4072,null);
      }
   }
}
