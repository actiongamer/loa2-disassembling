package nslm2.common.ui.components.comps2d
{
   import game.ui.commons.icons.LotteryRenderS5UI;
   import nslm2.mgrs.skins.ColorLib;
   
   public class LotteryRenderS5 extends LotteryRenderS5UI
   {
       
      
      public function LotteryRenderS5()
      {
         super();
      }
      
      override protected function validateTxtName() : void
      {
         if(this.ref_txt_name != null)
         {
            if(wealthVo && wealthVo.kind != 0 && wealthVo.kind != 999999)
            {
               this.ref_txt_name.color = ColorLib.qualityColor(wealthVo.quality);
               this.ref_txt_name.text = wealthVo.showName + ":";
               this.ref_txt_name.visible = true;
            }
            else
            {
               this.ref_txt_name.visible = false;
            }
         }
      }
   }
}
