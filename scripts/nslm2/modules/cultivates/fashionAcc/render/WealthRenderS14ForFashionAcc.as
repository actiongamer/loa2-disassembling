package nslm2.modules.cultivates.fashionAcc.render
{
   import game.ui.commons.icons.WealthRenderS14UI;
   
   public class WealthRenderS14ForFashionAcc extends WealthRenderS14UI
   {
       
      
      public function WealthRenderS14ForFashionAcc()
      {
         super();
      }
      
      override protected function validateQuality() : void
      {
         super.validateQuality();
         if(dataSource == null)
         {
            this.ref_img_quality.skin = "png.a5.bgs.iconBgs.img_iconBgItemS1_" + 0;
            this.ref_img_quality.width = 56;
            this.ref_img_quality.height = 56;
            this.buttonMode = false;
            this.ref_img_quality.visible = true;
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            this.buttonMode = true;
         }
      }
   }
}
