package nslm2.modules.foundations.friendModules.mains
{
   import game.ui.friendModules.mains.FriendBlockListRenderUI;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.tipMenus.TipMenuMsg;
   import com.mz.core.mediators.RollHighLightMediator;
   
   public class FriendBlockListRender extends FriendBlockListRenderUI
   {
       
      
      public function FriendBlockListRender()
      {
         super();
         this.nameUseLink = false;
         this.parts.push(new RollHighLightMediator(this));
         this.addEventListener("click",this_onClick);
      }
      
      protected function this_onClick(param1:MouseEvent) : void
      {
         ObserverMgr.ins.sendNotice("MSG_TIP_MENU_SHOW",new TipMenuMsg(102,this.playerVo));
      }
   }
}
