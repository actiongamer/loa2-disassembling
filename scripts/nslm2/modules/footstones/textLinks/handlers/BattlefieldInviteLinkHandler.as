package nslm2.modules.footstones.textLinks.handlers
{
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import proto.TeamEnterReq;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.funnies.teams.TeamService;
   import nslm2.modules.foundations.AlertUtil;
   
   public class BattlefieldInviteLinkHandler extends LinkHandlerBase
   {
       
      
      public function BattlefieldInviteLinkHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         var _loc1_:* = null;
         super.exec();
         if(FuncOpenAutoCtrl.checkOpen(50500))
         {
            _loc1_ = new TeamEnterReq();
            _loc1_.kind = 16;
            _loc1_.id = Uint64Util.fromString(this.evtContent[0]);
            TeamService.ins.teamEnter(_loc1_,null);
         }
         else
         {
            AlertUtil.lackLevel(FuncOpenAutoCtrl.getOpenLevel(50500));
         }
      }
   }
}
