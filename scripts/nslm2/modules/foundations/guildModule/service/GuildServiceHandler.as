package nslm2.modules.foundations.guildModule.service
{
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import nslm2.nets.sockets.ServerEngine;
   import proto.FamilyListRes;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.FamilyHeroDonationPanelRes;
   import proto.FamilyInfoRes;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.funnies.guilds.guildTechs.GuildTechService;
   import proto.FamilyCreateReq;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.chatModules.ChatModel;
   import com.netease.protobuf.UInt64;
   import proto.FamilyApplyReq;
   import proto.FamilyApplyRes;
   import proto.FamilyApplyOpReq;
   import proto.FamilyInviteFriendReq;
   import proto.FamilyAppointReq;
   import proto.FamilyPostList;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.FamilyChangeLeaderReq;
   import proto.FamilyApplyListRes;
   import proto.FamilyKickReq;
   import proto.FamilyQuitRes;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import proto.FamilyMemberRes;
   import proto.FamilyDonateReq;
   import proto.FamilyDonateRes;
   import proto.FamilyChangeNoticeReq;
   import proto.FamilyChangeFlagReq;
   import proto.FamilyOtherReq;
   import proto.FamilyPostAuthorityReq;
   import proto.FamilyGetAuthorityRes;
   import proto.FamilyAuthority;
   import proto.FamilyAuthorityNotify;
   import proto.FamilyDonateScoreRes;
   import proto.FamilyDonateRewardReq;
   
   public class GuildServiceHandler
   {
      
      private static var _ins:nslm2.modules.foundations.guildModule.service.GuildServiceHandler;
       
      
      private var guildModel:GuildModel;
      
      private var _applyGuildID:UInt64;
      
      private var crtPlayerID:UInt64;
      
      private var crtOp:int;
      
      private var kickId:UInt64;
      
      private var donateKind:int;
      
      public function GuildServiceHandler()
      {
         super();
         guildModel = GuildModel.ins;
         ServerEngine.ins.addAlwayHandler(5212,onGetMemberList);
         ServerEngine.ins.addAlwayHandler(5228,familyAuthorityNotifyHandler);
         ServerEngine.ins.addAlwayHandler(5230,donateNotifyHandler);
      }
      
      public static function get ins() : nslm2.modules.foundations.guildModule.service.GuildServiceHandler
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.guildModule.service.GuildServiceHandler();
         }
         return _ins;
      }
      
      public function reqGuildList() : void
      {
         ServerEngine.ins.send(5213,null,onGetGuildList);
      }
      
      private function onGetGuildList(param1:FamilyListRes) : void
      {
         if(param1)
         {
            guildModel.applyedGuildList = param1.apply;
            guildModel.guildList = param1.all;
            guildModel.guildFriendCntArr = param1.friend;
            ObserverMgr.ins.sendNotice("guild_notice_update_guild_list");
         }
      }
      
      public function reqHeroShardPanelInfo() : void
      {
         ServerEngine.ins.send(10020,null,onHeroShardPanelInfoResult);
      }
      
      private function onHeroShardPanelInfoResult(param1:FamilyHeroDonationPanelRes) : void
      {
         guildModel.panelRes = param1;
         ObserverMgr.ins.sendNotice("GUILD_NOTICE_UPDATE_HERO_SHARD_PANEL");
      }
      
      public function reqGuildinfo() : void
      {
         ServerEngine.ins.send(5211,null,onGetGuildInfo);
         reqHeroShardPanelInfo();
      }
      
      private function onGetGuildInfo(param1:FamilyInfoRes) : void
      {
         guildModel.guildInfo = param1.info;
         if(!Uint64Util.equal(PlayerModel.ins.playerInfo.familyId,param1.info.id))
         {
            PlayerModel.ins.playerInfo.familyId = param1.info.id;
            PlayerModel.ins.playerInfo.familyName = param1.info.name;
            ObserverMgr.ins.sendNotice("guild_notice_update_role_guild_data");
         }
         guildModel.updateRoleGuildInfo(param1.member);
         ObserverMgr.ins.sendNotice("guild_notice_update_guild_info");
         GuildTechService.ins.initInfo();
      }
      
      public function familyCreate(param1:String) : void
      {
         var _loc2_:FamilyCreateReq = new FamilyCreateReq();
         _loc2_.name = param1;
         ServerEngine.ins.send(5201,_loc2_,server_familyCreate);
      }
      
      private function server_familyCreate(param1:FamilyInfoRes) : void
      {
         guildModel.guildInfo = param1.info;
         guildModel.updateRoleGuildInfo(param1.member);
         guildModel.needUpdateGuildRankList = true;
         PlayerModel.ins.playerInfo.familyId = param1.info.id;
         PlayerModel.ins.playerInfo.familyName = param1.info.name;
         ObserverMgr.ins.sendNotice("guild_notice_show_guild_info_panel");
         reqMemberList();
         getAuthorityData();
         ModuleMgr.ins.closeModule(40706);
         ObserverMgr.ins.sendNotice("guild_notice_update_role_guild_data");
         ObserverMgr.ins.sendNotice("guild_notice_update_guild_info");
         ChatModel.ins.synChannels();
      }
      
      public function familyApply(param1:UInt64) : void
      {
         var _loc2_:FamilyApplyReq = new FamilyApplyReq();
         _loc2_.id = param1;
         _applyGuildID = param1;
         ServerEngine.ins.send(5202,_loc2_,server_familyApply);
      }
      
      private function server_familyApply(param1:FamilyApplyRes) : void
      {
         switch(int(param1.ok))
         {
            case 0:
               guildModel.applyedGuildList.push(_applyGuildID);
               ObserverMgr.ins.sendNotice("guild_notice_update_guild_list");
               break;
            case 1:
               ObserverMgr.ins.sendNotice("guild_notice_show_guild_info_panel");
               ModuleMgr.ins.closeModule(40711);
               guildModel.needUpdateGuildRankList = true;
               requestGuildInfo();
               ChatModel.ins.synChannels();
         }
      }
      
      public function requestGuildInfo() : void
      {
         updateGuildData();
         getDonateInfo();
         getAuthorityData();
      }
      
      public function familyApplyOp(param1:uint, param2:UInt64) : void
      {
         var _loc3_:FamilyApplyOpReq = new FamilyApplyOpReq();
         _loc3_.op = param1;
         _loc3_.id = param2;
         crtPlayerID = param2;
         crtOp = param1;
         ServerEngine.ins.send(5203,_loc3_,server_applyOp);
      }
      
      private function server_applyOp(param1:Object = null) : void
      {
         if(crtOp < 3)
         {
            guildModel.removeItemFromApplicantList(crtPlayerID);
         }
         else
         {
            guildModel.applicantList = [];
         }
         guildModel.needUpdateGuildRankList = true;
         ObserverMgr.ins.sendNotice("guild_notice_update_applicant_list");
         reqMemberList();
      }
      
      public function familyInviteFriend(param1:Array, param2:Function) : void
      {
         var _loc3_:FamilyInviteFriendReq = new FamilyInviteFriendReq();
         _loc3_.id = param1;
         ServerEngine.ins.send(5205,_loc3_,param2);
      }
      
      private function server_inviteFriend(param1:Object) : void
      {
      }
      
      public function familyAppoint() : void
      {
         var _loc5_:* = 0;
         var _loc1_:* = null;
         var _loc4_:FamilyAppointReq = new FamilyAppointReq();
         var _loc2_:Array = guildModel.officerist.concat();
         var _loc3_:int = _loc2_.length - 1;
         _loc5_ = _loc3_;
         while(_loc5_ >= 0)
         {
            _loc1_ = _loc2_[_loc5_];
            if(!_loc1_.id)
            {
               _loc2_.splice(_loc5_,1);
            }
            _loc5_--;
         }
         _loc4_.list = _loc2_;
         ServerEngine.ins.send(5206,_loc4_,server_familyAppoint);
      }
      
      private function server_familyAppoint(param1:Object = null) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(999000270));
         reqMemberList();
      }
      
      public function familyChangeLeader(param1:UInt64) : void
      {
         var _loc2_:FamilyChangeLeaderReq = new FamilyChangeLeaderReq();
         _loc2_.id = param1;
         ServerEngine.ins.send(5207,_loc2_,server_changeLeader);
      }
      
      private function server_changeLeader(param1:Object) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(999000271));
         ModuleMgr.ins.closeModule(40702);
         updateGuildData();
         guildModel.needUpdateGuildRankList = true;
      }
      
      public function reqApplicantList() : void
      {
         ServerEngine.ins.send(5218,null,onGotApplicantList);
      }
      
      private function onGotApplicantList(param1:FamilyApplyListRes) : void
      {
         if(param1)
         {
            guildModel.applicantList = param1.list;
         }
         ObserverMgr.ins.sendNotice("guild_notice_update_applicant_list");
      }
      
      public function familyKick(param1:UInt64) : void
      {
         var _loc2_:FamilyKickReq = new FamilyKickReq();
         _loc2_.id = param1;
         kickId = param1;
         ServerEngine.ins.send(5210,_loc2_,server_familyKick);
      }
      
      private function server_familyKick(param1:Object) : void
      {
         guildModel.removeMember(kickId);
         ObserverMgr.ins.sendNotice("guild_notice_update_member_list");
         AlertUtil.float(LocaleMgr.ins.getStr(11000243));
         guildModel.needUpdateGuildRankList = true;
      }
      
      public function switchAutoInvite() : void
      {
         ServerEngine.ins.send(5204,null,switchInviteHandler);
      }
      
      private function switchInviteHandler(param1:Object = null) : void
      {
         var _loc2_:Boolean = guildModel.guildInfo.invite;
         guildModel.guildInfo.invite = !_loc2_;
         ObserverMgr.ins.sendNotice("guild_notice_update_auto_invite");
      }
      
      public function clearCD(param1:Function) : void
      {
         ServerEngine.ins.send(5222,null,param1);
      }
      
      public function quickGuild() : void
      {
         ServerEngine.ins.send(5209,null,quickHandler);
      }
      
      private function quickHandler(param1:FamilyQuitRes) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(11000017));
         guildModel.exitTimeStamp = param1.cd;
         exitGuildHandler();
         ChatModel.ins.synChannels();
         guildModel.highPos = 0;
         guildModel.pos = 0;
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(40700,false));
      }
      
      public function dismissGuild() : void
      {
         ServerEngine.ins.send(5209,null,dismissGangHandler);
      }
      
      private function dismissGangHandler(param1:FamilyQuitRes) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(999000272));
         guildModel.exitTimeStamp = param1.cd;
         exitGuildHandler();
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(40700,false));
         if(ModuleMgr.ins.isShow(40740))
         {
            ModuleMgr.ins.closeModule(40740);
         }
         guildModel.highPos = 0;
         guildModel.pos = 0;
      }
      
      private function exitGuildHandler() : void
      {
         PlayerModel.ins.playerInfo.familyId = null;
         PlayerModel.ins.playerInfo.familyName = "";
         ModuleMgr.ins.closeModule(40700);
         ObserverMgr.ins.sendNotice("guild_notice_update_role_guild_data");
         if(ModuleMgr.ins.isShow(40740))
         {
            ModuleMgr.ins.closeModule(40740);
         }
      }
      
      public function reqMemberList() : void
      {
         ServerEngine.ins.send(5212);
      }
      
      private function onGetMemberList(param1:FamilyMemberRes) : void
      {
         guildModel.memberList = param1.list;
         ObserverMgr.ins.sendNotice("guild_notice_update_member_list");
      }
      
      public function upGrade(param1:Function) : void
      {
         ServerEngine.ins.send(5208,null,param1);
      }
      
      public function updateGuildData() : void
      {
         reqGuildinfo();
         reqMemberList();
      }
      
      public function guildDonate(param1:uint) : void
      {
         var _loc2_:FamilyDonateReq = new FamilyDonateReq();
         _loc2_.kind = param1;
         donateKind = param1;
         ServerEngine.ins.send(5214,_loc2_,server_familyDonate);
      }
      
      private function server_familyDonate(param1:FamilyDonateRes) : void
      {
         guildModel.updateDonateInfo(param1,donateKind);
         guildModel.hasDonated = true;
         ObserverMgr.ins.sendNotice("guild_notice_donate_success",donateKind);
      }
      
      public function changeNotice(param1:int, param2:String, param3:Function) : void
      {
         var _loc4_:FamilyChangeNoticeReq = new FamilyChangeNoticeReq();
         _loc4_.kind = param1 + 1;
         _loc4_.notice = param2;
         ServerEngine.ins.send(5215,_loc4_,param3);
         guildModel.needUpdateGuildRankList = true;
      }
      
      public function reqGuildLog(param1:Function) : void
      {
         ServerEngine.ins.send(5217,null,param1);
      }
      
      public function changeFlag(param1:int, param2:int, param3:*) : void
      {
         var _loc4_:FamilyChangeFlagReq = new FamilyChangeFlagReq();
         _loc4_.base = param1;
         _loc4_.icon = param2;
         ServerEngine.ins.send(5216,_loc4_,param3);
         guildModel.needUpdateGuildRankList = true;
      }
      
      public function reqSign(param1:Function) : void
      {
         ServerEngine.ins.send(5219,null,param1);
      }
      
      public function getOtherGuildInfo(param1:UInt64, param2:Function) : void
      {
         var _loc3_:FamilyOtherReq = new FamilyOtherReq();
         _loc3_.id = param1;
         ServerEngine.ins.send(5224,_loc3_,param2);
      }
      
      public function setNormalAuthority(param1:int, param2:Array, param3:*) : void
      {
         var _loc4_:FamilyPostAuthorityReq = new FamilyPostAuthorityReq();
         _loc4_.id = param1;
         _loc4_.auth = param2;
         ServerEngine.ins.send(5226,_loc4_,param3);
      }
      
      public function getAuthorityData() : void
      {
         ServerEngine.ins.send(5227,null,getAuthorityHanlder);
      }
      
      private function getAuthorityHanlder(param1:FamilyGetAuthorityRes) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc4_:int = 0;
         var _loc3_:* = param1.auth;
         for each(var _loc2_ in param1.auth)
         {
            guildModel.updateNormalAuthority(_loc2_.post,_loc2_.info);
         }
      }
      
      private function familyAuthorityNotifyHandler(param1:FamilyAuthorityNotify) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1.auth;
         for each(var _loc2_ in param1.auth)
         {
            guildModel.updateNormalAuthority(_loc2_.post,_loc2_.info);
         }
      }
      
      public function getDonateInfo() : void
      {
         ServerEngine.ins.send(5229,null,getDonateInfoHanlder);
      }
      
      private function getDonateInfoHanlder(param1:FamilyDonateScoreRes) : void
      {
         guildModel.donateScore = param1.score;
         guildModel.donateRecord = param1.record;
         ObserverMgr.ins.sendNotice("guild_notice_update_donate_data");
      }
      
      private function donateNotifyHandler(param1:FamilyDonateRes) : void
      {
         guildModel.updateDonateBaseInfo(param1);
      }
      
      public function server_familyDonateReward(param1:uint, param2:Function) : void
      {
         var _loc3_:FamilyDonateRewardReq = new FamilyDonateRewardReq();
         _loc3_.kind = param1;
         ServerEngine.ins.send(5225,_loc3_,param2);
      }
   }
}
