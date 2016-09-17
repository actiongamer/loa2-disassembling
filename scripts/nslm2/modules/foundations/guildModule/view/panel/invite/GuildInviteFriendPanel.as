package nslm2.modules.foundations.guildModule.view.panel.invite
{
   import game.ui.guildModules.invite.GuildInviteFriendPanelUI;
   import morn.core.components.Button;
   import nslm2.modules.foundations.guildModule.vo.GuildInviteFriendVo;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.guildModule.service.GuildServiceHandler;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   
   public class GuildInviteFriendPanel extends GuildInviteFriendPanelUI
   {
       
      
      private var invitefriendArr:Array;
      
      public function GuildInviteFriendPanel()
      {
         invitefriendArr = [];
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btnClickHandler);
         (pageBar as IPageBar).bindList(list_friend);
      }
      
      private function btnClickHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btnOk.btn_ok !== _loc2_)
         {
            if(btnCancel.btn_cancel === _loc2_)
            {
               btnCloseHandler();
            }
         }
         else
         {
            doInvite();
         }
      }
      
      private function doInvite() : void
      {
         var _loc4_:int = 0;
         var _loc1_:* = null;
         var _loc3_:int = invitefriendArr.length;
         var _loc2_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc1_ = invitefriendArr[_loc4_];
            if(_loc1_.selected)
            {
               _loc2_.push(_loc1_.friendData.id);
            }
            _loc4_++;
         }
         if(!_loc2_.length)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999000278));
            return;
         }
         GuildServiceHandler.ins.familyInviteFriend(_loc2_,inviteSuccessHander);
      }
      
      private function inviteSuccessHander(param1:Object = null) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(999000279),DisplayUtils.globarCenter(this));
         btnCloseHandler();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = 40713;
         invitefriendArr = GuildModel.ins.getCanInviteFriendsArr();
         list_friend.dataSource = invitefriendArr;
         super.preShow(param1);
      }
   }
}
