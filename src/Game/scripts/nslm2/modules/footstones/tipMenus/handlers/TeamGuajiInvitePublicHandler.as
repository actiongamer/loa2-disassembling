package nslm2.modules.footstones.tipMenus.handlers
{
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   
   public class TeamGuajiInvitePublicHandler extends TipMenuHandlerBase
   {
       
      
      public function TeamGuajiInvitePublicHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         ObserverMgr.ins.sendNotice("MSG_TEAM_GUAJI_INVITE_SEND_CHAT",TeamGuajiService.ins.curPlayerTeamInfo.id);
      }
   }
}
