package nslm2.modules.battles.PeakSports.model
{
   import proto.BkInfoRes;
   import com.mz.core.utils.DictHash;
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import proto.BkStageGetReportRes;
   import proto.BkStagePlayerInfo;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import com.netease.protobuf.UInt64;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleTimerMsg;
   import nslm2.modules.battles.PeakSports.type.PeakSportsMsgs;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.BkSceneMoveNotify;
   import proto.BkPlayerStatusNotify;
   import nslm2.modules.battles.PeakSports.model.vos.PeakSportsPlayerDiedVo;
   import nslm2.utils.ServerTimer;
   import nslm2.modules.battles.PeakSports.utils.PeakSportsUtil;
   
   public class PeakSportsModel
   {
      
      private static var _ins:nslm2.modules.battles.PeakSports.model.PeakSportsModel;
       
      
      public var bkInfoRes:BkInfoRes;
      
      public var regStamp:uint = 0;
      
      public var bkStagePlayers:DictHash;
      
      private var _curPeakSportsId:int;
      
      public var curScene:Scene45Base;
      
      public var bkStageGetReportRes:BkStageGetReportRes;
      
      public var isFinished:Boolean;
      
      public var winSide:int;
      
      public var startStamp:int;
      
      public var chatChannelId:String;
      
      public var lastBattleProtectFloatStamp:int;
      
      public var isInBattleScene:Boolean;
      
      public var isDied:Boolean;
      
      private var _step:int;
      
      public function PeakSportsModel()
      {
         bkStagePlayers = new DictHash();
         super();
      }
      
      public static function get ins() : nslm2.modules.battles.PeakSports.model.PeakSportsModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.battles.PeakSports.model.PeakSportsModel();
         }
         return _ins;
      }
      
      public function get currentBkStagePlayerInfo() : BkStagePlayerInfo
      {
         return this.bkStagePlayers.getValue(Uint64Util.toString(PlayerModel.ins.playerInfo.id));
      }
      
      public function getBkStagePlayerInfo(param1:UInt64) : BkStagePlayerInfo
      {
         return this.bkStagePlayers.getValue(Uint64Util.toString(param1));
      }
      
      public function clearData() : void
      {
         _step = 0;
         this.regStamp = 0;
         ObserverMgr.ins.sendNotice("msgSwitchMinimapCountDown",new SwitchModuleTimerMsg(50520,0,0));
         this.startStamp = 0;
      }
      
      public function clearLastFightData() : void
      {
         this.bkStagePlayers = new DictHash();
         this.curScene = null;
         this.winSide = 0;
         this.isFinished = false;
         this.chatChannelId = null;
         this.isDied = false;
      }
      
      public function addBgStagePlayer(param1:BkStagePlayerInfo) : void
      {
         if(bkStagePlayers.getValue(Uint64Util.toString(param1.playerInfo.baseInfo.id)) == null)
         {
            bkStagePlayers.put(Uint64Util.toString(param1.playerInfo.baseInfo.id),param1);
            PeakFlagModel.ins.addPlayerOne(param1.side);
            PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightNewPlayer",param1));
            PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",LocaleMgr.ins.getStr(999600128,[PlayerModel.ins.getFullNameWithDistName(param1.playerInfo.baseInfo),LocaleMgr.ins.getStr(50500900 + param1.side)])));
         }
      }
      
      public function removeBgStagePlayer(param1:UInt64) : void
      {
         var _loc2_:BkStagePlayerInfo = bkStagePlayers.getValue(Uint64Util.toString(param1));
         if(_loc2_)
         {
            PeakFlagModel.ins.minusPlayerOne(_loc2_.side);
            PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",LocaleMgr.ins.getStr(999600127,[LocaleMgr.ins.getStr(50500900 + _loc2_.side),PlayerModel.ins.getFullNameWithDistName(_loc2_.playerInfo.baseInfo)])));
            bkStagePlayers.remove(Uint64Util.toString(param1));
         }
         PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightPlayerLeave",param1));
      }
      
      public function posChanged(param1:BkSceneMoveNotify, param2:Boolean = true) : void
      {
         var _loc3_:BkStagePlayerInfo = this.bkStagePlayers.getValue(Uint64Util.toString(param1.id));
         if(_loc3_)
         {
            _loc3_.x = param1.x;
            _loc3_.y = param1.y;
            if(param2)
            {
               PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightPlayerPosChanged",param1));
            }
         }
      }
      
      public function changeStatus(param1:BkPlayerStatusNotify) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc3_:BkStagePlayerInfo = this.bkStagePlayers.getValue(Uint64Util.toString(param1.playerId)) as BkStagePlayerInfo;
         _loc3_.status = param1.status;
         _loc3_.x = param1.x;
         _loc3_.y = param1.y;
         _loc3_.rebornStamp = param1.rebornStamp;
         if(param1.status == 0)
         {
            _loc3_.conDeathNum = param1.conDeathNum;
            _loc3_.defenseStamp = param1.defenseStamp;
            if(PlayerModel.ins.isCurPlayer(param1.playerId))
            {
               this.isDied = true;
            }
            else
            {
               PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightPlayerDied",new PeakSportsPlayerDiedVo(param1.playerId,ServerTimer.ins.second,param1.conDeathNum,param1.rebornStamp)));
               this.posChanged(PeakSportsUtil.bkStatusNotifyToCrossSceneMoveNotify(param1));
            }
            _loc2_ = this.bkStagePlayers.getValue(Uint64Util.toString(param1.killerId)) as BkStagePlayerInfo;
            if(_loc2_)
            {
               _loc2_.hpPercent = param1.killerHpPercent;
               _loc2_.conDeathNum = 0;
               _loc2_.defenseStamp = param1.defenseStamp;
            }
            PeakFlagModel.ins.addTeamKilled(_loc2_.side);
            PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightHpChanged",_loc2_));
            PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",LocaleMgr.ins.getStr(999600120,[LocaleMgr.ins.getStr(50500900 + _loc2_.side),PlayerModel.ins.getFullNameWithDistName(_loc2_.playerInfo.baseInfo),LocaleMgr.ins.getStr(50500900 + _loc3_.side),PlayerModel.ins.getFullNameWithDistName(_loc3_.playerInfo.baseInfo)])));
            if(param1.firstKill)
            {
               _loc4_ = LocaleMgr.ins.getStr(999600121,[LocaleMgr.ins.getStr(50500900 + _loc2_.side),PlayerModel.ins.getFullNameWithDistName(_loc2_.playerInfo.baseInfo)]);
               PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",_loc4_));
               ObserverMgr.ins.sendNotice("MSG_TOP_CENTER_HORSE_LAMP",_loc4_);
            }
            switch(int(param1.killerConKillNum) - 5)
            {
               case 0:
                  _loc4_ = LocaleMgr.ins.getStr(999600122,[LocaleMgr.ins.getStr(50500900 + _loc2_.side),PlayerModel.ins.getFullNameWithDistName(_loc2_.playerInfo.baseInfo)]);
                  PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",_loc4_));
                  ObserverMgr.ins.sendNotice("MSG_TOP_CENTER_HORSE_LAMP",_loc4_);
                  break;
               default:
                  _loc4_ = LocaleMgr.ins.getStr(999600122,[LocaleMgr.ins.getStr(50500900 + _loc2_.side),PlayerModel.ins.getFullNameWithDistName(_loc2_.playerInfo.baseInfo)]);
                  PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",_loc4_));
                  ObserverMgr.ins.sendNotice("MSG_TOP_CENTER_HORSE_LAMP",_loc4_);
                  break;
               default:
                  _loc4_ = LocaleMgr.ins.getStr(999600122,[LocaleMgr.ins.getStr(50500900 + _loc2_.side),PlayerModel.ins.getFullNameWithDistName(_loc2_.playerInfo.baseInfo)]);
                  PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",_loc4_));
                  ObserverMgr.ins.sendNotice("MSG_TOP_CENTER_HORSE_LAMP",_loc4_);
                  break;
               case 3:
                  _loc4_ = LocaleMgr.ins.getStr(999600123,[LocaleMgr.ins.getStr(50500900 + _loc2_.side),PlayerModel.ins.getFullNameWithDistName(_loc2_.playerInfo.baseInfo)]);
                  PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",_loc4_));
                  ObserverMgr.ins.sendNotice("MSG_TOP_CENTER_HORSE_LAMP",_loc4_);
                  break;
               default:
                  _loc4_ = LocaleMgr.ins.getStr(999600123,[LocaleMgr.ins.getStr(50500900 + _loc2_.side),PlayerModel.ins.getFullNameWithDistName(_loc2_.playerInfo.baseInfo)]);
                  PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",_loc4_));
                  ObserverMgr.ins.sendNotice("MSG_TOP_CENTER_HORSE_LAMP",_loc4_);
                  break;
               default:
                  _loc4_ = LocaleMgr.ins.getStr(999600123,[LocaleMgr.ins.getStr(50500900 + _loc2_.side),PlayerModel.ins.getFullNameWithDistName(_loc2_.playerInfo.baseInfo)]);
                  PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",_loc4_));
                  ObserverMgr.ins.sendNotice("MSG_TOP_CENTER_HORSE_LAMP",_loc4_);
                  break;
               default:
                  _loc4_ = LocaleMgr.ins.getStr(999600123,[LocaleMgr.ins.getStr(50500900 + _loc2_.side),PlayerModel.ins.getFullNameWithDistName(_loc2_.playerInfo.baseInfo)]);
                  PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",_loc4_));
                  ObserverMgr.ins.sendNotice("MSG_TOP_CENTER_HORSE_LAMP",_loc4_);
                  break;
               case 7:
                  _loc4_ = LocaleMgr.ins.getStr(999600124,[LocaleMgr.ins.getStr(50500900 + _loc2_.side),PlayerModel.ins.getFullNameWithDistName(_loc2_.playerInfo.baseInfo)]);
                  PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",_loc4_));
                  ObserverMgr.ins.sendNotice("MSG_TOP_CENTER_HORSE_LAMP",_loc4_);
            }
         }
         else
         {
            if(PlayerModel.ins.isCurPlayer(param1.playerId))
            {
               this.isDied = false;
            }
            PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightPlayerRevived",param1.playerId));
            this.posChanged(PeakSportsUtil.bkStatusNotifyToCrossSceneMoveNotify(param1));
            PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",LocaleMgr.ins.getStr(999600125,[LocaleMgr.ins.getStr(50500900 + _loc3_.side),PlayerModel.ins.getFullNameWithDistName(_loc3_.playerInfo.baseInfo)])));
         }
         if(PlayerModel.ins.isCurPlayer(param1.killerId))
         {
            PeakFlagModel.ins.addMykilledByOne();
         }
         if(param1.assistPlayerId)
         {
            var _loc7_:int = 0;
            var _loc6_:* = param1.assistPlayerId;
            for each(var _loc5_ in param1.assistPlayerId)
            {
               if(PlayerModel.ins.isCurPlayer(_loc5_))
               {
                  PeakFlagModel.ins.addMyAssistedByOne();
                  return;
               }
            }
         }
      }
      
      public function replyAllHp(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ = bkStagePlayers.getValue(Uint64Util.toString(param1[_loc3_]));
            if(_loc2_)
            {
               _loc2_.hpPercent = 100;
            }
            PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightHpChanged",_loc2_));
            _loc3_++;
         }
      }
      
      public function get step() : int
      {
         return _step;
      }
      
      public function set step(param1:int) : void
      {
         _step = param1;
         PeakSportsMsgs.ins.dispatchEvent(new MzEvent("peakSportsStep"));
      }
      
      public function get curPeakSportsId() : int
      {
         _curPeakSportsId = 1001;
         return _curPeakSportsId;
      }
   }
}
