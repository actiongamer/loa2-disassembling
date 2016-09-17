package nslm2.modules.foundations.playerHeaders
{
   import game.ui.playerHeaders.PlayerHeaderWealthRenderUI;
   import flash.events.Event;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   
   public class PlayerHeaderWealthRender extends PlayerHeaderWealthRenderUI
   {
       
      
      public function PlayerHeaderWealthRender()
      {
         super();
         this.txt_num.addEventListener("change",changeHandler);
      }
      
      private function changeHandler(param1:Event) : void
      {
         if(this.wealthVo.kind == 2)
         {
            this.txt_num.text = this.wealthVo.showCount + "/" + PlayerModel.ins.staminaMax;
         }
         else
         {
            this.txt_num.text = LocaleConsts.getNumberAbbr2(this.wealthVo.showCount.toString());
         }
      }
      
      override protected function validateImgIcon() : void
      {
         super.validateImgIcon();
      }
   }
}
