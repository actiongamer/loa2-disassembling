package nslm2.modules.footstones.textLinks.handlers
{
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.FamilyApplyReq;
   import nslm2.nets.sockets.ServerEngine;
   import com.netease.protobuf.UInt64;
   import proto.FamilyApplyRes;
   import nslm2.modules.foundations.guildModule.service.GuildServiceHandler;
   import nslm2.utils.Uint64Util;
   
   public class GuildInviteLinkHanlder extends LinkHandlerBase
   {
       
      
      private var _guildId:UInt64;
      
      public function GuildInviteLinkHanlder()
      {
         super();
      }
      
      override public function exec() : void
      {
         var _loc1_:* = null;
         super.exec();
         if(PlayerModel.ins.playerInfo.familyId)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(40700024));
         }
         else
         {
            _loc1_ = new FamilyApplyReq();
            _loc1_.id = guildId;
            ServerEngine.ins.send(5202,_loc1_,server_familyApply);
         }
      }
      
      private function server_familyApply(param1:FamilyApplyRes) : void
      {
         switch(int(param1.ok))
         {
            case 0:
               AlertUtil.float(LocaleMgr.ins.getStr(11000010));
               break;
            case 1:
               AlertUtil.float(LocaleMgr.ins.getStr(11000837));
               GuildServiceHandler.ins.requestGuildInfo();
         }
      }
      
      public function get guildId() : UInt64
      {
         if(_guildId == null)
         {
            _guildId = Uint64Util.fromString(this.evtContent[0]);
         }
         return _guildId;
      }
   }
}
