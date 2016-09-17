package nslm2.modules.funnies.teamGuajiScenes
{
   import game.ui.teamGuajiScenes.TeamGuajiSceneUI;
   import nslm2.modules.dungeons.scripts.IScriptBox;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideCheckHandler;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideGetComp;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideGetCompParent;
   import nslm2.modules.funnies.teamGuajiScenes.mains.CurChallengePanel;
   import nslm2.modules.funnies.teamGuajiScenes.mains.InfoPanel;
   import nslm2.modules.scenes.commons.SceneModel;
   import com.mz.core.utils.DictHash;
   import nslm2.modules.funnies.teamGuajiScenes.team.TeamMemberPlayer;
   import nslm2.modules.funnies.teamGuajiScenes.ctrl.TeamGuajiPlayerAutoRandomActionCtrl;
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import nslm2.modules.funnies.teamGuajiScenes.subpalaceBoss.SubpalaceBossUnit3D;
   import nslm2.modules.funnies.teamGuajiScenes.ctrl.TeamFollowerCtr;
   import nslm2.common.ui.components.comps2d.others.TaskAlertRenderS2;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.MainToolBarChangeMsg;
   import nslm2.common.globals.GlobalRef;
   import nslm2.modules.funnies.teamGuajiScenes.vo.TeamGuaJiParam;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.foundations.vip.view.VipHintBox;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.TimeUtils;
   import nslm2.modules.funnies.teamGuajiScenes.mini.TeamGuajiMiniPanel;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import nslm2.common.service.CrossSeverScenceService;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.foundations.FloatBubbleUtil;
   import away3d.events.MouseEvent3D;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcGuajiVo;
   import nslm2.utils.WealthUtil;
   import nslm2.common.event.WealthChangeEvent;
   import proto.GuajiBossFightStartRes;
   import nslm2.modules.funnies.teamGuajiScenes.subpalaceBoss.SubpalaceBossDungeonVo;
   import nslm2.modules.funnies.teamGuajiScenes.vo.GuajiHisVo;
   import nslm2.modules.funnies.teamGuajiScenes.model.TeamGuajiModel;
   import flash.geom.Point;
   import proto.GuajiInfoRes;
   import nslm2.utils.ServerTimer;
   import com.greensock.TweenLite;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import proto.GuajiSwitchReq;
   import nslm2.modules.funnies.teamGuajiScenes.mains.BuyGuajiEnergy;
   import proto.ProtocolStatusRes;
   import proto.TeamInfo;
   import proto.TeamMemberState;
   import com.mz.core.event.MzEvent;
   import proto.ScenePlayerInfo;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.scenes.commons.ScenePlayer3D;
   import flash.events.Event;
   import com.netease.protobuf.UInt64;
   import proto.GuajiSwitchNotify;
   import proto.GuajiInfoNotify;
   import proto.GuajiReport;
   import nslm2.mgrs.stcMgrs.vos.StcNpcGroupVo;
   import proto.GuajiFightStNotify;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   import proto.GuajiRewardDispNotify;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import nslm2.common.uiEffects.ListIconFlyEff;
   import morn.customs.components.WealthRender;
   import nslm2.common.uiEffects.FlyTarget;
   import nslm2.modules.foundations.mainToolBar.MainBottomIconModule;
   import com.mz.core.components.comp2d.BlackRim;
   import com.greensock.TimelineLite;
   import proto.GuajiGetBagInfoRes;
   import com.mz.core.configs.ClientConfig;
   import proto.CrossSceneWatchRes;
   import proto.CrossSceneEnterNotify;
   import com.mz.core.utils.MathUtil;
   import proto.CrossSceneLeaveNotify;
   import com.mz.core.interFace.IDispose;
   import nslm2.modules.dungeons.scripts.comps.ScriptCmdEffect3DView;
   import away3d.containers.ObjectContainer3D;
   import nslm2.modules.fightPlayer.UnitView;
   import morn.core.components.Component;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import nslm2.modules.footstones.newerGuideModules.NGCompForUnit3D;
   import nslm2.modules.scenes.commons.SceneNpc3D;
   import com.mz.core.logging.Log;
   import nslm2.modules.footstones.tooltipsModules.TooltipUtils;
   
   public class TeamGuajiScene extends TeamGuajiSceneUI implements IScriptBox, INewerGuideCheckHandler, INewerGuideGetComp, INewerGuideGetCompParent
   {
      
      private static const FIGHT_TIME:int = 6;
      
      private static const FIGHT_REST_TIME:int = 2;
      
      private static const AUTO_RUN_DELAY:int = 5;
       
      
      private var sdEff:nslm2.modules.funnies.teamGuajiScenes.TeamGuajiSaodangEffect;
      
      private var otherPlayMoveCtrlDic:DictHash;
      
      private var rolePlayer:TeamMemberPlayer;
      
      private var playerRandomCtrl:TeamGuajiPlayerAutoRandomActionCtrl;
      
      public var scene:Scene45Base;
      
      public var boss:SubpalaceBossUnit3D;
      
      private var teamCtr:TeamFollowerCtr;
      
      private var _taskAlertRender:TaskAlertRenderS2;
      
      private var gateImg:Image3D;
      
      private var gateEff:Object;
      
      private var teamMembersDic:DictHash;
      
      private var teamMemberIDs:Array;
      
      private var _rim:BlackRim;
      
      private var ngFakeComp2D:NGCompForUnit3D;
      
      public function TeamGuajiScene()
      {
         boss = new SubpalaceBossUnit3D();
         gateEff = {};
         teamMemberIDs = [];
         super();
         ObserverMgr.ins.regObserver(this);
         otherPlayMoveCtrlDic = new DictHash();
         list_member.dataSource = [null,null];
         helpView.toolTip = LocaleMgr.ins.getStr(41210014);
         TooltipUtils.preventHideByMouseDown(helpView);
      }
      
      public function get curChallengePanel() : CurChallengePanel
      {
         return this.curChallengePanelUI as CurChallengePanel;
      }
      
      public function get infoPanel() : InfoPanel
      {
         return this.infoPanelUI as InfoPanel;
      }
      
      public function get service() : TeamGuajiService
      {
         return TeamGuajiService.ins;
      }
      
      private function get model() : SceneModel
      {
         return SceneModel.ins;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         ModuleMgr.ins.staticLayer.closeAll([10430]);
         ModuleMgr.ins.showModule(10400);
         ModuleMgr.ins.showModule(10500);
         ObserverMgr.ins.sendNotice("msg_main_tool_bar_id",new MainToolBarChangeMsg(MainToolBarChangeMsg.TEAM_GUAJI_moduleIdArr,[],true,false));
         ObserverMgr.ins.sendNotice("msg_update_icon_bar_visible",false);
         GlobalRef.bottomModuleBtns.expBar.visible = true;
         GlobalRef.bottomModuleBtns.btnRecharge.visible = true;
         var _loc2_:TeamGuaJiParam = param1 as TeamGuaJiParam;
         if(_loc2_)
         {
            if(_loc2_.roomId >= 0)
            {
               teamGuajiInviteHandler(_loc2_.roomId);
            }
         }
         init3D();
         playerRandomCtrl = new TeamGuajiPlayerAutoRandomActionCtrl();
         sdEff = new nslm2.modules.funnies.teamGuajiScenes.TeamGuajiSaodangEffect(this.infoPanel.txt_state);
         this.infoPanel.label_buff.text = LocaleMgr.ins.getStr(30100344,[int(VipModel.ins.getVipValue(10420))]);
         this.infoPanel.addChild(new VipHintBox(10420,112,-22));
         fightLogPanel.visible = false;
         this.infoPanel.txt_left_energy.text = LocaleMgr.ins.getStr(41210600) + PlayerModel.ins.getWealthValue(8);
         this.infoPanel.txt_left_energy.mouseEnabled = true;
         this.infoPanel.txt_left_energy.selectable = false;
         this.infoPanel.txt_left_energy.toolTip = LocaleMgr.ins.getStr(41210619);
         this.infoPanel.txt_left_time.text = LocaleMgr.ins.getStr(41210141,[TimeUtils.getSimpleTimeStr1(TeamGuajiMiniPanel.getCanGuajiTime())]);
         this.infoPanel.btn_buyStamina.x = this.infoPanel.txt_left_energy.x + this.infoPanel.txt_left_energy.width + 10;
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         CrossSeverScenceService.requestSceneWatch(DefindConsts.TEAM_GUAJI_STAGE_ID,addOtherPlayers);
         if(NGUtil.checkModuleShow(this.moduleId,this) == false)
         {
            if(FloatBubbleUtil.needShow(1120))
            {
               if(_taskAlertRender == null)
               {
                  _taskAlertRender = new TaskAlertRenderS2();
                  _taskAlertRender.img_bg.scaleX = -1;
                  _taskAlertRender.x = 389;
                  _taskAlertRender.show(1120);
               }
               FloatBubbleUtil.addOneTime(1120.toString());
               this.infoPanel.label_buff.addChild(_taskAlertRender);
            }
            else if(_taskAlertRender)
            {
               _taskAlertRender.dispose();
               _taskAlertRender = null;
            }
         }
         var _loc2_:TeamGuaJiParam = param1 as TeamGuaJiParam;
         if(_loc2_)
         {
            if(_loc2_.showRobPanel)
            {
               ModuleMgr.ins.showModule(41219,null,ModuleMgr.ins.popLayer.curModuleId);
            }
         }
      }
      
      protected function gateClickHandler(param1:MouseEvent3D) : void
      {
         ModuleMgr.ins.showModule(41211);
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            this.infoPanel.btn_do.addEventListener("click",onBtnFightStartClick);
            this.infoPanel.btn_qiangduo.addEventListener("click",onBtnQiangDuoClick);
            this.infoPanel.cb_atuo.addEventListener("change",onAutoTeamChange);
            this.infoPanel.btn_buyStamina.addEventListener("click",buyStamina);
            TeamGuajiService.ins.addEventListener("EVT_GUAJI_INFO_NOTIFY",guajiInfoNotifyHandler);
            TeamGuajiService.ins.addEventListener("EVT_TEAM_GUAJI_FIGHT_NOTIFY",teamGuajiFightNotify);
            TeamGuajiService.ins.addEventListener("EVT_GUAJI_REWARD_DISPLAY_NOTIFY",guajiRewardDispNotify);
            TeamGuajiService.ins.addEventListener("EVT_TEAM_ENTER_NOTIFY",teamEnterNotifyHandler);
            TeamGuajiService.ins.addEventListener("EVT_TEAM_DELETE_NOTIFY",teamRemoveNotifyHandler);
            TeamGuajiService.ins.addEventListener("EVT_TEAM_KICKOUT_NOTIFY",teamRemoveNotifyHandler);
            TeamGuajiService.ins.addEventListener("evt_team_dissmiss",teamDissmissHandler);
            UIMgr.stage.addEventListener("deactivate",onDeActive);
            UIMgr.stage.addEventListener("activate",onActive);
            ServerEngine.ins.addAlwayHandler(3036,otherPlyerEnterHandler);
            ServerEngine.ins.addAlwayHandler(3037,otherPlyerLeaveHandler);
            this.scene.multiBgLayer.addEventListener("mouseDown3d",img3d_onMouseDown);
         }
         else
         {
            this.infoPanel.btn_do.removeEventListener("click",onBtnFightStartClick);
            this.infoPanel.btn_qiangduo.removeEventListener("click",onBtnQiangDuoClick);
            this.infoPanel.cb_atuo.removeEventListener("change",onAutoTeamChange);
            this.infoPanel.btn_buyStamina.removeEventListener("click",buyStamina);
            TeamGuajiService.ins.removeEventListener("EVT_GUAJI_INFO_NOTIFY",guajiInfoNotifyHandler);
            TeamGuajiService.ins.removeEventListener("EVT_TEAM_GUAJI_FIGHT_NOTIFY",teamGuajiFightNotify);
            TeamGuajiService.ins.removeEventListener("EVT_GUAJI_REWARD_DISPLAY_NOTIFY",guajiRewardDispNotify);
            TeamGuajiService.ins.removeEventListener("EVT_TEAM_ENTER_NOTIFY",teamEnterNotifyHandler);
            TeamGuajiService.ins.removeEventListener("EVT_TEAM_DELETE_NOTIFY",teamRemoveNotifyHandler);
            TeamGuajiService.ins.removeEventListener("EVT_TEAM_KICKOUT_NOTIFY",teamRemoveNotifyHandler);
            TeamGuajiService.ins.removeEventListener("evt_team_dissmiss",teamDissmissHandler);
            UIMgr.stage.removeEventListener("deactivate",onDeActive);
            UIMgr.stage.removeEventListener("activate",onActive);
            ServerEngine.ins.removeAlwayHandler(3036,otherPlyerEnterHandler);
            ServerEngine.ins.removeAlwayHandler(3037,otherPlyerLeaveHandler);
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["CHANGE_CHALLENGE_NANDU","wealthChange","msg_player_hero_run","KILL_BOSS","accepct_invite","update_team_member_list"],"guaji_change_guaji_status");
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         super.handleNotices(param1,param2);
         var _loc6_:* = param1;
         if("CHANGE_CHALLENGE_NANDU" !== _loc6_)
         {
            if("wealthChange" !== _loc6_)
            {
               if("KILL_BOSS" !== _loc6_)
               {
                  if("accepct_invite" !== _loc6_)
                  {
                     if("update_team_member_list" !== _loc6_)
                     {
                        if("guaji_change_guaji_status" === _loc6_)
                        {
                           updateTeamMemberList(param2);
                        }
                     }
                     else
                     {
                        updateTeamMemberList();
                     }
                  }
               }
               else
               {
                  _loc5_ = TeamGuajiService.ins.sceneInfo.curGuajiId;
                  if(_loc5_ == 99)
                  {
                     killBossNow();
                     return;
                  }
                  playerRandomCtrl.stop();
                  scene.autoTrack(param2);
               }
               service.getTeamInfo(initGuajiTeamInfo);
            }
            else
            {
               _loc4_ = param2 as WealthChangeEvent;
               if(_loc4_.wealthType == 8)
               {
                  this.infoPanel.txt_left_energy.text = LocaleMgr.ins.getStr(41210600) + (param2 as WealthChangeEvent).value;
                  this.infoPanel.txt_left_time.text = LocaleMgr.ins.getStr(41210141,[TimeUtils.getSimpleTimeStr1(TeamGuajiMiniPanel.getCanGuajiTime())]);
                  this.infoPanel.btn_buyStamina.x = this.infoPanel.txt_left_energy.x + this.infoPanel.txt_left_energy.width + 10;
               }
            }
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(41210036,[LocaleMgr.ins.getStr(41210800 + param2)]));
            _loc3_ = StcMgr.ins.getGuajiVo(param2);
            this.curChallengePanel.list.array = WealthUtil.costStrToArr(_loc3_.client_drop_desc);
            curChallengePanel.update(TeamGuajiService.ins.sceneInfo);
            setChallengePanelTitle(param2);
            teamChangeGuajiNandu_blackScreen();
            addSceneBoss(TeamGuajiService.ins.sceneInfo);
         }
      }
      
      private function killBossNow() : void
      {
         TeamGuajiService.ins.requestChallengBoss(killBoss,null);
      }
      
      private function killBoss(param1:GuajiBossFightStartRes) : void
      {
         var _loc2_:* = null;
         _loc2_ = StcMgr.ins.getGuajiVo(99);
         var _loc3_:SubpalaceBossDungeonVo = new SubpalaceBossDungeonVo(_loc2_.btl_stage_id,_loc2_.boss_group_id);
         ModuleMgr.ins.showModule(41215,{
            "vo":_loc3_,
            "res":param1
         });
      }
      
      private function init3D() : void
      {
         this.scene = new Scene45Base();
         this.scene.useFullScreen = true;
         this.scene.init(this.moduleId,DefindConsts.TEAM_GUAJI_STAGE_ID,initHandler);
         this.addChild(this.scene);
      }
      
      private function initHandler() : void
      {
         TeamGuajiService.ins.server_get_guajiInfo(get_guajiInfo_cpl);
         TeamGuajiService.ins.server_get_guajiBag(get_guajiBag_cpl);
         var _loc1_:GuajiHisVo = this.moduleInfo.historyParam;
         if(_loc1_)
         {
            this.scene.playerHero.pos2d = _loc1_.playerPos;
            if(_loc1_.showRobModule)
            {
               ModuleMgr.ins.showModule(41219);
               TeamGuajiModel.ins.showRobPanel = false;
            }
            if(_loc1_.showLogModule)
            {
               ModuleMgr.ins.showModule(50900,41222);
               TeamGuajiModel.ins.showLogPanel = false;
            }
         }
         else
         {
            this.scene.playerHero.pos2d = new Point(2000,1000);
         }
         this.scene.playerMoveCtrl.isActived = true;
         this.scene.playerMoveCtrl.needSendMsg = false;
         rolePlayer = new TeamMemberPlayer(this.scene.playerHero);
      }
      
      private function get_guajiInfo_cpl(param1:GuajiInfoRes) : void
      {
         this.playerRandomCtrl.bind(rolePlayer,this.scene);
         TeamGuajiModel.ins.guajiLogArr = param1.reports;
         service.initTeamType(15);
         service.getTeamInfo(initGuajiTeamInfo);
         if(param1.startFight)
         {
            startGuaji();
         }
         TeamGuajiModel.ins.isGuaji = param1.startFight;
         this.curChallengePanel.update(param1);
         updateInfoPanel(param1);
         addSceneBoss(param1);
         setChallengePanelTitle(param1.curGuajiId);
         TeamGuajiService.ins.getGotScoreRewardId();
         this.preShowCpl();
      }
      
      private function updateInfoPanel(param1:GuajiInfoRes) : void
      {
         this.infoPanel.cb_atuo.selected = param1.autoTeam;
         var _loc2_:int = param1.gjSpeed;
         _loc2_ = _loc2_ > 60?60:_loc2_;
         this.infoPanel.txt_kill.text = LocaleMgr.ins.getStr(41210117,[_loc2_]);
         if(param1.startFight)
         {
            this.infoPanel.txt_state.visible = true;
         }
         else
         {
            this.infoPanel.txt_state.visible = false;
         }
         updateBtnStatus();
      }
      
      private function server_fight_start_cpl() : void
      {
         startGuaji();
      }
      
      private function startGuaji() : void
      {
         TeamGuajiModel.ins.isGuaji = true;
         sdEff.start(ServerTimer.ins.second,LocaleMgr.ins.getStr(41210128));
         this.infoPanel.txt_state.visible = true;
         updateBtnStatus();
         this.infoPanel.info_box.y = 36;
         if(ModuleMgr.ins.isShow(41212))
         {
            TweenLite.to(ModuleMgr.ins.getModule(41212),0.3,{"x":UIMgr.gameWidth - 390});
         }
         else
         {
            ModuleMgr.ins.showModule(41212,true);
         }
         TweenLite.delayedCall(1,restartRandomRun);
         ObserverMgr.ins.sendNotice("TEAM_GUAJI_START");
         CrossSeverScenceService.requestSceneEnter(DefindConsts.TEAM_GUAJI_STAGE_ID);
         TeamGuajiService.ins.sceneInfo.startFight = true;
         fightLogPanel.visible = true;
         fightLogPanel.list_log.dataSource = TeamGuajiModel.ins.guajiLogArr;
      }
      
      private function stopGuaji() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = 0;
         this.scene.playerHero.tag3DVBox.hideGuajiSaoDang();
         sdEff.stop();
         this.infoPanel.info_box.y = 20;
         this.infoPanel.txt_state.visible = false;
         TeamGuajiModel.ins.isGuaji = false;
         TeamGuajiService.ins.sceneInfo.startFight = false;
         this.playerRandomCtrl.stop();
         ObserverMgr.ins.sendNotice("TEAM_GUAJI_STOP");
         if(ModuleMgr.ins.isShow(41212))
         {
            _loc2_ = ModuleMgr.ins.getModule(41212);
            _loc1_ = UIMgr.gameWidth - _loc2_.width >> 1;
            TweenLite.to(_loc2_,0.3,{"x":_loc1_});
         }
         updateBtnStatus();
         fightLogPanel.visible = false;
      }
      
      private function server_fight_end_cpl() : void
      {
         CrossSeverScenceService.requestSceneLeave(DefindConsts.TEAM_GUAJI_STAGE_ID);
         stopGuaji();
      }
      
      private function onBtnQiangDuoClick(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(41219);
      }
      
      private function onBtnFightStartClick(param1:MouseEvent) : void
      {
         var _loc2_:GuajiSwitchReq = new GuajiSwitchReq();
         if(TeamGuajiModel.ins.isGuaji)
         {
            _loc2_.isFight = false;
            _loc2_.isAutoTeam = this.infoPanel.cb_atuo.selected;
            service.server_fight_start(_loc2_,server_fight_end_cpl);
         }
         else
         {
            if(PlayerModel.ins.getWealthValue(8) < DefindConsts.GUAJI_JINGLI_COST)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(41300252));
               AlertUtil.comfirm(new BuyGuajiEnergy());
               return;
            }
            _loc2_.isFight = true;
            _loc2_.isAutoTeam = this.infoPanel.cb_atuo.selected;
            service.server_fight_start(_loc2_,server_fight_start_cpl,startErrorHandler);
         }
      }
      
      private function startErrorHandler(param1:ProtocolStatusRes) : void
      {
         if(param1.cmd == 300008312)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(300008312));
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(41300252));
            AlertUtil.comfirm(new BuyGuajiEnergy());
         }
      }
      
      private function initGuajiTeamInfo() : void
      {
         initTeamMember(service.curPlayerTeamInfo);
      }
      
      private function initTeamMember(param1:TeamInfo) : void
      {
         if(!teamMembersDic)
         {
            teamMembersDic = new DictHash();
         }
         if(param1 && param1.all)
         {
            var _loc4_:int = 0;
            var _loc3_:* = param1.all;
            for each(var _loc2_ in param1.all)
            {
               addTeamMember(_loc2_);
            }
         }
      }
      
      private function teamEnterNotifyHandler(param1:MzEvent) : void
      {
         var _loc2_:TeamMemberState = param1.data;
         if(PlayerModel.ins.isCurPlayer(_loc2_.mem.player.id))
         {
            TweenLite.delayedCall(0.6,initTeamMemberAfterNofity);
         }
         else
         {
            addTeamMember(_loc2_);
            updateTeamMemberList();
         }
      }
      
      private function initTeamMemberAfterNofity() : void
      {
         if(service.curPlayerTeamInfo)
         {
            initTeamMember(service.curPlayerTeamInfo);
         }
         else
         {
            service.getTeamInfo(initGuajiTeamInfo);
         }
      }
      
      private function addTeamMember(param1:TeamMemberState) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:* = null;
         if(!param1 || !param1.mem || !param1.mem.player)
         {
            return;
         }
         var _loc3_:ScenePlayerInfo = new ScenePlayerInfo();
         _loc3_.baseInfo = param1.mem.player;
         if(!PlayerModel.ins.isCurPlayer(param1.mem.player.id))
         {
            _loc5_ = Uint64Util.toString(param1.mem.player.id);
            if(!teamMembersDic.getValue(_loc5_))
            {
               if(!scene)
               {
                  return;
               }
               scene.removeOtherRole(_loc3_.baseInfo.id);
               _loc2_ = scene.addOtherRole(_loc3_,true,true);
               _loc4_ = new TeamMemberPlayer(_loc2_);
               if(!teamCtr)
               {
                  teamCtr = new TeamFollowerCtr();
                  teamCtr.addMember(rolePlayer);
               }
               teamCtr.addMember(_loc4_);
               teamMembersDic.put(Uint64Util.toString(param1.mem.player.id),_loc4_);
               teamMemberIDs.push(param1.mem.player.id);
            }
         }
      }
      
      protected function teamDissmissHandler(param1:Event) : void
      {
         removeTeam();
         updateTeamMemberList();
      }
      
      protected function teamRemoveNotifyHandler(param1:MzEvent) : void
      {
         var _loc2_:TeamMemberState = param1.data;
         if(_loc2_)
         {
            removeTeamMember(_loc2_.mem.player.id);
         }
         else
         {
            removeTeam();
         }
         updateTeamMemberList();
      }
      
      private function removeTeam() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = teamMemberIDs;
         for each(var _loc1_ in teamMemberIDs)
         {
            removeTeamMember(_loc1_);
         }
         if(teamCtr)
         {
            teamCtr.dispose();
            teamCtr = null;
         }
         teamMemberIDs = [];
      }
      
      public function removeTeamMember(param1:UInt64) : void
      {
         var _loc3_:String = Uint64Util.toString(param1);
         var _loc2_:TeamMemberPlayer = teamMembersDic.getValue(_loc3_);
         if(_loc2_)
         {
            teamCtr.removeMember(_loc2_);
            _loc2_.dispose();
            _loc2_ = null;
         }
         scene.removeOtherRole(param1);
         teamMembersDic.remove(_loc3_);
      }
      
      private function updateTeamMemberList(param1:GuajiSwitchNotify = null) : void
      {
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:* = null;
         var _loc2_:Array = TeamGuajiService.ins.teamMems.concat();
         if(_loc2_.length > 1)
         {
            _loc4_ = _loc2_.length;
            _loc6_ = _loc4_ - 1;
            while(_loc6_ >= 0)
            {
               _loc3_ = _loc2_[_loc6_];
               if(PlayerModel.ins.isCurPlayer(_loc3_.mem.player.id))
               {
                  _loc2_.splice(_loc6_,1);
                  break;
               }
               _loc6_--;
            }
            while(_loc2_.length < 3)
            {
               _loc2_.push(null);
            }
         }
         else
         {
            _loc2_ = [null,null];
         }
         if(param1)
         {
            var _loc8_:int = 0;
            var _loc7_:* = _loc2_;
            for each(var _loc5_ in _loc2_)
            {
               if(_loc5_ && Uint64Util.equal(_loc5_.mem.player.id,param1.id))
               {
                  _loc5_.mem.guajiInfo.isStartFight = param1.isStartFight;
               }
            }
         }
         list_member.dataSource = _loc2_;
      }
      
      private function guajiInfoNotifyHandler(param1:MzEvent) : void
      {
         var _loc2_:GuajiInfoNotify = param1.data as GuajiInfoNotify;
         this.playerRandomCtrl.stop();
         this.scene.playerHero.tag3DVBox.showGuajiSaoDang(LocaleMgr.ins.getStr(999000460),16723968);
         TweenLite.delayedCall(6,delayCall,[param1]);
         this.infoPanel.txt_kill.text = LocaleMgr.ins.getStr(41210117,[_loc2_.gjSpeed]);
      }
      
      private function delayCall(param1:MzEvent) : void
      {
         this.scene.playerHero.tag3DVBox.hideGuajiSaoDang();
         if(!TeamGuajiModel.ins.isGuaji)
         {
            return;
         }
         TweenLite.delayedCall(2,setRandomMove);
         TeamGuajiModel.ins.addGuajiLog(param1.data.report as GuajiReport);
         fightLogPanel.list_log.dataSource = TeamGuajiModel.ins.guajiLogArr;
         ObserverMgr.ins.sendNotice("guaji_update_reward_bag");
      }
      
      private function setRandomMove() : void
      {
         this.playerRandomCtrl.start();
      }
      
      private function addSceneBoss(param1:GuajiInfoRes) : void
      {
         var _loc2_:* = null;
         if(param1.maxPassedGuajiId != 0)
         {
            if(param1.curGuajiId != param1.maxPassedGuajiId + 1)
            {
               boss.dispose();
               return;
            }
         }
         if(param1.maxPassedGuajiId == 0)
         {
            _loc2_ = StcMgr.ins.getGuajiVo(99);
         }
         else
         {
            _loc2_ = StcMgr.ins.getGuajiVo(param1.maxPassedGuajiId + 1);
         }
         var _loc3_:StcNpcGroupVo = StcMgr.ins.getNpcGroupVo(_loc2_.boss_group_id);
         boss = this.scene.addSubpalaceBoss(_loc3_.display_npc,_loc2_.boss_group_id,_loc2_.btl_stage_id);
         boss.tag3DVBox.initName(LocaleMgr.ins.getStr(int(_loc3_.name)),16046112);
      }
      
      private function teamGuajiFightNotify(param1:MzEvent) : void
      {
         if(!(param1.data as GuajiFightStNotify).isFight)
         {
            stopGuaji();
            ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(999000466)));
         }
      }
      
      private function guajiRewardDispNotify(param1:MzEvent) : void
      {
         TweenLite.delayedCall(6,guajiDispDelayCall,[param1]);
      }
      
      private function guajiDispDelayCall(param1:MzEvent) : void
      {
         var _loc2_:Array = WealthUtil.rewardArrToWealthVoArr((param1.data as GuajiRewardDispNotify).reward);
         FloatUtil.showGetItemsDisplayPanel(_loc2_,LocaleMgr.ins.getStr(999000467),getToTargetFromWealthRender,0,true,10420);
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(41212,true));
      }
      
      private function getToTargetFromWealthRender(param1:ListIconFlyEff, param2:WealthRender) : *
      {
         if((param2 as WealthRender).wealthVoIsEnable)
         {
            return new FlyTarget((GlobalRef.bottomModuleBtns as MainBottomIconModule).guajiRewardBag,new Point(40,40));
         }
      }
      
      private function teamGuajiInviteHandler(param1:uint) : void
      {
         ModuleMgr.ins.showModule(10624);
      }
      
      private function guajiChangeNanduNotifyHandler(param1:MzEvent) : void
      {
         addSceneBoss(param1.data);
      }
      
      private function teamChangeGuajiNandu_blackScreen() : void
      {
         _rim = new BlackRim();
         _rim.width = UIMgr.gameWidth;
         _rim.height = UIMgr.gameHeight;
         _rim.alpha = 0.7;
         _rim.draw();
         this.scene.addChildAt(_rim,0);
         var _loc1_:TimelineLite = new TimelineLite();
         _loc1_.to(_rim,0.4,{"alpha":1});
         _loc1_.to(_rim,0.4,{"alpha":0});
         _loc1_.call(callBackHandler);
      }
      
      private function callBackHandler() : void
      {
         this.scene.removeChild(_rim);
      }
      
      private function updateBtnStatus() : void
      {
         if(TeamGuajiModel.ins.isGuaji)
         {
            this.infoPanel.btn_do.label = LocaleMgr.ins.getStr(41210013);
         }
         else
         {
            this.infoPanel.btn_do.label = LocaleMgr.ins.getStr(41210012);
         }
      }
      
      public function setChallengePanelTitle(param1:int) : void
      {
         var _loc2_:String = LocaleMgr.ins.getStr(41210800 + param1);
         this.curChallengePanel.txt_tip1.text = LocaleMgr.ins.getStr(41210002) + _loc2_;
         txt_floor.text = _loc2_;
      }
      
      private function onAutoTeamChange(param1:Event) : void
      {
         var _loc2_:GuajiSwitchReq = new GuajiSwitchReq();
         _loc2_.isFight = TeamGuajiModel.ins.isGuaji;
         _loc2_.isAutoTeam = this.infoPanel.cb_atuo.selected;
         service.server_auto_team(_loc2_);
      }
      
      private function get_guajiBag_cpl(param1:GuajiGetBagInfoRes) : void
      {
         if(param1)
         {
            if(param1.rwd && param1.rwd.length > 0)
            {
               ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(41212,true));
            }
         }
      }
      
      protected function buyStamina(param1:MouseEvent) : void
      {
         AlertUtil.comfirm(new BuyGuajiEnergy());
      }
      
      protected function img3d_onMouseDown(param1:MouseEvent3D) : void
      {
         TweenLite.killDelayedCallsTo(restartRandomRun);
         var _loc2_:Point = scene.lookAtPos2d;
         var _loc3_:Point = new Point(param1.screenX - ClientConfig.SCENE_FIXED_W / 2 + _loc2_.x,param1.screenY - ClientConfig.SCENE_FIXED_H / 2 + _loc2_.y);
         rolePlayer.run(_loc3_.x,_loc3_.y);
         if(TeamGuajiModel.ins.isGuaji)
         {
            TweenLite.delayedCall(5,restartRandomRun);
            playerRandomCtrl.playing = false;
         }
      }
      
      private function restartRandomRun() : void
      {
         if(TeamGuajiModel.ins.isGuaji)
         {
            if(playerRandomCtrl)
            {
               playerRandomCtrl.start();
            }
         }
      }
      
      private function addOtherPlayers(param1:CrossSceneWatchRes) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc4_:int = 0;
         var _loc3_:* = param1.player;
         for each(var _loc2_ in param1.player)
         {
            addOtherPlayer(_loc2_);
         }
      }
      
      private function otherPlyerEnterHandler(param1:CrossSceneEnterNotify) : void
      {
         addOtherPlayer(param1.player);
      }
      
      private function addOtherPlayer(param1:ScenePlayerInfo) : void
      {
         var _loc2_:* = null;
         if(!scene)
         {
            return;
         }
         scene.removeOtherRole(param1.baseInfo.id);
         var _loc3_:ScenePlayer3D = scene.addOtherRole(param1,true,true);
         if(_loc3_)
         {
            _loc3_.pos2d = new Point(MathUtil.randomInt(800,2500),MathUtil.randomInt(500,1200));
            _loc2_ = new TeamGuajiPlayerAutoRandomActionCtrl();
            _loc2_.bind(new TeamMemberPlayer(_loc3_),scene);
            _loc2_.start();
            otherPlayMoveCtrlDic.put(Uint64Util.toString(param1.baseInfo.id),_loc2_);
         }
      }
      
      private function otherPlyerLeaveHandler(param1:CrossSceneLeaveNotify) : void
      {
         var _loc2_:TeamGuajiPlayerAutoRandomActionCtrl = otherPlayMoveCtrlDic.getValue(Uint64Util.toString(param1.playerId));
         if(_loc2_)
         {
            _loc2_.dispose();
            _loc2_ = null;
         }
         scene.removeOtherRole(param1.playerId);
      }
      
      protected function onActive(param1:Event) : void
      {
         if(TeamGuajiModel.ins.isGuaji)
         {
            if(playerRandomCtrl)
            {
               playerRandomCtrl.start();
            }
         }
      }
      
      protected function onDeActive(param1:Event) : void
      {
         if(playerRandomCtrl)
         {
            playerRandomCtrl.stop();
         }
      }
      
      override public function getHistoryParam() : *
      {
         var _loc1_:GuajiHisVo = new GuajiHisVo();
         if(rolePlayer)
         {
            _loc1_.playerPos = rolePlayer.player.pos2d;
         }
         _loc1_.showRobModule = TeamGuajiModel.ins.showRobPanel;
         _loc1_.showLogModule = TeamGuajiModel.ins.showLogPanel;
         return _loc1_;
      }
      
      override public function preClose(param1:Object = null) : void
      {
         this.scene.multiBgLayer.removeEventListener("mouseDown3d",img3d_onMouseDown);
         if(this.scene.playerMoveCtrl)
         {
            this.scene.playerMoveCtrl.needSendMsg = true;
            this.scene.playerMoveCtrl.isActived = true;
         }
         this.scene.ctrl_stop = false;
         scene.dispose();
         scene = null;
         this.playerRandomCtrl.dispose();
         playerRandomCtrl = null;
         GlobalRef.bottomModuleBtns.expBar.visible = true;
         GlobalRef.bottomModuleBtns.btnRecharge.visible = true;
         TweenLite.killDelayedCallsTo(delayCall);
         TweenLite.killDelayedCallsTo(setRandomMove);
         TweenLite.killDelayedCallsTo(guajiDispDelayCall);
         TweenLite.killDelayedCallsTo(restartRandomRun);
         CrossSeverScenceService.requestSceneUnWatch(DefindConsts.TEAM_GUAJI_STAGE_ID);
         ObserverMgr.ins.sendNotice("msg_update_icon_bar_visible",true);
         if(teamCtr)
         {
            teamCtr.dispose();
            teamCtr = null;
         }
         var _loc4_:int = 0;
         var _loc3_:* = otherPlayMoveCtrlDic.array;
         for each(var _loc2_ in otherPlayMoveCtrlDic.array)
         {
            _loc2_.dispose();
            _loc2_ = null;
         }
         otherPlayMoveCtrlDic.clear();
         otherPlayMoveCtrlDic = null;
         sdEff.dispose();
         sdEff = null;
         super.preClose(param1);
      }
      
      public function addDisplay2D(param1:String, param2:DisplayObject) : void
      {
      }
      
      public function addDisplay3D(param1:String, param2:String, param3:ObjectContainer3D = null) : ScriptCmdEffect3DView
      {
         return null;
      }
      
      public function get anchorPoi() : Point
      {
         return null;
      }
      
      public function get cameraX() : int
      {
         return 0;
      }
      
      public function set cameraX(param1:int) : void
      {
      }
      
      public function createTempUnitByNpcId(param1:int, param2:String, param3:String, param4:int, param5:int, param6:int) : UnitView
      {
         return null;
      }
      
      public function deleteDisplay2D(param1:String) : void
      {
      }
      
      public function deleteDisplay3D(param1:String) : void
      {
      }
      
      public function deleteUnit(param1:String) : void
      {
      }
      
      public function getDisplay2DById(param1:String) : DisplayObject
      {
         return null;
      }
      
      public function getDisplay3DById(param1:String) : ScriptCmdEffect3DView
      {
         return null;
      }
      
      public function getUnitById(param1:String) : Array
      {
         return null;
      }
      
      public function get isBossBattle() : Boolean
      {
         return false;
      }
      
      public function get topLayer2D() : Component
      {
         return ModuleMgr.ins.dramaLayer;
      }
      
      public function ngCheck(param1:int, param2:Array, param3:StcGuideVo) : int
      {
         var _loc4_:* = null;
         if(!(int(param1) - 20022))
         {
            _loc4_ = TeamGuajiService.ins.sceneInfo;
            if(_loc4_.maxPassedGuajiId == 0)
            {
               NGUtil.gm_gotoId(param2[0]);
               return 4;
            }
            return 1;
         }
         return 1;
      }
      
      public function getCompById(param1:String, param2:StcGuideVo) : Component
      {
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc7_:int = 0;
         var _loc6_:* = null;
         var _loc8_:* = param1;
         if("stageNpcRelationId:2001" !== _loc8_)
         {
            if("btn_qiangduo" !== _loc8_)
            {
               return NGUtil.getCompById(this,param1,param2);
            }
            return this.infoPanel.btn_qiangduo;
         }
         _loc3_ = param1.split(":")[1];
         _loc5_ = this.scene.npcArr.length;
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            _loc6_ = this.scene.npcArr[_loc7_];
            if(_loc6_.npcGroupId == _loc3_)
            {
               _loc4_ = _loc6_;
               break;
            }
            _loc7_++;
         }
         if(_loc4_ == null)
         {
            Log.fatal(this,"没找到NG需要的npc","npcGroupId",_loc3_);
         }
         ngFakeComp2D = new NGCompForUnit3D(_loc4_,this.scene,76,220);
         return ngFakeComp2D;
      }
      
      public function getCompParentById(param1:StcGuideVo) : Component
      {
         var _loc2_:* = param1;
         if("stageNpcRelationId:2001" !== _loc2_)
         {
            return null;
         }
         return this.scene;
      }
   }
}
