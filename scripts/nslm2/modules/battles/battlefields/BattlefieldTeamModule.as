package nslm2.modules.battles.battlefields
{
   import game.ui.battlefield.BattlefieldTeam.BattlefieldTeamModuleUI;
   import nslm2.modules.battles.battlefields.panels.BattlefieldTeamInfoPanel;
   import nslm2.modules.battles.battlefields.panels.BattlefieldInvitePlayersPanel;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import nslm2.modules.battles.battlefields.service.BattlefieldService;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   
   public class BattlefieldTeamModule extends BattlefieldTeamModuleUI
   {
       
      
      public function BattlefieldTeamModule()
      {
         super();
         switchEventListeners(true);
      }
      
      private function get panel_teamInfo() : BattlefieldTeamInfoPanel
      {
         return this.ref_panel_teamInfo as BattlefieldTeamInfoPanel;
      }
      
      private function get panel_invitePlayers() : BattlefieldInvitePlayersPanel
      {
         return this.ref_panel_invitePlayers as BattlefieldInvitePlayersPanel;
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            BattlefieldMsgs.ins.addEventListener("msgBattlefieldPlayersReady",onPlayersReady);
            BattlefieldMsgs.ins.addEventListener("msgBattlefieldMemChanged",onMemChanged);
            BattlefieldMsgs.ins.addEventListener("msgBattlefieldTeamDismissed",onTeamDismissed);
         }
         else
         {
            BattlefieldMsgs.ins.removeEventListener("msgBattlefieldPlayersReady",onPlayersReady);
            BattlefieldMsgs.ins.removeEventListener("msgBattlefieldMemChanged",onMemChanged);
            BattlefieldMsgs.ins.removeEventListener("msgBattlefieldTeamDismissed",onTeamDismissed);
         }
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         BattlefieldService.ins.getPlayersList();
      }
      
      private function onPlayersReady(param1:MzEvent) : void
      {
         this.moduleServerCpl();
      }
      
      private function onMemChanged(param1:MzEvent) : void
      {
         this.panel_teamInfo.show(param1.data as Array);
      }
      
      private function onTeamDismissed(param1:MzEvent) : void
      {
         ModuleMgr.ins.closeModule(50501);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc2_:Array = param1 as Array;
         this.panelBg.titleImgId = this.moduleId;
         this.panel_teamInfo.show(_loc2_);
         this.panel_invitePlayers.show();
         this.render_mapInfo.dataSource = StcMgr.ins.getBginfoVo(BattlefieldModel.ins.curBattlefieldId);
         this.preShowCpl();
      }
   }
}
