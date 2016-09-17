package nslm2.modules.bag.equipComposes
{
   import game.ui.BagModules.equipComposes.EquipComposeRenderToUI;
   
   public class EquipComposeRenderTo extends EquipComposeRenderToUI
   {
       
      
      public function EquipComposeRenderTo()
      {
         super();
      }
      
      override protected function showTxtNum(param1:Number) : void
      {
         this.ref_txt_num.color = param1 > 0?458496:16723968;
         this.ref_txt_num.text = String(param1);
         this.ref_txt_num.visible = true;
      }
   }
}
