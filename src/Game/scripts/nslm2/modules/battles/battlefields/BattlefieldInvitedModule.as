package nslm2.modules.battles.battlefields
{
   import game.ui.battlefield.BattlefieldInvited.BattlefieldInvitedModuleUI;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.event.MzEvent;
   import nslm2.common.compsEffects.ListCellTweenEffect;
   import com.netease.protobuf.UInt64;
   import proto.TeamInvitedNotify;
   
   public class BattlefieldInvitedModule extends BattlefieldInvitedModuleUI
   {
       
      
      public function BattlefieldInvitedModule()
      {
         super();
      }
      
      public function get pageBar() : IPageBar
      {
         return this.pageBarUI as IPageBar;
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            BattlefieldMsgs.ins.addEventListener("msgBattlefieldInvitedChanged",onInvitedChanged);
         }
         else
         {
            BattlefieldMsgs.ins.removeEventListener("msgBattlefieldInvitedChanged",onInvitedChanged);
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.pageBar.bindList(this.list_invited);
         this.panelBg.titleImgId = this.moduleId;
         this.list_invited.dataSource = BattlefieldModel.ins.invitedNotifies;
         this.img_bg.url = UrlLib.battlefieldUI("img_invitedBg");
         this.preShowCpl();
      }
      
      private function onInvitedChanged(param1:MzEvent) : void
      {
         new ListCellTweenEffect(this.list_invited,BattlefieldModel.ins.invitedNotifies).set_compareDataHandler(compareDataHandler).exec();
      }
      
      private function compareDataHandler(param1:TeamInvitedNotify) : UInt64
      {
         return param1.teamId;
      }
   }
}
