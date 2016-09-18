package nslm2.modules.funnies.teams.details
{
   import game.ui.teams.details.TeamInviteFriendModuleUI;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.foundations.friendModules.FriendService;
   import proto.GameFriendData;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import proto.TeamMemberState;
   import nslm2.modules.funnies.teams.details.vo.TeamInviteFriendVo;
   import morn.core.components.Button;
   import proto.TeamInviteReq;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   
   public class TeamInviteFriendModule extends TeamInviteFriendModuleUI
   {
       
      
      private var invitefriendArr:Array;
      
      public function TeamInviteFriendModule()
      {
         invitefriendArr = [];
         super();
      }
      
      public function get pageBar() : IPageBar
      {
         return this.pageBarUI as IPageBar;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = 41216;
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(41210096);
         this.pageBar.bindList(this.list_friend);
         invitefriendArr = getInviteFriendsArr();
         list_friend.dataSource = invitefriendArr;
         MornExpandUtil.addHandlerForBtnAll(this,btnClickHandler);
         super.preShow(param1);
      }
      
      public function getInviteFriendsArr() : Array
      {
         var _loc8_:* = null;
         var _loc7_:int = 0;
         var _loc2_:* = null;
         var _loc6_:Boolean = false;
         var _loc5_:int = 0;
         var _loc1_:Array = FriendService.ins.friendArr;
         var _loc4_:int = _loc1_.length;
         var _loc3_:Array = [];
         _loc7_ = 0;
         while(_loc7_ < _loc4_)
         {
            _loc2_ = _loc1_[_loc7_];
            if(_loc2_.level >= 25)
            {
               _loc6_ = false;
               _loc5_ = 0;
               while(_loc5_ < TeamGuajiService.ins.teamMems.length)
               {
                  if(Uint64Util.equal(_loc2_.id,(TeamGuajiService.ins.teamMems[_loc5_] as TeamMemberState).mem.player.id))
                  {
                     _loc6_ = true;
                  }
                  _loc5_++;
               }
               if(!_loc6_)
               {
                  _loc8_ = new TeamInviteFriendVo();
                  _loc8_.friendData = _loc2_;
                  _loc3_.push(_loc8_);
               }
            }
            _loc7_++;
         }
         return _loc3_;
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
            team_invite_friend();
         }
      }
      
      private function team_invite_friend() : void
      {
         var _loc5_:int = 0;
         var _loc1_:* = null;
         var _loc3_:int = invitefriendArr.length;
         var _loc2_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc1_ = invitefriendArr[_loc5_];
            if(_loc1_.selected)
            {
               _loc2_.push(_loc1_.friendData.id);
            }
            _loc5_++;
         }
         var _loc4_:TeamInviteReq = new TeamInviteReq();
         _loc4_.friendIds = _loc2_;
         _loc4_.kind = TeamGuajiService.ins.teamType;
         _loc4_.teamId = TeamGuajiService.ins.curPlayerTeamInfo.id;
         TeamGuajiService.ins.server_teamInviteFriend(_loc4_);
         ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(41210092)));
         btnCloseHandler();
      }
      
      private function team_invite_friend_cpl() : void
      {
      }
   }
}
