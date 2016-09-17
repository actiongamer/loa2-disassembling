package nslm2.modules.cultivates.horse.horseMaster
{
   import game.ui.horseModules.horseMaster.HorseMasterLvLabelUI;
   import nslm2.modules.cultivates.horse.utils.HorseUtil;
   import nslm2.common.compsEffects.FloatZoomInEffCtrl;
   
   public class HorseMasterLvLabel extends HorseMasterLvLabelUI
   {
       
      
      public function HorseMasterLvLabel()
      {
         super();
      }
      
      public function show(param1:int, param2:Boolean) : void
      {
         this.txt_lv.text = HorseUtil.getLevelName(param1);
         if(param2)
         {
            new FloatZoomInEffCtrl(this.txt_lv);
         }
      }
   }
}
