package nslm2.modules.footstones.tipMenus.handlers
{
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.vo.PlayerVo;
   import com.netease.protobuf.UInt64;
   import proto.PlayerDeleteFriendReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.PlayerDeleteFriendRes;
   import nslm2.modules.foundations.friendModules.FriendService;
   import proto.Para;
   import proto.PlayerBaseInfo;
   import nslm2.utils.ProtoUtils;
   
   public class DeleteFriendTipMenuHandler extends TipMenuHandlerBase
   {
       
      
      public function DeleteFriendTipMenuHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         AlertUtil.comfirm(LocaleMgr.ins.getStr(10600036),alert_cpl);
      }
      
      public function get vo() : PlayerVo
      {
         return this.data as PlayerVo;
      }
      
      private function alert_cpl() : void
      {
         server_deleteFriend(vo.playerId);
      }
      
      public function server_deleteFriend(param1:UInt64) : void
      {
         var _loc2_:PlayerDeleteFriendReq = new PlayerDeleteFriendReq();
         _loc2_.id = param1;
         ServerEngine.ins.send(7036,_loc2_,server_deleteFriendCpl);
      }
      
      private function server_deleteFriendCpl(param1:PlayerDeleteFriendRes) : void
      {
         FriendService.ins.removeFriend(param1.id);
         var _loc2_:Para = new Para();
         _loc2_.player = new PlayerBaseInfo();
         _loc2_.player.name = vo.name;
         AlertUtil.float(LocaleMgr.ins.getStr(10600037,ProtoUtils.parseParaArr([_loc2_])));
      }
   }
}
