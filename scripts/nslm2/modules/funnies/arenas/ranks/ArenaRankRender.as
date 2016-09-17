package nslm2.modules.funnies.arenas.ranks
{
   import game.ui.arenas.ranks.ArenaRankRenderUI;
   import proto.PlayerArenaInfo;
   import nslm2.modules.funnies.arenas.ArenaUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class ArenaRankRender extends ArenaRankRenderUI
   {
       
      
      private var _info:PlayerArenaInfo;
      
      public function ArenaRankRender()
      {
         super();
      }
      
      public function set info(param1:PlayerArenaInfo) : void
      {
         _info = param1;
         .super.playerVo = ArenaUtil.playerArenaInfoToPlayerVo(param1);
         this.rank = param1.rank;
         img_arrow.visible = false;
         this.txt_noChange.text = super.playerVo.fightValue + "";
      }
      
      public function get info() : PlayerArenaInfo
      {
         return _info;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         if(param1 is PlayerArenaInfo)
         {
            this.info = param1 as PlayerArenaInfo;
         }
         .super.dataSource = param1;
      }
      
      public function set rank(param1:int) : void
      {
         this.txt_rank.text = LocaleMgr.ins.getStr(50200020,[param1]);
      }
   }
}
