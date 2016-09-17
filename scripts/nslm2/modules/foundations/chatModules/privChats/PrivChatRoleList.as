package nslm2.modules.foundations.chatModules.privChats
{
   import game.ui.chatModules.privChats.PrivChatRoleListUI;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.modules.foundations.friendModules.FriendService;
   
   public class PrivChatRoleList extends PrivChatRoleListUI
   {
       
      
      public function PrivChatRoleList()
      {
         super();
         this.list_player.selectedIndex = 0;
         this.pageBar.bindList(this.list_player);
      }
      
      public function get pageBar() : IPageBar
      {
         return this.pageBarUI as IPageBar;
      }
      
      public function refresh() : void
      {
         this.list_player.array = FriendService.ins.recentlyArr;
      }
   }
}
