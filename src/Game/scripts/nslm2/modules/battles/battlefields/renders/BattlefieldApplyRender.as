package nslm2.modules.battles.battlefields.renders
{
   import game.ui.battlefield.render.BattlefieldApplyRenderUI;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS3;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.battles.battlefields.utils.BattlefieldUtil;
   import nslm2.modules.battles.battlefields.service.BattlefieldService;
   import proto.TeamCreateReq;
   import nslm2.modules.funnies.teams.TeamService;
   import proto.TeamStopReq;
   import com.mz.core.event.MzEvent;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.TimeUtils;
   import morn.customs.expands.MornExpandUtil;
   
   public class BattlefieldApplyRender extends BattlefieldApplyRenderUI
   {
       
      
      private var _textCdCtrlS3:TextCDCtrlS3;
      
      private var _textCdCtrlS2:TextCDCtrlS2;
      
      public function BattlefieldApplyRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         switchEventListeners(true);
      }
      
      private function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            BattlefieldMsgs.ins.addEventListener("msgBattlefieldApplyCpl",onApplyCpl);
            BattlefieldMsgs.ins.addEventListener("msgBattlefieldExitCpl",onExitCpl);
            BattlefieldMsgs.ins.addEventListener("msgBattlefieldTeamDismissed",onExitCpl);
            BattlefieldMsgs.ins.addEventListener("msgBattlefieldCreateTeamCpl",onExitCpl);
            BattlefieldMsgs.ins.addEventListener("msgBattlefieldStart",onStartCpl);
         }
         else
         {
            BattlefieldMsgs.ins.removeEventListener("msgBattlefieldApplyCpl",onApplyCpl);
            BattlefieldMsgs.ins.removeEventListener("msgBattlefieldExitCpl",onExitCpl);
            BattlefieldMsgs.ins.removeEventListener("msgBattlefieldTeamDismissed",onExitCpl);
            BattlefieldMsgs.ins.removeEventListener("msgBattlefieldCreateTeamCpl",onExitCpl);
            BattlefieldMsgs.ins.removeEventListener("msgBattlefieldStart",onStartCpl);
         }
      }
      
      public function show() : void
      {
         var _loc1_:* = null;
         if(BattlefieldModel.ins.startStamp != 0)
         {
            onStartCpl(null);
         }
         else if(BattlefieldModel.ins.regStamp != 0)
         {
            onApplyCpl(null);
         }
         else
         {
            onExitCpl(null);
         }
         if(BattlefieldModel.ins.curBattlefieldId == 1000)
         {
            _loc1_ = LocaleMgr.ins.getStr(50500002);
         }
         else
         {
            _loc1_ = LocaleMgr.ins.getStr(50500003);
         }
         txt_startInfo.text = LocaleMgr.ins.getStr(50500155,[_loc1_]);
      }
      
      private function onBtnFunc(param1:Button, param2:MouseEvent) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = param1;
         if(this.btn_singleApply !== _loc5_)
         {
            if(this.btn_teamApply !== _loc5_)
            {
               if(this.btn_cancel !== _loc5_)
               {
                  if(this.btn_apply !== _loc5_)
                  {
                     if(this.btn_refuse === _loc5_)
                     {
                        BattlefieldUtil.refuseBattlefield();
                        onExitCpl(null);
                     }
                  }
                  else
                  {
                     BattlefieldUtil.enterBattlefield();
                  }
               }
               else if(BattlefieldModel.ins.curTeamId != null)
               {
                  _loc3_ = new TeamStopReq();
                  _loc3_.kind = 16;
                  TeamService.ins.teamStop(_loc3_);
               }
               else
               {
                  BattlefieldService.ins.exitBattlefield();
               }
            }
            else if(BattlefieldModel.ins.curTeamId != null)
            {
               ModuleMgr.ins.showModule(50501,BattlefieldModel.ins.memInfos,ModuleMgr.ins.popLayer.curModuleId);
            }
            else if(BattlefieldUtil.canEnter())
            {
               _loc4_ = new TeamCreateReq();
               _loc4_.kind = 16;
               TeamService.ins.teamCreate(_loc4_);
            }
         }
         else if(param2.altKey && EnvConfig.ins.showDevModule)
         {
            ModuleMgr.ins.showModule(50507,BattlefieldModel.ins.curBattlefieldId);
         }
         else if(BattlefieldUtil.canEnter())
         {
            BattlefieldService.ins.applySingle();
         }
      }
      
      private function onStartCpl(param1:MzEvent) : void
      {
         this.box_started.visible = true;
         this.box_inTeam.visible = false;
         this.btn_teamApply.visible = false;
         this.btn_singleApply.visible = false;
         if(_textCdCtrlS3)
         {
            _textCdCtrlS3.dispose();
            _textCdCtrlS3 = null;
         }
         if(_textCdCtrlS2)
         {
            _textCdCtrlS2.dispose();
            _textCdCtrlS2 = null;
         }
         _textCdCtrlS2 = new TextCDCtrlS2(this.txt_applyAlert,textCDFormat,textCDCpl);
         this.parts.push(new TextCDCtrlS2(this.txt_applyAlert,textCDFormat,textCDCpl));
         _textCdCtrlS2.start(BattlefieldModel.ins.startStamp + int(DefindConsts.BG_CONFIRM_TIME));
      }
      
      private function onApplyCpl(param1:MzEvent) : void
      {
         if(BattlefieldModel.ins.startStamp != 0)
         {
            onStartCpl(null);
            return;
         }
         this.box_started.visible = false;
         if(BattlefieldUtil.isInTeam())
         {
            this.btn_teamApply.label = LocaleMgr.ins.getStr(50500065);
         }
         else
         {
            this.btn_teamApply.label = LocaleMgr.ins.getStr(50500064);
         }
         this.btn_singleApply.visible = false;
         if(_textCdCtrlS3)
         {
            _textCdCtrlS3.dispose();
            _textCdCtrlS3 = null;
         }
         if(_textCdCtrlS2)
         {
            _textCdCtrlS2.dispose();
            _textCdCtrlS2 = null;
         }
         _textCdCtrlS3 = new TextCDCtrlS3(this.txt_alert,textCDFormat,textCDCpl);
         this.parts.push(new TextCDCtrlS3(this.txt_alert,textCDFormat,textCDCpl));
         _textCdCtrlS3.start(BattlefieldModel.ins.regStamp,BattlefieldModel.ins.regStamp + (StcMgr.ins.getBginfoVo(1000).bg_max_time + 2) * 60);
         this.box_inTeam.visible = true;
         if(BattlefieldModel.ins.curTeamId != null)
         {
            this.btn_teamApply.visible = true;
            if(PlayerModel.ins.isCurPlayer(BattlefieldModel.ins.curLeaderId))
            {
               this.btn_cancel.visible = true;
            }
            else
            {
               this.btn_cancel.visible = false;
            }
         }
         else
         {
            this.btn_teamApply.visible = false;
         }
      }
      
      private function onExitCpl(param1:MzEvent) : void
      {
         this.box_started.visible = false;
         if(BattlefieldUtil.isInTeam())
         {
            this.btn_singleApply.visible = false;
            this.btn_teamApply.visible = true;
            this.btn_teamApply.label = LocaleMgr.ins.getStr(50500065);
         }
         else
         {
            this.btn_singleApply.visible = true;
            this.btn_teamApply.visible = true;
            this.btn_teamApply.label = LocaleMgr.ins.getStr(50500064);
         }
         if(_textCdCtrlS3)
         {
            _textCdCtrlS3.dispose();
            _textCdCtrlS3 = null;
         }
         if(_textCdCtrlS2)
         {
            _textCdCtrlS2.dispose();
            _textCdCtrlS2 = null;
         }
         this.box_inTeam.visible = false;
      }
      
      private function textCDFormat(param1:int) : String
      {
         param1 = param1 < 0?0:param1;
         return TimeUtils.hisColonAddZero2(param1);
      }
      
      private function textCDCpl() : void
      {
         BattlefieldModel.ins.clearData();
         onExitCpl(null);
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         super.dispose();
      }
   }
}
