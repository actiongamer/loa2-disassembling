package nslm2.modules.funnies.arenas.ranks
{
   import game.ui.arenas.ranks.ArenaRankTopUI;
   import proto.ArenaInfoRes;
   import nslm2.modules.funnies.arenas.ArenaService;
   
   public class ArenaRankTop extends ArenaRankTopUI
   {
       
      
      public function ArenaRankTop()
      {
         super();
      }
      
      public function get infoRes() : ArenaInfoRes
      {
         return ArenaService.ins.infoRes;
      }
      
      public function refresh(param1:Array) : void
      {
         this.render1.dataSource = param1[0];
         this.render1["rank"] = 1;
         this.render2.dataSource = param1[1];
         this.render2["rank"] = 2;
         this.render3.dataSource = param1[2];
         this.render3["rank"] = 3;
      }
   }
}
