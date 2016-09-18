package nslm2.modules.battles.battlefields.model
{
   import proto.BgInfoRes;
   import com.netease.protobuf.UInt64;
   import com.mz.core.utils.DictHash;
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import proto.BgStageGetReportRes;
   import proto.TeamMemberState;
   import proto.BgPlayerInfo;
   import proto.BgStagePlayerInfo;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import com.mz.core.event.MzEvent;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.TeamInvitedNotify;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleTimerMsg;
   import proto.BgSceneMoveNotify;
   import proto.BgPlayerStatusNotify;
   import nslm2.modules.battles.battlefields.vos.BattlefieldPlayerDiedVo;
   import nslm2.utils.ServerTimer;
   import nslm2.modules.battles.battlefields.utils.BattlefieldUtil;
   import proto.BgCryTeamInfo;
   import proto.BgFireTeamInfo;
   import proto.TaskInfo;
   import nslm2.modules.foundations.miniTasks.vo.TaskVo;
   
   public class BattlefieldModel
   {
      
      private static var _ins:nslm2.modules.battles.battlefields.model.BattlefieldModel;
       
      
      public var bgInfoRes:BgInfoRes;
      
      public var regStamp:uint;
      
      private var _memInfos:Array;
      
      public var curLeaderId:UInt64;
      
      public var curTeamId:UInt64;
      
      public var invitedNotifies:Array;
      
      public var invitedIds:Array;
      
      public var bgStagePlayers:DictHash;
      
      private var _curBattlefieldId:int;
      
      public var curScene:Scene45Base;
      
      public var bgStageGetReportRes:BgStageGetReportRes;
      
      public var isFinished:Boolean;
      
      public var winSide:int;
      
      public var startStamp:int;
      
      public var getedDegreeRankRewardIds:Array;
      
      public var chatChannelId:String;
      
      public var canGetSeasonReward:Boolean;
      
      public var conDeathNum:int;
      
      public var lastBattleProtectFloatStamp:int;
      
      public var isInBattleScene:Boolean;
      
      public var isDied:Boolean;
      
      public var friendsListReady:Boolean;
      
      public var memberListReady:Boolean;
      
      private var _friendsList:Array;
      
      private var _familyMemList:Array;
      
      public var taskDic:DictHash;
      
      public function BattlefieldModel()
      {
         invitedNotifies = [];
         invitedIds = [];
         bgStagePlayers = new DictHash();
         getedDegreeRankRewardIds = [];
         taskDic = new DictHash();
         super();
      }
      
      public static function get ins() : nslm2.modules.battles.battlefields.model.BattlefieldModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.battles.battlefields.model.BattlefieldModel();
         }
         return _ins;
      }
      
      public function get memInfos() : Array
      {
         return _memInfos;
      }
      
      public function set memInfos(param1:Array) : void
      {
         var _loc3_:* = null;
         var _loc4_:Array = [];
         var _loc6_:int = 0;
         var _loc5_:* = param1;
         for each(var _loc2_ in param1)
         {
            _loc3_ = new BgPlayerInfo();
            _loc3_.bgBaseInfo = _loc2_.mem.bgBaseInfo;
            _loc3_.baseInfo = _loc2_.mem.player;
            _loc4_.push(_loc3_);
         }
         _memInfos = _loc4_;
      }
      
      public function get friendsList() : Array
      {
         return _friendsList;
      }
      
      public function set friendsList(param1:Array) : void
      {
         _friendsList = param1;
         friendsListReady = true;
         sendReadyNotice();
      }
      
      public function get familyMemList() : Array
      {
         return _familyMemList;
      }
      
      public function set familyMemList(param1:Array) : void
      {
         _familyMemList = param1;
         memberListReady = true;
         sendReadyNotice();
      }
      
      public function get currentBgStagePlayerInfo() : BgStagePlayerInfo
      {
         return this.bgStagePlayers.getValue(Uint64Util.toString(PlayerModel.ins.playerInfo.id));
      }
      
      public function getBgStagePlayerInfo(param1:UInt64) : BgStagePlayerInfo
      {
         return this.bgStagePlayers.getValue(Uint64Util.toString(param1));
      }
      
      public function addMem(param1:BgPlayerInfo) : void
      {
         if(this.curTeamId != null)
         {
            this.memInfos.push(param1);
            BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgBattlefieldMemChanged",this.memInfos));
         }
      }
      
      public function removeMem(param1:UInt64, param2:Boolean = false) : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = memInfos;
         for each(var _loc3_ in memInfos)
         {
            if(Uint64Util.equal(_loc3_.baseInfo.id,param1))
            {
               ArrayUtil.removeItem(memInfos,_loc3_);
               AlertUtil.float(_loc3_.baseInfo.name + LocaleMgr.ins.getStr(50500048));
               if(PlayerModel.ins.isCurPlayer(param1))
               {
                  ModuleMgr.ins.closeModule(50501);
                  this.clearData();
                  this.clearTeamData();
                  BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgBattlefieldTeamDismissed"));
               }
               BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgBattlefieldMemChanged",this.memInfos));
            }
         }
      }
      
      public function addInvitedNotify(param1:TeamInvitedNotify) : void
      {
         this.invitedNotifies.push(param1);
      }
      
      public function removeInvitedNotify(param1:UInt64) : void
      {
         Uint64Util.removeItemByAttr(this.invitedNotifies,"teamId",param1);
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgBattlefieldInvitedChanged"));
      }
      
      public function addInvitedId(param1:UInt64) : void
      {
         this.invitedIds.push(param1);
      }
      
      public function removeInvitedId(param1:UInt64) : void
      {
         Uint64Util.removeItemFromArray(this.invitedIds,param1);
      }
      
      public function teamDismissed() : void
      {
         clearTeamData();
         clearData();
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgBattlefieldTeamDismissed"));
         AlertUtil.float(LocaleMgr.ins.getStr(50500101));
      }
      
      private function sendReadyNotice() : void
      {
         if(memberListReady == true && friendsListReady == true)
         {
            BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgBattlefieldPlayersReady"));
         }
      }
      
      public function getPlayerState(param1:UInt64) : int
      {
         var _loc4_:int = 0;
         var _loc3_:* = memInfos;
         for each(var _loc2_ in memInfos)
         {
            if(Uint64Util.equal(_loc2_.baseInfo.id,param1))
            {
               return 2;
            }
         }
         if(Uint64Util.indexOfArray(this.invitedIds,param1) != -1)
         {
            return 1;
         }
         return 3;
      }
      
      public function clearTeamData() : void
      {
         this.memInfos = null;
         this.curLeaderId = null;
         this.curTeamId = null;
      }
      
      public function clearData() : void
      {
         this.invitedIds = [];
         this.regStamp = 0;
         ObserverMgr.ins.sendNotice("msgSwitchMinimapCountDown",new SwitchModuleTimerMsg(50500,0,0));
         this.startStamp = 0;
      }
      
      public function clearLastFightData() : void
      {
         this.bgStagePlayers = new DictHash();
         this.curScene = null;
         this.winSide = 0;
         this.isFinished = false;
         this.chatChannelId = null;
         this.isDied = false;
      }
      
      public function addBgStagePlayer(param1:BgStagePlayerInfo) : void
      {
         if(this.bgStagePlayers.getValue(Uint64Util.toString(param1.playerInfo.baseInfo.id)) == null)
         {
            this.bgStagePlayers.put(Uint64Util.toString(param1.playerInfo.baseInfo.id),param1);
            if(curBattlefieldId == 1000)
            {
               BattlefieldCrystalModel.ins.addPlayerOne(param1.side);
            }
            else if(curBattlefieldId == 1001)
            {
               BattleFlagModel.ins.addPlayerOne(param1.side);
            }
            BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightNewPlayer",param1));
            BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",LocaleMgr.ins.getStr(50500115,[PlayerModel.ins.getFullNameWithDistName(param1.playerInfo.baseInfo),LocaleMgr.ins.getStr(50500900 + param1.side)])));
         }
      }
      
      public function removeBgStagePlayer(param1:UInt64) : void
      {
         var _loc2_:BgStagePlayerInfo = this.bgStagePlayers.getValue(Uint64Util.toString(param1));
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightPlayerLeave",param1));
         if(_loc2_)
         {
            if(curBattlefieldId == 1000)
            {
               BattlefieldCrystalModel.ins.minusPlayerOne(_loc2_.side);
            }
            else if(curBattlefieldId == 1001)
            {
               BattleFlagModel.ins.minusPlayerOne(_loc2_.side);
            }
            BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",LocaleMgr.ins.getStr(50500114,[LocaleMgr.ins.getStr(50500900 + _loc2_.side),PlayerModel.ins.getFullNameWithDistName(_loc2_.playerInfo.baseInfo)])));
            this.bgStagePlayers.remove(Uint64Util.toString(param1));
         }
      }
      
      public function posChanged(param1:BgSceneMoveNotify, param2:Boolean = true) : void
      {
         var _loc3_:BgStagePlayerInfo = this.bgStagePlayers.getValue(Uint64Util.toString(param1.id));
         if(_loc3_)
         {
            _loc3_.x = param1.x;
            _loc3_.y = param1.y;
            if(param2)
            {
               BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightPlayerPosChanged",param1));
            }
         }
      }
      
      public function changeStatus(param1:BgPlayerStatusNotify) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc3_:BgStagePlayerInfo = this.bgStagePlayers.getValue(Uint64Util.toString(param1.playerId)) as BgStagePlayerInfo;
         _loc3_.status = param1.status;
         _loc3_.x = param1.x;
         _loc3_.y = param1.y;
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
               BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightPlayerDied",new BattlefieldPlayerDiedVo(param1.playerId,ServerTimer.ins.second,param1.conDeathNum)));
               this.posChanged(BattlefieldUtil.bgStatusNotifyToCrossSceneMoveNotify(param1));
            }
            _loc2_ = this.bgStagePlayers.getValue(Uint64Util.toString(param1.killerId)) as BgStagePlayerInfo;
            if(_loc2_)
            {
               _loc2_.hpPercent = param1.killerHpPercent;
               _loc2_.conDeathNum = 0;
               _loc2_.defenseStamp = param1.defenseStamp;
            }
            if(!_loc2_)
            {
               if(curBattlefieldId == 1001)
               {
                  BattleFlagModel.ins.removeFlagOwner(param1.playerId,param1.flagRebornStamp);
               }
               return;
            }
            if(curBattlefieldId == 1000)
            {
               BattlefieldCrystalModel.ins.addTeamKilled(_loc2_.side);
            }
            else if(curBattlefieldId == 1001)
            {
               BattleFlagModel.ins.addTeamKilled(_loc2_.side);
            }
            BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightHpChanged",_loc2_));
            BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightConKill",param1));
            BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",LocaleMgr.ins.getStr(50500080,[LocaleMgr.ins.getStr(50500900 + _loc2_.side),PlayerModel.ins.getFullNameWithDistName(_loc2_.playerInfo.baseInfo),LocaleMgr.ins.getStr(50500900 + _loc3_.side),PlayerModel.ins.getFullNameWithDistName(_loc3_.playerInfo.baseInfo)])));
            if(param1.firstKill)
            {
               _loc4_ = LocaleMgr.ins.getStr(50500117,[LocaleMgr.ins.getStr(50500900 + _loc2_.side),PlayerModel.ins.getFullNameWithDistName(_loc2_.playerInfo.baseInfo)]);
               BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",_loc4_));
               ObserverMgr.ins.sendNotice("MSG_TOP_CENTER_HORSE_LAMP",_loc4_);
            }
            switch(int(param1.killerConKillNum) - 5)
            {
               case 0:
                  _loc4_ = LocaleMgr.ins.getStr(50500085,[LocaleMgr.ins.getStr(50500900 + _loc2_.side),PlayerModel.ins.getFullNameWithDistName(_loc2_.playerInfo.baseInfo)]);
                  BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",_loc4_));
                  ObserverMgr.ins.sendNotice("MSG_TOP_CENTER_HORSE_LAMP",_loc4_);
                  break;
               default:
                  _loc4_ = LocaleMgr.ins.getStr(50500085,[LocaleMgr.ins.getStr(50500900 + _loc2_.side),PlayerModel.ins.getFullNameWithDistName(_loc2_.playerInfo.baseInfo)]);
                  BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",_loc4_));
                  ObserverMgr.ins.sendNotice("MSG_TOP_CENTER_HORSE_LAMP",_loc4_);
                  break;
               default:
                  _loc4_ = LocaleMgr.ins.getStr(50500085,[LocaleMgr.ins.getStr(50500900 + _loc2_.side),PlayerModel.ins.getFullNameWithDistName(_loc2_.playerInfo.baseInfo)]);
                  BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",_loc4_));
                  ObserverMgr.ins.sendNotice("MSG_TOP_CENTER_HORSE_LAMP",_loc4_);
                  break;
               case 3:
                  _loc4_ = LocaleMgr.ins.getStr(50500086,[LocaleMgr.ins.getStr(50500900 + _loc2_.side),PlayerModel.ins.getFullNameWithDistName(_loc2_.playerInfo.baseInfo)]);
                  BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",_loc4_));
                  ObserverMgr.ins.sendNotice("MSG_TOP_CENTER_HORSE_LAMP",_loc4_);
                  break;
               default:
                  _loc4_ = LocaleMgr.ins.getStr(50500086,[LocaleMgr.ins.getStr(50500900 + _loc2_.side),PlayerModel.ins.getFullNameWithDistName(_loc2_.playerInfo.baseInfo)]);
                  BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",_loc4_));
                  ObserverMgr.ins.sendNotice("MSG_TOP_CENTER_HORSE_LAMP",_loc4_);
                  break;
               default:
                  _loc4_ = LocaleMgr.ins.getStr(50500086,[LocaleMgr.ins.getStr(50500900 + _loc2_.side),PlayerModel.ins.getFullNameWithDistName(_loc2_.playerInfo.baseInfo)]);
                  BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",_loc4_));
                  ObserverMgr.ins.sendNotice("MSG_TOP_CENTER_HORSE_LAMP",_loc4_);
                  break;
               default:
                  _loc4_ = LocaleMgr.ins.getStr(50500086,[LocaleMgr.ins.getStr(50500900 + _loc2_.side),PlayerModel.ins.getFullNameWithDistName(_loc2_.playerInfo.baseInfo)]);
                  BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",_loc4_));
                  ObserverMgr.ins.sendNotice("MSG_TOP_CENTER_HORSE_LAMP",_loc4_);
                  break;
               case 7:
                  _loc4_ = LocaleMgr.ins.getStr(50500087,[LocaleMgr.ins.getStr(50500900 + _loc2_.side),PlayerModel.ins.getFullNameWithDistName(_loc2_.playerInfo.baseInfo)]);
                  BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",_loc4_));
                  ObserverMgr.ins.sendNotice("MSG_TOP_CENTER_HORSE_LAMP",_loc4_);
            }
            if(curBattlefieldId == 1001)
            {
               BattleFlagModel.ins.chanageFlagOwner(param1.playerId,param1.killerId,param1.flagTimeOutStamp,param1.flagRebornStamp);
            }
         }
         else
         {
            if(PlayerModel.ins.isCurPlayer(param1.playerId))
            {
               this.isDied = false;
            }
            BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightPlayerRevived",param1.playerId));
            this.posChanged(BattlefieldUtil.bgStatusNotifyToCrossSceneMoveNotify(param1));
            BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",LocaleMgr.ins.getStr(50500081,[LocaleMgr.ins.getStr(50500900 + _loc3_.side),PlayerModel.ins.getFullNameWithDistName(_loc3_.playerInfo.baseInfo)])));
         }
         if(PlayerModel.ins.isCurPlayer(param1.killerId))
         {
            if(curBattlefieldId == 1000)
            {
               BattlefieldCrystalModel.ins.addMykilledByOne();
            }
            else if(curBattlefieldId == 1001)
            {
               BattleFlagModel.ins.addMykilledByOne();
            }
         }
         if(param1.assistPlayerId)
         {
            var _loc7_:int = 0;
            var _loc6_:* = param1.assistPlayerId;
            for each(var _loc5_ in param1.assistPlayerId)
            {
               if(PlayerModel.ins.isCurPlayer(_loc5_))
               {
                  if(curBattlefieldId == 1000)
                  {
                     BattlefieldCrystalModel.ins.addMyAssistedByOne();
                  }
                  else if(curBattlefieldId == 1001)
                  {
                     BattleFlagModel.ins.addMyAssistedByOne();
                  }
                  return;
               }
            }
         }
      }
      
      public function getAddHonor() : int
      {
         var _loc1_:int = 0;
         switch(int(this.curBattlefieldId) - 1000)
         {
            case 0:
               _loc1_ = BattlefieldCrystalModel.ins.getMyHonor();
               break;
            case 1:
               _loc1_ = BattleFlagModel.ins.getMyHonor();
         }
         return _loc1_;
      }
      
      public function getPlayerNum(param1:int) : int
      {
         loop2:
         switch(int(this.curBattlefieldId) - 1000)
         {
            case 0:
               var _loc5_:int = 0;
               var _loc4_:* = BattlefieldCrystalModel.ins.bgCryStageInfoNotify.teamInfos;
               for each(var _loc2_ in BattlefieldCrystalModel.ins.bgCryStageInfoNotify.teamInfos)
               {
                  if(_loc2_.side == param1)
                  {
                     return _loc2_.playerNum;
                  }
               }
               break;
            case 1:
               var _loc7_:int = 0;
               var _loc6_:* = BattleFlagModel.ins.bgFlagFireStageInfoNotify.teamInfos;
               while(true)
               {
                  for each(var _loc3_ in BattleFlagModel.ins.bgFlagFireStageInfoNotify.teamInfos)
                  {
                     if(_loc3_.side == param1)
                     {
                        return _loc3_.playerNum;
                     }
                  }
                  break loop2;
               }
         }
         return 0;
      }
      
      public function getCurRank(param1:int) : int
      {
         if(param1 == 6)
         {
            return this.bgInfoRes.lastMonthLocalRank;
         }
         if(param1 == 7)
         {
            return this.bgInfoRes.lastMonthCrossRank;
         }
         return 0;
      }
      
      public function get curBattlefieldId() : int
      {
         if(ServerTimer.ins.date.date % 2)
         {
            _curBattlefieldId = 1000;
         }
         else
         {
            _curBattlefieldId = 1001;
         }
         return _curBattlefieldId;
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
         BattlefieldUtil.checkHasTodayReward();
      }
      
      public function updateTaskStatus(param1:int, param2:int) : void
      {
         var _loc3_:TaskVo = taskDic.getValue(param1);
         if(_loc3_)
         {
            _loc3_.status = param2;
         }
      }
   }
}
