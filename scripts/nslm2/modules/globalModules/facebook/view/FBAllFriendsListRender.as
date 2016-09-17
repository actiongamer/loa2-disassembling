package nslm2.modules.globalModules.facebook.view
{
   import game.ui.facebook.FBInviteListRenderUI;
   import flash.events.Event;
   import nslm2.modules.globalModules.facebook.control.FBControl;
   import nslm2.modules.globalModules.facebook.event.FBEvent;
   
   public class FBAllFriendsListRender extends FBInviteListRenderUI
   {
       
      
      private var _obj;
      
      public function FBAllFriendsListRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1 == null)
         {
            return;
         }
         _obj = param1;
         headImage.url = param1.picture.data.url;
         friendNameTxt.text = param1.name;
         checkBoxBtn.selected = false;
         checkBoxBtn.addEventListener("select",checkBoxBtnSelect);
      }
      
      protected function checkBoxBtnSelect(param1:Event) : void
      {
         if(checkBoxBtn.selected == true)
         {
            FBControl.instance.dispatchEvent(new FBEvent("addFriend",_obj));
         }
      }
   }
}
