package nslm2.modules.battles.battlefields.panels
{
   import game.ui.battlefield.BattlefieldTeam.panel.BattlefieldTeamInfoPanelUI;
   import nslm2.common.ctrls.TSMDict;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS3;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.utils.TimeUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.battles.battlefields.utils.BattlefieldUtil;
   import nslm2.common.model.PlayerModel;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import morn.core.components.Button;
   import proto.TeamStartReq;
   import nslm2.modules.funnies.teams.TeamService;
   import proto.TeamLeaveReq;
   import proto.TeamDismissReq;
   import proto.TeamStopReq;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.utils.ServerTimer;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.common.ctrls.TSM;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class BattlefieldTeamInfoPanel extends BattlefieldTeamInfoPanelUI
   {
       
      
      private var tsms:TSMDict;
      
      private var _textCdCtrl:TextCDCtrlS3;
      
      private var _textInviteCtrl:TextCDCtrlS2;
      
      public function BattlefieldTeamInfoPanel()
      {
         tsms = new TSMDict();
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         tsms.put(box_inTeam,new TSM(this.box_inTeam,0.4).addState(1,{"visible":false}).copyState(2,0));
         tsms.put(btn_start,new TSM(this.btn_start,0.4).copyState(1,0).addState(2,{
            "alpha":0,
            "y":1000
         }));
         tsms.put(btn_dismiss,new TSM(this.btn_dismiss,0.4).copyState(1,0)).addState(2,{
            "alpha":0,
            "y":1000
         });
         tsms.put(btn_invite,new TSM(this.btn_invite,0.4).copyState(1,0)).addState(2,{
            "alpha":0,
            "y":1000
         });
         this.box_inTeam.visible = false;
         this.img_bg.skin = UrlLib.battlefieldUI("img_teamInfoBg");
         switchEventListeners(true);
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            BattlefieldMsgs.ins.addEventListener("msgBattlefieldApplyCpl",onApplyCpl);
            BattlefieldMsgs.ins.addEventListener("msgBattlefieldExitCpl",onExit);
            BattlefieldMsgs.ins.addEventListener("msgBattlefieldStart",onExit);
         }
         else
         {
            BattlefieldMsgs.ins.removeEventListener("msgBattlefieldApplyCpl",onApplyCpl);
            BattlefieldMsgs.ins.removeEventListener("msgBattlefieldExitCpl",onExit);
            BattlefieldMsgs.ins.removeEventListener("msgBattlefieldStart",onExit);
         }
      }
      
      private function onApplyCpl(param1:MzEvent) : void
      {
         tsms.toState(2);
         if(_textCdCtrl == null)
         {
            _textCdCtrl = new TextCDCtrlS3(this.txt_alert,textCDFormat,null);
            this.parts.push(new TextCDCtrlS3(this.txt_alert,textCDFormat,null));
            _textCdCtrl.start(BattlefieldModel.ins.regStamp,BattlefieldModel.ins.regStamp + StcMgr.ins.getBginfoVo(1000).bg_max_time * 60);
         }
      }
      
      private function onExit(param1:MzEvent) : void
      {
         if(_textCdCtrl)
         {
            _textCdCtrl.stop();
            _textCdCtrl.dispose();
            _textCdCtrl = null;
         }
         refresh();
      }
      
      private function textCDFormat(param1:int) : String
      {
         param1 = param1 < 0?0:param1;
         return TimeUtils.hisColonAddZero2(param1);
      }
      
      public function show(param1:Array) : void
      {
         this.list_teamMems.dataSource = param1;
         this.txt_teamLimit.text = LocaleMgr.ins.getStr(50500027) + param1.length + "/3";
         refresh();
      }
      
      public function refresh() : void
      {
         if(BattlefieldUtil.isLeader(PlayerModel.ins.playerInfo.id))
         {
            this.btn_exit.visible = false;
            this.btn_dismiss.visible = true;
            this.btn_start.visible = true;
            this.btn_cancel.visible = true;
            this.btn_invite.visible = true;
         }
         else
         {
            this.btn_exit.visible = true;
            this.btn_dismiss.visible = false;
            this.btn_start.visible = false;
            this.btn_cancel.visible = false;
            this.btn_invite.visible = false;
         }
         if(BattlefieldModel.ins.regStamp != 0)
         {
            onApplyCpl(null);
         }
         else
         {
            tsms.toState(1);
         }
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc6_:* = param1;
         if(this.btn_start !== _loc6_)
         {
            if(this.btn_exit !== _loc6_)
            {
               if(this.btn_dismiss !== _loc6_)
               {
                  if(this.btn_cancel !== _loc6_)
                  {
                     if(this.btn_invite === _loc6_)
                     {
                        ObserverMgr.ins.sendNotice("MSG_TEAM_BATTLEFIELD_INVITE_SEND_CHAT",BattlefieldModel.ins.curTeamId);
                        this.btn_invite.disabled = true;
                        _textInviteCtrl = new TextCDCtrlS2(this.btn_invite.btnLabel,textCdFormat,textCplFunc);
                        this.parts.push(new TextCDCtrlS2(this.btn_invite.btnLabel,textCdFormat,textCplFunc));
                        _textInviteCtrl.start(ServerTimer.ins.second + 5);
                     }
                  }
                  else
                  {
                     _loc4_ = new TeamStopReq();
                     _loc4_.kind = 16;
                     TeamService.ins.teamStop(_loc4_);
                  }
               }
               else
               {
                  _loc5_ = new TeamDismissReq();
                  _loc5_.kind = 16;
                  TeamService.ins.teamDismiss(_loc5_);
               }
            }
            else
            {
               _loc2_ = new TeamLeaveReq();
               _loc2_.kind = 16;
               TeamService.ins.teamLeave(_loc2_);
            }
         }
         else if(BattlefieldUtil.canStart())
         {
            _loc3_ = new TeamStartReq();
            _loc3_.kind = 16;
            TeamService.ins.teamStart(_loc3_);
         }
      }
      
      private function textCdFormat(param1:int) : String
      {
         param1 = param1 < 0?0:param1;
         return LocaleMgr.ins.getStr(41210091) + "(" + param1 + LocaleMgr.ins.getStr(999000019) + ")";
      }
      
      private function textCplFunc() : void
      {
         this.btn_invite.disabled = false;
         this.btn_invite.label = LocaleMgr.ins.getStr(41210091);
         if(_textInviteCtrl)
         {
            _textInviteCtrl.dispose();
            _textInviteCtrl = null;
         }
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         super.dispose();
      }
   }
}
