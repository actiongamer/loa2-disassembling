package nslm2.modules.battles.battlefields.renders
{
   import game.ui.battlefield.BattlefieldTeam.render.BattlefieldMemberRenderUI;
   import proto.BgPlayerInfo;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcBgtitleIntvlVo;
   import nslm2.modules.battles.battlefields.utils.BattlefieldUtil;
   import nslm2.common.model.PlayerModel;
   import morn.core.components.Button;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import proto.TeamKickReq;
   import nslm2.modules.funnies.teams.TeamService;
   import nslm2.modules.foundations.AlertUtil;
   import morn.customs.expands.MornExpandUtil;
   
   public class BattlefieldMemberRender extends BattlefieldMemberRenderUI
   {
       
      
      public function BattlefieldMemberRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
      }
      
      private function get vo() : BgPlayerInfo
      {
         return this.dataSource as BgPlayerInfo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(param1)
         {
            this.txt_name.text = LinkUtils.playerNameSmart(vo.baseInfo.id,vo.baseInfo.name,vo.baseInfo.dist,ColorLib.getMilitaryColor(vo.baseInfo.militaryRank));
            this.txt_level.text = LocaleMgr.ins.getStr(50500040) + ":" + vo.baseInfo.lv;
            this.txt_score.text = LocaleMgr.ins.getStr(50500042) + ":" + vo.bgBaseInfo.score;
            this.txt_fightValue.text = LocaleMgr.ins.getStr(50500041) + ":" + LocaleConsts.getNumberAbbr2(Uint64Util.toString(vo.baseInfo.ability));
            this.img_head.skin = UrlLib.playerHeaderIcon(StcMgr.ins.getNpcVo(vo.baseInfo.npcId).sex);
            _loc2_ = StcMgr.ins.getBgtitleIntvlVo(vo.bgBaseInfo.degree);
            this.txt_rank.text = LocaleMgr.ins.getStr(50500028,[!!_loc2_?LocaleMgr.ins.getStr(int(_loc2_.tite_name)):LocaleMgr.ins.getStr(999000020)]);
            if(BattlefieldUtil.isLeader(PlayerModel.ins.playerInfo.id) && PlayerModel.ins.isCurPlayer(vo.baseInfo.id) == false)
            {
               this.btn_kick.visible = true;
            }
            else
            {
               this.btn_kick.visible = false;
            }
            if(BattlefieldUtil.isLeader(vo.baseInfo.id))
            {
               this.img_leader.visible = true;
               this.img_bg.url = "png.uiBattlefields.battlefieldTeamModule.img_leaderBg";
            }
            else
            {
               this.img_leader.visible = false;
               this.img_bg.url = "png.uiBattlefields.battlefieldTeamModule.img_normalBg";
            }
         }
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1;
         if(this.btn_kick === _loc3_)
         {
            if(BattlefieldModel.ins.regStamp == 0)
            {
               _loc2_ = new TeamKickReq();
               _loc2_.kind = 16;
               _loc2_.playerId = vo.baseInfo.id;
               TeamService.ins.teamKick(_loc2_);
            }
            else
            {
               AlertUtil.float(LocaleMgr.ins.getStr(50500099));
            }
         }
      }
   }
}
