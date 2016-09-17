package nslm2.modules.funnies.teams
{
   import nslm2.nets.sockets.ServerEngine;
   import proto.TeamReadyNotify;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.TeamChangeNameNotify;
   import proto.TeamCreateNotify;
   import proto.TeamLeaveNotify;
   import proto.TeamEnterNotify;
   import proto.TeamKickNotify;
   import proto.TeamReplyNotify;
   import proto.TeamCountChangeNotify;
   import proto.TeamInvitedNotify;
   import proto.TeamMemInfoNotify;
   import proto.TeamDismissNotify;
   import proto.TeamStopNotify;
   import proto.TeamCreateReq;
   import proto.TeamCreateRes;
   import proto.TeamInviteReq;
   import proto.TeamEnterReq;
   import proto.TeamLeaveReq;
   import proto.TeamKickReq;
   import proto.TeamStartReq;
   import proto.TeamStopReq;
   import proto.TeamDismissReq;
   
   public class TeamService
   {
      
      private static var _ins:nslm2.modules.funnies.teams.TeamService;
       
      
      public function TeamService()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.funnies.teams.TeamService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.teams.TeamService();
         }
         return _ins;
      }
      
      public function init() : void
      {
         ServerEngine.ins.addAlwayHandler(2021,server_teamCreate_notify);
         ServerEngine.ins.addAlwayHandler(2031,server_teamLeave_notify);
         ServerEngine.ins.addAlwayHandler(2026,server_teamEnter_notify);
         ServerEngine.ins.addAlwayHandler(2024,server_teamKick_notify);
         ServerEngine.ins.addAlwayHandler(2034,server_teamReply_notify);
         ServerEngine.ins.addAlwayHandler(2035,server_teamCount_notify);
         ServerEngine.ins.addAlwayHandler(2038,server_teamInvited_notify);
         ServerEngine.ins.addAlwayHandler(2039,server_teamMemInfo_notify);
         ServerEngine.ins.addAlwayHandler(2047,server_teamDismiss_notify);
         ServerEngine.ins.addAlwayHandler(2049,server_teamStop_notify);
         ServerEngine.ins.addAlwayHandler(2054,server_teamChangeName_notify);
         ServerEngine.ins.addAlwayHandler(2040,server_teamSomeoneReady_notify);
      }
      
      private function server_teamSomeoneReady_notify(param1:TeamReadyNotify) : void
      {
         ObserverMgr.ins.sendNotice("msgTeamSomeoneReadyNotify",param1);
      }
      
      private function server_teamChangeName_notify(param1:TeamChangeNameNotify) : void
      {
         ObserverMgr.ins.sendNotice("msgTeamChangeNameNotify",param1);
      }
      
      private function server_teamCreate_notify(param1:TeamCreateNotify) : void
      {
         ObserverMgr.ins.sendNotice("msgTeamCreateNotify",param1);
      }
      
      private function server_teamLeave_notify(param1:TeamLeaveNotify) : void
      {
         ObserverMgr.ins.sendNotice("msgTeamLeaveNotify",param1);
      }
      
      private function server_teamEnter_notify(param1:TeamEnterNotify) : void
      {
         ObserverMgr.ins.sendNotice("msgTeamEnterNotify",param1);
      }
      
      private function server_teamKick_notify(param1:TeamKickNotify) : void
      {
         ObserverMgr.ins.sendNotice("msgTeamKickNotify",param1);
      }
      
      private function server_teamReply_notify(param1:TeamReplyNotify) : void
      {
         ObserverMgr.ins.sendNotice("msgTeamReplyNotify",param1);
      }
      
      private function server_teamCount_notify(param1:TeamCountChangeNotify) : void
      {
         ObserverMgr.ins.sendNotice("msgTeamCountChangeNotify",param1);
      }
      
      private function server_teamInvited_notify(param1:TeamInvitedNotify) : void
      {
         ObserverMgr.ins.sendNotice("msgTeamInvitedNotify",param1);
      }
      
      private function server_teamMemInfo_notify(param1:TeamMemInfoNotify) : void
      {
         ObserverMgr.ins.sendNotice("msgTeamMemInfoNotify",param1);
      }
      
      private function server_teamDismiss_notify(param1:TeamDismissNotify) : void
      {
         ObserverMgr.ins.sendNotice("msgTeamDismissNotify",param1);
      }
      
      private function server_teamStop_notify(param1:TeamStopNotify) : void
      {
         ObserverMgr.ins.sendNotice("msgTeamStopNotify",param1);
      }
      
      public function teamCreate(param1:TeamCreateReq) : void
      {
         ServerEngine.ins.send(2020,param1,server_teamCreate_cpl);
      }
      
      private function server_teamCreate_cpl(param1:TeamCreateRes) : void
      {
         ObserverMgr.ins.sendNotice("msgTeamCreateRes",param1);
      }
      
      public function teamInvite(param1:TeamInviteReq) : void
      {
         ServerEngine.ins.send(3030,param1);
      }
      
      public function teamEnter(param1:TeamEnterReq, param2:*) : void
      {
         ServerEngine.ins.send(2025,param1,null,param2);
      }
      
      public function teamLeave(param1:TeamLeaveReq) : void
      {
         ServerEngine.ins.send(2030,param1);
      }
      
      public function teamKick(param1:TeamKickReq) : void
      {
         ServerEngine.ins.send(2023,param1);
      }
      
      public function teamStart(param1:TeamStartReq) : void
      {
         ServerEngine.ins.send(2043,param1);
      }
      
      public function teamStop(param1:TeamStopReq) : void
      {
         ServerEngine.ins.send(2048,param1);
      }
      
      public function teamDismiss(param1:TeamDismissReq) : void
      {
         ServerEngine.ins.send(2046,param1);
      }
   }
}
