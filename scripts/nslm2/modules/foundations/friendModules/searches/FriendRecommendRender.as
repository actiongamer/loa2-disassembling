package nslm2.modules.foundations.friendModules.searches
{
   import game.ui.friendModules.searches.FriendRecommendRenderUI;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.GameFriendData;
   import proto.PlayerFriendApplyReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.PlayerFriendApplyRes;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.utils.ProtoUtils;
   import flash.events.Event;
   import morn.customs.expands.MornExpandUtil;
   
   public class FriendRecommendRender extends FriendRecommendRenderUI
   {
      
      public static const APPLIED:String = "APPLIED";
       
      
      public function FriendRecommendRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_add === _loc3_)
         {
            friendApply(this.gameFriendData);
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         this.img_line.visible = !this.listCellVo.isLastLineInCurPage;
      }
      
      public function set applied(param1:Boolean) : void
      {
         this.btn_add.disabled = param1;
         this.btn_add.label = !!param1?LocaleMgr.ins.getStr(300004044):LocaleMgr.ins.getStr(300004045);
      }
      
      public function get applied() : Boolean
      {
         return this.btn_add.disabled;
      }
      
      public function friendApply(param1:GameFriendData) : void
      {
         var _loc2_:PlayerFriendApplyReq = new PlayerFriendApplyReq();
         _loc2_.id = param1.id;
         ServerEngine.ins.send(7024,_loc2_,server_friendapplyCpl);
      }
      
      public function server_friendapplyCpl(param1:PlayerFriendApplyRes) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(10602004,ProtoUtils.parseParaArr([param1.content])));
         this.applied = true;
         this.dispatchEvent(new Event("APPLIED",true));
      }
   }
}
