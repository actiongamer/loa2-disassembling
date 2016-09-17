package nslm2.modules.battles.PeakSports.service
{
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import nslm2.nets.sockets.ServerEngine;
   import proto.BkSceneMoveReq;
   import com.netease.protobuf.UInt64;
   import nslm2.modules.battles.PeakSports.utils.PeakSportsUtil;
   import nslm2.modules.battles.PeakSports.model.PeakSportsModel;
   import proto.BkFightReq;
   import nslm2.modules.battles.PeakSports.type.PeakSportsMsgs;
   import com.mz.core.event.MzEvent;
   import proto.ProtocolStatusRes;
   import nslm2.modules.footstones.assistantModules.model.AssistantModel;
   import proto.BkStageGetReportRes;
   import proto.BkStageNewEnterNotify;
   import proto.BkSceneMoveNotify;
   import proto.BkFightNotify;
   import nslm2.modules.battles.PeakSports.model.vos.FastPeakData;
   import nslm2.utils.Uint64Util;
   import proto.BkStagePlayerInfo;
   import nslm2.modules.battles.PeakSports.model.vos.FastPeakSportsData;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.BkFightInfo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.BkPlayerStatusNotify;
   import proto.BkStageEndNotify;
   import proto.BkStageLeaveNotify;
   import proto.BkGameStageInfoNotify;
   import nslm2.modules.battles.PeakSports.model.PeakFlagModel;
   import proto.BkGameStepNotify;
   import proto.BkSpecialCommandNotify;
   import proto.PublicTalkNotify;
   import proto.TalkContent;
   import nslm2.modules.foundations.chatModules.ChatModel;
   import nslm2.utils.ServerTimer;
   
   public class PeakSportsBattleService
   {
      
      private static var _ins:nslm2.modules.battles.PeakSports.service.PeakSportsBattleService;
       
      
      private var _lastSendPos:Point;
      
      private var _timeHero:Dictionary;
      
      public function PeakSportsBattleService()
      {
         _lastSendPos = new Point();
         _timeHero = new Dictionary();
         super();
      }
      
      public static function get ins() : nslm2.modules.battles.PeakSports.service.PeakSportsBattleService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.battles.PeakSports.service.PeakSportsBattleService();
         }
         return _ins;
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            ServerEngine.ins.addAlwayHandler(4263,serverCpl_bkStageNewEnterNotify);
            ServerEngine.ins.addAlwayHandler(4268,serverCpl_bkSceneMoveNotify);
            ServerEngine.ins.addAlwayHandler(4261,serverCpl_bkFightNotify);
            ServerEngine.ins.addAlwayHandler(4266,serverCpl_bkPlayerStatusNotify);
            ServerEngine.ins.addAlwayHandler(4271,serverCpl_bkStageEndNotify);
            ServerEngine.ins.addAlwayHandler(4273,serverCpl_bgStageLeaveNotify);
            ServerEngine.ins.addAlwayHandler(4274,serverCpl_bgFlagStageInfoNotify);
            ServerEngine.ins.addAlwayHandler(4275,serverCpl_bkGameStepNotify);
            ServerEngine.ins.addAlwayHandler(4277,serverCpl_bkSpwctalCommandNotify);
         }
         else
         {
            ServerEngine.ins.removeAlwayHandler(4263,serverCpl_bkStageNewEnterNotify);
            ServerEngine.ins.removeAlwayHandler(4268,serverCpl_bkSceneMoveNotify);
            ServerEngine.ins.removeAlwayHandler(4261,serverCpl_bkFightNotify);
            ServerEngine.ins.removeAlwayHandler(4266,serverCpl_bkPlayerStatusNotify);
            ServerEngine.ins.removeAlwayHandler(4271,serverCpl_bkStageEndNotify);
            ServerEngine.ins.removeAlwayHandler(4273,serverCpl_bgStageLeaveNotify);
            ServerEngine.ins.removeAlwayHandler(4274,serverCpl_bgFlagStageInfoNotify);
            ServerEngine.ins.removeAlwayHandler(4275,serverCpl_bkGameStepNotify);
            ServerEngine.ins.removeAlwayHandler(4277,serverCpl_bkSpwctalCommandNotify);
         }
      }
      
      public function sendSelfPos(param1:BkSceneMoveReq, param2:Boolean = false) : void
      {
         if(_lastSendPos.x != param1.x || _lastSendPos.y != param1.y || param2)
         {
            _lastSendPos = new Point(param1.x,param1.y);
            ServerEngine.ins.send(4267,param1);
         }
      }
      
      public function attackOtherPlayer(param1:UInt64, param2:Point) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(PeakSportsUtil.canClickTarget(param2) && PeakSportsUtil.isInBattleProtect(param1) == false && PeakSportsModel.ins.isDied == false)
         {
            _loc3_ = new BkSceneMoveReq();
            _loc3_.x = PeakSportsModel.ins.curScene.playerHero.pos2d.x;
            _loc3_.y = PeakSportsModel.ins.curScene.playerHero.pos2d.y;
            this.sendSelfPos(_loc3_,true);
            _loc4_ = new BkFightReq();
            _loc4_.id = param1;
            ServerEngine.ins.send(4260,_loc4_,null,onServerErr_attack);
         }
         else
         {
            PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgError"));
         }
      }
      
      private function onServerErr_attack(param1:ProtocolStatusRes) : void
      {
         PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgError"));
         if(param1.errCode != 1)
         {
            ServerEngine.ins.doDefaultErr(param1);
         }
      }
      
      public function leave() : void
      {
         AssistantModel.ins.removeTask(50520);
         ServerEngine.ins.send(4272,null,serverCpl_bgStageLeave);
      }
      
      private function serverCpl_bgStageLeave(param1:ProtocolStatusRes) : void
      {
         PeakSportsModel.ins.clearLastFightData();
         PeakSportsModel.ins.clearData();
      }
      
      public function getPeakSportsReport() : void
      {
         ServerEngine.ins.send(4270,null,serverCpl_onStageReport);
      }
      
      private function serverCpl_onStageReport(param1:BkStageGetReportRes) : void
      {
         PeakSportsModel.ins.bkStageGetReportRes = param1;
         PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightReportChanged"));
      }
      
      private function serverCpl_bkStageNewEnterNotify(param1:BkStageNewEnterNotify) : void
      {
         PeakSportsModel.ins.addBgStagePlayer(param1.playerInfo);
      }
      
      private function serverCpl_bkSceneMoveNotify(param1:BkSceneMoveNotify) : void
      {
         PeakSportsModel.ins.posChanged(param1);
      }
      
      private function serverCpl_bkFightNotify(param1:BkFightNotify) : void
      {
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc7_:FastPeakData = new FastPeakData();
         _loc7_.fightData = param1;
         var _loc8_:BkStagePlayerInfo = PeakSportsModel.ins.bkStagePlayers.getValue(Uint64Util.toString(param1.attacker.playerId));
         var _loc3_:BkStagePlayerInfo = PeakSportsModel.ins.bkStagePlayers.getValue(Uint64Util.toString(param1.target.playerId));
         var _loc5_:FastPeakSportsData = new FastPeakSportsData();
         _loc5_.parsePlayerBaseInfo(_loc8_.playerInfo.baseInfo);
         _loc5_.name = PlayerModel.ins.getFullNameWithDistName(_loc8_.playerInfo.baseInfo,false);
         _loc5_.side = _loc8_.side;
         _loc5_.conDeathNum = _loc8_.conDeathNum;
         var _loc4_:FastPeakSportsData = new FastPeakSportsData();
         _loc4_.parsePlayerBaseInfo(_loc3_.playerInfo.baseInfo);
         _loc4_.name = PlayerModel.ins.getFullNameWithDistName(_loc3_.playerInfo.baseInfo,false);
         _loc4_.side = _loc3_.side;
         _loc4_.conDeathNum = _loc3_.conDeathNum;
         if(PlayerModel.ins.isCurPlayer(param1.attacker.playerId) || PlayerModel.ins.isCurPlayer(param1.target.playerId))
         {
            _loc7_.leftPlayerData = _loc5_;
            _loc7_.rightPlayerData = _loc4_;
            _loc7_.fightData = param1;
         }
         ModuleMgr.ins.closeModule(50529);
         ModuleMgr.ins.showModule(50529,_loc7_,ModuleMgr.ins.popLayer.curModuleId);
         PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgStopRun",param1.attacker.playerId));
         PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgStopRun",param1.target.playerId));
         if(PlayerModel.ins.isCurPlayer(param1.attacker.playerId))
         {
            _loc2_ = param1.attacker;
         }
         if(PlayerModel.ins.isCurPlayer(param1.target.playerId))
         {
            _loc2_ = param1.target;
         }
         if(_loc2_ && _loc2_.gainHonor != 0)
         {
            _loc6_ = PeakSportsModel.ins.getBkStagePlayerInfo(_loc2_.playerId == param1.attacker.playerId?param1.target.playerId:param1.attacker.playerId);
            PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",LocaleMgr.ins.getStr(999600138,[_loc6_.playerInfo.baseInfo.name,_loc2_.gainHonor])));
         }
      }
      
      private function serverCpl_bkPlayerStatusNotify(param1:BkPlayerStatusNotify) : void
      {
         PeakSportsModel.ins.changeStatus(param1);
      }
      
      private function serverCpl_bkStageEndNotify(param1:BkStageEndNotify) : void
      {
         PeakSportsModel.ins.isFinished = true;
         PeakSportsModel.ins.winSide = param1.winnerSide;
         PeakSportsModel.ins.bkStageGetReportRes = PeakSportsUtil.bkStageEndNotifyToBgStageGetReportRes(param1);
         PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightFinished"));
      }
      
      private function serverCpl_bgStageLeaveNotify(param1:BkStageLeaveNotify) : void
      {
         PeakSportsModel.ins.removeBgStagePlayer(param1.id);
      }
      
      private function serverCpl_bgFlagStageInfoNotify(param1:BkGameStageInfoNotify) : void
      {
         PeakFlagModel.ins.bkGameStageInfoNotify = param1;
      }
      
      public function serverCpl_bkGameStepNotify(param1:BkGameStepNotify) : void
      {
         PeakSportsModel.ins.step = param1.step;
         PeakSportsModel.ins.replyAllHp(param1.recoverPlayerId);
      }
      
      public function serverCpl_bkSpwctalCommandNotify(param1:BkSpecialCommandNotify) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         _loc3_ = null;
         var _loc4_:BkStagePlayerInfo = PeakSportsModel.ins.getBkStagePlayerInfo(param1.playerId);
         if(_loc4_)
         {
            if(param1.command == 1)
            {
               PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",LocaleMgr.ins.getStr(999600036,[LocaleMgr.ins.getStr(50500900 + _loc4_.side),PlayerModel.ins.getFullNameWithDistName(_loc4_.playerInfo.baseInfo)])));
               if(_loc4_.side == PeakSportsModel.ins.currentBkStagePlayerInfo.side)
               {
                  _loc3_ = new PublicTalkNotify();
                  _loc3_.content = new TalkContent();
                  _loc3_.pindao = 8;
                  _loc3_.content.content = LocaleMgr.ins.getStr(999600046,[PlayerModel.ins.getFullNameWithDistName(_loc4_.playerInfo.baseInfo)]);
                  ChatModel.ins.dispatchEvent(new MzEvent("evtAddChat",_loc3_));
               }
            }
            else if(param1.command == 2)
            {
               PeakSportsMsgs.ins.dispatchEvent(new MzEvent("peakSportsPatternInfo",param1));
               if(_loc4_.side == PeakSportsModel.ins.currentBkStagePlayerInfo.side)
               {
                  if(_timeHero[_loc4_.playerInfo.baseInfo.id] == null)
                  {
                     _timeHero[_loc4_.playerInfo.baseInfo.id] = [];
                  }
                  _loc2_ = "";
                  if(param1.param1 < 200 / 3 && param1.param2 < 182 / 3)
                  {
                     if(_timeHero[_loc4_.playerInfo.baseInfo.id][0] == null || _timeHero[_loc4_.playerInfo.baseInfo.id][0] < ServerTimer.ins.second - 2)
                     {
                        _loc2_ = LocaleMgr.ins.getStr(999600047,[PlayerModel.ins.getFullNameWithDistName(_loc4_.playerInfo.baseInfo)]);
                        _timeHero[_loc4_.playerInfo.baseInfo.id][0] = ServerTimer.ins.second;
                     }
                  }
                  else if(param1.param1 >= 200 / 3 && param1.param2 >= 182 / 3 && param1.param1 < 133.333333333333 && param1.param2 < 121.333333333333)
                  {
                     if(_timeHero[_loc4_.playerInfo.baseInfo.id][1] == null || _timeHero[_loc4_.playerInfo.baseInfo.id][1] < ServerTimer.ins.second - 2)
                     {
                        _loc2_ = LocaleMgr.ins.getStr(999600048,[PlayerModel.ins.getFullNameWithDistName(_loc4_.playerInfo.baseInfo)]);
                        _timeHero[_loc4_.playerInfo.baseInfo.id][1] = ServerTimer.ins.second;
                     }
                  }
                  else if(param1.param1 >= 133.333333333333 && param1.param2 >= 121.333333333333 && param1.param1 <= 200 && param1.param2 <= 182)
                  {
                     if(_timeHero[_loc4_.playerInfo.baseInfo.id][2] == null || _timeHero[_loc4_.playerInfo.baseInfo.id][2] < ServerTimer.ins.second - 2)
                     {
                        _loc2_ = LocaleMgr.ins.getStr(999600049,[PlayerModel.ins.getFullNameWithDistName(_loc4_.playerInfo.baseInfo)]);
                        _timeHero[_loc4_.playerInfo.baseInfo.id][2] = ServerTimer.ins.second;
                     }
                  }
                  if(_loc2_ && _loc2_ != "")
                  {
                     _loc3_ = new PublicTalkNotify();
                     _loc3_.content = new TalkContent();
                     _loc3_.pindao = 8;
                     _loc3_.content.content = _loc2_;
                     ChatModel.ins.dispatchEvent(new MzEvent("evtAddChat",_loc3_));
                  }
               }
            }
         }
      }
   }
}
