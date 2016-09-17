package nslm2.modules.foundations.fourteenDays.service
{
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.modules.foundations.fourteenDays.model.FourteenDaysModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.utils.ServerTimer;
   import proto.FourteenInfoRes;
   import proto.FourteenDayShopBuyTimesRes;
   import proto.FourteenDayTaskInfo;
   import proto.FunctionTimesNotify;
   import nslm2.nets.sockets.ServerEvent;
   import proto.FunctionTimesInfo;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import proto.FourteenDayGetRewardReq;
   import nslm2.nets.sockets.ServerEngine;
   
   public class FourteenDaysService
   {
      
      private static var _ins:nslm2.modules.foundations.fourteenDays.service.FourteenDaysService;
       
      
      private var _deadline:int;
      
      public function FourteenDaysService()
      {
         super();
         ServerEngine.ins.addAlwayHandler(6230,taskInfoNotifyHander);
         ServerEngine.ins.addAlwayHandler(4102,server_residualTimes_cpl);
         ServerEngine.ins.addAlwayHandler(6234,serverBuyTimes_cpl);
         ServerEngine.ins.addAlwayHandler(6231,fourteenInfo_cpl);
      }
      
      public static function get ins() : nslm2.modules.foundations.fourteenDays.service.FourteenDaysService
      {
         if(!_ins)
         {
            _ins = new nslm2.modules.foundations.fourteenDays.service.FourteenDaysService();
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
         FourteenDaysModel.ins.startTime = param1 - 864000 + 1;
         FourteenDaysModel.ins.endTime = param1 - 259200;
         FourteenDaysModel.ins.rewardEndTime = param1;
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
         var _loc1_:uint = ServerTimer.ins.second;
         return ServerTimer.ins.second >= this.deadline;
      }
      
      public function get isNotOpen() : Boolean
      {
         var _loc1_:uint = ServerTimer.ins.second;
         return _loc1_ < FourteenDaysModel.ins.startTime;
      }
      
      private function fourteenInfo_cpl(param1:FourteenInfoRes) : void
      {
         ObserverMgr.ins.sendNotice("sevenday_notice_event_refreshed",param1);
      }
      
      private function serverBuyTimes_cpl(param1:FourteenDayShopBuyTimesRes) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = FourteenDaysModel.ins.currentDayRewardVo.buyArr;
         for each(var _loc2_ in FourteenDaysModel.ins.currentDayRewardVo.buyArr)
         {
            if(_loc2_.id == param1.id)
            {
               _loc2_.buyTime = param1.buyTime;
            }
         }
         ObserverMgr.ins.sendNotice("sevenday_notice_update_shop");
      }
      
      private function taskInfoNotifyHander(param1:FourteenDayTaskInfo) : void
      {
         FourteenDaysModel.ins.updateRedPointStatus(true);
      }
      
      private function server_residualTimes_cpl(param1:FunctionTimesNotify, param2:ServerEvent) : void
      {
         if(param1.timesInfos)
         {
            var _loc5_:int = 0;
            var _loc4_:* = param1.timesInfos;
            for each(var _loc3_ in param1.timesInfos)
            {
               if(_loc3_.funcId == 13300)
               {
                  FourteenDaysModel.ins.updateRedPointStatus(_loc3_.times > 0);
               }
            }
         }
      }
      
      public function getInitFourteenDayInfo() : void
      {
         FourteenDaysModel.ins.updateRedPointStatus(NpcFuncService.ins.getVo(13300).count > 0);
      }
      
      public function getLoginReward(param1:int, param2:int = 0, param3:* = null, param4:* = null) : void
      {
         var _loc5_:FourteenDayGetRewardReq = new FourteenDayGetRewardReq();
         _loc5_.day = param1 + 8;
         _loc5_.kind = 1;
         _loc5_.id = param2;
         ServerEngine.ins.send(6232,_loc5_,param3,param4);
      }
      
      public function getTaskReward(param1:int, param2:int, param3:* = null, param4:* = null) : void
      {
         var _loc5_:FourteenDayGetRewardReq = new FourteenDayGetRewardReq();
         _loc5_.day = param1 + 1;
         _loc5_.kind = 3;
         _loc5_.id = param2;
         ServerEngine.ins.send(6232,_loc5_,param3,param4);
      }
      
      public function getCrtTasksInfo() : void
      {
         ServerEngine.ins.send(6230,null);
      }
      
      public function getShopReward(param1:int, param2:int, param3:int, param4:* = null, param5:* = null) : void
      {
         var _loc6_:FourteenDayGetRewardReq = new FourteenDayGetRewardReq();
         _loc6_.day = param1 + 1;
         _loc6_.kind = 2;
         _loc6_.id = param2;
         _loc6_.count = param3;
         ServerEngine.ins.send(6232,_loc6_,param4,param5);
      }
      
      public function getTasksInfo() : void
      {
         ServerEngine.ins.send(6230,null);
      }
   }
}
