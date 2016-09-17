package nslm2.modules.cultivates.horse.horseChange
{
   import game.ui.horseModules.horseChange.HorsePreRenderUI;
   import nslm2.modules.cultivates.horse.HorseService;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class HorsePreRender extends HorsePreRenderUI
   {
       
      
      public function HorsePreRender()
      {
         super();
      }
      
      override protected function validateTxtState() : void
      {
         super.validateTxtState();
         if(this.stcSaddlehorseVo)
         {
            switch(int(HorseService.ins.getState(this.stcSaddlehorseId)) - 1)
            {
               case 0:
               case 1:
                  this.txt_state.color = 458496;
                  this.txt_state.text = LocaleMgr.ins.getStr(999000055);
            }
         }
      }
   }
}
