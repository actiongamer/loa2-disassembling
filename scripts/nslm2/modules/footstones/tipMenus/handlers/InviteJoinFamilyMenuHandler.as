package nslm2.modules.footstones.tipMenus.handlers
{
   import nslm2.modules.foundations.guildModule.service.GuildServiceHandler;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.vo.PlayerVo;
   
   public class InviteJoinFamilyMenuHandler extends TipMenuHandlerBase
   {
       
      
      public function InviteJoinFamilyMenuHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         GuildServiceHandler.ins.familyInviteFriend([vo.playerId],inviteSuccessHander);
      }
      
      private function inviteSuccessHander() : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(999000146));
      }
      
      public function get vo() : PlayerVo
      {
         return this.data as PlayerVo;
      }
   }
}
