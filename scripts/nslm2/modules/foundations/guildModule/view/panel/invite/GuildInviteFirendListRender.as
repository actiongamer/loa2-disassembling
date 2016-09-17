package nslm2.modules.foundations.guildModule.view.panel.invite
{
   import game.ui.guildModules.invite.InviteFirendlListRenderUI;
   import nslm2.modules.foundations.guildModule.vo.GuildInviteFriendVo;
   import flash.events.MouseEvent;
   import com.mz.core.mediators.RollMediator;
   
   public class GuildInviteFirendListRender extends InviteFirendlListRenderUI
   {
       
      
      private var _data:GuildInviteFriendVo;
      
      public function GuildInviteFirendListRender()
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
         _data = param1 as GuildInviteFriendVo;
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
