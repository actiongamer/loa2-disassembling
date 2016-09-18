package nslm2.modules.funnies.teamGuajiScenes
{
   import flash.events.EventDispatcher;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.funnies.teamGuajiScenes.model.TeamGuajiModel;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.TeamCreateNotify;
   import proto.TeamLeaveNotify;
   import proto.TeamEnterNotify;
   import proto.TeamKickNotify;
   import proto.TeamReplyNotify;
   import proto.TeamCountChangeNotify;
   import proto.TeamDismissNotify;
   import proto.TeamReadyNotify;
   import proto.TeamChangeNameNotify;
   import proto.TeamInvitedNotify;
   import proto.TeamInfo;
   import proto.GuajiInfoRes;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.nets.sockets.ServerEngine;
   import morn.core.handlers.Handler;
   import nslm2.nets.sockets.ServerEvent;
   import proto.TeamGetInfoReq;
   import proto.TeamGetInfoRes;
   import proto.TeamListReq;
   import proto.TeamListRes;
   import com.mz.core.event.MzEvent;
   import proto.TeamCreateReq;
   import proto.TeamCreateRes;
   import nslm2.common.model.PlayerModel;
   import com.netease.protobuf.UInt64;
   import proto.TeamEnterReq;
   import nslm2.utils.Uint64Util;
   import proto.TeamBasicInfo;
   import proto.TeamMemberState;
   import proto.TeamAutoReq;
   import proto.GuajiChangeNanduReq;
   import proto.TeamReplyReq;
   import proto.GuajiLogRes;
   import proto.GuajiGetBagInfoRes;
   import proto.GuajiSwitchReq;
   import proto.TeamLeaveReq;
   import nslm2.modules.footstones.notices.BottomMsgVo;
   import proto.TeamStartNotify;
   import proto.TeamDismissReq;
   import proto.TeamKickReq;
   import proto.TeamPanelCloseReq;
   import proto.GuajiInfoNotify;
   import proto.GuajiExtraRewardNotify;
   import proto.TeamInviteReq;
   import proto.GetTimesBuyRes;
   import proto.GuajiFightStNotify;
   import proto.GuajiRewardDispNotify;
   import proto.GuajiPvpTodayRankRes;
   import proto.GuajiPvpYestodayRankRes;
   import proto.GuajiChangePvperRes;
   import proto.GJPvpInfo;
   import proto.PlayerBaseInfo;
   import proto.GuajiPvpFightStartReq;
   import proto.GuajiSomeDataNotify;
   import proto.GetSwapActionsReq;
   import proto.GetSwapActionsRes;
   import proto.SwapActionInfo;
   import proto.SwapActionReq;
   import proto.GuajiPvpAutoFightReq;
   import proto.GuajiSwitchNotify;
   import proto.GuajiSaoDangReq;
   
   public class TeamGuajiService extends EventDispatcher implements IObserver
   {
      
      public static const EVT_TEAM_LIST:String = "evtTeamList";
      
      public static const EVT_TEAM_CREATE_NOTIFY:String = "EVT_TEAM_CREATE_NOTIFY";
      
      public static const EVT_TEAM_REMOVE_NOTIFY:String = "EVT_TEAM_DELETE_NOTIFY";
      
      public static const EVT_TEAM_ENTER_NOTIFY:String = "EVT_TEAM_ENTER_NOTIFY";
      
      public static const EVT_TEAM_KICKOUT_NOTIFY:String = "EVT_TEAM_KICKOUT_NOTIFY";
      
      public static const EVT_TEAM_REPLY_NOTIFY:String = "EVT_TEAM_REPLY_NOTIFY";
      
      public static const EVT_TEAM_COUNT_NOTIFY:String = "EVT_TEAM_COUNT_NOTIFY";
      
      public static const EVT_GUAJI_INFO_NOTIFY:String = "EVT_GUAJI_INFO_NOTIFY";
      
      public static const EVT_GUAJI_CHANGENANDU_NOTIFY:String = "EVT_GUAJI_CHANGENANDU_NOTIFY";
      
      public static const EVT_GUAJI_EXTRAREWARD_NOTIFY:String = "EVT_GUAJI_EXTRAREWARD_NOTIFY";
      
      public static const EVT_GUAJI_TEAM_INVITE_NOTIFY:String = "EVT_GUAJI_TEAM_INVITE_NOTIFY";
      
      public static const EVT_TEAM_CHANGE_NANDU:String = "EVT_TEAM_CHANGE_NANDU";
      
      public static const EVT_TEAM_GUAJI_FIGHT_NOTIFY:String = "EVT_TEAM_GUAJI_FIGHT_NOTIFY";
      
      public static const EVT_GUAJI_REWARD_DISPLAY_NOTIFY:String = "EVT_GUAJI_REWARD_DISPLAY_NOTIFY";
      
      public static const EVT_GUAJI_REWARD_CLEAR:String = "evt_guaji_reward_clear";
      
      public static const EVT_TEAM_DISSMISS:String = "evt_team_dissmiss";
      
      public static const EVT_SELF_TEAM_ENTER_COMPLETE:String = "EVT_SELF_TEAM_CREATE_COMPLETE";
      
      public static const EVT_TEAM_ENTER_BY_NO:String = "EVT_TEAM_ENTER_BY_NO";
      
      public static const EVT_TEAM_SOMEONE_READY:String = "EVT_TEAM_SOMEONE_READY";
      
      public static const EVT_TEAM_CHANGE_NAME:String = "EVT_TEAM_CHANGE_NAME";
      
      public static const EVT_TEAM_INVITED_NOTIFY:String = "EVT_TEAM_INVITED_NOTIFY";
      
      public static const EVT_TEAM_START_NOTIFY:String = "EVT_TEAM_START_NOTIFY";
      
      private static var _ins:nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
       
      
      private var model:TeamGuajiModel;
      
      public var teamType:int = 15;
      
      public var typeid:int = 14;
      
      public var teams:Array;
      
      public var teamMems:Array;
      
      public var curPlayerTeamInfo:TeamInfo;
      
      public var sceneInfo:GuajiInfoRes;
      
      private var tmpGuajiId:int;
      
      public var invitedNotifies:Array;
      
      public function TeamGuajiService()
      {
         model = TeamGuajiModel.ins;
         teams = [];
         teamMems = [];
         invitedNotifies = [];
         super();
         needEventListeners(true);
         ServerEngine.ins.addAlwayHandler(3029,server_guajiInfo_notify);
         ServerEngine.ins.addAlwayHandler(3026,server_guaji_extraReward_notify);
         ServerEngine.ins.addAlwayHandler(3031,server_guaji_fight_notify);
         ServerEngine.ins.addAlwayHandler(3032,server_guaji_reward_disp_notify);
         ServerEngine.ins.addAlwayHandler(3148,server_guaji_somedata_notify);
         ServerEngine.ins.addAlwayHandler(3150,beStolenNotifyHandler);
         ServerEngine.ins.addAlwayHandler(3152,otherPlayerSwitchHandler);
         ServerEngine.ins.addAlwayHandler(2055,teamStartHandler);
      }
      
      public static function get ins() : nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService();
         }
         return _ins;
      }
      
      public function needEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            ObserverMgr.ins.regObserver(this);
         }
         else
         {
            ObserverMgr.ins.unregObserver(this);
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["msgTeamCreateNotify","msgTeamLeaveNotify","msgTeamEnterNotify","msgTeamKickNotify","msgTeamReplyNotify","msgTeamCountChangeNotify","msgTeamDismissNotify","msgTeamChangeNameNotify","msgTeamSomeoneReadyNotify","msgTeamInvitedNotify"];
      }
      
      public function initTeamType(param1:int) : void
      {
         exitTeam();
         teamType = param1;
      }
      
      public function get teamMaxMemberNum() : uint
      {
         if(!(int(teamType) - 17))
         {
            return 5;
         }
         return 3;
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("msgTeamCreateNotify" !== _loc3_)
         {
            if("msgTeamLeaveNotify" !== _loc3_)
            {
               if("msgTeamEnterNotify" !== _loc3_)
               {
                  if("msgTeamKickNotify" !== _loc3_)
                  {
                     if("msgTeamReplyNotify" !== _loc3_)
                     {
                        if("msgTeamCountChangeNotify" !== _loc3_)
                        {
                           if("msgTeamLeaveNotify" !== _loc3_)
                           {
                              if("msgTeamDismissNotify" !== _loc3_)
                              {
                                 if("msgTeamSomeoneReadyNotify" !== _loc3_)
                                 {
                                    if("msgTeamChangeNameNotify" !== _loc3_)
                                    {
                                       if("msgTeamInvitedNotify" === _loc3_)
                                       {
                                          server_teamInvited_notify(param2 as TeamInvitedNotify);
                                       }
                                    }
                                    else
                                    {
                                       server_teamChangeName_notify(param2 as TeamChangeNameNotify);
                                    }
                                 }
                                 else
                                 {
                                    server_teamSomeoneReady_notify(param2 as TeamReadyNotify);
                                 }
                              }
                           }
                           addr52:
                           server_teamDissmiss_notify(param2 as TeamDismissNotify);
                        }
                        else
                        {
                           server_teamCount_notify(param2 as TeamCountChangeNotify);
                        }
                        server_teamLeave_notify(param2 as TeamLeaveNotify);
                        §§goto(addr52);
                     }
                     else
                     {
                        server_teamReply_notify(param2 as TeamReplyNotify);
                     }
                  }
                  else
                  {
                     server_teamKick_notify(param2 as TeamKickNotify);
                  }
               }
               else
               {
                  server_teamEnter_notify(param2 as TeamEnterNotify);
               }
            }
            else
            {
               server_teamLeave_notify(param2 as TeamLeaveNotify);
            }
         }
         else
         {
            server_teamCreate_notify(param2 as TeamCreateNotify);
         }
      }
      
      public function server_get_guajiInfo(param1:Function) : void
      {
         if(FuncOpenAutoCtrl.checkOpen(41210))
         {
            ServerEngine.ins.send(3020,null,new Handler(server_getGuajiInfo_cpl,[param1]));
         }
      }
      
      private function server_getGuajiInfo_cpl(param1:*, param2:GuajiInfoRes, param3:ServerEvent) : void
      {
         sceneInfo = param2;
         model.pvpCount = param2.pvpCount;
         model.robPieceCountToday = param2.stealCount;
         model.pvpCntAddCD = param2.nextPvpCountTm;
         model.rankToday = param2.todayRank;
         model.rankYesterDay = param2.yestodayRank;
         model.hasGotYestoDayReward = param2.yestodayRwdIsGet;
         model.updateYesterDayRewardStatus();
         model.protectCD = param2.immuTm;
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
      
      public function getTeamInfo(param1:* = null) : void
      {
         var _loc2_:TeamGetInfoReq = new TeamGetInfoReq();
         _loc2_.kind = teamType;
         ServerEngine.ins.send(2027,_loc2_,new Handler(server_getTeamInfoCpl,[param1]));
      }
      
      private function server_getTeamInfoCpl(param1:*, param2:TeamGetInfoRes, param3:ServerEvent) : void
      {
         if(param2 == null)
         {
            curPlayerTeamInfo = null;
         }
         else if(param2.info)
         {
            this.curPlayerTeamInfo = param2.info;
            this.teamMems = param2.info.all;
         }
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
         ObserverMgr.ins.sendNotice("update_team_member_list");
      }
      
      public function getTeamList(param1:* = null) : void
      {
         var _loc2_:TeamListReq = new TeamListReq();
         _loc2_.kind = teamType;
         ServerEngine.ins.send(2022,_loc2_,new Handler(server_teamListCpl,[param1]));
      }
      
      private function server_teamListCpl(param1:*, param2:TeamListRes, param3:ServerEvent) : void
      {
         this.teams = param2.all;
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
         this.dispatchEvent(new MzEvent("evtTeamList"));
      }
      
      public function server_TeamCreate(param1:Function) : void
      {
         var _loc2_:TeamCreateReq = new TeamCreateReq();
         _loc2_.kind = teamType;
         _loc2_.nandu = 0;
         ServerEngine.ins.send(2020,_loc2_,new Handler(server_teamCreate_cpl,[param1]));
      }
      
      private function server_teamCreate_cpl(param1:*, param2:TeamCreateRes, param3:ServerEvent) : void
      {
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
      
      private function server_teamCreate_notify(param1:TeamCreateNotify) : void
      {
         if(param1 && param1.info.kind == teamType)
         {
            this.teams.push(param1.info);
            this.dispatchEvent(new MzEvent("EVT_TEAM_CREATE_NOTIFY",param1.info));
            if(PlayerModel.ins.isCurPlayer(param1.info.leaderId))
            {
               getTeamInfo();
            }
         }
      }
      
      public function server_TeamEnter(param1:UInt64, param2:Function) : void
      {
         var _loc3_:TeamEnterReq = new TeamEnterReq();
         _loc3_.kind = teamType;
         _loc3_.id = param1;
         _loc3_.pwd = null;
         ServerEngine.ins.send(2025,_loc3_,new Handler(server_teamEnter_cpl,[param2]));
      }
      
      private function server_teamEnter_cpl(param1:*, param2:*, param3:ServerEvent) : void
      {
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
      
      private function server_teamEnter_notify(param1:TeamEnterNotify) : void
      {
         var _loc2_:int = 0;
         var _loc4_:* = null;
         var _loc3_:* = null;
         if(param1.kind == teamType)
         {
            _loc2_ = Uint64Util.indexByAttr(this.teams,TeamBasicInfo.ID.name,param1.mem.player.id);
            if(_loc2_ != -1)
            {
               _loc4_ = this.teams[_loc2_];
               _loc4_.count = Number(_loc4_.count) + 1;
            }
            _loc3_ = new TeamMemberState();
            _loc3_.mem = param1.mem;
            if(teamType == 15)
            {
               _loc3_.ready = true;
            }
            this.teamMems.push(_loc3_);
            this.dispatchEvent(new MzEvent("EVT_TEAM_ENTER_NOTIFY",_loc3_));
         }
      }
      
      public function server_teamQuickEnter() : void
      {
         var _loc1_:TeamAutoReq = new TeamAutoReq();
         _loc1_.kind = teamType;
         ServerEngine.ins.send(2025,_loc1_);
      }
      
      public function server_set_guajiNandu(param1:Function, param2:int) : void
      {
         var _loc3_:GuajiChangeNanduReq = new GuajiChangeNanduReq();
         _loc3_.guajiId = param2;
         tmpGuajiId = _loc3_.guajiId;
         ServerEngine.ins.send(3021,_loc3_,new Handler(server_set_guajiNandu_cpl,[param1]));
      }
      
      private function server_set_guajiNandu_cpl(param1:*, param2:ServerEvent) : void
      {
         this.sceneInfo.curGuajiId = tmpGuajiId;
         model.crtPvPPlayers = [];
         ObserverMgr.ins.sendNotice("CHANGE_CHALLENGE_NANDU",tmpGuajiId);
         if(param1)
         {
            Handler.execute(param1,[param2]);
         }
      }
      
      public function server_agreeOrRefuse_apply(param1:Array, param2:Function) : void
      {
         var _loc3_:TeamReplyReq = new TeamReplyReq();
         _loc3_.kind = teamType;
         _loc3_.reply = param1;
         ServerEngine.ins.send(2033,_loc3_,param2);
      }
      
      private function server_teamReply_notify(param1:TeamReplyNotify) : void
      {
         this.dispatchEvent(new MzEvent("EVT_TEAM_REPLY_NOTIFY",param1));
      }
      
      public function server_get_guajiLog(param1:Function) : void
      {
         ServerEngine.ins.send(3027,null,new Handler(server_get_guajiLog_cpl,[param1]));
      }
      
      private function server_get_guajiLog_cpl(param1:*, param2:GuajiLogRes, param3:ServerEvent) : void
      {
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
      
      public function server_get_guajiBag(param1:Function) : void
      {
         ServerEngine.ins.send(3024,null,new Handler(server_get_guajiBag_cpl,[param1]));
      }
      
      private function server_get_guajiBag_cpl(param1:*, param2:GuajiGetBagInfoRes, param3:ServerEvent) : void
      {
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
      
      public function server_get_guajiReward(param1:Function) : void
      {
         ServerEngine.ins.send(3025);
      }
      
      private function server_get_guajiReward_cpl(param1:*, param2:ServerEvent) : void
      {
         if(param1)
         {
            Handler.execute(param1,[param2]);
         }
      }
      
      public function server_fight_start(param1:GuajiSwitchReq, param2:Function, param3:Function = null) : void
      {
         ServerEngine.ins.send(3028,param1,new Handler(server_fight_start_cpl,[param2]),param3);
      }
      
      private function server_fight_start_cpl(param1:*, param2:ServerEvent) : void
      {
         if(param1)
         {
            Handler.execute(param1,[param2]);
         }
      }
      
      public function server_auto_team(param1:GuajiSwitchReq) : void
      {
         ServerEngine.ins.send(3028,param1);
      }
      
      private function server_auto_team_cpl(param1:*, param2:ServerEvent) : void
      {
         if(param1)
         {
            Handler.execute(param1,[param2]);
         }
      }
      
      public function server_TeamLeave() : void
      {
         var _loc1_:TeamLeaveReq = new TeamLeaveReq();
         _loc1_.kind = teamType;
         ServerEngine.ins.send(2030,_loc1_);
      }
      
      private function server_teamLeave_notify(param1:TeamLeaveNotify) : void
      {
         var _loc2_:* = null;
         if(param1 && param1.kind == teamType)
         {
            if(PlayerModel.ins.isCurPlayer(param1.playerId))
            {
               exitTeam();
               this.dispatchEvent(new MzEvent("EVT_TEAM_DELETE_NOTIFY",null));
            }
            else
            {
               _loc2_ = findMem(param1.playerId);
               this.dispatchEvent(new MzEvent("EVT_TEAM_DELETE_NOTIFY",_loc2_));
            }
         }
      }
      
      private function server_teamDissmiss_notify(param1:TeamDismissNotify) : void
      {
         if(param1 && param1.kind == teamType)
         {
            exitTeam();
            this.dispatchEvent(new MzEvent("evt_team_dissmiss"));
         }
      }
      
      private function server_teamSomeoneReady_notify(param1:TeamReadyNotify) : void
      {
         var _loc2_:* = null;
         if(param1 && param1.kind == teamType)
         {
            _loc2_ = findMemById(param1.playerId);
            if(_loc2_)
            {
               _loc2_.ready = param1.ready;
            }
            this.dispatchEvent(new MzEvent("EVT_TEAM_SOMEONE_READY",param1));
         }
      }
      
      public function findMemById(param1:UInt64) : TeamMemberState
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         _loc3_ = 0;
         while(_loc3_ < teamMems.length)
         {
            _loc2_ = this.teamMems[_loc3_];
            if(Uint64Util.equal(_loc2_.mem.player.id,param1))
            {
               return _loc2_;
            }
            _loc3_++;
         }
         return null;
      }
      
      private function server_teamChangeName_notify(param1:TeamChangeNameNotify) : void
      {
         if(param1 && param1.kind == teamType)
         {
            this.dispatchEvent(new MzEvent("EVT_TEAM_CHANGE_NAME",param1));
         }
      }
      
      private function server_teamInvited_notify(param1:TeamInvitedNotify) : void
      {
         if(param1.kind == 17)
         {
            addInvitedNotify(param1);
            ObserverMgr.ins.sendNotice("msg_new_bottom_msg",new BottomMsgVo(13,null));
         }
      }
      
      public function addInvitedNotify(param1:TeamInvitedNotify) : void
      {
         this.invitedNotifies.push(param1);
      }
      
      public function removeInvitedNotify(param1:UInt64) : void
      {
         Uint64Util.removeItemByAttr(this.invitedNotifies,"teamId",param1);
         this.dispatchEvent(new MzEvent("EVT_TEAM_INVITED_NOTIFY"));
      }
      
      private function teamStartHandler(param1:TeamStartNotify) : void
      {
         if(param1 && param1.kind == teamType)
         {
            this.dispatchEvent(new MzEvent("EVT_TEAM_START_NOTIFY",param1));
         }
      }
      
      public function dismissTeam() : void
      {
         var _loc1_:TeamDismissReq = new TeamDismissReq();
         _loc1_.kind = teamType;
         ServerEngine.ins.send(2046,_loc1_);
      }
      
      private function exitTeam() : void
      {
         this.curPlayerTeamInfo = null;
         this.teamMems = [];
      }
      
      private function server_teamCount_notify(param1:TeamCountChangeNotify) : void
      {
         if(param1.kind == teamType)
         {
            this.dispatchEvent(new MzEvent("EVT_TEAM_COUNT_NOTIFY",null));
         }
      }
      
      public function findMem(param1:UInt64) : TeamMemberState
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = this.teamMems.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.teamMems[_loc5_];
            if(Uint64Util.equal(_loc2_.mem.player.id,param1))
            {
               _loc3_ = this.teamMems[0];
               this.teamMems[0] = this.teamMems[_loc5_];
               this.teamMems[_loc5_] = _loc3_;
               return this.teamMems.shift();
            }
            _loc5_++;
         }
         return null;
      }
      
      public function findSelfMem() : TeamMemberState
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:int = this.teamMems.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = this.teamMems[_loc3_];
            if(Uint64Util.equal(_loc1_.mem.player.id,PlayerModel.ins.playerInfo.id))
            {
               return _loc1_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function server_TeamKickOut(param1:UInt64) : void
      {
         var _loc2_:TeamKickReq = new TeamKickReq();
         _loc2_.kind = teamType;
         _loc2_.playerId = param1;
         ServerEngine.ins.send(2023,_loc2_);
      }
      
      private function server_teamKick_notify(param1:TeamKickNotify) : void
      {
         var _loc2_:* = null;
         if(param1.kind == teamType)
         {
            if(PlayerModel.ins.isCurPlayer(param1.playerId))
            {
               exitTeam();
               this.dispatchEvent(new MzEvent("EVT_TEAM_KICKOUT_NOTIFY",null));
            }
            else
            {
               _loc2_ = findMem(param1.playerId);
               this.dispatchEvent(new MzEvent("EVT_TEAM_KICKOUT_NOTIFY",_loc2_));
            }
         }
      }
      
      public function server_TeamPanelClose() : void
      {
         var _loc1_:TeamPanelCloseReq = new TeamPanelCloseReq();
         _loc1_.kind = teamType;
         ServerEngine.ins.send(2029,_loc1_);
      }
      
      private function server_guajiInfo_notify(param1:GuajiInfoNotify, param2:ServerEvent) : void
      {
         this.dispatchEvent(new MzEvent("EVT_GUAJI_INFO_NOTIFY",param1));
      }
      
      private function server_guaji_extraReward_notify(param1:GuajiExtraRewardNotify, param2:ServerEvent) : void
      {
         this.dispatchEvent(new MzEvent("EVT_GUAJI_EXTRAREWARD_NOTIFY",param1));
      }
      
      public function server_teamInviteFriend(param1:TeamInviteReq) : void
      {
         ServerEngine.ins.send(3030,param1);
      }
      
      private function server_teamInviteFriend_cpl(param1:*, param2:ServerEvent) : void
      {
         if(param1)
         {
            Handler.execute(param1,[param2]);
         }
      }
      
      public function server_get_times_buy(param1:Function) : void
      {
         ServerEngine.ins.send(5336,null,new Handler(server_get_times_buy_cpl,[param1]));
      }
      
      private function server_get_times_buy_cpl(param1:*, param2:GetTimesBuyRes, param3:ServerEvent) : void
      {
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
      
      private function server_guaji_fight_notify(param1:GuajiFightStNotify, param2:ServerEvent) : void
      {
         this.dispatchEvent(new MzEvent("EVT_TEAM_GUAJI_FIGHT_NOTIFY",param1));
      }
      
      private function server_guaji_reward_disp_notify(param1:GuajiRewardDispNotify, param2:ServerEvent) : void
      {
         this.dispatchEvent(new MzEvent("EVT_GUAJI_REWARD_DISPLAY_NOTIFY",param1));
      }
      
      public function requestChallengBoss(param1:Function, param2:Function) : void
      {
         ServerEngine.ins.send(3022,null,param1,param2);
      }
      
      public function getTodayRank() : void
      {
         ServerEngine.ins.send(3145,null,server_todayRank_cpl);
      }
      
      private function server_todayRank_cpl(param1:GuajiPvpTodayRankRes) : void
      {
         if(param1)
         {
            model.rankToday = param1.rank;
            model.pvpRankToday = param1.player;
         }
      }
      
      public function getYesterDayRank() : void
      {
         ServerEngine.ins.send(3146,null,server_yestodayRank_cpl);
      }
      
      private function server_yestodayRank_cpl(param1:GuajiPvpYestodayRankRes) : void
      {
         if(param1)
         {
            model.pvpRankYesterDay = param1.player;
            model.needGetYesterDayRankData = false;
         }
      }
      
      private function setRankData(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            _loc2_.rank = _loc4_ + 1;
            _loc4_++;
         }
      }
      
      public function getPvPScoreReward(param1:Function) : void
      {
         ServerEngine.ins.send(3147,null,param1);
      }
      
      public function changePvPPlayers() : void
      {
         ServerEngine.ins.send(3140,null,changePvpPlayerHandler);
      }
      
      private function changePvpPlayerHandler(param1:GuajiChangePvperRes) : void
      {
         if(!param1)
         {
            return;
         }
         model.crtPvPPlayers = param1.info;
         model.crtPvPPlayers.sort(sortPvPer);
         ObserverMgr.ins.sendNotice("guaji_update_pvp_playres");
      }
      
      private function sortPvPer(param1:GJPvpInfo, param2:GJPvpInfo) : int
      {
         return -Uint64Util.compareValue(param1.info.ability,param2.info.ability);
      }
      
      public function requestPvP(param1:PlayerBaseInfo, param2:Function) : void
      {
         var _loc3_:GuajiPvpFightStartReq = new GuajiPvpFightStartReq();
         _loc3_.playerId = param1.id;
         _loc3_.dist = param1.dist;
         ServerEngine.ins.send(3143,_loc3_,param2);
      }
      
      private function server_guaji_somedata_notify(param1:GuajiSomeDataNotify, param2:ServerEvent) : void
      {
         model.protectCD = param1.immuTm;
         model.pvpCount = param1.pvpCount;
      }
      
      public function getGotScoreRewardId() : void
      {
         var _loc1_:GetSwapActionsReq = new GetSwapActionsReq();
         _loc1_.ids = model.scoreRwdIds;
         ServerEngine.ins.send(8007,_loc1_,server_swapActions_cpl);
      }
      
      private function server_swapActions_cpl(param1:GetSwapActionsRes) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         model.hasGotSocreRewardIDArr = [];
         if(!param1)
         {
            return;
         }
         var _loc3_:int = param1.info.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1.info[_loc4_];
            if(_loc2_.count > 0)
            {
               model.hasGotSocreRewardIDArr.push(_loc2_.id);
            }
            _loc4_++;
         }
         model.updateScoreRewardStatus();
      }
      
      public function requestGetScoreReward(param1:uint, param2:Function) : void
      {
         var _loc3_:SwapActionReq = new SwapActionReq();
         _loc3_.id = param1;
         ServerEngine.ins.send(8008,_loc3_,param2);
      }
      
      public function beStolenNotifyHandler(param1:Object) : void
      {
         ObserverMgr.ins.sendNotice("guaji_update_reward_bag");
      }
      
      public function reqeustPvPFight(param1:int, param2:UInt64, param3:Function) : void
      {
         var _loc4_:GuajiPvpAutoFightReq = new GuajiPvpAutoFightReq();
         _loc4_.dist = param1;
         _loc4_.playerId = param2;
         ServerEngine.ins.send(3151,_loc4_,param3);
      }
      
      public function reqeustPvPSimpleFight(param1:int, param2:UInt64, param3:Function) : void
      {
         var _loc4_:GuajiPvpAutoFightReq = new GuajiPvpAutoFightReq();
         _loc4_.dist = param1;
         _loc4_.playerId = param2;
         _loc4_.kind = 1;
         ServerEngine.ins.send(3151,_loc4_,param3);
      }
      
      private function otherPlayerSwitchHandler(param1:GuajiSwitchNotify) : void
      {
         ObserverMgr.ins.sendNotice("guaji_change_guaji_status",param1);
      }
      
      public function requestFastRob(param1:int, param2:Function) : void
      {
         var _loc3_:GuajiSaoDangReq = new GuajiSaoDangReq();
         _loc3_.count = param1;
         ServerEngine.ins.send(3153,_loc3_,param2);
      }
   }
}
