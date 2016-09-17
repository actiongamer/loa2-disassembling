package nslm2.modules.funnies.arenas.ranks
{
   import game.ui.arenas.ranks.ArenaRankRenderUI;
   import proto.PlayerShenYuanInfo;
   import proto.PlayerArenaInfo;
   import nslm2.modules.funnies.arenas.ArenaUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class ShenYuanRankRender extends ArenaRankRenderUI
   {
       
      
      private var _info:PlayerShenYuanInfo;
      
      public function ShenYuanRankRender()
      {
         super();
      }
      
      public function set info(param1:PlayerShenYuanInfo) : void
      {
         _info as PlayerArenaInfo;
         .super.playerVo = ArenaUtil.playerSYInfoToPlayerVo(param1);
         this.rank = param1.rank;
         this.star = param1.star;
         img_arrow.visible = false;
         this.txt_noChange.text = super.playerVo.fightValue + "";
      }
      
      public function get info() : PlayerShenYuanInfo
      {
         return _info;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         if(param1 is PlayerShenYuanInfo)
         {
            this.info = param1 as PlayerShenYuanInfo;
         }
         .super.dataSource = param1;
      }
      
      public function set rank(param1:int) : void
      {
         this.txt_rank.text = LocaleMgr.ins.getStr(50200020,[param1]);
      }
      
      public function set star(param1:int) : void
      {
         this.txt_lv.text = param1 + "";
      }
   }
}
