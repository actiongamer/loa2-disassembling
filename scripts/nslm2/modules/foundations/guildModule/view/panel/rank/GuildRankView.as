package nslm2.modules.foundations.guildModule.view.panel.rank
{
   import game.ui.guildModules.guildRank.GuildRankViewUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.foundations.guildModule.service.GuildServiceHandler;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   
   public class GuildRankView extends GuildRankViewUI implements IViewStackPage, IObserver
   {
       
      
      private var guildService:GuildServiceHandler;
      
      private var guildModel:GuildModel;
      
      public function GuildRankView()
      {
         guildService = GuildServiceHandler.ins;
         guildModel = GuildModel.ins;
         super();
         (pagebar as IPageBar).bindList(list_member);
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         this.fadeIn();
         if(!guildModel.guildList || guildModel.needUpdateGuildRankList)
         {
            guildService.reqGuildList();
            guildModel.needUpdateGuildRankList = false;
         }
         updateRankList();
         ObserverMgr.ins.regObserver(this);
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
         ObserverMgr.ins.unregObserver(this);
      }
      
      private function updateRankList() : void
      {
         if(guildModel.guildList && guildModel.guildList.length > 0)
         {
            this.list_member.dataSource = guildModel.guildList;
         }
         else
         {
            this.list_member.dataSource = [];
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["guild_notice_update_guild_list"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("guild_notice_update_guild_list" === _loc3_)
         {
            updateRankList();
         }
      }
   }
}
