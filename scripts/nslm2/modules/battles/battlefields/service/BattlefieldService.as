package nslm2.modules.battles.battlefields.service
{
   import com.mz.core.interFace.IObserver;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.TeamEnterNotify;
   import proto.TeamInvitedNotify;
   import proto.TeamKickNotify;
   import proto.TeamLeaveNotify;
   import proto.TeamMemInfoNotify;
   import proto.TeamStopNotify;
   import proto.TeamDismissNotify;
   import proto.TaskGetCurInfoReq;
   import proto.TaskGetCurInfoRes;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import com.mz.core.event.MzEvent;
   import proto.BgInfoRes;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncVo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import proto.ProtocolStatusRes;
   import nslm2.modules.footstones.assistantModules.model.AssistantModel;
   import nslm2.modules.footstones.assistantModules.AssistantTimerManager;
   import nslm2.modules.footstones.assistantModules.vos.AssistantTimerVo;
   import nslm2.utils.ServerTimer;
   import proto.BgRegNotify;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleTimerMsg;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import proto.BgPlayerInfo;
   import proto.BgStartNotify;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleEffMsg;
   import nslm2.modules.battles.battlefields.utils.BattlefieldUtil;
   import morn.core.managers.timerMgrs.TimerManager;
   import proto.BgEnterReq;
   import proto.BgGetTitleRewardInfoRes;
   import proto.BgGetTitleRewardReq;
   import proto.BgFriendsListRes;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import proto.BgFamilyMemberListRes;
   import nslm2.modules.footstones.notices.BottomMsgVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.BgStageEnterNotify;
   import proto.BgStagePlayerInfo;
   import nslm2.utils.Uint64Util;
   import proto.BgCheckRes;
   import proto.BgGetRankInfoReq;
   import proto.BgGetRankInfoRes;
   
   public class BattlefieldService implements IObserver
   {
      
      private static var _ins:nslm2.modules.battles.battlefields.service.BattlefieldService;
       
      
      private var _lastRewardReq:BgGetTitleRewardReq;
      
      public function BattlefieldService()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.battles.battlefields.service.BattlefieldService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.battles.battlefields.service.BattlefieldService();
         }
         return _ins;
      }
      
      public function init() : void
      {
         ServerEngine.ins.addAlwayHandler(4220,serverCpl_bgStageEnterNotify);
         ServerEngine.ins.addAlwayHandler(4205,serverCpl_bgRegNotify);
         ServerEngine.ins.addAlwayHandler(4209,serverCpl_bgStartNotify);
         ServerEngine.ins.addAlwayHandler(4213,serverCpl_bgTimeoutLeaveNotify);
         needEventListeners(true);
         if(FuncOpenAutoCtrl.checkOpen(50500))
         {
            this.battlefieldCheck();
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["msgTeamCountChangeNotify","msgTeamCreateRes","msgTeamEnterNotify","msgTeamInvitedNotify","msgTeamKickNotify","msgTeamLeaveNotify","msgTeamReplyNotify","msgTeamMemInfoNotify","msgTeamDismissNotify","msgTeamStopNotify"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("msgTeamCountChangeNotify" !== _loc3_)
         {
            if("msgTeamCreateRes" !== _loc3_)
            {
               if("msgTeamEnterNotify" !== _loc3_)
               {
                  if("msgTeamInvitedNotify" !== _loc3_)
                  {
                     if("msgTeamKickNotify" !== _loc3_)
                     {
                        if("msgTeamLeaveNotify" !== _loc3_)
                        {
                           if("msgTeamReplyNotify" !== _loc3_)
                           {
                              if("msgTeamMemInfoNotify" !== _loc3_)
                              {
                                 if("msgTeamStopNotify" !== _loc3_)
                                 {
                                    if("msgTeamDismissNotify" === _loc3_)
                                    {
                                       serverCpl_teamDismissNotify(param2 as TeamDismissNotify);
                                    }
                                 }
                                 else
                                 {
                                    serverCpl_onTeamStopNotify(param2 as TeamStopNotify);
                                 }
                              }
                              else
                              {
                                 serverCpl_onMemInfoNotify(param2 as TeamMemInfoNotify);
                              }
                           }
                        }
                        else
                        {
                           serverCpl_onLeave(param2 as TeamLeaveNotify);
                        }
                     }
                     else
                     {
                        serverCpl_onKick(param2 as TeamKickNotify);
                     }
                  }
                  else
                  {
                     serverCpl_onInvited(param2 as TeamInvitedNotify);
                  }
               }
               else
               {
                  serverCpl_teamEnterNotify(param2 as TeamEnterNotify);
               }
            }
            else
            {
               AlertUtil.float(LocaleMgr.ins.getStr(50500098));
            }
         }
      }
      
      public function getBattlefieldInfo() : void
      {
         ServerEngine.ins.send(4200,null,serverCpl_battlefieldInfo);
      }
      
      public function getBattlefieldTodayRewardInfo() : void
      {
         var _loc1_:TaskGetCurInfoReq = new TaskGetCurInfoReq();
         _loc1_.kinds = [3];
         ServerEngine.ins.send(8300,_loc1_,crtTasksInfoHandler);
      }
      
      private function crtTasksInfoHandler(param1:TaskGetCurInfoRes) : void
      {
         if(param1)
         {
            BattlefieldModel.ins.initTasksArr(param1.info);
         }
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgBattlefieldGetTaskInfoCpl"));
      }
      
      public function serverCpl_battlefieldInfo(param1:BgInfoRes) : void
      {
         var _loc2_:int = 0;
         BattlefieldModel.ins.bgInfoRes = param1;
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgBattlefieldInfoCpl"));
         var _loc3_:NpcFuncVo = NpcFuncService.ins.getVo(50511);
         if(_loc3_)
         {
            _loc2_ = String(DefindConsts.BG_DAILY_WIN_TIME_INTV).split("|")[0];
            _loc3_.count = _loc2_ - param1.todayWinTimes;
         }
      }
      
      public function applySingle() : void
      {
         ServerEngine.ins.send(4204,null,null,serverErr_applySingle);
      }
      
      private function serverErr_applySingle(param1:ProtocolStatusRes) : void
      {
         AssistantModel.ins.removeTask(50500);
         if(param1.errCode == 300004153)
         {
            AssistantTimerManager.ins.addTimer(new AssistantTimerVo(ServerTimer.ins.second + 300,50500));
         }
         ServerEngine.ins.doDefaultErr(param1);
      }
      
      public function exitBattlefield() : void
      {
         ServerEngine.ins.send(4206,null,serverCpl_bgLeave);
      }
      
      public function serverCpl_bgLeave(param1:ProtocolStatusRes) : void
      {
         BattlefieldModel.ins.clearData();
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgBattlefieldExitCpl"));
      }
      
      public function serverCpl_bgRegNotify(param1:BgRegNotify) : void
      {
         BattlefieldModel.ins.regStamp = param1.regStamp;
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgBattlefieldApplyCpl"));
         ObserverMgr.ins.sendNotice("msgSwitchMinimapCountDown",new SwitchModuleTimerMsg(50500,param1.regStamp,param1.regStamp + StcMgr.ins.getBginfoVo(1000).bg_max_time * 60));
      }
      
      public function serverCpl_teamEnterNotify(param1:TeamEnterNotify) : void
      {
         var _loc2_:* = null;
         if(param1.kind == 16)
         {
            BattlefieldModel.ins.removeInvitedId(param1.mem.player.id);
            _loc2_ = new BgPlayerInfo();
            _loc2_.baseInfo = param1.mem.player;
            _loc2_.bgBaseInfo = param1.mem.bgBaseInfo;
            BattlefieldModel.ins.addMem(_loc2_);
            AlertUtil.float(LocaleMgr.ins.getStr(50500133,[param1.mem.player.name]));
         }
      }
      
      public function serverCpl_teamDismissNotify(param1:TeamDismissNotify) : void
      {
         if(param1.kind == 16)
         {
            BattlefieldModel.ins.teamDismissed();
         }
      }
      
      public function serverCpl_bgStartNotify(param1:BgStartNotify) : void
      {
         BattlefieldModel.ins.startStamp = param1.startStamp;
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(50500,true));
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MINIMAP_EFFECT_VISIBLE",new SwitchModuleEffMsg(50500,true));
         ObserverMgr.ins.sendNotice("msgSwitchMinimapCountDown",new SwitchModuleTimerMsg(50500,0,BattlefieldModel.ins.startStamp + int(DefindConsts.BG_CONFIRM_TIME)));
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgBattlefieldStart"));
         BattlefieldUtil.showEnterConfirm();
         TimerManager.ins.doOnce((BattlefieldModel.ins.startStamp + int(DefindConsts.BG_CONFIRM_TIME) - ServerTimer.ins.second - 20) * 1000,BattlefieldUtil.showEnterConfirm);
      }
      
      public function serverCpl_bgTimeoutLeaveNotify(param1:ProtocolStatusRes) : void
      {
         BattlefieldModel.ins.clearData();
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgBattlefieldExitCpl"));
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgBattlefieldTimeOut"));
      }
      
      public function acceptBattlefield(param1:Boolean) : void
      {
         BattlefieldBattleService.ins.switchEventListeners(param1);
         var _loc2_:BgEnterReq = new BgEnterReq();
         _loc2_.accept = param1;
         ServerEngine.ins.send(4210,_loc2_);
      }
      
      public function getPlayersList() : void
      {
         BattlefieldModel.ins.friendsListReady = false;
         BattlefieldModel.ins.memberListReady = false;
         getFriendsList();
         getFamilyMemberList();
      }
      
      public function getFriendsList() : void
      {
         BattlefieldModel.ins.friendsListReady = false;
         ServerEngine.ins.send(4214,null,serverCpl_friendsList);
      }
      
      public function getDegreeRankRewardInfo() : void
      {
         ServerEngine.ins.send(4235,null,serverCpl_bgGetTitleRewardInfo);
      }
      
      private function serverCpl_bgGetTitleRewardInfo(param1:BgGetTitleRewardInfoRes) : void
      {
         if(param1)
         {
            BattlefieldModel.ins.getedDegreeRankRewardIds = param1.ids;
         }
         BattlefieldUtil.checkHasSeasonReward();
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgBattlefieldRankDataCpl"));
      }
      
      public function getDegreeRankReward(param1:BgGetTitleRewardReq) : void
      {
         _lastRewardReq = param1;
         ServerEngine.ins.send(4234,param1,serverCpl_bgGetTitleReward);
      }
      
      private function serverCpl_bgGetTitleReward(param1:ProtocolStatusRes) : void
      {
         BattlefieldModel.ins.getedDegreeRankRewardIds.push(_lastRewardReq.id);
         BattlefieldUtil.checkHasSeasonReward();
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgBattlefieldDegreeRankRewardCpl",_lastRewardReq.id));
      }
      
      private function serverCpl_friendsList(param1:BgFriendsListRes) : void
      {
         if(param1)
         {
            BattlefieldModel.ins.friendsList = param1.playerInfos;
         }
         else
         {
            BattlefieldModel.ins.friendsList = [];
         }
      }
      
      public function getFamilyMemberList() : void
      {
         if(GuildModel.ins.guildInfo != null)
         {
            BattlefieldModel.ins.memberListReady = false;
            ServerEngine.ins.send(4215,null,serverCpl_memberList);
         }
         else
         {
            BattlefieldModel.ins.familyMemList = [];
         }
      }
      
      private function serverCpl_memberList(param1:BgFamilyMemberListRes) : void
      {
         if(param1)
         {
            BattlefieldModel.ins.familyMemList = param1.playerInfos;
         }
         else
         {
            BattlefieldModel.ins.familyMemList = [];
         }
      }
      
      private function serverCpl_onInvited(param1:TeamInvitedNotify) : void
      {
         if(param1.kind == 16)
         {
            BattlefieldModel.ins.addInvitedNotify(param1);
            ObserverMgr.ins.sendNotice("msg_new_bottom_msg",new BottomMsgVo(12,null));
         }
      }
      
      private function serverCpl_onKick(param1:TeamKickNotify) : void
      {
         if(param1.kind == 16)
         {
            BattlefieldModel.ins.removeMem(param1.playerId,true);
         }
      }
      
      private function serverCpl_onLeave(param1:TeamLeaveNotify) : void
      {
         if(param1.kind == 16)
         {
            if(param1.newCaptainId)
            {
               BattlefieldModel.ins.curLeaderId = param1.newCaptainId;
            }
            BattlefieldModel.ins.removeMem(param1.playerId);
         }
      }
      
      private function serverCpl_onMemInfoNotify(param1:TeamMemInfoNotify) : void
      {
         if(param1.info.kind == 16)
         {
            BattlefieldModel.ins.memInfos = param1.info.all;
            BattlefieldModel.ins.curLeaderId = param1.info.leader;
            BattlefieldModel.ins.curTeamId = param1.info.id;
            BattlefieldModel.ins.removeInvitedNotify(param1.info.id);
            BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgBattlefieldCreateTeamCpl"));
            ModuleMgr.ins.showModule(50501,BattlefieldModel.ins.memInfos,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      private function serverCpl_onTeamStopNotify(param1:TeamStopNotify) : void
      {
         BattlefieldModel.ins.regStamp = 0;
         ObserverMgr.ins.sendNotice("msgSwitchMinimapCountDown",new SwitchModuleTimerMsg(50500,0,0));
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgBattlefieldExitCpl"));
      }
      
      private function serverCpl_bgStageEnterNotify(param1:BgStageEnterNotify) : void
      {
         BattlefieldModel.ins.clearLastFightData();
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(50500,false));
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MINIMAP_EFFECT_VISIBLE",new SwitchModuleEffMsg(50500,false));
         var _loc4_:int = 0;
         var _loc3_:* = param1.playerInfos;
         for each(var _loc2_ in param1.playerInfos)
         {
            BattlefieldModel.ins.bgStagePlayers.put(Uint64Util.toString(_loc2_.playerInfo.baseInfo.id),_loc2_);
         }
         BattlefieldModel.ins.clearData();
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgBattlefieldEnterScene"));
         ModuleMgr.ins.showModule(50507,BattlefieldModel.ins.curBattlefieldId);
      }
      
      public function battlefieldCheck() : void
      {
         ServerEngine.ins.send(4211,null,serverCpl_bgCheck);
      }
      
      private function serverCpl_bgCheck(param1:BgCheckRes) : void
      {
         if(param1.inBg)
         {
            AlertUtil.comfirm(LocaleMgr.ins.getStr(50500055),confirmBack,refuseBack);
         }
      }
      
      public function getRankList(param1:BgGetRankInfoReq) : void
      {
         ServerEngine.ins.send(4236,param1,serverCpl_bgGetRankInfo);
      }
      
      private function serverCpl_bgGetRankInfo(param1:BgGetRankInfoRes) : void
      {
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgBattlefieldGetRankPageCpl",param1));
      }
      
      private function confirmBack() : void
      {
         acceptBattlefield(true);
      }
      
      private function refuseBack() : void
      {
         acceptBattlefield(false);
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
   }
}
