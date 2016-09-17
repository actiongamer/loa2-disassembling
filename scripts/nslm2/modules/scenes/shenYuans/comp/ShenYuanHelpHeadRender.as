package nslm2.modules.scenes.shenYuans.comp
{
   import game.ui.shenYuans.ShenYuanHelpHeadUI;
   
   public class ShenYuanHelpHeadRender extends ShenYuanHelpHeadUI
   {
       
      
      public function ShenYuanHelpHeadRender()
      {
         super();
         this.nameUseLink = true;
      }
      
      override protected function validateTxtFightValue() : void
      {
         if(playerVo && isNaN(playerVo.fightValue) == false)
         {
            txt_fightValue.value = playerVo.fightValue;
         }
      }
   }
}
