package nslm2.modules.battles.battlefields.panels
{
   import game.ui.battlefield.panel.BattlefieldFlagPanelUI;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class BattleFieldFlagInfoPanel extends BattlefieldFlagPanelUI
   {
       
      
      public function BattleFieldFlagInfoPanel()
      {
         super();
         this.img_bg.url = UrlLib.battlefieldBg("bg2.jpg");
      }
   }
}
