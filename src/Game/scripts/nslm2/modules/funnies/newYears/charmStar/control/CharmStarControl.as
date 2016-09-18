package nslm2.modules.funnies.newYears.charmStar.control
{
   import nslm2.modules.funnies.newYears.charmStar.model.CharmStarModel;
   import nslm2.nets.sockets.ServerEngine;
   import proto.CharmRankStunnerRes;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.CharmRankStunnerReq;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   
   public class CharmStarControl
   {
       
      
      private var _model:CharmStarModel;
      
      public function CharmStarControl(param1:CharmStarModel)
      {
         super();
         _model = param1;
         addListeners();
      }
      
      private function addListeners() : void
      {
         ServerEngine.ins.addAlwayHandler(10011,stunCplHandler);
      }
      
      private function stunCplHandler(param1:CharmRankStunnerRes) : void
      {
         if(param1)
         {
            _model.rankInfo = param1.info;
            if(Uint64Util.equal(param1.playerId,PlayerModel.ins.playerInfo.id))
            {
               _model.score = param1.score;
               _model.rank = param1.rank;
            }
         }
         ObserverMgr.ins.sendNotice("refresh_rank");
      }
      
      public function reqCharmRankStunner() : void
      {
         ServerEngine.ins.send(10011,new CharmRankStunnerReq());
      }
      
      public function isOpenTimeOne() : Boolean
      {
         return NpcFuncService.ins.isOpenTime(13400) || NpcFuncService.ins.isOpenTime(13402) || NpcFuncService.ins.isOpenTime(13401) || NpcFuncService.ins.isOpenTime(13403);
      }
      
      public function dispose() : void
      {
         _model = null;
      }
   }
}
