package nslm2.modules.footstones.textLinks.handlers
{
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import nslm2.utils.Uint64Util;
   import proto.TeamEnterReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.nets.sockets.ServerEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.funnies.teamGuajiScenes.vo.TeamGuaJiParam;
   import proto.ProtocolStatusRes;
   
   public class TeamGuajiInviteHandler extends LinkHandlerBase
   {
       
      
      public function TeamGuajiInviteHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         if(PlayerModel.ins.level < StcMgr.ins.getFunctionVo(41210).level)
         {
            ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(999000143)));
         }
         else
         {
            TeamGuajiService.ins.getTeamInfo(server_teamGetInfo_cpl);
         }
      }
      
      private function server_teamGetInfo_cpl() : void
      {
         var _loc1_:* = null;
         if(TeamGuajiService.ins.curPlayerTeamInfo)
         {
            if(Uint64Util.equal(TeamGuajiService.ins.curPlayerTeamInfo.id,Uint64Util.fromNumber(this.evtContent[0])))
            {
               ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(999000144)));
            }
            else
            {
               ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(41210099)));
            }
         }
         else
         {
            _loc1_ = new TeamEnterReq();
            _loc1_.kind = 15;
            _loc1_.id = Uint64Util.fromNumber(this.evtContent[0]);
            _loc1_.pwd = null;
            ServerEngine.ins.send(2025,_loc1_,server_teamEnter_cpl,errHandler);
         }
      }
      
      private function server_teamEnter_cpl(param1:*, param2:ServerEvent) : void
      {
         var _loc3_:* = null;
         if(!ModuleMgr.ins.isShow(41210))
         {
            _loc3_ = new TeamGuaJiParam();
            _loc3_.roomId = this.evtContent[0];
            ModuleMgr.ins.showModule(41210,_loc3_);
         }
         else
         {
            ObserverMgr.ins.sendNotice("accepct_invite");
         }
      }
      
      private function errHandler(param1:ProtocolStatusRes) : void
      {
         if(!param1.errCode)
         {
         }
         ServerEngine.ins.doDefaultErr(param1);
      }
   }
}
