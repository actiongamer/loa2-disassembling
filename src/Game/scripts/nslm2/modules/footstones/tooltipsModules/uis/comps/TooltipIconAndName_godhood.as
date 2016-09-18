package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipIconAndName_godhoodUI;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   
   public class TooltipIconAndName_godhood extends TooltipIconAndName_godhoodUI
   {
       
      
      public function TooltipIconAndName_godhood(param1:String, param2:int, param3:String, param4:String, param5:String, param6:String)
      {
         super();
         this.img_quality.skin = SkinLib.changeSkinNum_underline(this.img_quality.skin,param2);
         this.img_icon.skin = param1;
         this.txt_name.color = ColorLib.qualityColor(param2);
         this.txt_name.text = param3;
         this.txt_kind.text = param4;
         if(int(param5) < int(param6))
         {
            this.txt_has.text = LocaleMgr.ins.getStr(60300008) + param5 + TextFieldUtil.htmlText2(" (" + LocaleMgr.ins.getStr(30100406) + ")",16723968);
         }
         else
         {
            this.txt_has.text = LocaleMgr.ins.getStr(60300008) + param5;
         }
         this.txt_needCnt.text = LocaleMgr.ins.getStr(30100407) + param6;
         this.x = 15;
      }
   }
}
