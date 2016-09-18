package nslm2.modules.globalModules.facebook.view
{
   import game.ui.facebook.FBInviteListRenderUI;
   import flash.events.Event;
   import nslm2.modules.globalModules.facebook.control.FBControl;
   import nslm2.modules.globalModules.facebook.event.FBEvent;
   
   public class FBSelectedFriendsListRender extends FBInviteListRenderUI
   {
       
      
      private var _obj;
      
      public function FBSelectedFriendsListRender()
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
         checkBoxBtn.selected = true;
         checkBoxBtn.addEventListener("select",checkBoxBtnSelect);
      }
      
      protected function checkBoxBtnSelect(param1:Event) : void
      {
         if(checkBoxBtn.selected == false)
         {
            FBControl.instance.dispatchEvent(new FBEvent("removeFriend",_obj));
         }
      }
   }
}
