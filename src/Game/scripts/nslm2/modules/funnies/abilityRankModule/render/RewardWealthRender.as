package nslm2.modules.funnies.abilityRankModule.render
{
   import game.ui.abilityRankModule.render.AbilityRewardRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   
   public class RewardWealthRender extends AbilityRewardRenderUI
   {
       
      
      public function RewardWealthRender()
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
