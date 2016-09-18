package nslm2.modules.foundations.ranks.comp
{
   import game.ui.rankModules.RankTitleInfoUI;
   
   public class RankTitleInfo extends RankTitleInfoUI
   {
       
      
      public function RankTitleInfo(param1:String, param2:String, param3:String, param4:String, param5:String)
      {
         super();
         this.txt_head_1.text = param1;
         this.txt_head_2.text = param2;
         this.txt_head_3.text = param3;
         this.txt_head_4.text = param4;
         this.txt_head_5.text = param5;
      }
   }
}
