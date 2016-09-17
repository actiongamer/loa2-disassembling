package nslm2.modules.funnies.abilityRankModule.service
{
   import nslm2.nets.sockets.ServerEngine;
   import proto.OpenChallengeNotify;
   import nslm2.modules.funnies.abilityRankModule.model.AbilityRankModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   
   public class AbilityRankService
   {
      
      private static var _ins:nslm2.modules.funnies.abilityRankModule.service.AbilityRankService;
       
      
      public function AbilityRankService()
      {
         super();
         ServerEngine.ins.addAlwayHandler(7437,notifyHandler);
      }
      
      public static function get ins() : nslm2.modules.funnies.abilityRankModule.service.AbilityRankService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.abilityRankModule.service.AbilityRankService();
         }
         return _ins;
      }
      
      public function getInfo(param1:Function) : void
      {
         ServerEngine.ins.send(7436,null,param1);
      }
      
      public function getReward(param1:Function) : void
      {
         ServerEngine.ins.send(7435,null,param1);
      }
      
      private function notifyHandler(param1:OpenChallengeNotify) : void
      {
         if(param1.cangetreward)
         {
            AbilityRankModel.ins.canGetReward = param1.cangetreward;
            ObserverMgr.ins.sendNotice("ablili_rank_update");
            NpcFuncService.ins.countPlusOne(60763);
         }
         if(param1.allfinish)
         {
            ObserverMgr.ins.sendNotice("ablili_rank_hide");
         }
      }
   }
}
