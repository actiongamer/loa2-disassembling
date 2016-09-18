package nslm2.modules.foundations.playerHeaders
{
   import game.ui.playerHeaders.PlayerHeaderStaminaBarUI;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.WealthUtil;
   
   public class PlayerHeaderStaminaBar extends PlayerHeaderStaminaBarUI
   {
       
      
      public function PlayerHeaderStaminaBar()
      {
         super();
      }
      
      override protected function validateTxtNum() : void
      {
         super.validateTxtNum();
         if(this.wealthVo)
         {
            this.bar_num.value = PlayerModel.ins.stamina / PlayerModel.ins.staminaMax;
            this.txt_value.text = PlayerModel.ins.stamina + "/" + PlayerModel.ins.staminaMax;
         }
      }
      
      override protected function validateTooltip() : void
      {
         if(this.wealthVo)
         {
            this.toolTip = WealthUtil.createWealthVo(2,0,PlayerModel.ins.stamina);
         }
         else
         {
            this.toolTip = null;
         }
      }
   }
}
