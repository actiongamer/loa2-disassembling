package nslm2.modules.battles.battlefields.renders
{
   import game.ui.battlefield.BattlefieldInvited.render.BattlefieldInvitedRenderUI;
   import proto.TeamInvitedNotify;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import morn.core.components.Button;
   import proto.TeamEnterReq;
   import nslm2.modules.funnies.teams.TeamService;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import proto.ProtocolStatusRes;
   import nslm2.nets.sockets.ServerEngine;
   import morn.customs.expands.MornExpandUtil;
   
   public class BattlefieldInvitedRender extends BattlefieldInvitedRenderUI
   {
       
      
      public function BattlefieldInvitedRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
      }
      
      public function get vo() : TeamInvitedNotify
      {
         return this.dataSource as TeamInvitedNotify;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            this.txt_info.text = LinkUtils.playerNameSmart(vo.bgPlayer.baseInfo.id,vo.bgPlayer.baseInfo.name,vo.bgPlayer.baseInfo.dist,ColorLib.getMilitaryColor(vo.bgPlayer.baseInfo.militaryRank)) + LocaleMgr.ins.getStr(50500056);
            this.txt_level.text = LocaleMgr.ins.getStr(50500040) + ":" + vo.bgPlayer.baseInfo.lv;
            this.txt_fightValue.text = LocaleMgr.ins.getStr(50500041) + ":" + Uint64Util.toString(vo.bgPlayer.baseInfo.ability);
            this.txt_score.text = LocaleMgr.ins.getStr(50500042) + ":" + vo.bgPlayer.bgBaseInfo.score;
            this.img_head.skin = UrlLib.playerHeaderIcon(StcMgr.ins.getNpcVo(vo.bgPlayer.baseInfo.npcId).sex);
         }
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1;
         if(this.btn_accept !== _loc3_)
         {
            if(this.btn_refuse === _loc3_)
            {
               BattlefieldModel.ins.removeInvitedNotify(vo.teamId);
            }
         }
         else
         {
            _loc2_ = new TeamEnterReq();
            _loc2_.kind = 16;
            _loc2_.id = vo.teamId;
            TeamService.ins.teamEnter(_loc2_,onServerErr_enter);
         }
      }
      
      private function onServerErr_enter(param1:ProtocolStatusRes) : void
      {
         if(param1.errCode != 300008402 && param1.errCode != 300004155)
         {
            BattlefieldModel.ins.removeInvitedNotify(vo.teamId);
         }
         ServerEngine.ins.doDefaultErr(param1);
      }
   }
}
