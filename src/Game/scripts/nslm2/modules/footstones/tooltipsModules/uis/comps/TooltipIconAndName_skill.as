package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipIconAndName_normalUI;
   import com.mz.core.configs.ClientConfig;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   
   public class TooltipIconAndName_skill extends TooltipIconAndName_normalUI
   {
       
      
      public function TooltipIconAndName_skill(param1:String, param2:int, param3:String, param4:String, param5:int = 0)
      {
         super();
         if(ClientConfig.isRuLang())
         {
            this.txt_name.size = 12;
         }
         this.img_icon.skin = param1;
         this.img_quality.skin = SkinLib.changeSkinNum_underline(this.img_quality.skin,param2);
         this.txt_name.color = ColorLib.qualityColor(param2);
         this.txt_name.text = param3;
         this.txt_kind.text = param4;
         this.txt2.color = 13198693;
         this.txt2.text = LocaleMgr.ins.getStr(10220008) + "    " + LocaleConsts.lvStr(param5);
         this.x = 15;
      }
   }
}
