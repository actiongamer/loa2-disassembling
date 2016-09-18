package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipIconAndName_normalUI;
   import com.mz.core.configs.ClientConfig;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class TooltipIconAndName_itemNormal extends TooltipIconAndName_normalUI
   {
       
      
      public function TooltipIconAndName_itemNormal(param1:String, param2:int, param3:String, param4:String, param5:int)
      {
         super();
         if(ClientConfig.isRuLang())
         {
            this.txt_name.size = 12;
         }
         this.img_quality.skin = SkinLib.changeSkinNum_underline(this.img_quality.skin,param2);
         this.img_icon.skin = param1;
         this.txt_name.color = ColorLib.qualityColor(param2);
         this.txt_name.text = param3;
         this.txt_kind.text = param4;
         if(param5 > 0 && param5 != 1)
         {
            this.txt2.color = param5 <= PlayerModel.ins.level?458496:16723968;
            this.txt2.text = LocaleMgr.ins.getStr(10000003) + ": " + param5;
         }
         else
         {
            this.txt2.text = "";
         }
         this.x = 15;
      }
   }
}
