package nslm2.modules.foundations.guildModule.model
{
   import proto.FamilyInfo;
   import com.mz.core.utils.DictHash;
   import proto.FamilyHeroDonationPanelRes;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcGonghuiZhiweiVo;
   import nslm2.modules.foundations.guildModule.vo.GuildPositionVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.vos.StcAuthorityVo;
   import nslm2.modules.foundations.guildModule.vo.AuthorityVo;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.Uint64Util;
   import proto.FamilyMemberInfoRes;
   import proto.FamilyMember;
   import nslm2.modules.foundations.guildModule.util.GuildUtil;
   import nslm2.mgrs.stcMgrs.vos.StcGonghuiVo;
   import proto.FamilyPostList;
   import nslm2.modules.foundations.guildModule.vo.GuildDonateScoreRewardVo;
   import nslm2.utils.WealthUtil;
   import proto.FamilyDonateRes;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.guildModule.vo.GuildManageVo;
   import nslm2.modules.foundations.guildModule.consts.GuildConsts;
   import nslm2.modules.foundations.friendModules.FriendService;
   import proto.GameFriendData;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.foundations.guildModule.vo.GuildInviteFriendVo;
   
   public class GuildModel
   {
      
      private static var _ins:nslm2.modules.foundations.guildModule.model.GuildModel;
       
      
      private var _pos:int;
      
      private var _highPos:int;
      
      private var _con:int;
      
      private var _hasDonated:Boolean;
      
      private var _hasSingned:Boolean;
      
      private var _exitTimeStamp:uint;
      
      private var _inviteGuildList:Array;
      
      private var _guildList:Array;
      
      private var _guildInfo:FamilyInfo;
      
      private var _memberList:Array;
      
      private var _officerist:Array;
      
      private var vpList:Array;
      
      private var zlList:Array;
      
      public var applicantList:Array;
      
      public var applyedGuildList:Array;
      
      private var _flagBgArr:Array;
      
      private var _flagPatternArr:Array;
      
      public var donateHornorArr:Array;
      
      public var donateExpArr:Array;
      
      public var donateMoneyArr:Array;
      
      public var donateGuildCoinArr:Array;
      
      public var donateScoreArr:Array;
      
      public var donateGuildFundArr:Array;
      
      public var getDonateRewardNeedScoreArr:Array;
      
      public var donateCostyArr:Array;
      
      public var AllPosDic:DictHash;
      
      public var gettedRwdID:Array;
      
      public var donateRecord:Array;
      
      public var donateScore:int;
      
      private var manageListData:Array;
      
      public var needUpdateGuildRankList:Boolean;
      
      public var guildFriendCntArr:Array;
      
      public var panelRes:FamilyHeroDonationPanelRes;
      
      private var posNameArr:Array;
      
      private var allSuperAutuArr:Array;
      
      private var allNormalAuthArr:Array;
      
      private var _memberNameList:Array;
      
      public var _memberListExceptLeader:Array;
      
      public function GuildModel()
      {
         applicantList = [];
         applyedGuildList = [];
         donateHornorArr = String(DefindConsts.GUILD_DONATE_HONOR).split("|");
         donateExpArr = String(DefindConsts.GUILD_DONATE_GUILDEXP).split("|");
         donateMoneyArr = String(DefindConsts.GUILD_DONATE_GUILDMONEY).split("|");
         donateGuildCoinArr = String(DefindConsts.GUILD_DONATE_YONGZHEYINGJI).split("|");
         donateScoreArr = String(DefindConsts.GUILD_DONATE_SCORE).split("|");
         donateGuildFundArr = String(DefindConsts.GUILD_DONATE_GUILDMONEY).split("|");
         getDonateRewardNeedScoreArr = String(DefindConsts.GUILD_SCORE).split("|");
         donateCostyArr = String(DefindConsts.GUILD_DONATE_COST).split("|");
         gettedRwdID = [];
         donateRecord = [];
         super();
         initPosAuthority();
      }
      
      public static function get ins() : nslm2.modules.foundations.guildModule.model.GuildModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.guildModule.model.GuildModel();
         }
         return _ins;
      }
      
      public function initPosAuthority() : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc2_:* = null;
         AllPosDic = new DictHash();
         var _loc1_:Array = StcMgr.ins.getTabel("static_gonghui_zhiwei").array;
         var _loc3_:int = _loc1_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc2_ = _loc1_[_loc5_];
            _loc4_ = new GuildPositionVo();
            _loc4_.id = _loc2_.id;
            _loc4_.name = _loc2_.name;
            _loc4_.superAuth = _loc2_.superAuth.split(",");
            _loc4_.normalAuth = _loc2_.normalAuth.split(",");
            AllPosDic.put(_loc4_.id,_loc4_);
            _loc5_++;
         }
      }
      
      public function getAllPosNamesArr() : String
      {
         var _loc1_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         if(!posNameArr)
         {
            posNameArr = [];
            _loc1_ = AllPosDic.array;
            _loc3_ = _loc1_.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc2_ = _loc1_[_loc4_];
               posNameArr.push(LocaleMgr.ins.getStr(_loc2_.name));
               _loc4_++;
            }
            posNameArr.reverse();
            posNameArr.shift();
         }
         return posNameArr.join(",");
      }
      
      public function get crtPosIndex() : int
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = pos;
         if(highPos)
         {
            _loc3_ = highPos;
         }
         var _loc1_:Array = AllPosDic.array.concat();
         _loc1_.reverse();
         _loc1_.shift();
         var _loc4_:int = _loc1_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = _loc1_[_loc5_];
            if(_loc2_.id == _loc3_)
            {
               return _loc5_;
            }
            _loc5_++;
         }
         return 0;
      }
      
      public function getAllSuperAuth() : Array
      {
         var _loc1_:* = null;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc6_:int = 0;
         var _loc5_:* = null;
         if(!allSuperAutuArr)
         {
            allSuperAutuArr = [];
            _loc1_ = StcMgr.ins.getVoArrByColumnValue("static_authority","kind",100);
            _loc4_ = _loc1_.length;
            _loc2_ = [];
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               _loc5_ = _loc1_[_loc6_];
               _loc3_ = new AuthorityVo();
               _loc3_.id = _loc5_.id;
               _loc3_.name = LocaleMgr.ins.getStr(_loc5_.desc);
               allSuperAutuArr.push(_loc3_);
               _loc6_++;
            }
         }
         return allSuperAutuArr;
      }
      
      public function getAllNormalAuth() : Array
      {
         var _loc1_:* = null;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc6_:int = 0;
         var _loc5_:* = null;
         if(!allNormalAuthArr)
         {
            allNormalAuthArr = [];
            _loc1_ = StcMgr.ins.getVoArrByColumnValue("static_authority","kind",200);
            _loc4_ = _loc1_.length;
            _loc2_ = [];
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               _loc5_ = _loc1_[_loc6_];
               _loc3_ = new AuthorityVo();
               _loc3_.id = _loc5_.id;
               _loc3_.name = LocaleMgr.ins.getStr(_loc5_.desc);
               allNormalAuthArr.push(_loc3_);
               _loc6_++;
            }
         }
         return allNormalAuthArr;
      }
      
      public function resetNormalAuth(param1:int) : Array
      {
         var _loc4_:Array = StcMgr.ins.getGonghuiZhiweiVo(param1).normalAuth.split(",");
         var _loc2_:Array = getAllNormalAuth();
         var _loc6_:int = 0;
         var _loc5_:* = _loc2_;
         for each(var _loc3_ in _loc2_)
         {
            _loc3_.selected = false;
            if(_loc4_.indexOf(_loc3_.id + "") >= 0)
            {
               _loc3_.selected = true;
            }
         }
         return _loc2_;
      }
      
      public function getNormalAuthByPos(param1:int) : Array
      {
         var _loc3_:GuildPositionVo = AllPosDic.getValue(param1);
         var _loc2_:Array = getAllNormalAuth();
         var _loc6_:int = 0;
         var _loc5_:* = _loc2_;
         for each(var _loc4_ in _loc2_)
         {
            _loc4_.selected = false;
            if(_loc3_.normalAuth.indexOf(int(_loc4_.id)) >= 0)
            {
               _loc4_.selected = true;
            }
         }
         return _loc2_;
      }
      
      public function getSuperAuthByPos(param1:int) : Array
      {
         var _loc3_:GuildPositionVo = AllPosDic.getValue(param1);
         var _loc2_:Array = getAllSuperAuth();
         var _loc6_:int = 0;
         var _loc5_:* = _loc2_;
         for each(var _loc4_ in _loc2_)
         {
            _loc4_.selected = false;
            if(_loc3_.superAuth.indexOf(_loc4_.id + "") >= 0)
            {
               _loc4_.selected = true;
            }
         }
         return _loc2_;
      }
      
      public function updateNormalAuthority(param1:int, param2:Array) : void
      {
         var _loc3_:GuildPositionVo = AllPosDic.getValue(param1);
         _loc3_.normalAuth = param2;
      }
      
      public function checkHasAuthority(param1:int) : Boolean
      {
         var _loc2_:int = 0;
         if(highPos)
         {
            _loc2_ = highPos;
         }
         else
         {
            _loc2_ = pos;
         }
         var _loc3_:GuildPositionVo = AllPosDic.getValue(_loc2_);
         if(_loc3_ && _loc3_.superAuth && _loc3_.superAuth.indexOf(param1 + "") >= 0)
         {
            return true;
         }
         if(_loc3_ && _loc3_.normalAuth && _loc3_.normalAuth.indexOf(param1) >= 0)
         {
            return true;
         }
         return false;
      }
      
      public function checkIsApplyed(param1:UInt64) : Boolean
      {
         var _loc4_:int = 0;
         var _loc3_:* = applyedGuildList;
         for each(var _loc2_ in applyedGuildList)
         {
            if(Uint64Util.equal(_loc2_,param1))
            {
               return true;
            }
         }
         return false;
      }
      
      public function updateRoleGuildInfo(param1:FamilyMemberInfoRes) : void
      {
         _con = param1.con;
         _exitTimeStamp = param1.cd;
         _highPos = param1.highPost;
         _pos = param1.post;
         _exitTimeStamp = param1.cd;
         _hasDonated = param1.donate;
         _hasSingned = param1.qianDao;
         gettedRwdID = param1.donateReward;
      }
      
      public function removeItemFromApplicantList(param1:UInt64) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = applicantList.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = applicantList[_loc4_] as FamilyMember;
            if(_loc2_ && Uint64Util.equal(param1,_loc2_.id))
            {
               applicantList.splice(_loc4_,1);
               _loc4_--;
               _loc3_--;
            }
            _loc4_++;
         }
      }
      
      public function get invitedGuildList() : Array
      {
         if(!_inviteGuildList)
         {
            filterInviteGuildList();
         }
         return _inviteGuildList;
      }
      
      private function filterInviteGuildList() : void
      {
         if(!_guildList || !_guildList.length)
         {
            return;
         }
         _inviteGuildList = _guildList.filter(filterInvite,null);
         _inviteGuildList.sortOn("rank",16);
      }
      
      private function filterInvite(param1:*, param2:int, param3:Array) : Boolean
      {
         return param1.invite;
      }
      
      public function get guildInfo() : FamilyInfo
      {
         return _guildInfo;
      }
      
      public function set guildInfo(param1:FamilyInfo) : void
      {
         _guildInfo = param1;
      }
      
      public function set guildList(param1:Array) : void
      {
         _guildList = param1;
         if(!_guildList)
         {
            return;
         }
         _guildList.sortOn("rank",16);
      }
      
      public function get guildList() : Array
      {
         return _guildList;
      }
      
      public function get memberList() : Array
      {
         return _memberList;
      }
      
      public function set memberList(param1:Array) : void
      {
         _memberList = param1;
         _memberList.sort(GuildUtil.sortMemberList);
         updateLowerPosMemberList();
      }
      
      public function get con() : int
      {
         return _con;
      }
      
      public function set con(param1:int) : void
      {
         _con = param1;
      }
      
      public function get highPos() : int
      {
         return _highPos;
      }
      
      public function get pos() : int
      {
         return _pos;
      }
      
      public function get exitTimeStamp() : uint
      {
         return _exitTimeStamp;
      }
      
      public function isPresident() : Boolean
      {
         return this.highPos == 14;
      }
      
      public function isVP() : Boolean
      {
         return this.highPos == 13;
      }
      
      public function getFastApplyGuildID() : UInt64
      {
         var _loc1_:* = null;
         var _loc4_:int = 0;
         if(invitedGuildList && invitedGuildList.length > 0)
         {
            return (invitedGuildList[0] as FamilyInfo).id;
         }
         if(!_guildList || _guildList.length == 0)
         {
            return null;
         }
         var _loc2_:Array = _guildList.concat();
         _loc2_.sortOn("lv",16 | 2);
         var _loc3_:int = _loc2_.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc1_ = _loc2_[_loc4_];
            if(_loc1_.count < _loc1_.max)
            {
               return _loc1_.id;
            }
            _loc4_++;
         }
         return null;
      }
      
      public function updateOfficerList() : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         _officerist = [];
         initOfficerList();
         var _loc1_:StcGonghuiVo = StcMgr.ins.getGonghuiVo(_guildInfo.lv);
         var _loc2_:int = _loc1_.vice_num;
         var _loc5_:int = _loc1_.zl_num;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = new FamilyPostList();
            _loc3_.post = 13;
            if(_loc4_ < vpList.length)
            {
               _loc3_.id = vpList[_loc4_];
            }
            _officerist.push(_loc3_);
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc3_ = new FamilyPostList();
            _loc3_.post = 12;
            if(_loc4_ < zlList.length)
            {
               _loc3_.id = zlList[_loc4_];
            }
            _officerist.push(_loc3_);
            _loc4_++;
         }
      }
      
      private function initOfficerList() : void
      {
         vpList = [];
         zlList = [];
         var _loc3_:int = 0;
         var _loc2_:* = _memberList;
         for each(var _loc1_ in _memberList)
         {
            if(_loc1_.highPost == 13)
            {
               vpList.push(_loc1_.id);
            }
            if(_loc1_.highPost == 12)
            {
               zlList.push(_loc1_.id);
            }
         }
      }
      
      public function get officerist() : Array
      {
         return _officerist;
      }
      
      public function clearMultipleOfficer(param1:UInt64) : Boolean
      {
         var _loc4_:int = 0;
         var _loc3_:* = _officerist;
         for each(var _loc2_ in _officerist)
         {
            if(Uint64Util.equal(param1,_loc2_.id))
            {
               _loc2_.id = null;
               return true;
            }
         }
         return false;
      }
      
      public function get memberNameList() : Array
      {
         return _memberNameList;
      }
      
      private function updateLowerPosMemberList() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:* = null;
         var _loc4_:int = 0;
         _memberListExceptLeader = [new FamilyMember()];
         _memberNameList = [LocaleMgr.ins.getStr(11000865)];
         var _loc3_:int = _memberList.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = _memberList[_loc4_];
            if(_loc2_.highPost < highPos)
            {
               _memberListExceptLeader.push(_loc2_);
               _memberNameList.push(_loc2_.name);
            }
            _loc4_++;
         }
      }
      
      public function getMemberIndex(param1:UInt64) : int
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc3_:int = _memberListExceptLeader.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = _memberListExceptLeader[_loc4_];
            if(Uint64Util.equal(_loc2_.id,param1))
            {
               return _loc4_;
            }
            _loc4_++;
         }
         return -1;
      }
      
      public function getMemberNameByID(param1:UInt64) : String
      {
         var _loc4_:int = 0;
         var _loc3_:* = _memberList;
         for each(var _loc2_ in _memberList)
         {
            if(Uint64Util.equal(_loc2_.id,param1))
            {
               return _loc2_.name;
            }
         }
         return "";
      }
      
      public function getMemberIDByIndex(param1:int) : UInt64
      {
         return (_memberListExceptLeader[param1] as FamilyMember).id;
      }
      
      public function get flagBgArr() : Array
      {
         if(!_flagBgArr)
         {
            _flagBgArr = StcMgr.ins.getVoArrByColumnValue("static_gonghui_flag","kind",1);
         }
         return _flagBgArr;
      }
      
      public function get flagPatternArr() : Array
      {
         if(!_flagPatternArr)
         {
            _flagPatternArr = StcMgr.ins.getVoArrByColumnValue("static_gonghui_flag","kind",2);
         }
         return _flagPatternArr;
      }
      
      public function get hasDonated() : Boolean
      {
         return _hasDonated;
      }
      
      public function get hasSingned() : Boolean
      {
         return _hasSingned;
      }
      
      public function set exitTimeStamp(param1:uint) : void
      {
         _exitTimeStamp = param1;
      }
      
      public function set pos(param1:int) : void
      {
         _pos = param1;
      }
      
      public function get crtScoreRewardArr() : Array
      {
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc1_:* = null;
         var _loc7_:StcGonghuiVo = StcMgr.ins.getGonghuiVo(guildInfo.lv);
         var _loc2_:Array = _loc7_.donate_reward.split("|");
         var _loc5_:int = _loc2_.length;
         var _loc3_:Array = [];
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc1_ = _loc2_[_loc6_];
            _loc4_ = new GuildDonateScoreRewardVo();
            _loc4_.id = _loc6_ + 1;
            _loc4_.dropID = int(_loc1_);
            _loc4_.rewardArr = WealthUtil.dropGroupIDToWealthVoArr(_loc4_.dropID);
            _loc4_.needScore = getDonateRewardNeedScoreArr[_loc6_];
            if(donateScore >= _loc4_.needScore)
            {
               _loc4_.status = 0;
            }
            if(gettedRwdID.indexOf(_loc4_.id) >= 0)
            {
               _loc4_.status = 1;
            }
            _loc3_.push(_loc4_);
            _loc6_++;
         }
         return _loc3_;
      }
      
      public function get hasDonateReward() : Boolean
      {
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc1_:* = null;
         var _loc6_:StcGonghuiVo = StcMgr.ins.getGonghuiVo(guildInfo.lv);
         var _loc2_:Array = _loc6_.donate_reward.split("|");
         var _loc4_:int = _loc2_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc1_ = _loc2_[_loc5_];
            _loc3_ = new GuildDonateScoreRewardVo();
            _loc3_.id = _loc5_ + 1;
            _loc3_.dropID = int(_loc1_);
            _loc3_.rewardArr = WealthUtil.dropGroupIDToWealthVoArr(_loc3_.dropID);
            _loc3_.needScore = getDonateRewardNeedScoreArr[_loc5_];
            if(donateScore >= _loc3_.needScore)
            {
               _loc3_.status = 0;
            }
            if(gettedRwdID.indexOf(_loc3_.id) >= 0)
            {
               _loc3_.status = 1;
            }
            if(_loc3_.status == 0)
            {
               return true;
            }
            _loc5_++;
         }
         return false;
      }
      
      public function updateDonateInfo(param1:FamilyDonateRes, param2:int) : void
      {
         var _loc4_:String = donateHornorArr[param2 - 1] as String;
         var _loc3_:int = _loc4_;
         _con = _con + _loc3_;
         updateMyCon(_con);
         addMyConToday(_loc3_);
         guildInfo.exp = param1.exp;
         guildInfo.fund = param1.fund;
         guildInfo.lv = param1.level;
         donateScore = param1.score;
      }
      
      public function updateDonateBaseInfo(param1:FamilyDonateRes) : void
      {
         if(!guildInfo)
         {
            return;
         }
         guildInfo.exp = param1.exp;
         guildInfo.fund = param1.fund;
         guildInfo.lv = param1.level;
         donateScore = param1.score;
         ObserverMgr.ins.sendNotice("guild_notice_update_donate_data");
      }
      
      public function updateGottedRewardArr(param1:int) : void
      {
         gettedRwdID.push(param1);
      }
      
      public function set hasDonated(param1:Boolean) : void
      {
         _hasDonated = param1;
      }
      
      public function updateMyPos(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = memberList;
         for each(var _loc2_ in memberList)
         {
            if(Uint64Util.equal(_loc2_.id,PlayerModel.ins.playerInfo.id))
            {
               _loc2_.post = param1;
            }
         }
      }
      
      public function updateMyCon(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = memberList;
         for each(var _loc2_ in memberList)
         {
            if(Uint64Util.equal(_loc2_.id,PlayerModel.ins.playerInfo.id))
            {
               _loc2_.con = param1;
            }
         }
      }
      
      public function addMyConToday(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = memberList;
         for each(var _loc2_ in memberList)
         {
            if(Uint64Util.equal(_loc2_.id,PlayerModel.ins.playerInfo.id))
            {
               _loc2_.activity = _loc2_.activity + param1;
            }
         }
      }
      
      public function removeMember(param1:UInt64) : void
      {
         Uint64Util.removeItemByAttr(memberList,"id",param1);
      }
      
      public function getCrtManageFunctionList() : Array
      {
         var _loc1_:Boolean = false;
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc3_:Array = [];
         if(!manageListData)
         {
            initManageListData();
         }
         var _loc2_:int = manageListData.length;
         _loc5_ = 0;
         while(_loc5_ < _loc2_)
         {
            _loc4_ = manageListData[_loc5_];
            if(checkHasAuthority(_loc4_.authId))
            {
               _loc1_ = true;
               _loc4_.status = 1;
               if(_loc4_.id == 3 && applicantList.length > 0)
               {
                  _loc4_.status = 2;
               }
               if(highPos && _loc4_.id == 6)
               {
                  _loc1_ = false;
               }
               if(_loc1_)
               {
                  _loc3_.push(_loc4_);
               }
            }
            else
            {
               if(isPresident() && _loc4_.id == 8)
               {
                  _loc4_.status = 1;
                  _loc3_.push(_loc4_);
               }
               if(!highPos && _loc4_.id == 6)
               {
                  _loc4_.status = 1;
                  _loc3_.push(_loc4_);
               }
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function getShowRedPointArr() : Array
      {
         var _loc1_:Array = [];
         if(checkHasAuthority(203) && applicantList.length > 0 && guildInfo.count < guildInfo.max)
         {
            _loc1_.push(3);
         }
         if(hasDonateReward)
         {
            _loc1_.push(4);
         }
         return _loc1_;
      }
      
      private function initManageListData() : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         manageListData = [];
         var _loc1_:int = 9;
         _loc3_ = 1;
         while(_loc3_ <= _loc1_)
         {
            _loc2_ = new GuildManageVo();
            _loc2_.id = _loc3_;
            _loc2_.authId = GuildConsts.FUN_AUTH_RELATION[_loc3_];
            manageListData.push(_loc2_);
            _loc3_++;
         }
      }
      
      public function getCanInviteFriendsArr() : Array
      {
         var _loc6_:* = null;
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc1_:Array = FriendService.ins.friendArr;
         var _loc4_:int = _loc1_.length;
         var _loc3_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = _loc1_[_loc5_];
            if(_loc2_.level >= DefindConsts.GUILD_CREATE_LV)
            {
               _loc6_ = new GuildInviteFriendVo();
               _loc6_.friendData = _loc2_;
               if(!Uint64Util.findItemByAttr(_memberList,"id",_loc2_.id))
               {
                  _loc3_.push(_loc6_);
               }
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function set hasSingned(param1:Boolean) : void
      {
         _hasSingned = param1;
      }
      
      public function dispose() : void
      {
         guildList = null;
         _memberList = null;
         _officerist = null;
         vpList = null;
         zlList = null;
         applicantList = [];
         needUpdateGuildRankList = true;
      }
      
      public function set highPos(param1:int) : void
      {
         _highPos = param1;
      }
   }
}
