package nslm2.modules.funnies.arenas.ranks
{
   import game.ui.arenas.ranks.ArenaRankRenderUI;
   import proto.FamilyStageRank;
   import nslm2.modules.funnies.arenas.ArenaUtil;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.battles.guildDungeons.GuildDungeonModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   
   public class GuildDungeonRankRender extends ArenaRankRenderUI
   {
       
      
      private var _info:FamilyStageRank;
      
      public function GuildDungeonRankRender()
      {
         super();
      }
      
      public function set info(param1:FamilyStageRank) : void
      {
         _info = param1;
         .super.playerVo = ArenaUtil.playerGuildDungeonToPlayerVo(param1);
         this.rank = Uint64Util.indexByAttr(GuildDungeonModel.ins.damageRankArr,"playerid",info.playerid) + 1;
         this.times = param1.times;
         this.hurt = Uint64Util.toNumber(param1.hurt);
         img_arrow.visible = false;
      }
      
      public function get info() : FamilyStageRank
      {
         return _info;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         if(param1 is FamilyStageRank)
         {
            this.info = param1 as FamilyStageRank;
         }
      }
      
      public function set rank(param1:int) : void
      {
         this.txt_rank.text = LocaleMgr.ins.getStr(50200020,[param1]);
      }
      
      public function set times(param1:int) : void
      {
         this.txt_lv.text = param1.toString();
      }
      
      public function set hurt(param1:Number) : void
      {
         this.txt_noChange.text = LocaleConsts.getNumberAbbr3(param1.toString());
      }
   }
}
