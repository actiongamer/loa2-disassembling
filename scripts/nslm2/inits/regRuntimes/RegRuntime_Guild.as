package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.guildModules.guildList.GuildListRenderUI;
   import nslm2.modules.foundations.guildModule.view.panel.guildList.GuildListRender;
   import game.ui.guildModules.memberView.GuildMemberListRenderUI;
   import nslm2.modules.foundations.guildModule.view.panel.memberList.GuildMemberListRender;
   import game.ui.guildModules.verify.GuildVerifyListRenderUI;
   import nslm2.modules.foundations.guildModule.view.panel.verify.GuildVerifyListRender;
   import game.ui.guildModules.appoint.GuildOfficerListRenderUI;
   import nslm2.modules.foundations.guildModule.view.panel.appoint.GuildOfficerListRender;
   import game.ui.guildModules.log.GuildLogRenderUI;
   import nslm2.modules.foundations.guildModule.view.panel.log.GuildLogRender;
   import game.ui.guildModules.flag.GuildFlagRenderUI;
   import nslm2.modules.foundations.guildModule.view.panel.flag.GuildFlagRender;
   import game.ui.guildModules.mainView.GuildActivityListRenderUI;
   import nslm2.modules.foundations.guildModule.view.panel.main.GuildActivityListRender;
   import game.ui.guildModules.guildRank.GuildRankListRenderUI;
   import nslm2.modules.foundations.guildModule.view.panel.rank.GuildRankListRender;
   import game.ui.guildModules.guildRank.GuildDetailMemListRenderUI;
   import nslm2.modules.foundations.guildModule.view.panel.rank.GuildDetialMemListRender;
   import game.ui.guildModules.setting.AuthorityListRenderUI;
   import nslm2.modules.foundations.guildModule.view.panel.setAuth.AuthorityListRender;
   import game.ui.guildModules.donate.DonateListRenderUI;
   import nslm2.modules.foundations.guildModule.view.panel.donate.GuildDonateListRender;
   import game.ui.guildModules.manageView.ManagerListRenderUI;
   import nslm2.modules.foundations.guildModule.view.panel.manage.GuildManageListRender;
   import game.ui.guildModules.GuildDisplayView.JoinShowViewUI;
   import nslm2.modules.foundations.guildModule.view.panel.show.GuildJoinShow;
   import game.ui.guildModules.GuildDisplayView.CreateShowViewUI;
   import nslm2.modules.foundations.guildModule.view.panel.show.GuidCreateShow;
   import game.ui.guildModules.invite.InviteFirendlListRenderUI;
   import nslm2.modules.foundations.guildModule.view.panel.invite.GuildInviteFirendListRender;
   import game.ui.guildDungeon.render.GuildDungeonRenderUI;
   import nslm2.modules.battles.guildDungeons.render.GuildDungeonRender;
   import game.ui.guildDungeon.render.GuildDungeonTargetRenderUI;
   import nslm2.modules.battles.guildDungeons.render.GuildDungeonTargetRender;
   import game.ui.guildDungeon.render.GuildDungeonTreasureRenderUI;
   import nslm2.modules.battles.guildDungeons.render.GuildDungeonTreasureRender;
   import game.ui.guildDungeon.render.GuildDungeonTreasureFloorRenderUI;
   import nslm2.modules.battles.guildDungeons.render.GuildDungeonTreasureFloorRender;
   import game.ui.guildDungeon.render.GuildDungeonAceTreasureRenderUI;
   import nslm2.modules.battles.guildDungeons.render.GuildDungeonAceTreasureRender;
   import game.ui.guildDungeon.render.GuildDungeonVideoRenderUI;
   import nslm2.modules.battles.guildDungeons.render.GuildDungeonVideoRender;
   import game.ui.guildDungeon.render.GuildDungeonTreasureIconUI;
   import nslm2.modules.battles.guildDungeons.render.GuildDungeonTreasureIcon;
   import game.ui.guildDungeon.render.GuildDungeonBuffRenderUI;
   import nslm2.modules.battles.guildDungeons.render.GuildDungeonBuffRender;
   import game.ui.guildTechs.GuildTechRenderUI;
   import nslm2.modules.funnies.guilds.guildTechs.GuildTechRender;
   import game.ui.guildTechs.GuildTechPropRenderUI;
   import nslm2.modules.funnies.guilds.guildTechs.GuildTechPropRender;
   import game.ui.guildTechs.GuildTechResearchRenderUI;
   import nslm2.modules.funnies.guilds.guildTechs.GuildTechResearchRender;
   
   public class RegRuntime_Guild
   {
       
      
      public function RegRuntime_Guild()
      {
         super();
         View.runtimeClassMap[GuildListRenderUI] = GuildListRender;
         View.runtimeClassMap[GuildMemberListRenderUI] = GuildMemberListRender;
         View.runtimeClassMap[GuildVerifyListRenderUI] = GuildVerifyListRender;
         View.runtimeClassMap[GuildOfficerListRenderUI] = GuildOfficerListRender;
         View.runtimeClassMap[GuildLogRenderUI] = GuildLogRender;
         View.runtimeClassMap[GuildFlagRenderUI] = GuildFlagRender;
         View.runtimeClassMap[GuildActivityListRenderUI] = GuildActivityListRender;
         View.runtimeClassMap[GuildRankListRenderUI] = GuildRankListRender;
         View.runtimeClassMap[GuildDetailMemListRenderUI] = GuildDetialMemListRender;
         View.runtimeClassMap[AuthorityListRenderUI] = AuthorityListRender;
         View.runtimeClassMap[DonateListRenderUI] = GuildDonateListRender;
         View.runtimeClassMap[ManagerListRenderUI] = GuildManageListRender;
         View.runtimeClassMap[JoinShowViewUI] = GuildJoinShow;
         View.runtimeClassMap[CreateShowViewUI] = GuidCreateShow;
         View.runtimeClassMap[InviteFirendlListRenderUI] = GuildInviteFirendListRender;
         View.runtimeClassMap[GuildDungeonRenderUI] = GuildDungeonRender;
         View.runtimeClassMap[GuildDungeonTargetRenderUI] = GuildDungeonTargetRender;
         View.runtimeClassMap[GuildDungeonTreasureRenderUI] = GuildDungeonTreasureRender;
         View.runtimeClassMap[GuildDungeonTreasureFloorRenderUI] = GuildDungeonTreasureFloorRender;
         View.runtimeClassMap[GuildDungeonAceTreasureRenderUI] = GuildDungeonAceTreasureRender;
         View.runtimeClassMap[GuildDungeonVideoRenderUI] = GuildDungeonVideoRender;
         View.runtimeClassMap[GuildDungeonTreasureIconUI] = GuildDungeonTreasureIcon;
         View.runtimeClassMap[GuildDungeonBuffRenderUI] = GuildDungeonBuffRender;
         View.runtimeClassMap[GuildTechRenderUI] = GuildTechRender;
         View.runtimeClassMap[GuildTechPropRenderUI] = GuildTechPropRender;
         View.runtimeClassMap[GuildTechResearchRenderUI] = GuildTechResearchRender;
      }
   }
}
