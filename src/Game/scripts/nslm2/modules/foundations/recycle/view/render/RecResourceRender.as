package nslm2.modules.foundations.recycle.view.render
{
   import game.ui.recycleModules.render.RecWealthRenderUI;
   
   public class RecResourceRender extends RecWealthRenderUI
   {
       
      
      public function RecResourceRender()
      {
         super();
      }
      
      override protected function validateTxtNum() : void
      {
         super.validateTxtNum();
         this.txt_num.width = this.txt_num.textWidth + 10;
         this.txt_num.x = this.width - this.txt_num.width;
         this.img_icon.x = this.txt_num.x - img_icon.width - 5;
      }
   }
}
