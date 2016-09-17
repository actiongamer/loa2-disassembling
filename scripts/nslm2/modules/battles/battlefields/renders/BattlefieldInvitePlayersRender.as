package nslm2.modules.battles.battlefields.renders
{
   import game.ui.battlefield.BattlefieldTeam.render.BattlefieldInvitePlayersRenderUI;
   import proto.BgPlayerInfo;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import nslm2.utils.Uint64Util;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcBgtitleIntvlVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import com.mz.core.event.MzEvent;
   import morn.core.components.Button;
   import nslm2.modules.foundations.AlertUtil;
   import proto.TeamInviteReq;
   import nslm2.modules.funnies.teams.TeamService;
   import morn.customs.expands.MornExpandUtil;
   
   public class BattlefieldInvitePlayersRender extends BattlefieldInvitePlayersRenderUI
   {
       
      
      public function BattlefieldInvitePlayersRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
      }
      
      public function get vo() : BgPlayerInfo
      {
         return this.dataSource as BgPlayerInfo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(param1)
         {
            switchEventListeners(true);
            this.txt_name.text = TextFieldUtil.htmlText2(vo.baseInfo.name,ColorLib.qualityColor(MilitaryModel.ins.getPlayerQuality(vo.baseInfo.militaryRank)));
            this.txt_level.num = vo.baseInfo.lv;
            this.txt_fightValue.text = LocaleConsts.getNumberAbbr2(Uint64Util.toString(vo.baseInfo.ability));
            this.txt_point.num = vo.bgBaseInfo.score;
            _loc2_ = StcMgr.ins.getBgtitleIntvlVo(vo.bgBaseInfo.degree);
            this.txt_rank.text = !!_loc2_?LocaleMgr.ins.getStr(_loc2_.tite_name):LocaleMgr.ins.getStr(12200);
            changeBtnState(BattlefieldModel.ins.getPlayerState(vo.baseInfo.id));
         }
         else
         {
            switchEventListeners(false);
         }
      }
      
      private function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            BattlefieldMsgs.ins.addEventListener("msgBattlefieldMemChanged",onMemChanged);
         }
         else
         {
            BattlefieldMsgs.ins.removeEventListener("msgBattlefieldMemChanged",onMemChanged);
         }
      }
      
      private function onMemChanged(param1:MzEvent) : void
      {
         changeBtnState(BattlefieldModel.ins.getPlayerState(vo.baseInfo.id));
      }
      
      private function changeBtnState(param1:int) : void
      {
         switch(int(param1) - 1)
         {
            case 0:
               this.btn_invite.visible = false;
               this.txt_accepted.visible = true;
               this.txt_accepted.text = LocaleMgr.ins.getStr(50500097);
               break;
            case 1:
               this.btn_invite.visible = false;
               this.txt_accepted.visible = true;
               this.txt_accepted.text = LocaleMgr.ins.getStr(50500045);
               break;
            case 2:
               this.btn_invite.visible = true;
               this.txt_accepted.visible = false;
         }
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1;
         if(this.btn_invite === _loc3_)
         {
            if(BattlefieldModel.ins.regStamp != 0)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(50500106));
            }
            else
            {
               _loc2_ = new TeamInviteReq();
               _loc2_.kind = 16;
               _loc2_.teamId = BattlefieldModel.ins.curTeamId;
               _loc2_.friendIds = [this.vo.baseInfo.id];
               TeamService.ins.teamInvite(_loc2_);
               BattlefieldModel.ins.addInvitedId(this.vo.baseInfo.id);
               this.btn_invite.visible = false;
               this.txt_accepted.visible = true;
               this.txt_accepted.text = LocaleMgr.ins.getStr(50500097);
            }
         }
      }
   }
}
