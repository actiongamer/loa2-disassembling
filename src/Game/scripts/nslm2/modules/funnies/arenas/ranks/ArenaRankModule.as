package nslm2.modules.funnies.arenas.ranks
{
   import game.ui.arenas.ranks.ArenaRankModuleUI;
   import proto.ArenaInfoRes;
   import nslm2.modules.funnies.arenas.ArenaService;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.funnies.newYears.newYear2016s.bossPanels.NewYear2016_BossRankRender;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.ShenYuanPaiMingRes;
   import proto.PlayerArenaInfo;
   import nslm2.modules.funnies.arenas.ArenaUtil;
   import nslm2.modules.battles.guildDungeons.GuildDungeonModel;
   import proto.ArenaGetRankListRes;
   import proto.SpringBeatBossRankListRes;
   import nslm2.nets.sockets.ServerEvent;
   import proto.SpringBeatBossRankListRes.Rank;
   
   public class ArenaRankModule extends ArenaRankModuleUI
   {
      
      public static const RANK_TYPE_ARENA:int = 0;
      
      public static const RANK_TYPE_SHENYUAN:int = 1;
      
      public static const RANK_TYPE_GUILD_DUNGEON:int = 2;
      
      public static const RANK_TYPE_NEW_YEAR_BOSS:int = 3;
      
      public static const ARENA_TITLE:Array = [50200007,50200021,2035,50200022];
      
      public static const SHENYUAN_TITLE:Array = [50200007,50200021,41500044,50200022];
      
      public static const GUILD_DUNGEON:Array = [50200007,50200021,40710525,40710526];
      
      public static const NEW_YEAR_BOSS:Array = [50200007,50200021,2035,40710526];
       
      
      private var curRank:int;
      
      public function ArenaRankModule()
      {
         super();
      }
      
      public function get infoRes() : ArenaInfoRes
      {
         return ArenaService.ins.infoRes;
      }
      
      public function get pageBar() : IPageBar
      {
         return this.pageBarUI as IPageBar;
      }
      
      public function get rankTop() : ArenaRankTop
      {
         return this.topUI as ArenaRankTop;
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         list.itemRender = ArenaRankRender;
         switch(int(param1[0]))
         {
            case 0:
               ServerEngine.ins.send(4038,null,server_arenaGetRankList_cpl);
               setListTitle(ARENA_TITLE);
               break;
            case 1:
               ServerEngine.ins.send(6081,null,server_shenyuanGetRankList_cpl);
               setListTitle(SHENYUAN_TITLE);
               list.itemRender = ShenYuanRankRender;
               break;
            case 2:
               setListTitle(GUILD_DUNGEON);
               list.itemRender = GuildDungeonRankRender;
               onGetRankCpl();
               break;
            case 3:
               ServerEngine.ins.send(6246,null,server_bossRank_cpl);
               setListTitle(NEW_YEAR_BOSS);
               list.itemRender = NewYear2016_BossRankRender;
         }
      }
      
      private function setListTitle(param1:Array) : void
      {
         this.l0.text = LocaleMgr.ins.getStr(param1[0]);
         this.l1.text = LocaleMgr.ins.getStr(param1[1]);
         this.l2.text = LocaleMgr.ins.getStr(param1[2]);
         this.l3.text = LocaleMgr.ins.getStr(param1[3]);
      }
      
      private function server_shenyuanGetRankList_cpl(param1:ShenYuanPaiMingRes) : void
      {
         param1.playerShenyuanInfos.sortOn(PlayerArenaInfo.RANK.name,16);
         var _loc3_:Array = [];
         _loc3_.push(!!param1.playerShenyuanInfos[0]?ArenaUtil.playerSYInfoToPlayerVo(param1.playerShenyuanInfos[0]):null);
         _loc3_.push(!!param1.playerShenyuanInfos[1]?ArenaUtil.playerSYInfoToPlayerVo(param1.playerShenyuanInfos[1]):null);
         _loc3_.push(!!param1.playerShenyuanInfos[2]?ArenaUtil.playerSYInfoToPlayerVo(param1.playerShenyuanInfos[2]):null);
         this.rankTop.refresh(_loc3_);
         var _loc2_:Array = param1.playerShenyuanInfos.concat();
         this.list.array = param1.playerShenyuanInfos;
         this.pageBar.bindList(this.list);
         super.moduleServerCpl();
      }
      
      private function onGetRankCpl() : void
      {
         var _loc2_:Array = [];
         var _loc1_:Array = GuildDungeonModel.ins.damageRankArr;
         _loc2_.push(!!_loc1_[0]?ArenaUtil.playerGuildDungeonToPlayerVo(_loc1_[0]):null);
         _loc2_.push(!!_loc1_[1]?ArenaUtil.playerGuildDungeonToPlayerVo(_loc1_[1]):null);
         _loc2_.push(!!_loc1_[2]?ArenaUtil.playerGuildDungeonToPlayerVo(_loc1_[2]):null);
         this.rankTop.refresh(_loc2_);
         this.list.dataSource = _loc1_;
         this.pageBar.bindList(this.list);
         super.moduleServerCpl();
      }
      
      private function server_arenaGetRankList_cpl(param1:ArenaGetRankListRes) : void
      {
         infoRes.rank = param1.myArenaRank;
         param1.playerArenaInfos.sortOn(PlayerArenaInfo.RANK.name,16);
         var _loc3_:Array = [];
         _loc3_.push(ArenaUtil.playerArenaInfoToPlayerVo(param1.playerArenaInfos[0]));
         _loc3_.push(ArenaUtil.playerArenaInfoToPlayerVo(param1.playerArenaInfos[1]));
         _loc3_.push(ArenaUtil.playerArenaInfoToPlayerVo(param1.playerArenaInfos[2]));
         this.rankTop.refresh(_loc3_);
         var _loc2_:Array = param1.playerArenaInfos.concat();
         this.list.array = param1.playerArenaInfos;
         this.pageBar.bindList(this.list);
         super.moduleServerCpl();
      }
      
      private function server_bossRank_cpl(param1:SpringBeatBossRankListRes, param2:ServerEvent) : void
      {
         this.curRank = param1.myRank;
         param1.rankList.sortOn(Rank.RANK.name,16);
         var _loc4_:Array = [];
         _loc4_.push(!!param1.rankList[0]?NewYear2016_BossRankRender.rankToPlayerVo(param1.rankList[0]):null);
         _loc4_.push(!!param1.rankList[1]?NewYear2016_BossRankRender.rankToPlayerVo(param1.rankList[1]):null);
         _loc4_.push(!!param1.rankList[2]?NewYear2016_BossRankRender.rankToPlayerVo(param1.rankList[2]):null);
         this.rankTop.refresh(_loc4_);
         var _loc3_:Array = param1.rankList.concat();
         this.list.array = param1.rankList;
         this.pageBar.bindList(this.list);
         super.moduleServerCpl();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = this.moduleId;
         this.rankTop.mouseEnabled = false;
         if(param1.length > 1)
         {
            txt_myRank.text = LocaleMgr.ins.getStr(50400106) + (!!curRank?curRank:param1[1]);
         }
         else
         {
            txt_myRank.text = "";
         }
         super.preShow(param1);
      }
   }
}
