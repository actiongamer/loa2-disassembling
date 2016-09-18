package nslm2.modules.funnies.teamPKCS.invite
{
   import game.ui.teamPKCS.invite.TPKCInviteSceneUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.ui.components.comps2d.others.RedPoint;
   import nslm2.modules.funnies.teamPKCS.TPKCModel;
   import proto.CTeamInfo;
   import proto.CTeamMemberInfo;
   import nslm2.utils.Uint64Util;
   import proto.TeamMemberState;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import proto.TeamChangeNameReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.TeamStartReq;
   import proto.CteamArenaStateRes;
   import nslm2.utils.ServerTimer;
   import org.manager.DateUtils;
   import proto.TeamReadyReq;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   import nslm2.modules.footstones.tipMenus.TipMenuMsg;
   import nslm2.modules.funnies.teams.details.TeamApplySetting;
   import com.mz.core.event.MzEvent;
   import flash.events.Event;
   import nslm2.modules.foundations.mainToolBar.MainToolBarBackMsg;
   import morn.customs.expands.MornExpandUtil;
   
   public class TPKCInviteScene extends TPKCInviteSceneUI implements IObserver
   {
       
      
      private var _scene3D:nslm2.modules.funnies.teamPKCS.invite.TPKCInviteScene3D;
      
      private var redPoint:RedPoint;
      
      private var _isready:Boolean = false;
      
      public function TPKCInviteScene()
      {
         super();
         _scene3D = new nslm2.modules.funnies.teamPKCS.invite.TPKCInviteScene3D();
         addChild(_scene3D);
         _scene3D.init();
         var _loc1_:Array = [0,btn_delete1,btn_delete2,btn_delete3,btn_delete4];
         _scene3D.del_btns = _loc1_;
         switchEventListeners(true);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         ObserverMgr.ins.regObserver(this);
         TeamGuajiService.ins.getTeamInfo(preShow);
         ObserverMgr.ins.sendNotice("main_tool_bar_back_add",new MainToolBarBackMsg(42000,this.btnBack_handler,null));
      }
      
      private function btnBack_handler() : void
      {
         onYes = function():void
         {
            leaveTeam();
            ModuleMgr.ins.closeModule(42000);
         };
         if(ui_member.visible && _isready == false)
         {
            AlertUtil.comfirm(LocaleMgr.ins.getStr(50800065),onYes);
         }
         else
         {
            ModuleMgr.ins.closeModule(42000);
         }
      }
      
      public function get model() : TPKCModel
      {
         return TPKCModel.ins;
      }
      
      public function preShow() : void
      {
         if(model.outActDay)
         {
            notOpenPanel();
            return;
         }
         this.txt_signuprequire.text = LocaleMgr.ins.getStr(50800005,model.getInvateDateParam()) + "\n" + LocaleMgr.ins.getStr(50800006);
         this.txt_teamcount.text = LocaleMgr.ins.getStr(50800010,[model.stateRes.num]);
         if(isOpenTime() && model.stateRes.state == 2)
         {
            waitForFightPanel();
            leaderFirstSignUp(model.stateRes.team);
            _scene3D.setSignUpTeam(model.stateRes.team.member);
            return;
         }
         if(isOpenTime() && model.inviteState == 3)
         {
            notOpenPanel();
            return;
         }
         if(isOpenTime())
         {
            if(hasTeam())
            {
               if(isLeader())
               {
                  leaderPanel();
               }
               else
               {
                  memberPanel();
               }
               leaderFirst(service.teamMems);
               _scene3D.setTeam(service.teamMems);
            }
            else
            {
               joinTeamPanel();
               _scene3D.setTeam(null);
            }
         }
         else
         {
            notOpenPanel();
         }
      }
      
      private function leaderFirstSignUp(param1:CTeamInfo) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         _loc4_ = 0;
         while(_loc4_ < param1.member.length)
         {
            _loc2_ = param1.member[_loc4_];
            if(Uint64Util.equal(_loc2_.info.id,param1.leader))
            {
               _loc3_ = _loc2_;
               param1.member[_loc4_] = param1.member[0];
               param1.member[0] = _loc3_;
               break;
            }
            _loc4_++;
         }
      }
      
      private function leaderFirst(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(service.curPlayerTeamInfo && service.curPlayerTeamInfo.leader)
         {
            _loc4_ = 0;
            while(_loc4_ < param1.length)
            {
               _loc2_ = param1[_loc4_] as TeamMemberState;
               if(Uint64Util.equal(_loc2_.mem.player.id,service.curPlayerTeamInfo.leader))
               {
                  _loc3_ = _loc2_;
                  param1[_loc4_] = param1[0];
                  param1[0] = _loc3_;
                  break;
               }
               _loc4_++;
            }
         }
      }
      
      public function isOpenTime() : Boolean
      {
         return model.inviteState != 0;
      }
      
      public function get service() : TeamGuajiService
      {
         return TeamGuajiService.ins;
      }
      
      public function isLeader() : Boolean
      {
         if(service.curPlayerTeamInfo && Uint64Util.equal(service.curPlayerTeamInfo.leader,PlayerModel.ins.playerInfo.id))
         {
            return true;
         }
         return false;
      }
      
      public function hasTeam() : Boolean
      {
         if(service.teamMems.length != 0)
         {
            return true;
         }
         return false;
      }
      
      private function waitForFightPanel() : void
      {
         this.img_bg1.visible = true;
         this.txt_signuprequire.visible = true;
         this.ui_team.visible = true;
         this.img_bg2.visible = true;
         this.txt_teamcount.visible = true;
         this.ui_introduction.visible = false;
         this.ui_jointeam.visible = false;
         this.ui_leader.visible = false;
         this.ui_member.visible = false;
         this.txt_teamname.text = model.stateRes.team.name;
         var _loc3_:Number = Uint64Util.toNumber(model.stateRes.team.ability);
         var _loc2_:String = _loc3_ > 100000?LocaleMgr.ins.getStr(50800066,[int(_loc3_ / 10000)]):_loc3_ + "";
         this.txt_fightValue.text = _loc2_;
         var _loc1_:Array = model.getPreDataParam();
         this.txt_teamcount.text = LocaleMgr.ins.getStr(50800024,_loc1_) + "\n" + LocaleMgr.ins.getStr(50800010,[model.stateRes.num]);
      }
      
      private function notOpenPanel() : void
      {
         this.img_bg1.visible = false;
         this.txt_signuprequire.visible = false;
         this.ui_team.visible = false;
         this.img_bg2.visible = true;
         this.txt_teamcount.visible = true;
         this.ui_introduction.visible = true;
         this.ui_jointeam.visible = false;
         this.ui_leader.visible = false;
         this.ui_member.visible = false;
         this.img_bg_intro.skin = UrlLib.tpkcUrl("img_bg_intro.png");
         var _loc1_:Array = model.getInvateDateParam().concat(model.getPreDataParam());
         _loc1_ = _loc1_.concat(model.halfStr());
         _loc1_ = _loc1_.concat(model.finalStr());
         this.txt_0.text = LocaleMgr.ins.getStr(50800022,_loc1_);
         if(model.inviteState == 3)
         {
            this.txt_teamcount.text = LocaleMgr.ins.getStr(50800052);
         }
         else
         {
            this.txt_teamcount.text = LocaleMgr.ins.getStr(50600002);
         }
      }
      
      private function joinTeamPanel() : void
      {
         this.img_bg1.visible = true;
         this.txt_signuprequire.visible = true;
         this.ui_team.visible = false;
         this.img_bg2.visible = false;
         this.txt_teamcount.visible = false;
         this.ui_introduction.visible = false;
         this.ui_jointeam.visible = true;
         this.ui_leader.visible = false;
         this.ui_member.visible = false;
      }
      
      public function leaderPanel() : void
      {
         this.img_bg1.visible = true;
         this.txt_signuprequire.visible = true;
         this.ui_team.visible = false;
         this.img_bg2.visible = true;
         this.txt_teamcount.visible = true;
         this.ui_introduction.visible = false;
         this.ui_jointeam.visible = false;
         this.ui_leader.visible = true;
         this.ui_member.visible = false;
         this.txt_fightValue_l.text = teamFightValue.toString();
         this.txt_teamnameinput.text = service.curPlayerTeamInfo.teamname;
         this.txt_teamnameinput.textField.maxChars = 6;
         this.txt_teamnameinput.textField.restrict = "Α-￥A-Za-z0-9";
         if(TeamGuajiService.ins.curPlayerTeamInfo.applys.length > 0)
         {
            showRedPoint(true);
         }
      }
      
      private function get teamFightValue() : String
      {
         var _loc2_:int = 0;
         var _loc1_:* = 0;
         _loc2_ = 0;
         while(_loc2_ < service.teamMems.length)
         {
            _loc1_ = Number(_loc1_ + Uint64Util.toNumber(service.teamMems[_loc2_].mem.player.ability));
            _loc2_++;
         }
         return _loc1_ > 100000?LocaleMgr.ins.getStr(50800066,[int(_loc1_ / 10000)]):_loc1_ + "";
      }
      
      public function memberPanel() : void
      {
         this.img_bg1.visible = true;
         this.txt_signuprequire.visible = true;
         this.ui_team.visible = false;
         this.img_bg2.visible = true;
         this.txt_teamcount.visible = true;
         this.ui_introduction.visible = false;
         this.ui_jointeam.visible = false;
         this.ui_leader.visible = false;
         this.ui_member.visible = true;
         if(service.curPlayerTeamInfo)
         {
            this.txt_teamname_m.text = service.curPlayerTeamInfo.teamname;
            this.txt_fightValue_m.text = teamFightValue.toString();
         }
         _isready = service.findSelfMem().ready;
         if(_isready == false)
         {
            this.btn_ready.label = LocaleMgr.ins.getStr(50800025);
            this.btn_leaveteam.disabled = false;
         }
         else
         {
            this.btn_ready.label = LocaleMgr.ins.getStr(50800026);
            this.btn_leaveteam.disabled = true;
         }
      }
      
      private function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_createteam !== _loc3_)
         {
            if(this.btn_applyteam !== _loc3_)
            {
               if(this.btn_apply_list !== _loc3_)
               {
                  if(this.btn_apply_setting !== _loc3_)
                  {
                     if(this.btn_invite_friend_l !== _loc3_)
                     {
                        if(this.btn_dismiss !== _loc3_)
                        {
                           if(this.btn_sign_up !== _loc3_)
                           {
                              if(this.btn_ready !== _loc3_)
                              {
                                 if(this.btn_invite_friend_m !== _loc3_)
                                 {
                                    if(this.btn_leaveteam !== _loc3_)
                                    {
                                       if(this.btn_delete1 !== _loc3_)
                                       {
                                          if(this.btn_delete2 !== _loc3_)
                                          {
                                             if(this.btn_delete3 !== _loc3_)
                                             {
                                                if(this.btn_delete4 !== _loc3_)
                                                {
                                                   if(this.btn_changename === _loc3_)
                                                   {
                                                      onBtnChangeNameClick();
                                                      AlertUtil.float(LocaleMgr.ins.getStr(50800029));
                                                   }
                                                }
                                                else
                                                {
                                                   TeamGuajiService.ins.server_TeamKickOut(_scene3D.avatars[4].arenaPlayer.mem.player.id);
                                                }
                                             }
                                             else
                                             {
                                                TeamGuajiService.ins.server_TeamKickOut(_scene3D.avatars[3].arenaPlayer.mem.player.id);
                                             }
                                          }
                                          else
                                          {
                                             TeamGuajiService.ins.server_TeamKickOut(_scene3D.avatars[2].arenaPlayer.mem.player.id);
                                          }
                                       }
                                       else
                                       {
                                          TeamGuajiService.ins.server_TeamKickOut(service.teamMems[1].mem.player.id);
                                       }
                                    }
                                    else
                                    {
                                       leaveTeam();
                                    }
                                 }
                                 else
                                 {
                                    onBtnInviteFriendClick();
                                 }
                              }
                              else
                              {
                                 _isready = !_isready;
                                 onBtnReadyClick();
                                 if(_isready == false)
                                 {
                                    this.btn_ready.label = LocaleMgr.ins.getStr(50800025);
                                    this.btn_leaveteam.disabled = false;
                                 }
                                 else
                                 {
                                    this.btn_ready.label = LocaleMgr.ins.getStr(50800026);
                                    this.btn_leaveteam.disabled = true;
                                 }
                              }
                           }
                           else
                           {
                              onBtnSignupClick();
                           }
                        }
                        else
                        {
                           AlertUtil.float(LocaleMgr.ins.getStr(50800028));
                           service.dismissTeam();
                           service.curPlayerTeamInfo = null;
                        }
                     }
                     else
                     {
                        onBtnInviteFriendClick();
                     }
                  }
                  else
                  {
                     service.getTeamInfo(team_setting_cpl);
                  }
               }
               else
               {
                  ModuleMgr.ins.showModule(10625);
               }
            }
            else
            {
               ModuleMgr.ins.showModule(10623);
            }
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(50800027));
            service.server_TeamCreate(createTeamCpl);
         }
      }
      
      private function leaveTeam() : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(41210606));
         service.server_TeamLeave();
         service.curPlayerTeamInfo = null;
      }
      
      private function onBtnChangeNameClick() : void
      {
         teamChangeName(txt_teamnameinput.text);
      }
      
      public function teamChangeName(param1:String) : void
      {
         var _loc2_:TeamChangeNameReq = new TeamChangeNameReq();
         _loc2_.kind = TeamGuajiService.ins.teamType;
         _loc2_.teamId = TeamGuajiService.ins.curPlayerTeamInfo.id;
         _loc2_.name = param1;
         ServerEngine.ins.send(2054,_loc2_);
      }
      
      private function onBtnSignupClick() : void
      {
         if(canSignup() == true)
         {
            AlertUtil.comfirm(LocaleMgr.ins.getStr(50800021),sendReq,null,null);
         }
      }
      
      private function sendReq() : void
      {
         var _loc1_:TeamStartReq = new TeamStartReq();
         _loc1_.kind = TeamGuajiService.ins.teamType;
         ServerEngine.ins.send(2043,_loc1_);
      }
      
      private function onSignUpOk() : void
      {
         onStateRet = function(param1:CteamArenaStateRes):void
         {
            model.stateRes = param1;
            preShow();
         };
         ServerEngine.ins.send(5408,null,onStateRet);
      }
      
      private function canSignup() : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:DateUtils = ServerTimer.ins.date;
         if(_loc2_.hours < model.time_arr_invite[1] || _loc2_.hours >= model.time_arr_invite[2])
         {
            AlertUtil.float(LocaleMgr.ins.getStr(50800030,model.getInvateDateParam()));
            return false;
         }
         var _loc1_:Array = TeamGuajiService.ins.teamMems;
         if(_loc1_.length < 5)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(50800031));
            return false;
         }
         _loc3_ = 0;
         while(_loc3_ < 5)
         {
            if(!(service.curPlayerTeamInfo && Uint64Util.equal(service.curPlayerTeamInfo.leader,TeamMemberState(_loc1_[_loc3_]).mem.player.id)))
            {
               if(_loc1_[_loc3_].ready == false)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(50800032));
                  return false;
               }
            }
            _loc3_++;
         }
         return true;
      }
      
      private function onBtnReadyClick() : void
      {
         var _loc1_:TeamReadyReq = new TeamReadyReq();
         _loc1_.kind = TeamGuajiService.ins.teamType;
         _loc1_.ready = _isready;
         ServerEngine.ins.send(2040,_loc1_);
         _scene3D.setOneReady(PlayerModel.ins.playerInfo.id,_isready);
      }
      
      private function onBtnInviteFriendClick() : void
      {
         if(service.teamMems.length == 5)
         {
            ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(41210603)));
         }
         else
         {
            ObserverMgr.ins.sendNotice("MSG_TIP_MENU_SHOW",new TipMenuMsg(124,null));
         }
      }
      
      private function createTeamCpl(param1:* = null) : void
      {
         ModuleMgr.ins.closeModule(10623);
         service.getTeamInfo(refreshPanelHandler);
      }
      
      private function refreshPanelHandler() : void
      {
         preShow();
      }
      
      private function team_setting_cpl() : void
      {
         AlertUtil.alert(new TeamApplySetting(service.curPlayerTeamInfo.setting));
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            service.addEventListener("EVT_TEAM_ENTER_NOTIFY",teamEnterNotifyHandler);
            service.addEventListener("EVT_TEAM_DELETE_NOTIFY",teamRemoveNotifyHandler);
            service.addEventListener("EVT_TEAM_KICKOUT_NOTIFY",teamKickoutNotifyHandler);
            service.addEventListener("evt_team_dissmiss",dismissTeam);
            service.addEventListener("EVT_SELF_TEAM_CREATE_COMPLETE",createTeamCpl);
            service.addEventListener("EVT_TEAM_ENTER_BY_NO",createTeamCpl);
            service.addEventListener("EVT_TEAM_SOMEONE_READY",someoneReadyHandler);
            service.addEventListener("EVT_TEAM_CHANGE_NAME",changeTeamNameHandler);
            service.addEventListener("EVT_TEAM_START_NOTIFY",teamStartHandler);
         }
         else
         {
            service.removeEventListener("EVT_TEAM_ENTER_NOTIFY",teamEnterNotifyHandler);
            service.removeEventListener("EVT_TEAM_DELETE_NOTIFY",teamRemoveNotifyHandler);
            service.removeEventListener("EVT_TEAM_KICKOUT_NOTIFY",teamKickoutNotifyHandler);
            service.removeEventListener("evt_team_dissmiss",dismissTeam);
            service.removeEventListener("EVT_SELF_TEAM_CREATE_COMPLETE",createTeamCpl);
            service.removeEventListener("EVT_TEAM_ENTER_BY_NO",createTeamCpl);
            service.removeEventListener("EVT_TEAM_SOMEONE_READY",someoneReadyHandler);
            service.removeEventListener("EVT_TEAM_CHANGE_NAME",changeTeamNameHandler);
            service.removeEventListener("EVT_TEAM_START_NOTIFY",teamStartHandler);
         }
      }
      
      private function teamStartHandler(param1:MzEvent) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(50800053));
         onSignUpOk();
      }
      
      private function teamEnterNotifyHandler(param1:MzEvent) : void
      {
         if(param1.data)
         {
            _scene3D.addOne(param1.data);
            preShow();
         }
      }
      
      private function teamRemoveNotifyHandler(param1:MzEvent) : void
      {
         service.getTeamInfo(refreshPanelHandler);
      }
      
      private function dismissTeam(param1:Event) : void
      {
         refreshPanelHandler();
      }
      
      private function teamKickoutNotifyHandler(param1:MzEvent) : void
      {
         service.getTeamInfo(refreshPanelHandler);
         if(!param1.data)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(50800033));
         }
      }
      
      private function someoneReadyHandler(param1:MzEvent) : void
      {
         if(param1.data)
         {
            _scene3D.setOneReady(param1.data.playerId,param1.data.ready);
         }
      }
      
      private function changeTeamNameHandler(param1:MzEvent) : void
      {
         if(param1.data)
         {
            this.txt_teamname_m.text = param1.data.name;
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["TEAM_DETAIL_REMVOE_REDPOINT"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("TEAM_DETAIL_REMVOE_REDPOINT" === _loc3_)
         {
            showRedPoint(false);
         }
      }
      
      private function showRedPoint(param1:Boolean) : void
      {
         if(param1)
         {
            if(!redPoint)
            {
               redPoint = new RedPoint();
               redPoint.right = -2;
               redPoint.top = -2;
               btn_apply_list.addChild(redPoint);
            }
         }
         else if(redPoint)
         {
            this.btn_apply_list.removeChild(redPoint);
            redPoint = null;
         }
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.sendNotice("main_tool_bar_back_delete",new MainToolBarBackMsg(42000,this.btnBack_handler,null));
         if(_scene3D)
         {
            _scene3D.dispose();
         }
         super.dispose();
         switchEventListeners(false);
         ObserverMgr.ins.unregObserver(this);
      }
   }
}
