package nslm2.modules.foundations.mall.view.render
{
   import game.ui.mallModule.render.MallBannelItemRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   
   public class MallBannelItemRender extends MallBannelItemRenderUI
   {
       
      
      public function MallBannelItemRender()
      {
         super();
      }
      
      override protected function showTxtNum(param1:Number) : void
      {
         if(param1 > 1)
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
