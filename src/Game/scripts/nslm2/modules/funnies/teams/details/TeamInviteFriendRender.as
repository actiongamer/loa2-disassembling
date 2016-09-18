package nslm2.modules.funnies.teams.details
{
   import game.ui.teams.details.TeamInviteFriendRenderUI;
   import nslm2.modules.funnies.teams.details.vo.TeamInviteFriendVo;
   import flash.events.MouseEvent;
   import com.mz.core.mediators.RollMediator;
   
   public class TeamInviteFriendRender extends TeamInviteFriendRenderUI
   {
       
      
      private var _data:TeamInviteFriendVo;
      
      public function TeamInviteFriendRender()
      {
         super();
         img_roll.alpha = 0;
         this.parts.push(new RollMediator(this,rollHandler));
         this.addEventListener("click",clickHandler);
         selectedBox.mouseChildren = false;
         selectedBox.mouseEnabled = false;
         nameUseLink = false;
      }
      
      protected function clickHandler(param1:MouseEvent) : void
      {
         _data.selected = !_data.selected;
         selectedBox.selected = _data.selected;
      }
      
      private function rollHandler(param1:Boolean) : void
      {
         img_roll.alpha = !!param1?1:0;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _data = param1 as TeamInviteFriendVo;
         if(_data)
         {
            selectedBox.selected = _data.selected;
            .super.dataSource = _data.friendData;
         }
         else
         {
            .super.dataSource = param1;
         }
      }
   }
}
