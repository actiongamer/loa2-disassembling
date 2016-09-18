package nslm2.modules.funnies.championShip.service
{
   import com.mz.core.interFace.IDispose;
   import nslm2.modules.funnies.championShip.model.ChampionShipModel;
   import nslm2.nets.sockets.ServerEngine;
   import proto.CompeteStatusTimeNotify;
   import proto.CompeteGroupStageInfoReq;
   import proto.CompeteGroupStageInfoRes;
   import nslm2.nets.sockets.ServerEvent;
   import proto.CompetePlayerDisplayReq;
   import proto.CompetePlayerDisplayRes;
   import proto.CompeteGambleReq;
   import proto.CompeteStageInfoReq;
   import proto.CompeteGambleRewardReq;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class ChampionShipService implements IDispose
   {
      
      private static var _ins:nslm2.modules.funnies.championShip.service.ChampionShipService;
       
      
      private var model:ChampionShipModel;
      
      public function ChampionShipService()
      {
         model = ChampionShipModel.ins;
         super();
      }
      
      public static function get ins() : nslm2.modules.funnies.championShip.service.ChampionShipService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.championShip.service.ChampionShipService();
         }
         return _ins;
      }
      
      public function init() : void
      {
         ServerEngine.ins.addAlwayHandler(4054,updateStatusNotifyHandler);
         ServerEngine.ins.addAlwayHandler(4058,updateGambleRwdNofifyHandler);
      }
      
      private function updateStatusNotifyHandler(param1:CompeteStatusTimeNotify) : void
      {
         model.updateStatus(param1);
      }
      
      private function updateGambleRwdNofifyHandler(param1:Object) : void
      {
         model.canGetGambleReward = true;
      }
      
      public function reqeustBaseInfo(param1:Function) : void
      {
         ServerEngine.ins.send(4050,null,param1);
      }
      
      public function reqeustGroupNodeData(param1:int) : void
      {
         var _loc2_:CompeteGroupStageInfoReq = new CompeteGroupStageInfoReq();
         _loc2_.gStageIndex = param1;
         ServerEngine.ins.send(4053,_loc2_,server_stageInfo_cpl);
      }
      
      private function server_stageInfo_cpl(param1:CompeteGroupStageInfoRes, param2:ServerEvent) : void
      {
         model.updateGroupData(model.selectedGroupIndex,param1);
      }
      
      public function server_competePlayerDisplay(param1:int) : void
      {
         var _loc2_:CompetePlayerDisplayReq = new CompetePlayerDisplayReq();
         _loc2_.gStageIndex = param1;
         ServerEngine.ins.send(4051,_loc2_,server_playerDisplay_cpl);
      }
      
      private function server_playerDisplay_cpl(param1:CompetePlayerDisplayRes, param2:ServerEvent) : void
      {
         model.updatePlayerData(param1.gStageIndex,param1.playerInfos);
      }
      
      public function server_competeGamble(param1:Function) : void
      {
         var _loc2_:CompeteGambleReq = new CompeteGambleReq();
         ServerEngine.ins.send(4056,_loc2_,param1);
      }
      
      public function requestNodeInfo(param1:int, param2:int, param3:Function) : void
      {
         var _loc4_:CompeteStageInfoReq = new CompeteStageInfoReq();
         _loc4_.frontStageIndex = param1;
         _loc4_.gStageIndex = param2;
         ServerEngine.ins.send(4052,_loc4_,param3);
      }
      
      public function gamble(param1:int, param2:int, param3:int, param4:Function) : void
      {
         var _loc5_:CompeteGambleReq = new CompeteGambleReq();
         _loc5_.gStageIndex = param1;
         _loc5_.frontStageIndex = param2;
         _loc5_.posIndex = param3;
         ServerEngine.ins.send(4056,_loc5_,param4);
      }
      
      public function requestGambleRecord(param1:Function) : void
      {
         ServerEngine.ins.send(4055,null,param1);
      }
      
      public function getGambleReward(param1:int, param2:int, param3:Function) : void
      {
         var _loc4_:CompeteGambleRewardReq = new CompeteGambleRewardReq();
         _loc4_.frontStageIndex = param2;
         _loc4_.gStageIndex = param1;
         ServerEngine.ins.send(4057,_loc4_,param3);
      }
      
      public function getChampionRankReward() : void
      {
         ServerEngine.ins.send(4060,null,getRewardSuccesssHandler);
      }
      
      private function getRewardSuccesssHandler() : void
      {
         model.hasGotReward = true;
         ObserverMgr.ins.sendNotice("ACT_RANK_REWARD_GET_SUCCES");
      }
      
      public function getCompeteRecord(param1:Function) : void
      {
         ServerEngine.ins.send(4059,null,param1);
      }
      
      public function dispose() : void
      {
         ServerEngine.ins.removeAlwayHandler(4054,updateStatusNotifyHandler);
         ServerEngine.ins.removeAlwayHandler(4058,updateGambleRwdNofifyHandler);
      }
   }
}
