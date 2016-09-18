package nslm2.modules.funnies.arenas.ranks
{
   import game.ui.arenas.ranks.ArenaRankTopRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class ArenaRankTopRender extends ArenaRankTopRenderUI
   {
       
      
      public function ArenaRankTopRender()
      {
         super();
         this.img_icon.cacheAsBitmap = true;
         this.img_mask.cacheAsBitmap = true;
         this.img_icon.mask = this.img_mask;
         this.txt_name.text = "";
         this.txt_rank.text = "";
      }
      
      public function set rank(param1:int) : void
      {
         this.txt_rank.text = LocaleMgr.ins.getStr(50200020,[param1]);
      }
   }
}
