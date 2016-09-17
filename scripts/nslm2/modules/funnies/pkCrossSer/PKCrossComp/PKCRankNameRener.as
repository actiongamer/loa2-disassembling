package nslm2.modules.funnies.pkCrossSer.PKCrossComp
{
   import game.ui.rankModules.RankNameRenderUI;
   import nslm2.modules.foundations.ranks.RankUtil;
   
   public class PKCRankNameRener extends RankNameRenderUI
   {
       
      
      public function PKCRankNameRener()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         var _loc2_:RankUtil = param1 as RankUtil;
         this.img_waiwei.skin = _loc2_.img_waiwei;
         this.img_tubiao.skin = _loc2_.img_tubiao;
         this.img_bg.skin = _loc2_.img_bg;
         this.txt_bangdanname.text = _loc2_.txt_wenzi;
      }
   }
}
