package nslm2.modules.battles.battlefields.model
{
   import proto.BgFireStageInfoNotify;
   import com.mz.core.utils.DictHash;
   import proto.BgStageResInfo;
   import nslm2.modules.battles.battlefields.utils.BattlefieldUtil;
   import nslm2.mgrs.stcMgrs.vos.StcBgresGatherVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcBginfoVo;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import com.mz.core.event.MzEvent;
   import com.greensock.TweenLite;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.BgStageMyInfo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import proto.BgFireTeamInfo;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.Uint64Util;
   import com.mz.core.utils.ArrayUtil;
   import proto.BgStagePlayerInfo;
   import nslm2.modules.battles.battlefields.vos.BattleFlagInfoData;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class BattleFlagModel
   {
      
      private static var _ins:nslm2.modules.battles.battlefields.model.BattleFlagModel;
       
      
      private var _bgFlagFireStageInfoNotify:BgFireStageInfoNotify;
      
      private var _flagOwnerIdArr:Array;
      
      public var flagOwnerDic:DictHash;
      
      public var playerFlagDic:DictHash;
      
      public var flagResetCDDic:DictHash;
      
      public var flagDataDic:DictHash;
      
      public var crtKillMonster:int;
      
      public var killMonsterNum:Array;
      
      private var _leftMonsterCnt:int;
      
      public function BattleFlagModel()
      {
         _flagOwnerIdArr = [];
         flagOwnerDic = new DictHash();
         playerFlagDic = new DictHash();
         flagResetCDDic = new DictHash();
         flagDataDic = new DictHash();
         killMonsterNum = [];
         super();
      }
      
      public static function get ins() : nslm2.modules.battles.battlefields.model.BattleFlagModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.battles.battlefields.model.BattleFlagModel();
         }
         return _ins;
      }
      
      public function getStageResInfo(param1:int) : BgStageResInfo
      {
         var _loc4_:int = 0;
         var _loc3_:* = this.bgFlagFireStageInfoNotify.resInfos;
         for each(var _loc2_ in this.bgFlagFireStageInfoNotify.resInfos)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function changeStageResInfo(param1:int, param2:int) : void
      {
         var _loc3_:BgStageResInfo = this.getStageResInfo(param1);
         if(_loc3_)
         {
            _loc3_.status = param2;
         }
      }
      
      public function addGatherHornor(param1:int) : void
      {
         var _loc2_:StcBgresGatherVo = BattlefieldUtil.getBgreBatherVo(param1);
         var _loc3_:StcBginfoVo = StcMgr.ins.getBginfoVo(1001);
         if(this.bgFlagFireStageInfoNotify.myInfo.gatherNum == 0)
         {
            bgFlagFireStageInfoNotify.myInfo.gatherHonor = bgFlagFireStageInfoNotify.myInfo.gatherHonor + _loc3_.bg_first_gather_honor;
         }
         else
         {
            bgFlagFireStageInfoNotify.myInfo.gatherHonor = bgFlagFireStageInfoNotify.myInfo.gatherHonor + _loc2_.honor;
         }
         this.bgFlagFireStageInfoNotify.myInfo.gatherNum = this.bgFlagFireStageInfoNotify.myInfo.gatherNum + 1;
         this.bgFlagFireStageInfoNotify.myInfo.honor = getMyHonor();
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightInfoChanged"));
      }
      
      public function addKillMonsterHornor() : void
      {
         var _loc2_:StcBgresGatherVo = StcMgr.ins.getVoByMultiColumnValue("static_bgres_gather",["stage_id","display_npc"],[34001,810110]);
         var _loc1_:StcBginfoVo = StcMgr.ins.getBginfoVo(1001);
         bgFlagFireStageInfoNotify.myInfo.killNpcNum++;
         if(bgFlagFireStageInfoNotify.myInfo.killNpcNum == 1 && _loc1_)
         {
            bgFlagFireStageInfoNotify.myInfo.gatherHonor = bgFlagFireStageInfoNotify.myInfo.gatherHonor + _loc1_.bg_first_gather_honor;
            TweenLite.delayedCall(1,AlertUtil.float,[TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(50500185,[_loc1_.bg_first_gather_honor]),458496)]);
         }
         else
         {
            bgFlagFireStageInfoNotify.myInfo.gatherHonor = bgFlagFireStageInfoNotify.myInfo.gatherHonor + _loc2_.honor;
            TweenLite.delayedCall(1,AlertUtil.float,[TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(50500178,[_loc2_.honor]),458496)]);
         }
         this.bgFlagFireStageInfoNotify.myInfo.honor = getMyHonor();
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightInfoChanged"));
      }
      
      public function addGatherHornorFromTeam(param1:int) : void
      {
         var _loc2_:StcBgresGatherVo = BattlefieldUtil.getBgreBatherVo(param1);
         bgFlagFireStageInfoNotify.myInfo.gatherHonor = bgFlagFireStageInfoNotify.myInfo.gatherHonor + _loc2_.team_honor;
         bgFlagFireStageInfoNotify.myInfo.honor = getMyHonor();
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightInfoChanged"));
      }
      
      public function addMykilledByOne() : void
      {
         this.bgFlagFireStageInfoNotify.myInfo.killNum++;
         this.bgFlagFireStageInfoNotify.myInfo.honor = getMyHonor();
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightInfoChanged"));
      }
      
      public function addMyAssistedByOne() : void
      {
         this.bgFlagFireStageInfoNotify.myInfo.assistNum++;
         this.bgFlagFireStageInfoNotify.myInfo.honor = getMyHonor();
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightInfoChanged"));
      }
      
      public function getMyHonor() : int
      {
         var _loc2_:BgStageMyInfo = this.bgFlagFireStageInfoNotify.myInfo;
         var _loc1_:StcBginfoVo = StcMgr.ins.getBginfoVo(1001);
         var _loc5_:int = _loc2_.assistNum * _loc1_.bg_assist_honor;
         var _loc3_:int = _loc2_.killNum > 0?Math.max(0,(_loc2_.killNum - 1) * _loc1_.bg_kill_honor + _loc1_.bg_first_kill_honor):0;
         var _loc4_:int = _loc2_.gatherHonor;
         return Math.min(int(DefindConsts.BG_HONOR_LIMIT),_loc5_ + _loc3_ + _loc4_);
      }
      
      public function addTeamKilled(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = this.bgFlagFireStageInfoNotify.teamInfos;
         for each(var _loc2_ in this.bgFlagFireStageInfoNotify.teamInfos)
         {
            if(_loc2_.side == param1)
            {
               _loc2_.killNum = Number(_loc2_.killNum) + 1;
               BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightInfoChanged"));
               return;
            }
         }
      }
      
      public function addPlayerOne(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = this.bgFlagFireStageInfoNotify.teamInfos;
         for each(var _loc2_ in this.bgFlagFireStageInfoNotify.teamInfos)
         {
            if(_loc2_.side == param1)
            {
               _loc2_.playerNum = Number(_loc2_.playerNum) + 1;
               BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightInfoChanged"));
               return;
            }
         }
      }
      
      public function minusPlayerOne(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = this.bgFlagFireStageInfoNotify.teamInfos;
         for each(var _loc2_ in this.bgFlagFireStageInfoNotify.teamInfos)
         {
            if(_loc2_.side == param1)
            {
               _loc2_.playerNum = Number(_loc2_.playerNum) - 1;
               BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightInfoChanged"));
               return;
            }
         }
      }
      
      public function gatherAllChanged(param1:int, param2:*) : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = this.bgFlagFireStageInfoNotify.teamInfos;
         for each(var _loc3_ in this.bgFlagFireStageInfoNotify.teamInfos)
         {
            if(_loc3_.side == param1)
            {
               _loc3_.resNum = param2;
               BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightInfoChanged"));
               return;
            }
         }
      }
      
      public function addFlagOwnerId(param1:UInt64, param2:int, param3:uint) : void
      {
         var _loc4_:String = Uint64Util.toString(param1);
         if(flagOwnerIdArr.indexOf(_loc4_) < 0)
         {
            flagOwnerIdArr.push(_loc4_);
         }
         flagResetCDDic.put(param2,param3);
         flagOwnerDic.put(param2,param1);
         playerFlagDic.put(_loc4_,param2);
      }
      
      public function removeFlagOwnerId(param1:UInt64, param2:int) : void
      {
         var _loc3_:String = Uint64Util.toString(param1);
         if(flagOwnerIdArr.indexOf(_loc3_) >= 0)
         {
            ArrayUtil.removeItemFromArray(flagOwnerIdArr,_loc3_);
         }
         flagOwnerDic.remove(param2);
         playerFlagDic.remove(_loc3_);
      }
      
      public function get flagOwnerIdArr() : Array
      {
         return _flagOwnerIdArr;
      }
      
      public function chanageFlagOwner(param1:UInt64, param2:UInt64, param3:uint, param4:uint) : void
      {
         var _loc8_:* = null;
         var _loc7_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = playerFlagDic.getValue(Uint64Util.toString(param1));
         var _loc9_:int = playerFlagDic.getValue(Uint64Util.toString(param2));
         if(_loc6_ > 0)
         {
            _loc8_ = BattlefieldModel.ins.getBgStagePlayerInfo(param1);
            _loc7_ = BattlefieldModel.ins.getBgStagePlayerInfo(param2);
            removeFlagOwnerId(param1,_loc6_);
            _loc5_ = flagDataDic.getValue(_loc6_);
            _loc5_.ownerId = null;
            _loc5_.outTimeStamp = 0;
            if(!_loc9_)
            {
               addFlagOwnerId(param2,_loc6_,param3);
               _loc5_.ownerId = param2;
               _loc5_.outTimeStamp = param3;
            }
            else
            {
               _loc5_.refreshStamp = param4;
            }
            BattlefieldMsgs.ins.dispatchEvent(new MzEvent("MSG_FLAG_OWNER_UPDATE"));
            BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",LocaleMgr.ins.getStr(50500146,[LocaleMgr.ins.getStr(50500900 + _loc7_.side),PlayerModel.ins.getFullNameWithDistName(_loc7_.playerInfo.baseInfo),LocaleMgr.ins.getStr(50500900 + _loc8_.side),PlayerModel.ins.getFullNameWithDistName(_loc8_.playerInfo.baseInfo)])));
            ObserverMgr.ins.sendNotice("MSG_FLAG_STAUTS_UPDATE",_loc5_);
         }
      }
      
      public function removeFlagOwner(param1:UInt64, param2:uint) : void
      {
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = playerFlagDic.getValue(Uint64Util.toString(param1));
         if(_loc4_ > 0)
         {
            _loc5_ = BattlefieldModel.ins.getBgStagePlayerInfo(param1);
            removeFlagOwnerId(param1,_loc4_);
            _loc3_ = flagDataDic.getValue(_loc4_);
            _loc3_.ownerId = null;
            _loc3_.outTimeStamp = 0;
            _loc3_.refreshStamp = param2;
            BattlefieldMsgs.ins.dispatchEvent(new MzEvent("MSG_FLAG_OWNER_UPDATE"));
            ObserverMgr.ins.sendNotice("MSG_FLAG_STAUTS_UPDATE",_loc3_);
         }
      }
      
      public function get bgFlagFireStageInfoNotify() : BgFireStageInfoNotify
      {
         return _bgFlagFireStageInfoNotify;
      }
      
      public function set bgFlagFireStageInfoNotify(param1:BgFireStageInfoNotify) : void
      {
         var _loc2_:* = null;
         if(_bgFlagFireStageInfoNotify != param1)
         {
            _bgFlagFireStageInfoNotify = param1;
            var _loc6_:int = 0;
            var _loc5_:* = _bgFlagFireStageInfoNotify.resInfos;
            for each(var _loc4_ in _bgFlagFireStageInfoNotify.resInfos)
            {
               _loc2_ = new BattleFlagInfoData();
               _loc2_.id = _loc4_.id;
               if(!Uint64Util.isZero(_loc4_.owner))
               {
                  addFlagOwnerId(_loc4_.owner,_loc4_.id,_loc4_.flagTimeOutStamp);
                  _loc2_.ownerId = _loc4_.owner;
                  _loc2_.outTimeStamp = _loc4_.flagTimeOutStamp;
               }
               _loc2_.refreshStamp = _loc4_.rebornStamp;
               _loc2_.leftCnt = _loc4_.residualTotalNum;
               flagDataDic.put(_loc2_.id,_loc2_);
            }
            var _loc8_:int = 0;
            var _loc7_:* = _bgFlagFireStageInfoNotify.teamInfos;
            for each(var _loc3_ in _bgFlagFireStageInfoNotify.teamInfos)
            {
               killMonsterNum[_loc3_.side] = _loc3_.killNpcNum;
            }
            leftMonsterCnt = param1.leftNpcNum;
         }
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("MSG_FLAG_OWNER_UPDATE"));
         _bgFlagFireStageInfoNotify = param1;
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightInfoChanged"));
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("MSG_MONSTER_BUFF_CHANGE"));
      }
      
      public function get isShowCenterFlag() : Boolean
      {
         return leftFlagInfo.leftCnt == 0 && rightFlagInfo.leftCnt == 0;
      }
      
      public function get leftFlagInfo() : BattleFlagInfoData
      {
         return flagDataDic.getValue(2500);
      }
      
      public function get rightFlagInfo() : BattleFlagInfoData
      {
         return flagDataDic.getValue(2502);
      }
      
      public function get centerFlagInfo() : BattleFlagInfoData
      {
         return flagDataDic.getValue(2501);
      }
      
      public function setKillMonsterNum(param1:int, param2:int) : void
      {
         killMonsterNum[param1] = param2;
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("MSG_MONSTER_BUFF_CHANGE"));
      }
      
      public function getKillMonsterNum(param1:int) : int
      {
         return killMonsterNum[param1];
      }
      
      public function dispose() : void
      {
         _flagOwnerIdArr = [];
         flagDataDic.clear();
         flagOwnerDic.clear();
         playerFlagDic.clear();
         flagResetCDDic.clear();
         _bgFlagFireStageInfoNotify = null;
      }
      
      public function get leftMonsterCnt() : int
      {
         return _leftMonsterCnt;
      }
      
      public function set leftMonsterCnt(param1:int) : void
      {
         if(_leftMonsterCnt != param1)
         {
            _leftMonsterCnt = param1;
            ObserverMgr.ins.sendNotice("MSG_MONSTER_COUNT_CHANGE");
         }
      }
   }
}
