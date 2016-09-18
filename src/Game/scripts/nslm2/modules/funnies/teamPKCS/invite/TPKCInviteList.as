package nslm2.modules.funnies.teamPKCS.invite
{
   import game.ui.teamPKCS.invite.TPKCInviteListUI;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.event.MzEvent;
   import nslm2.common.compsEffects.ListCellTweenEffect;
   import com.netease.protobuf.UInt64;
   import proto.TeamInvitedNotify;
   
   public class TPKCInviteList extends TPKCInviteListUI
   {
       
      
      public function TPKCInviteList()
      {
         super();
         this.list_invited.itemRender = TPKCInviteRender;
      }
      
      public function get pageBar() : IPageBar
      {
         return this.pageBarUI as IPageBar;
      }
      
      public function get service() : TeamGuajiService
      {
         return TeamGuajiService.ins;
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            service.addEventListener("EVT_TEAM_INVITED_NOTIFY",onInvitedChanged);
         }
         else
         {
            service.removeEventListener("EVT_TEAM_INVITED_NOTIFY",onInvitedChanged);
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.pageBar.bindList(this.list_invited);
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(50800020);
         this.list_invited.dataSource = service.invitedNotifies;
         this.img_bg_list.skin = UrlLib.tpkcUrl("img_bg_list.png");
         this.preShowCpl();
      }
      
      private function onInvitedChanged(param1:MzEvent) : void
      {
         new ListCellTweenEffect(this.list_invited,service.invitedNotifies).set_compareDataHandler(compareDataHandler).exec();
      }
      
      private function compareDataHandler(param1:TeamInvitedNotify) : UInt64
      {
         return param1.teamId;
      }
   }
}
