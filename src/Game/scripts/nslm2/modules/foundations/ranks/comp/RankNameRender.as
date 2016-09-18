package nslm2.modules.foundations.ranks.comp
{
   import game.ui.rankModules.RankNameRenderUI;
   import nslm2.modules.foundations.ranks.RankConst;
   import nslm2.modules.foundations.ranks.RankUtil;
   
   public class RankNameRender extends RankNameRenderUI
   {
       
      
      public function RankNameRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         var _loc2_:RankUtil = RankConst.ins.getRankBangDan(param1 as int);
         this.img_waiwei.skin = _loc2_.img_waiwei;
         this.img_tubiao.skin = _loc2_.img_tubiao;
         this.img_bg.skin = _loc2_.img_bg;
         this.txt_bangdanname.text = _loc2_.txt_wenzi;
      }
   }
}
