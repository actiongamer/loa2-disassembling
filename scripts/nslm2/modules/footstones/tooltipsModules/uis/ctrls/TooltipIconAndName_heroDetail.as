package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import game.ui.tooltipModules.comps.TooltipIconAndName_heroDetailUI;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.common.ui.components.comps2d.others.FightValueBox;
   
   public class TooltipIconAndName_heroDetail extends TooltipIconAndName_heroDetailUI
   {
       
      
      public function TooltipIconAndName_heroDetail(param1:String, param2:int, param3:String, param4:String, param5:int, param6:String, param7:String)
      {
         super();
         this.img_quality.skin = SkinLib.changeSkinNum_underline(this.img_quality.skin,param2);
         this.img_icon.skin = param1;
         this.txt_name.color = ColorLib.qualityColor(param2);
         this.txt_name.text = param3;
         if(param5 > 0)
         {
            (this.fightValueBox2 as FightValueBox).tweenValue = param5;
         }
         else
         {
            this.fightValueBox2.visible = false;
         }
         this.img_group.skin = param6;
         this.txt_group.text = param7;
         this.x = 15;
      }
   }
}
