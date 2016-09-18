package nslm2.modules.funnies.newYears.day51s.renders
{
   import game.ui.newYears.day51s.renders.Day51CoinRenderUI;
   
   public class Day51CoinRender extends Day51CoinRenderUI
   {
       
      
      public function Day51CoinRender()
      {
         super();
      }
      
      override protected function validateTxtName() : void
      {
         super.validateTxtName();
         this.ref_txt_name.text = this.ref_txt_name.text + "：";
         this.ref_txt_num.x = this.ref_txt_name.textWidth + this.ref_txt_name.x;
      }
   }
}
