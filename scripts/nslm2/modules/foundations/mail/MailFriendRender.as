package nslm2.modules.foundations.mail
{
   import game.ui.MailModules.MailFriendRenderUI;
   import proto.GameFriendData;
   import flash.events.MouseEvent;
   import com.mz.core.event.MzEvent;
   
   public class MailFriendRender extends MailFriendRenderUI
   {
       
      
      public function MailFriendRender()
      {
         super();
         this.addEventListener("click",this_onClick);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         var _loc2_:GameFriendData = param1 as GameFriendData;
         if(_loc2_)
         {
            this.txtFriendName.text = _loc2_.name;
            this.txtFriendLv.text = "Lv. " + _loc2_.level.toString();
         }
      }
      
      private function this_onClick(param1:MouseEvent) : void
      {
         this.dispatchEvent(new MzEvent("mailToFriend",this.dataSource,true));
      }
   }
}
