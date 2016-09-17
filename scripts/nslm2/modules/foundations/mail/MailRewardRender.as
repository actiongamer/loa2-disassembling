package nslm2.modules.foundations.mail
{
   import game.ui.MailModules.MailRewardRenderUI;
   
   public class MailRewardRender extends MailRewardRenderUI
   {
       
      
      public function MailRewardRender()
      {
         super();
      }
      
      override protected function validateQuality() : void
      {
         super.validateQuality();
         if(this.ref_img_quality.visible == false)
         {
            this.ref_img_quality.skin = this.ori_img_quality_skin + 0;
            this.ref_img_quality.visible = true;
         }
      }
   }
}
