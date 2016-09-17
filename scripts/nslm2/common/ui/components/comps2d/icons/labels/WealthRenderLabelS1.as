package nslm2.common.ui.components.comps2d.icons.labels
{
   import game.ui.commons.icons.labels.WealthRenderLabelS1UI;
   
   public class WealthRenderLabelS1 extends WealthRenderLabelS1UI
   {
       
      
      public function WealthRenderLabelS1()
      {
         super();
      }
      
      override protected function showTxtNum(param1:Number) : void
      {
         if(param1 || wealthVo.useStcCount)
         {
            this.ref_txt_num.text = (!!this.showMultipleSign?"x":"") + param1;
            this.ref_txt_num.commitMeasure();
            this.width = ref_txt_num.x + ref_txt_num.textWidth + 4;
            this.ref_txt_num.y = (this.height - this.txt_num.textHeight) / 2 + 1;
         }
         else
         {
            this.ref_txt_num.visible = false;
         }
      }
   }
}
