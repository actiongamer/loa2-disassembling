package nslm2.modules.foundations.mall.view.render
{
   import game.ui.mallModule.render.MallBuyConfirmItemRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   
   public class MallBuyComfrimItemRender extends MallBuyConfirmItemRenderUI
   {
       
      
      public function MallBuyComfrimItemRender()
      {
         super();
      }
      
      override protected function showTxtNum(param1:Number) : void
      {
         if(param1 > 0)
         {
            this.ref_txt_num.text = (!!this.showMultipleSign?"x":"") + LocaleConsts.getNumberAbbr2(param1.toString(),99999);
            this.ref_txt_num.visible = true;
         }
         else
         {
            this.ref_txt_num.visible = false;
         }
      }
   }
}
