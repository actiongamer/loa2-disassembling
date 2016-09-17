package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipIconAndName_petUI;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.common.ui.components.comps2d.others.FightValueBox;
   
   public class TooltipPetBaseInfo extends TooltipIconAndName_petUI
   {
       
      
      public function TooltipPetBaseInfo(param1:String, param2:int, param3:String, param4:String, param5:int, param6:String, param7:*, param8:Array)
      {
         super();
         this.img_quality.skin = SkinLib.changeSkinNum_underline(this.img_quality.skin,param2);
         this.img_icon.skin = param1;
         this.txt_name.color = ColorLib.qualityColor(param2);
         this.txt_name.text = param3;
         this.txt_kind.text = param4;
         this.txt_lvl.text = param6;
         this.txt_grade.text = param7;
         if(param5 > 0)
         {
            (this.fightValueBox as FightValueBox).tweenValue = param5;
         }
         else
         {
            this.fightValueBox.visible = false;
         }
         this.list_stars.dataSource = param8;
         this.list_stars.repeatX = param8.length;
         this.x = 15;
      }
   }
}
