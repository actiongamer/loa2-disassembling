package nslm2.modules.foundations.friendModules.searches
{
   import game.ui.friendModules.searches.FriendApplyRenderUI;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import proto.GameFriendData;
   import proto.PlayerApplyAgreeReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.foundations.friendModules.FriendService;
   import flash.events.Event;
   import proto.PlayerApplyAgreeRes;
   import nslm2.modules.foundations.friendModules.FriendUtils;
   import proto.PlayerApplyRefuseReq;
   import morn.customs.expands.MornExpandUtil;
   
   public class FriendApplyRender extends FriendApplyRenderUI
   {
      
      public static const DONE:String = "done";
       
      
      private var tempFriendData:GameFriendData;
      
      public function FriendApplyRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_agree !== _loc3_)
         {
            if(this.btn_refuse === _loc3_)
            {
               server_applyRefuse(this.gameFriendData);
            }
         }
         else
         {
            server_applyAgree(this.gameFriendData);
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         this.btn_agree.visible = true;
         this.btn_refuse.visible = true;
         this.img_line.visible = !this.listCellVo.isLastLineInCurPage;
      }
      
      public function setApplied() : void
      {
         this.btn_agree.visible = false;
         this.btn_refuse.visible = false;
      }
      
      public function server_applyAgree(param1:GameFriendData) : void
      {
         var _loc2_:PlayerApplyAgreeReq = new PlayerApplyAgreeReq();
         _loc2_.id = param1.id;
         tempFriendData = this.gameFriendData;
         ServerEngine.ins.send(7063,_loc2_,server_applyAgreeCpl);
         setApplied();
         Uint64Util.removeItemByAttr(FriendService.ins.applyFriendDataArr,GameFriendData.ID.name,param1.id);
         this.dispatchEvent(new Event("done",true));
      }
      
      private function server_applyAgreeCpl(param1:PlayerApplyAgreeRes) : void
      {
         FriendService.ins.addFriend(this.tempFriendData);
         FriendUtils.floatMsg_applyAgree(this.tempFriendData.name);
         tempFriendData = null;
      }
      
      public function server_applyRefuse(param1:GameFriendData) : void
      {
         var _loc2_:PlayerApplyRefuseReq = new PlayerApplyRefuseReq();
         _loc2_.id = param1.id;
         ServerEngine.ins.send(7064,_loc2_);
         setApplied();
         Uint64Util.removeItemByAttr(FriendService.ins.applyFriendDataArr,GameFriendData.ID.name,param1.id);
         FriendUtils.floatMsg_applyRefuse(this.gameFriendData.name);
         this.dispatchEvent(new Event("done",true));
      }
   }
}
