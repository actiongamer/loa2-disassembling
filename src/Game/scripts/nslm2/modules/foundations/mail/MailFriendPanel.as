package nslm2.modules.foundations.mail
{
   import game.ui.MailModules.MailFriendPanelUI;
   
   public class MailFriendPanel extends MailFriendPanelUI
   {
       
      
      public function MailFriendPanel()
      {
         super();
         this.listFriends.selectEnable = false;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         var _loc2_:Array = param1 as Array;
         if(_loc2_)
         {
            this.listFriends.dataSource = _loc2_;
            if(_loc2_.length > 0)
            {
               this.height = this.listFriends.height;
               this.imgBg.height = this.listFriends.height + 32;
            }
            else
            {
               this.height = 0;
               this.imgBg.height = 0;
            }
         }
         else
         {
            this.height = 0;
            this.imgBg.height = 0;
         }
      }
   }
}
