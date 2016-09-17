package nslm2.modules.funnies.dials.renders
{
   import game.ui.dialModule.renders.DialWealthRenderUI;
   
   public class DialWealthRender extends DialWealthRenderUI
   {
       
      
      public var showName:Boolean = true;
      
      public function DialWealthRender()
      {
         super();
      }
      
      override protected function validateTxtName() : void
      {
         if(showName)
         {
            this.ref_txt_name.text = wealthVo.showName + ":";
            this.ref_txt_num.x = this.ref_txt_name.textWidth + this.ref_txt_name.x;
         }
         else
         {
            this.ref_txt_name.text = "";
            this.ref_txt_num.x = this.ref_txt_name.x;
         }
      }
   }
}
