package nslm2.modules.battles.battlefields.panels
{
   import game.ui.battlefield.panel.BattlefieldCrystalPanelUI;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class BattlefieldCrystalPanel extends BattlefieldCrystalPanelUI
   {
       
      
      public function BattlefieldCrystalPanel()
      {
         super();
         this.img_bg.url = UrlLib.battlefieldBg("bg1.jpg");
      }
   }
}
