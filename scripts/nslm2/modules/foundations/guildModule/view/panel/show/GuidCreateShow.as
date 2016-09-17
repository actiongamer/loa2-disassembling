package nslm2.modules.foundations.guildModule.view.panel.show
{
   import game.ui.guildModules.GuildDisplayView.CreateShowViewUI;
   import morn.core.components.Button;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.guildModule.util.GuildUtil;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class GuidCreateShow extends CreateShowViewUI
   {
       
      
      public function GuidCreateShow()
      {
         super();
         this.btn_create.clickHandler = createGuild;
      }
      
      private function createGuild(param1:Button) : void
      {
         var _loc2_:Array = String(DefindConsts.GUILD_CREAT_LV_VIP).split("|");
         if(PlayerModel.ins.playerInfo.vip < _loc2_[1] && PlayerModel.ins.level < _loc2_[0])
         {
            AlertUtil.float(LocaleMgr.ins.getStr(40700003));
            return;
         }
         if(GuildUtil.checkJoinGuildCD(showCreatePanel))
         {
            return;
         }
         showCreatePanel();
      }
      
      private function showCreatePanel() : void
      {
         GuildModel.ins.exitTimeStamp = 0;
         ModuleMgr.ins.showModule(40706,null,40700);
      }
   }
}
