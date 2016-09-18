package nslm2.modules.foundations.guildModule.view.panel.show
{
   import game.ui.guildModules.GuildDisplayView.JoinShowViewUI;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class GuildJoinShow extends JoinShowViewUI
   {
       
      
      public function GuildJoinShow()
      {
         super();
         btn_join.clickHandler = showGuildJoinPanel;
      }
      
      private function showGuildJoinPanel(param1:Button) : void
      {
         ModuleMgr.ins.showModule(40711,null,40700);
      }
   }
}
