package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipIconAndName_playerUI;
   
   public class TooltipIconAndName_player extends TooltipIconAndName_playerUI
   {
       
      
      public function TooltipIconAndName_player(param1:String, param2:int, param3:String, param4:int)
      {
         super();
         this.txt_name.text = param3;
         this.txt_value.text = param2.toString();
         this.img_icon.skin = param1;
         if(param4 > 0)
         {
            this.fightValueBox.txt_fightValue.value = param4;
         }
         else
         {
            this.fightValueBox.visible = false;
         }
         this.x = 15;
      }
   }
}
