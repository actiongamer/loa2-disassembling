package nslm2.modules.battles.battlefields.service
{
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import flash.geom.Point;
   import proto.BgSceneMoveReq;
   import com.netease.protobuf.UInt64;
   import nslm2.modules.battles.battlefields.utils.BattlefieldUtil;
   import proto.BgFightReq;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import com.mz.core.event.MzEvent;
   import proto.ProtocolStatusRes;
   import nslm2.modules.footstones.assistantModules.model.AssistantModel;
   import proto.BgStageGetReportRes;
   import proto.BgFightNotify;
   import nslm2.modules.battles.battlefields.vos.FastBattleData;
   import nslm2.utils.Uint64Util;
   import proto.BgStagePlayerInfo;
   import nslm2.modules.battles.battlefields.vos.FastBattlePlayerData;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.battles.battlefields.model.BattleFlagModel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.battles.battlefields.vos.BattlefieldGatherVo;
   import proto.BgPlayerStatusNotify;
   import proto.BgStageEndNotify;
   import proto.BgStageLeaveNotify;
   import proto.BgStageNewEnterNotify;
   import proto.BgSceneMoveNotify;
   
   public class BattlefieldBattleService
   {
      
      private static var _ins:nslm2.modules.battles.battlefields.service.BattlefieldBattleService;
       
      
      private var _lastSendPos:Point;
      
      public function BattlefieldBattleService()
      {
         _lastSendPos = new Point();
         super();
      }
      
      public static function get ins() : nslm2.modules.battles.battlefields.service.BattlefieldBattleService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.battles.battlefields.service.BattlefieldBattleService();
         }
         return _ins;
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            ServerEngine.ins.addAlwayHandler(4221,serverCpl_bgStageNewEnterNotify);
            ServerEngine.ins.addAlwayHandler(4226,serverCpl_bgSceneMoveNotify);
            ServerEngine.ins.addAlwayHandler(4217,serverCpl_bgFightNotify);
            ServerEngine.ins.addAlwayHandler(4224,serverCpl_bgPlayerStatusNotify);
            ServerEngine.ins.addAlwayHandler(4230,serverCpl_bgStageEndNotify);
            ServerEngine.ins.addAlwayHandler(4232,serverCpl_bgStageLeaveNotify);
         }
         else
         {
            ServerEngine.ins.removeAlwayHandler(4221,serverCpl_bgStageNewEnterNotify);
            ServerEngine.ins.removeAlwayHandler(4226,serverCpl_bgSceneMoveNotify);
            ServerEngine.ins.removeAlwayHandler(4217,serverCpl_bgFightNotify);
            ServerEngine.ins.removeAlwayHandler(4224,serverCpl_bgPlayerStatusNotify);
            ServerEngine.ins.removeAlwayHandler(4230,serverCpl_bgStageEndNotify);
            ServerEngine.ins.removeAlwayHandler(4232,serverCpl_bgStageLeaveNotify);
         }
         if(BattlefieldModel.ins.curBattlefieldId == 1000)
         {
            BattlefieldCrystalService.ins.switchEventListeners(param1);
         }
         else
         {
            BattlefieldFlagService.ins.switchEventListeners(param1);
         }
      }
      
      public function sendSelfPos(param1:BgSceneMoveReq, param2:Boolean = false) : void
      {
         if(_lastSendPos.x != param1.x || _lastSendPos.y != param1.y || param2)
         {
            _lastSendPos = new Point(param1.x,param1.y);
            ServerEngine.ins.send(4225,param1);
         }
      }
      
      public function attackOtherPlayer(param1:UInt64, param2:Point) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(BattlefieldUtil.canClickTarget(param2) && BattlefieldUtil.isInBattleProtect(param1) == false && BattlefieldModel.ins.isDied == false)
         {
            _loc3_ = new BgSceneMoveReq();
            _loc3_.x = BattlefieldModel.ins.curScene.playerHero.pos2d.x;
            _loc3_.y = BattlefieldModel.ins.curScene.playerHero.pos2d.y;
            this.sendSelfPos(_loc3_,true);
            _loc4_ = new BgFightReq();
            _loc4_.id = param1;
            ServerEngine.ins.send(4216,_loc4_,null,onServerErr_attack);
         }
         else
         {
            BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgError"));
         }
      }
      
      private function onServerErr_attack(param1:ProtocolStatusRes) : void
      {
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgError"));
         if(param1.errCode != 1)
         {
            ServerEngine.ins.doDefaultErr(param1);
         }
      }
      
      public function leave() : void
      {
         AssistantModel.ins.removeTask(50500);
         ServerEngine.ins.send(4231,null,serverCpl_bgStageLeave);
      }
      
      private function serverCpl_bgStageLeave(param1:ProtocolStatusRes) : void
      {
         BattlefieldModel.ins.clearLastFightData();
         BattlefieldModel.ins.clearData();
         BattlefieldModel.ins.clearTeamData();
      }
      
      public function getBattlefieldReport() : void
      {
         ServerEngine.ins.send(4228,null,serverCpl_onStageReport);
      }
      
      private function serverCpl_onStageReport(param1:BgStageGetReportRes) : void
      {
         BattlefieldModel.ins.bgStageGetReportRes = param1;
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightReportChanged"));
      }
      
      private function serverCpl_bgFightNotify(param1:BgFightNotify) : void
      {
         var _loc5_:FastBattleData = new FastBattleData();
         _loc5_.fightData = param1;
         var _loc6_:BgStagePlayerInfo = BattlefieldModel.ins.bgStagePlayers.getValue(Uint64Util.toString(param1.attacker.playerId));
         var _loc2_:BgStagePlayerInfo = BattlefieldModel.ins.bgStagePlayers.getValue(Uint64Util.toString(param1.target.playerId));
         var _loc4_:FastBattlePlayerData = new FastBattlePlayerData();
         _loc4_.parsePlayerBaseInfo(_loc6_.playerInfo.baseInfo);
         _loc4_.name = PlayerModel.ins.getFullNameWithDistName(_loc6_.playerInfo.baseInfo,false);
         _loc4_.side = _loc6_.side;
         _loc4_.conDeathNum = _loc6_.conDeathNum;
         _loc4_.noviceBuffNum = _loc6_.noviceBuffLayer;
         if(BattlefieldModel.ins.curBattlefieldId == 1001)
         {
            _loc4_.sideKillNpcNum = BattleFlagModel.ins.getKillMonsterNum(_loc6_.side);
         }
         var _loc3_:FastBattlePlayerData = new FastBattlePlayerData();
         _loc3_.parsePlayerBaseInfo(_loc2_.playerInfo.baseInfo);
         _loc3_.name = PlayerModel.ins.getFullNameWithDistName(_loc2_.playerInfo.baseInfo,false);
         _loc3_.side = _loc2_.side;
         _loc3_.conDeathNum = _loc2_.conDeathNum;
         _loc3_.noviceBuffNum = _loc2_.noviceBuffLayer;
         if(BattlefieldModel.ins.curBattlefieldId == 1001)
         {
            _loc3_.sideKillNpcNum = BattleFlagModel.ins.getKillMonsterNum(_loc3_.side);
         }
         if(PlayerModel.ins.isCurPlayer(param1.attacker.playerId) || PlayerModel.ins.isCurPlayer(param1.target.playerId))
         {
            _loc5_.leftPlayerData = _loc4_;
            _loc5_.rightPlayerData = _loc3_;
            _loc5_.fightData = param1;
         }
         ModuleMgr.ins.closeModule(50509);
         ModuleMgr.ins.showModule(50509,_loc5_,ModuleMgr.ins.popLayer.curModuleId);
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgStopRun",param1.attacker.playerId));
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgStopRun",param1.target.playerId));
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgCryStopGather",new BattlefieldGatherVo(0,param1.attacker.playerId)));
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgCryStopGather",new BattlefieldGatherVo(0,param1.target.playerId)));
      }
      
      private function serverCpl_bgPlayerStatusNotify(param1:BgPlayerStatusNotify) : void
      {
         BattlefieldModel.ins.changeStatus(param1);
      }
      
      private function serverCpl_bgStageEndNotify(param1:BgStageEndNotify) : void
      {
         BattlefieldModel.ins.isFinished = true;
         BattlefieldModel.ins.winSide = param1.winnerSide;
         BattlefieldModel.ins.bgStageGetReportRes = BattlefieldUtil.bgStageEndNotifyToBgStageGetReportRes(param1);
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightFinished"));
      }
      
      private function serverCpl_bgStageLeaveNotify(param1:BgStageLeaveNotify) : void
      {
         BattlefieldModel.ins.removeBgStagePlayer(param1.id);
         BattlefieldModel.ins.removeMem(param1.id);
      }
      
      private function serverCpl_bgStageNewEnterNotify(param1:BgStageNewEnterNotify) : void
      {
         BattlefieldModel.ins.addBgStagePlayer(param1.playerInfo);
      }
      
      private function serverCpl_bgSceneMoveNotify(param1:BgSceneMoveNotify) : void
      {
         BattlefieldModel.ins.posChanged(param1);
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgCryStopGather",new BattlefieldGatherVo(0,param1.id)));
      }
   }
}
