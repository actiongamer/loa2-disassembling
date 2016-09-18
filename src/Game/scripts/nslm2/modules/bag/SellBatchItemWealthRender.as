package nslm2.modules.bag
{
   import game.ui.BagModules.SellBatchItemWealthRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   
   public class SellBatchItemWealthRender extends SellBatchItemWealthRenderUI
   {
       
      
      public function SellBatchItemWealthRender()
      {
         super();
      }
      
      override protected function showTxtNum(param1:Number) : void
      {
         if(param1 || wealthVo.useStcCount)
         {
            this.ref_txt_num.text = LocaleConsts.getNumberAbbr2(String(param1));
            this.ref_txt_num.visible = true;
         }
         else
         {
            this.ref_txt_num.visible = false;
         }
      }
   }
}
