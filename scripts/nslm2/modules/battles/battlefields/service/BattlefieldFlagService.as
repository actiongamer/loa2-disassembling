package nslm2.modules.battles.battlefields.service
{
   import nslm2.nets.sockets.ServerEngine;
   import proto.BgGatherNotify;
   import proto.BgGatherPlayerInfo;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.utils.Uint64Util;
   import proto.BgStagePlayerInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageNpcRelationVo;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.battles.battlefields.model.BattleFlagModel;
   import nslm2.modules.battles.battlefields.vos.BattlefieldGatherVo;
   import nslm2.modules.battles.battlefields.vos.BattleFlagInfoData;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.BgPlaceFlagNotify;
   import nslm2.mgrs.stcMgrs.vos.StcBgresGatherVo;
   import nslm2.utils.ServerTimer;
   import proto.BgResStatusNotify;
   import nslm2.modules.battles.battlefields.utils.BattlefieldUtil;
   import com.netease.protobuf.UInt64;
   import proto.BgFireStageInfoNotify;
   import proto.BgGatherStatusNotify;
   import proto.BgGatherReq;
   import proto.BgSceneMoveReq;
   import proto.BgFightNpcReq;
   import proto.ProtocolStatusRes;
   import proto.BgFightNpcNotify;
   
   public class BattlefieldFlagService
   {
      
      private static var _ins:nslm2.modules.battles.battlefields.service.BattlefieldFlagService;
       
      
      private var _gatheredId:int;
      
      public function BattlefieldFlagService()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.battles.battlefields.service.BattlefieldFlagService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.battles.battlefields.service.BattlefieldFlagService();
         }
         return _ins;
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            ServerEngine.ins.addAlwayHandler(4219,serverCpl_bgGatherNotify);
            ServerEngine.ins.addAlwayHandler(4238,bgPlaceFlagNotify);
            ServerEngine.ins.addAlwayHandler(4227,serverCpl_bgResStatusNotify);
            ServerEngine.ins.addAlwayHandler(4237,serverCpl_bgFlagStageInfoNotify);
            ServerEngine.ins.addAlwayHandler(4233,serverCpl_bgGatherStatusNotify);
            ServerEngine.ins.addAlwayHandler(4240,bgFightNpcNotifyHandler);
         }
         else
         {
            ServerEngine.ins.addAlwayHandler(4219,serverCpl_bgGatherNotify);
            ServerEngine.ins.removeAlwayHandler(4238,bgPlaceFlagNotify);
            ServerEngine.ins.removeAlwayHandler(4227,serverCpl_bgResStatusNotify);
            ServerEngine.ins.removeAlwayHandler(4229,serverCpl_bgFlagStageInfoNotify);
            ServerEngine.ins.removeAlwayHandler(4233,serverCpl_bgGatherStatusNotify);
            ServerEngine.ins.removeAlwayHandler(4240,bgFightNpcNotifyHandler);
         }
      }
      
      private function serverCpl_bgGatherNotify(param1:BgGatherNotify) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc7_:int = 0;
         var _loc6_:* = param1.gatherInfo;
         for each(var _loc5_ in param1.gatherInfo)
         {
            _loc2_ = BattlefieldModel.ins.bgStagePlayers.getValue(Uint64Util.toString(_loc5_.playerId));
            _loc4_ = StcMgr.ins.getStageNpcRelationVo(param1.id);
            if(_loc2_)
            {
               BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",LocaleMgr.ins.getStr(50500145,[LocaleMgr.ins.getStr(50500900 + _loc2_.side),PlayerModel.ins.getFullNameWithDistName(_loc2_.playerInfo.baseInfo),LocaleMgr.ins.getStr(_loc4_.name)])));
               AlertUtil.float(LocaleMgr.ins.getStr(50500156,[LocaleMgr.ins.getStr(50500900 + _loc2_.side),LocaleMgr.ins.getStr(_loc4_.name)]));
            }
            if(param1.resStatus == 0)
            {
               BattleFlagModel.ins.changeStageResInfo(param1.id,param1.resStatus);
               BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msg_flag_picked_up",param1.id));
            }
            BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgCryStopGather",new BattlefieldGatherVo(param1.id,_loc5_.playerId)));
            BattleFlagModel.ins.addFlagOwnerId(_loc2_.playerInfo.baseInfo.id,param1.id,_loc5_.flagTimeOutStamp);
            _loc3_ = BattleFlagModel.ins.flagDataDic.getValue(param1.id);
            _loc3_.ownerId = _loc2_.playerInfo.baseInfo.id;
            _loc3_.outTimeStamp = _loc5_.flagTimeOutStamp;
            ObserverMgr.ins.sendNotice("MSG_FLAG_STAUTS_UPDATE",_loc3_);
            BattlefieldMsgs.ins.dispatchEvent(new MzEvent("MSG_FLAG_OWNER_UPDATE"));
         }
      }
      
      private function bgPlaceFlagNotify(param1:BgPlaceFlagNotify) : void
      {
         var _loc5_:* = null;
         var _loc2_:BgStagePlayerInfo = BattlefieldModel.ins.bgStagePlayers.getValue(Uint64Util.toString(param1.playerId));
         var _loc4_:StcStageNpcRelationVo = StcMgr.ins.getStageNpcRelationVo(param1.flagId);
         var _loc6_:StcBgresGatherVo = StcMgr.ins.getBgresGatherVo(param1.flagId);
         if(_loc2_)
         {
            BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",LocaleMgr.ins.getStr(50500148,[LocaleMgr.ins.getStr(50500900 + _loc2_.side),PlayerModel.ins.getFullNameWithDistName(_loc2_.playerInfo.baseInfo),LocaleMgr.ins.getStr(_loc4_.name)])));
            AlertUtil.float(LocaleMgr.ins.getStr(50500157,[LocaleMgr.ins.getStr(50500900 + _loc2_.side),LocaleMgr.ins.getStr(_loc4_.name)]));
         }
         if(PlayerModel.ins.isCurPlayer(param1.playerId))
         {
            BattleFlagModel.ins.addGatherHornor(param1.flagId);
         }
         else if(param1.teamSide == BattlefieldModel.ins.currentBgStagePlayerInfo.side)
         {
            BattleFlagModel.ins.addGatherHornorFromTeam(param1.flagId);
         }
         BattleFlagModel.ins.gatherAllChanged(param1.teamSide,param1.totalNum);
         BattleFlagModel.ins.removeFlagOwnerId(param1.playerId,param1.flagId);
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("MSG_FLAG_OWNER_UPDATE"));
         var _loc3_:BattleFlagInfoData = BattleFlagModel.ins.flagDataDic.getValue(param1.flagId);
         _loc3_.ownerId = null;
         _loc3_.outTimeStamp = 0;
         _loc3_.leftCnt = _loc3_.leftCnt - 1;
         if(_loc3_.leftCnt <= 0 && _loc3_.id != 2501)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(50500161,[LocaleMgr.ins.getStr(_loc4_.name)]));
         }
         if(param1.rebornFlagId == param1.flagId)
         {
            _loc3_.refreshStamp = param1.rebornStamp;
         }
         else if(param1.rebornFlagId)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(50500160,[param1.rebornStamp - ServerTimer.ins.second]));
            _loc5_ = BattleFlagModel.ins.flagDataDic.getValue(param1.rebornFlagId);
            if(!_loc5_)
            {
               _loc5_ = new BattleFlagInfoData();
               _loc5_.id = param1.rebornFlagId;
               BattleFlagModel.ins.flagDataDic.put(_loc5_.id,_loc5_);
            }
            _loc5_.refreshStamp = param1.rebornStamp;
            _loc5_.ownerId = null;
            _loc5_.outTimeStamp = 0;
         }
         ObserverMgr.ins.sendNotice("MSG_FLAG_STAUTS_UPDATE");
      }
      
      private function serverCpl_bgResStatusNotify(param1:BgResStatusNotify) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(param1.resStatus == 1)
         {
            BattleFlagModel.ins.changeStageResInfo(param1.id,param1.resStatus);
            _loc4_ = StcMgr.ins.getStageNpcRelationVo(param1.id);
            if(BattlefieldUtil.getNpcKind(_loc4_.display_npc) == 10)
            {
               BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msg_moster_reset",[param1.id,param1.npcGroupId]));
            }
            else
            {
               _loc3_ = BattleFlagModel.ins.flagOwnerDic.getValue(param1.id);
               BattleFlagModel.ins.removeFlagOwnerId(_loc3_,param1.id);
               BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msg_flag_reset",param1.id));
               BattlefieldMsgs.ins.dispatchEvent(new MzEvent("MSG_FLAG_OWNER_UPDATE"));
               _loc2_ = BattleFlagModel.ins.flagDataDic.getValue(param1.id);
               _loc2_.ownerId = null;
               _loc2_.refreshStamp = 0;
               _loc2_.outTimeStamp = 0;
               ObserverMgr.ins.sendNotice("MSG_FLAG_STAUTS_UPDATE",_loc2_);
            }
         }
      }
      
      private function serverCpl_bgFlagStageInfoNotify(param1:BgFireStageInfoNotify) : void
      {
         BattleFlagModel.ins.bgFlagFireStageInfoNotify = param1;
      }
      
      private function serverCpl_bgGatherStatusNotify(param1:BgGatherStatusNotify) : void
      {
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgCryBeginGather",new BattlefieldGatherVo(param1.resId,param1.id)));
      }
      
      public function gather(param1:BgGatherReq) : void
      {
         _gatheredId = param1.id;
         var _loc2_:BgSceneMoveReq = new BgSceneMoveReq();
         _loc2_.x = BattlefieldModel.ins.curScene.playerHero.pos2d.x;
         _loc2_.y = BattlefieldModel.ins.curScene.playerHero.pos2d.y;
         BattlefieldBattleService.ins.sendSelfPos(_loc2_);
         ServerEngine.ins.send(4218,param1);
      }
      
      public function killMonster(param1:int, param2:Function) : void
      {
         var _loc3_:BgFightNpcReq = new BgFightNpcReq();
         _loc3_.id = param1;
         ServerEngine.ins.send(4239,_loc3_,param2,onServerErr_fight);
      }
      
      private function onServerErr_fight(param1:ProtocolStatusRes) : void
      {
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgError"));
         if(param1.errCode != 1)
         {
            ServerEngine.ins.doDefaultErr(param1);
         }
      }
      
      private function bgFightNpcNotifyHandler(param1:BgFightNpcNotify) : void
      {
         var _loc2_:* = null;
         if(param1)
         {
            if(param1.hasIsWin)
            {
               _loc2_ = BattlefieldModel.ins.getBgStagePlayerInfo(param1.id);
               if(_loc2_)
               {
                  _loc2_.hpPercent = param1.hpPercent;
                  BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightHpChanged",_loc2_));
               }
               BattlefieldMsgs.ins.dispatchEvent(new MzEvent("MSG_MONSTER_DIE",param1.npcResId));
               BattleFlagModel.ins.changeStageResInfo(param1.npcResId,0);
               BattleFlagModel.ins.setKillMonsterNum(param1.teamSide,param1.teamKillNpcNum);
               BattleFlagModel.ins.leftMonsterCnt--;
            }
         }
      }
   }
}
