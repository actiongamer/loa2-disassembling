package nslm2.common.ui.components.comps2d
{
   import game.ui.commons.icons.WealthRenderS7UI;
   import morn.customs.FilterLib;
   
   public class WealthRenderS7 extends WealthRenderS7UI
   {
       
      
      public function WealthRenderS7()
      {
         super();
      }
      
      override protected function validateTxtNum() : void
      {
         super.validateTxtNum();
         if(this.wealthVo && this.wealthVo.showCount == 0)
         {
            this.ref_img_icon.filters = FilterLib.ins.getFilterArr(401);
            this.ref_img_quality.filters = FilterLib.ins.getFilterArr(401);
            this.ref_txt_num.color = 16723968;
         }
         else
         {
            this.ref_txt_num.color = 14210735;
            this.ref_img_icon.filters = null;
            this.ref_img_quality.filters = null;
         }
      }
   }
}
