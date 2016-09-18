package nslm2.modules.funnies.teams.details
{
   import game.ui.teams.details.TeamDetailModuleUI;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import nslm2.common.ctrls.TSMDict;
   import proto.Reward;
   import nslm2.modules.funnies.teamGuajiScenes.counter.TeamInviteCounter;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.common.ui.components.comps2d.others.RedPoint;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.DisplayUtils;
   import flash.geom.Point;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import proto.TeamMemberState;
   import morn.customs.expands.MornExpandUtil;
   import game.ui.teams.details.TeamDetailRenderUI;
   import proto.GuajiMemberInfo;
   import nslm2.utils.WealthUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   import nslm2.modules.footstones.tipMenus.TipMenuMsg;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.event.MzEvent;
   import flash.events.Event;
   import proto.GuajiExtraRewardNotify;
   import nslm2.utils.ServerTimer;
   
   public class TeamDetailModule extends TeamDetailModuleUI
   {
      
      public static const BUTTON_STATE_LEADER:int = 0;
      
      public static const BUTTON_STATE_MEMBER:int = 1;
      
      private static var _ins:nslm2.modules.funnies.teams.details.TeamDetailModule;
       
      
      private var panel3D:UIPanel3D;
      
      private var avatarArr:Vector.<nslm2.modules.funnies.teams.details.TeamDetailUnit3D>;
      
      public var memsArray:Array;
      
      private var tsms:TSMDict;
      
      private var $reward1:Reward = null;
      
      private var $reward2:Reward = null;
      
      private var first_invite:Boolean;
      
      private var inviteCounter:TeamInviteCounter;
      
      private var $bmc:BmcSpriteSheet;
      
      private var redPoint:RedPoint;
      
      public function TeamDetailModule()
      {
         avatarArr = new Vector.<nslm2.modules.funnies.teams.details.TeamDetailUnit3D>();
         memsArray = [];
         tsms = new TSMDict();
         super();
      }
      
      public static function get ins() : nslm2.modules.funnies.teams.details.TeamDetailModule
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.teams.details.TeamDetailModule();
         }
         return _ins;
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         TeamGuajiService.ins.getTeamInfo(moduleServerCpl);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc8_:int = 0;
         var _loc4_:* = null;
         var _loc7_:* = null;
         var _loc2_:* = null;
         var _loc6_:int = 0;
         var _loc3_:* = null;
         inviteCounter = new TeamInviteCounter(this.btn_invite,btnInviteStrFormat,btnInviteCounterCpl);
         if(TeamGuajiService.ins.curPlayerTeamInfo != null)
         {
            this.txt_no.text = TeamGuajiService.ins.curPlayerTeamInfo.id.toString();
         }
         this.txt_count.text = TeamGuajiService.ins.teamMems.length.toString() + "/3";
         this.txt_tip.text = LocaleMgr.ins.getStr(41210073);
         this.panelBg.titleImgId = this.moduleId;
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(41210070);
         panel3D = new UIPanel3D(this);
         DisplayUtils.addChildAbove(panel3D,this.img_bg);
         panel3D.initByImage(img_bg,this.panelBg);
         panel3D.visible = false;
         avatarArr[0] = new nslm2.modules.funnies.teams.details.TeamDetailUnit3D();
         panel3D.addChild3D(avatarArr[0]);
         avatarArr[0].pos2d = new Point(0,-50);
         avatarArr[1] = new nslm2.modules.funnies.teams.details.TeamDetailUnit3D();
         panel3D.addChild3D(avatarArr[1]);
         avatarArr[1].pos2d = new Point(this.render1.x + 74 - this.img_bg.width / 2,-(this.render1.y - this.img_bg.height / 2 - this.img_bg.y));
         avatarArr[2] = new nslm2.modules.funnies.teams.details.TeamDetailUnit3D();
         panel3D.addChild3D(avatarArr[2]);
         avatarArr[2].pos2d = new Point(this.render2.x + 74 - this.img_bg.width / 2,-(this.render2.y - this.img_bg.height / 2 - this.img_bg.y));
         this.render1.visible = false;
         this.render2.visible = false;
         if(Uint64Util.equal(TeamGuajiService.ins.curPlayerTeamInfo.leader,PlayerModel.ins.playerInfo.id))
         {
            this.btn_quit.label = LocaleMgr.ins.getStr(999000470);
         }
         else
         {
            this.render1.btn_kick.visible = false;
            this.render2.btn_kick.visible = false;
            this.btn_applyList.visible = false;
            this.btn_invite.visible = true;
            this.btn_invite.x = this.width / 2 - btn_invite.width - 10;
            this.btn_setting.visible = false;
            this.btn_quit.label = LocaleMgr.ins.getStr(999000471);
            this.btn_quit.x = this.width / 2 + 10;
         }
         this.memsArray = TeamGuajiService.ins.teamMems;
         _loc8_ = 0;
         while(_loc8_ < TeamGuajiService.ins.teamMems.length)
         {
            if(Uint64Util.equal(PlayerModel.ins.playerInfo.id,(TeamGuajiService.ins.teamMems[_loc8_] as TeamMemberState).mem.player.id))
            {
               _loc4_ = this.memsArray[_loc8_];
               this.memsArray[_loc8_] = this.memsArray[0];
               this.memsArray[0] = _loc4_;
            }
            _loc8_++;
         }
         var _loc5_:int = TeamGuajiService.ins.teamMems.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc7_ = this.memsArray[_loc6_] as TeamMemberState;
            avatarArr[_loc6_].vo = _loc7_;
            if(_loc6_ == 1)
            {
               if(_loc5_ != 1)
               {
                  updateGuajiStatus(render1,_loc7_.mem.guajiInfo);
               }
            }
            if(_loc6_ == 2)
            {
               updateGuajiStatus(render2,_loc7_.mem.guajiInfo);
            }
            _loc6_++;
         }
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         if(TeamGuajiService.ins.curPlayerTeamInfo.applys.length > 0)
         {
            redPoint = new RedPoint();
            redPoint.right = -2;
            redPoint.top = -2;
            this.btn_applyList.addChild(redPoint);
         }
         super.preShow(param1);
      }
      
      private function updateGuajiStatus(param1:TeamDetailRenderUI, param2:GuajiMemberInfo) : void
      {
         var _loc3_:int = 0;
         param1.visible = true;
         if(!param2.isStartFight)
         {
            param1.txt_speed.text = LocaleMgr.ins.getStr(41210118);
         }
         else
         {
            if(param2.targetExtra)
            {
               _loc3_ = param2.targetExtra.gjSpeed;
               _loc3_ = _loc3_ > 60?60:_loc3_;
            }
            param1.txt_speed.text = LocaleMgr.ins.getStr(41210117,[_loc3_]);
         }
         if(param2.targetExtra && param2.targetExtra.reward && Uint64Util.toInt(param2.targetExtra.reward.count) > 0)
         {
            param1.render_small.extra_reward.dataSource = WealthUtil.rewardToVo(param2.targetExtra.reward);
         }
         else
         {
            param1.render_small.visible = false;
         }
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         panel3D.visible = true;
      }
      
      override public function preClose(param1:Object = null) : void
      {
         ObserverMgr.ins.sendNotice("MSG_HORSE_MASTER_MODULE_CLOSE");
         this.panel3D.dispose();
         this.panel3D = null;
         super.preClose(param1);
      }
      
      private function btnInviteStrFormat(param1:uint) : String
      {
         return LocaleMgr.ins.getStr(41210078) + "(" + param1 + ")";
      }
      
      private function btnInviteCounterCpl() : void
      {
         this.btn_invite.disabled = false;
         this.btn_invite.label = LocaleMgr.ins.getStr(41210078);
         this.first_invite = true;
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc5_:* = param1;
         if(this.btn_applyList !== _loc5_)
         {
            if(this.btn_setting !== _loc5_)
            {
               if(this.btn_invite !== _loc5_)
               {
                  if(this.btn_quit !== _loc5_)
                  {
                     if(this.render1.btn_kick !== _loc5_)
                     {
                        if(this.render2.btn_kick === _loc5_)
                        {
                           _loc3_ = TeamGuajiService.ins.teamMems.length - 1;
                           this.txt_count.text = _loc3_.toString() + "/3";
                           this.render2.btn_kick.visible = false;
                           TeamGuajiService.ins.server_TeamKickOut(avatarArr[2].vo.mem.player.id);
                        }
                     }
                     else
                     {
                        _loc4_ = TeamGuajiService.ins.teamMems.length - 1;
                        this.txt_count.text = _loc4_.toString() + "/3";
                        this.render1.btn_kick.visible = false;
                        TeamGuajiService.ins.server_TeamKickOut(avatarArr[1].vo.mem.player.id);
                     }
                  }
                  else
                  {
                     if(Uint64Util.equal((memsArray[0] as TeamMemberState).mem.player.id,PlayerModel.ins.playerInfo.id))
                     {
                        panel3D.removeChild3D(avatarArr[0]);
                     }
                     else if(Uint64Util.equal((memsArray[1] as TeamMemberState).mem.player.id,PlayerModel.ins.playerInfo.id))
                     {
                        panel3D.removeChild3D(avatarArr[1]);
                     }
                     else
                     {
                        panel3D.removeChild3D(avatarArr[2]);
                     }
                     if(Uint64Util.equal(TeamGuajiService.ins.curPlayerTeamInfo.leader,PlayerModel.ins.playerInfo.id))
                     {
                        AlertUtil.float(LocaleMgr.ins.getStr(999000472));
                        TeamGuajiService.ins.dismissTeam();
                     }
                     else
                     {
                        AlertUtil.float(LocaleMgr.ins.getStr(41210606));
                        TeamGuajiService.ins.server_TeamLeave();
                     }
                     TeamGuajiService.ins.curPlayerTeamInfo = null;
                  }
               }
               else if(TeamGuajiService.ins.teamMems.length == 3)
               {
                  ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(41210603)));
               }
               else
               {
                  ObserverMgr.ins.sendNotice("MSG_TIP_MENU_SHOW",new TipMenuMsg(120,null).addHandlers(startInviteCD));
               }
            }
            else
            {
               TeamGuajiService.ins.getTeamInfo(team_setting_cpl);
            }
         }
         else
         {
            ModuleMgr.ins.showModule(10625,null,this.moduleId);
         }
      }
      
      private function team_setting_cpl() : void
      {
         AlertUtil.alert(new TeamApplySetting(TeamGuajiService.ins.curPlayerTeamInfo.setting));
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            TeamGuajiService.ins.addEventListener("EVT_TEAM_ENTER_NOTIFY",teamEnterNotifyHandler);
            TeamGuajiService.ins.addEventListener("EVT_TEAM_DELETE_NOTIFY",teamRemoveNotifyHandler);
            TeamGuajiService.ins.addEventListener("EVT_TEAM_KICKOUT_NOTIFY",teamKickoutNotifyHandler);
            TeamGuajiService.ins.addEventListener("EVT_GUAJI_EXTRAREWARD_NOTIFY",guajiExtraRewardNotifyHandler);
            TeamGuajiService.ins.addEventListener("evt_team_dissmiss",dismissTeam);
         }
         else
         {
            TeamGuajiService.ins.removeEventListener("EVT_TEAM_ENTER_NOTIFY",teamEnterNotifyHandler);
            TeamGuajiService.ins.removeEventListener("EVT_TEAM_DELETE_NOTIFY",teamRemoveNotifyHandler);
            TeamGuajiService.ins.removeEventListener("EVT_TEAM_KICKOUT_NOTIFY",teamKickoutNotifyHandler);
            TeamGuajiService.ins.removeEventListener("EVT_GUAJI_EXTRAREWARD_NOTIFY",guajiExtraRewardNotifyHandler);
            TeamGuajiService.ins.removeEventListener("evt_team_dissmiss",dismissTeam);
         }
      }
      
      private function teamEnterNotifyHandler(param1:MzEvent) : void
      {
         this.txt_count.text = TeamGuajiService.ins.teamMems.length.toString() + "/3";
         if(avatarArr[1].vo == null)
         {
            if(Uint64Util.equal(TeamGuajiService.ins.curPlayerTeamInfo.leader,PlayerModel.ins.playerInfo.id))
            {
               this.render1.visible = true;
               this.render1.btn_kick.visible = true;
               this.render1.render_small.visible = false;
            }
            avatarArr[1] = new nslm2.modules.funnies.teams.details.TeamDetailUnit3D();
            avatarArr[1].pos2d = new Point(this.render1.x + 74 - this.img_bg.width / 2,-(this.render1.y - this.img_bg.height / 2 - this.img_bg.y));
            panel3D.addChild3D(avatarArr[1]);
            avatarArr[1].vo = param1.data;
         }
         else if(avatarArr[2].vo == null)
         {
            if(Uint64Util.equal(TeamGuajiService.ins.curPlayerTeamInfo.leader,PlayerModel.ins.playerInfo.id))
            {
               this.render2.visible = true;
               this.render2.btn_kick.visible = true;
               this.render2.render_small.visible = false;
            }
            avatarArr[2] = new nslm2.modules.funnies.teams.details.TeamDetailUnit3D();
            avatarArr[2].pos2d = new Point(this.render2.x + 74 - this.img_bg.width / 2,-(this.render2.y - this.img_bg.height / 2 - this.img_bg.y));
            panel3D.addChild3D(avatarArr[2]);
            avatarArr[2].vo = param1.data;
         }
      }
      
      private function teamRemoveNotifyHandler(param1:MzEvent) : void
      {
         this.txt_count.text = TeamGuajiService.ins.teamMems.length.toString() + "/3";
         if(param1.data)
         {
            if(Uint64Util.equal(param1.data.mem.player.id,TeamGuajiService.ins.curPlayerTeamInfo.leader))
            {
               ModuleMgr.ins.showModule(10623);
            }
            else
            {
               if(avatarArr[1].vo != null)
               {
                  if(Uint64Util.equal(avatarArr[1].vo.mem.player.id,param1.data.mem.player.id))
                  {
                     if(Uint64Util.equal(TeamGuajiService.ins.curPlayerTeamInfo.leader,PlayerModel.ins.playerInfo.id))
                     {
                        this.render1.visible = false;
                     }
                     panel3D.removeChild3D(avatarArr[1]);
                     avatarArr[1].vo = null;
                  }
               }
               if(avatarArr[2].vo != null)
               {
                  if(Uint64Util.equal(avatarArr[2].vo.mem.player.id,param1.data.mem.player.id))
                  {
                     if(Uint64Util.equal(TeamGuajiService.ins.curPlayerTeamInfo.leader,PlayerModel.ins.playerInfo.id))
                     {
                        this.render2.visible = false;
                     }
                     panel3D.removeChild3D(avatarArr[2]);
                     avatarArr[2].vo = null;
                  }
               }
            }
         }
         else
         {
            ModuleMgr.ins.showModule(10623);
         }
      }
      
      private function dismissTeam(param1:Event) : void
      {
         ModuleMgr.ins.showModule(10623);
      }
      
      private function teamKickoutNotifyHandler(param1:MzEvent) : void
      {
         this.txt_count.text = TeamGuajiService.ins.teamMems.length.toString() + "/3";
         if(param1.data)
         {
            if(avatarArr[1].vo != null)
            {
               if(Uint64Util.equal(avatarArr[1].vo.mem.player.id,param1.data.mem.player.id))
               {
                  if(Uint64Util.equal(TeamGuajiService.ins.curPlayerTeamInfo.leader,PlayerModel.ins.playerInfo.id))
                  {
                     this.render1.visible = false;
                  }
                  panel3D.removeChild3D(avatarArr[1]);
                  avatarArr[1].vo = null;
               }
            }
            if(avatarArr[2].vo != null)
            {
               if(Uint64Util.equal(avatarArr[2].vo.mem.player.id,param1.data.mem.player.id))
               {
                  if(Uint64Util.equal(TeamGuajiService.ins.curPlayerTeamInfo.leader,PlayerModel.ins.playerInfo.id))
                  {
                     this.render2.visible = false;
                  }
                  panel3D.removeChild3D(avatarArr[2]);
                  avatarArr[2].vo = null;
               }
            }
         }
         else
         {
            panel3D.removeChild3D(avatarArr[0]);
            avatarArr[0].vo = null;
            ModuleMgr.ins.showModule(10623);
         }
      }
      
      private function guajiExtraRewardNotifyHandler(param1:MzEvent) : void
      {
         var _loc2_:GuajiExtraRewardNotify = param1.data as GuajiExtraRewardNotify;
         if(avatarArr[1].vo != null)
         {
            if(Uint64Util.equal(avatarArr[1].vo.mem.player.id,_loc2_.playerId))
            {
               this.render1.render_small.extra_reward.dataSource = WealthUtil.rewardToVo(_loc2_.rwd);
               return;
            }
         }
         if(avatarArr[2].vo != null)
         {
            if(Uint64Util.equal(avatarArr[2].vo.mem.player.id,_loc2_.playerId))
            {
               this.render2.render_small.extra_reward.dataSource = WealthUtil.rewardToVo(_loc2_.rwd);
            }
         }
      }
      
      private function startInviteCD() : void
      {
         this.btn_invite.disabled = true;
         this.inviteCounter.start(ServerTimer.ins.second + 5);
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["TEAM_DETAIL_REMVOE_REDPOINT"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         super.handleNotices(param1,param2);
         var _loc3_:* = param1;
         if("TEAM_DETAIL_REMVOE_REDPOINT" === _loc3_)
         {
            if(redPoint)
            {
               this.btn_applyList.removeChild(redPoint);
            }
         }
      }
   }
}
