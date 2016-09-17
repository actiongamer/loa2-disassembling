package nslm2.modules.footstones.tipMenus.handlers
{
   import proto.FriendDonateStaminaReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.common.vo.PlayerVo;
   import proto.FriendDonateStaminaRes;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.friendModules.FriendService;
   
   public class FriendGiveGiftHandler extends TipMenuHandlerBase
   {
       
      
      public function FriendGiveGiftHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         var _loc1_:FriendDonateStaminaReq = new FriendDonateStaminaReq();
         _loc1_.id = this.vo.playerId;
         ServerEngine.ins.send(7302,_loc1_,server_donateStamina);
      }
      
      public function get vo() : PlayerVo
      {
         return this.data as PlayerVo;
      }
      
      private function server_donateStamina(param1:FriendDonateStaminaRes) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(10600015));
         FriendService.ins.setHadGiveGift(param1.targetplayerid);
      }
   }
}
