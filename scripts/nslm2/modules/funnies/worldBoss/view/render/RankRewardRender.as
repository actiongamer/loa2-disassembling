package nslm2.modules.funnies.worldBoss.view.render
{
   import game.ui.worldBoss.render.HornorRankRewardRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   
   public class RankRewardRender extends HornorRankRewardRenderUI
   {
       
      
      public function RankRewardRender()
      {
         super();
      }
      
      override protected function showTxtNum(param1:Number) : void
      {
         if(param1 > 1)
         {
            this.ref_txt_num.text = (!!this.showMultipleSign?"x":"") + LocaleConsts.getNumberAbbr2(param1.toString(),9999);
            this.ref_txt_num.visible = true;
         }
         else
         {
            this.ref_txt_num.visible = false;
         }
      }
   }
}
