package nslm2.modules.funnies.teamPKCS.invite
{
   import game.ui.teamPKCS.invite.TPKCInviteRenderUI;
   import proto.TeamInvitedNotify;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.utils.Uint64Util;
   import morn.core.components.Button;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import morn.customs.expands.MornExpandUtil;
   
   public class TPKCInviteRender extends TPKCInviteRenderUI
   {
       
      
      public function TPKCInviteRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
      }
      
      public function get info() : TeamInvitedNotify
      {
         return this.dataSource as TeamInvitedNotify;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:* = 0;
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(param1)
         {
            this.img_bg_people.skin = UrlLib.tpkcUrl("img_bg_people.png");
            this.img_bg_frame.skin = UrlLib.tpkcUrl("img_bg_frame.png");
            _loc3_ = uint(ColorLib.getMilitaryColor(info.player.militaryRank));
            _loc2_ = LinkUtils.playerNameSmart(info.player.id,info.player.name,info.player.dist,_loc3_);
            this.txt_explain.text = LocaleMgr.ins.getStr(50800003,[_loc2_]);
            this.txt_level.text = LocaleMgr.ins.getStr(50500040) + ":" + TextFieldUtil.htmlText2(info.player.lv,16773888);
            this.txt_fightValue.text = LocaleMgr.ins.getStr(50500041) + ":" + TextFieldUtil.htmlText2(Uint64Util.toString(info.player.ability),16773888);
         }
      }
      
      public function btn_handler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_agree !== _loc2_)
         {
            if(this.btn_refuse === _loc2_)
            {
               TeamGuajiService.ins.removeInvitedNotify(info.teamId);
            }
         }
         else
         {
            if(!FuncOpenAutoCtrl.checkOpen(42000))
            {
               AlertUtil.lackLevel(FuncOpenAutoCtrl.getOpenLevel(42000));
               return;
            }
            if(TeamGuajiService.ins.curPlayerTeamInfo && TeamGuajiService.ins.curPlayerTeamInfo.kind == 17)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(41210099));
               TeamGuajiService.ins.removeInvitedNotify(info.teamId);
               return;
            }
            TeamGuajiService.ins.server_TeamEnter(info.teamId,teamEnterHandler);
         }
      }
      
      private function teamEnterHandler() : void
      {
         ModuleMgr.ins.showModule(42000);
         TeamGuajiService.ins.removeInvitedNotify(info.teamId);
      }
   }
}
