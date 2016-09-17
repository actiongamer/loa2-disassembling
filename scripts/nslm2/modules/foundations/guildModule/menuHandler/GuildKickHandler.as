package nslm2.modules.foundations.guildModule.menuHandler
{
   import nslm2.modules.footstones.tipMenus.handlers.TipMenuHandlerBase;
   import nslm2.utils.ServerTimer;
   import nslm2.common.vo.PlayerVo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.guildModule.service.GuildServiceHandler;
   
   public class GuildKickHandler extends TipMenuHandlerBase
   {
       
      
      public function GuildKickHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         var _loc1_:int = ServerTimer.ins.date.date;
         if(ServerTimer.ins.openServerDate == _loc1_ && ServerTimer.ins.second - (data as PlayerVo).joinTime < DefindConsts.GUILD_NEWBEE_CD * 3600)
         {
            AlertUtil.comfirm(LocaleMgr.ins.getStr(40700026,[DefindConsts.GUILD_NEWBEE_CD,"@{wealth:3}" + DefindConsts.GUILD_NEWBEE_TICOST]),alert_cpl);
         }
         else
         {
            AlertUtil.comfirm(LocaleMgr.ins.getStr(11000242),alert_cpl);
         }
      }
      
      private function alert_cpl() : void
      {
         GuildServiceHandler.ins.familyKick((data as PlayerVo).playerId);
      }
   }
}
