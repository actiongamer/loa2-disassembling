package nslm2.modules.battles.battleResults.battleLoss
{
   import game.ui.battleResults.BattleLossRenderUI;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.uiEffects.RoleGrowFilterMed;
   import morn.customs.FilterLib;
   
   public class BattleLossRender extends BattleLossRenderUI
   {
       
      
      public function BattleLossRender()
      {
         super();
         this.parts.push(new RoleGrowFilterMed(this,FilterLib.TEXT_GROW_SELECTED_FILTER));
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         this.img_bg.skin = UrlLib.battleLossFunImg(param1 as int);
         if(ClientConfig.isRuLang())
         {
            this.txt_name.size = 12;
         }
         this.txt_name.text = LocaleMgr.ins.getStr(9800000 + (param1 as int));
      }
   }
}
