package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipIconAndName_heroUI;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.mgrs.skins.ColorLib;
   import com.mz.core.configs.ClientConfig;
   import nslm2.common.ui.components.comps2d.others.FightValueBox;
   
   public class TooltipIconAndName_hero extends TooltipIconAndName_heroUI
   {
       
      
      public function TooltipIconAndName_hero(param1:String, param2:int, param3:String, param4:String, param5:int, param6:String, param7:String)
      {
         super();
         this.img_quality.skin = SkinLib.changeSkinNum_underline(this.img_quality.skin,param2);
         this.img_icon.skin = param1;
         this.txt_name.color = ColorLib.qualityColor(param2);
         this.txt_name.text = param3;
         if(ClientConfig.isRuLang())
         {
            this.txt_kind.width = 80;
         }
         this.txt_kind.text = param4;
         if(param5 > 0)
         {
            (this.fightValueBox as FightValueBox).tweenValue = param5;
         }
         else
         {
            this.fightValueBox.visible = false;
         }
         this.img_group.skin = param6;
         this.txt_group.text = param7;
         this.x = 15;
      }
   }
}
