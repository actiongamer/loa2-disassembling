package nslm2.modules.foundations.friendModules.mains
{
   import game.ui.friendModules.mains.FriendRecenltyListRender_PlayerUI;
   
   public class FriendRecenltyListRender_Player extends FriendRecenltyListRender_PlayerUI
   {
       
      
      public function FriendRecenltyListRender_Player()
      {
         super();
         this.nameUseLink = false;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
      }
   }
}
