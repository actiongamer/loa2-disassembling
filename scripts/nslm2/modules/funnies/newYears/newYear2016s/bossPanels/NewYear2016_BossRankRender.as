package nslm2.modules.funnies.newYears.newYear2016s.bossPanels
{
   import game.ui.arenas.ranks.ArenaRankRenderUI;
   import nslm2.common.vo.PlayerVo;
   import proto.SpringBeatBossRankListRes.Rank;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class NewYear2016_BossRankRender extends ArenaRankRenderUI
   {
       
      
      private var _info:Rank;
      
      public function NewYear2016_BossRankRender()
      {
         super();
      }
      
      public static function rankToPlayerVo(param1:Rank) : PlayerVo
      {
         var _loc2_:PlayerVo = new PlayerVo();
         _loc2_.playerId = param1.uid;
         _loc2_.baseId = param1.stcNpcId;
         _loc2_.fightValue = Uint64Util.toNumber(param1.ability);
         _loc2_.level = param1.level;
         _loc2_.name = param1.name;
         _loc2_.headerIconUrl = HeroInfoUtil.getHeadIconUrl(param1.uid,param1.stcNpcId);
         _loc2_.militaryRank = param1.huizhang;
         return _loc2_;
      }
      
      public function set info(param1:Rank) : void
      {
         _info = param1;
         .super.playerVo = rankToPlayerVo(param1);
         this.rank = param1.rank;
         img_arrow.visible = false;
         this.txt_noChange.text = String(_info.damage);
      }
      
      public function get info() : Rank
      {
         return _info;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         if(param1 is Rank)
         {
            this.info = param1 as Rank;
         }
         .super.dataSource = param1;
      }
      
      public function set rank(param1:int) : void
      {
         this.txt_rank.text = LocaleMgr.ins.getStr(50200020,[param1]);
      }
   }
}
