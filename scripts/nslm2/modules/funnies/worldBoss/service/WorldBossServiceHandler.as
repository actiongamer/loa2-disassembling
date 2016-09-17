package nslm2.modules.funnies.worldBoss.service
{
   import nslm2.modules.funnies.worldBoss.model.WorldBossModel;
   import nslm2.nets.sockets.ServerEngine;
   import proto.WorldBossMemberReliveNotify;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.WorldBossMemberDeadNotify;
   import proto.WorldBossTopRankNotify;
   import proto.WorldBossNextWaveNotify;
   import proto.WorldBossInfoNotify;
   import proto.WorldBossStartEventNotify;
   import proto.WorldBossInfoRes;
   import proto.WorldBossJoinFightStartReq;
   import proto.WorldBossQuickFightStartReq;
   import morn.core.handlers.Handler;
   import proto.WorldBossHurtInfoRes;
   import proto.WorldBossModelSetReq;
   import proto.WorldBossHurtRewardReq;
   
   public class WorldBossServiceHandler
   {
      
      private static var _ins:nslm2.modules.funnies.worldBoss.service.WorldBossServiceHandler;
       
      
      private var model:WorldBossModel;
      
      public function WorldBossServiceHandler()
      {
         model = WorldBossModel.ins;
         super();
      }
      
      public static function get ins() : nslm2.modules.funnies.worldBoss.service.WorldBossServiceHandler
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.worldBoss.service.WorldBossServiceHandler();
         }
         return _ins;
      }
      
      public function addAlwaysListerner() : void
      {
         ServerEngine.ins.addAlwayHandler(7511,updateActivityStatus);
         ServerEngine.ins.addAlwayHandler(7508,reviveNotifyHandler);
         ServerEngine.ins.addAlwayHandler(7509,dieNotifyHandler);
         ServerEngine.ins.addAlwayHandler(7512,damageRankNotifyHandler);
         ServerEngine.ins.addAlwayHandler(7513,nextWaveNotifyHandler);
         ServerEngine.ins.addAlwayHandler(7514,bossInfoNotifyHandler);
      }
      
      public function removeAlwaysListerner() : void
      {
         ServerEngine.ins.removeAlwayHandler(7511,updateActivityStatus);
         ServerEngine.ins.removeAlwayHandler(7508,reviveNotifyHandler);
         ServerEngine.ins.removeAlwayHandler(7509,dieNotifyHandler);
         ServerEngine.ins.removeAlwayHandler(7512,damageRankNotifyHandler);
         ServerEngine.ins.removeAlwayHandler(7513,nextWaveNotifyHandler);
         ServerEngine.ins.removeAlwayHandler(7514,bossInfoNotifyHandler);
      }
      
      private function reviveNotifyHandler(param1:WorldBossMemberReliveNotify) : void
      {
         if(PlayerModel.ins.isCurPlayer(param1.playerid))
         {
            model.reviveCD = 0;
         }
         ObserverMgr.ins.sendNotice("world_boss_player_revive",param1.playerid);
      }
      
      private function dieNotifyHandler(param1:WorldBossMemberDeadNotify) : void
      {
         ObserverMgr.ins.sendNotice("world_boss_player_die",param1);
      }
      
      private function damageRankNotifyHandler(param1:WorldBossTopRankNotify) : void
      {
         model.updateDmgRank(param1.rankdata);
      }
      
      private function nextWaveNotifyHandler(param1:WorldBossNextWaveNotify) : void
      {
         model.crtWave = param1.rank;
         model.updateBossInfo(param1.infos,true);
      }
      
      private function bossInfoNotifyHandler(param1:WorldBossInfoNotify) : void
      {
         model.updateBossInfo(param1.infos,false);
      }
      
      public function updateActivityStatus(param1:WorldBossStartEventNotify) : void
      {
         model.updateStatus(param1.kind,param1.time);
      }
      
      public function getInfo() : void
      {
         ServerEngine.ins.send(7500,null,getInfoHandler);
      }
      
      private function getInfoHandler(param1:WorldBossInfoRes) : void
      {
         if(param1)
         {
            model.updateBaseInfo(param1);
         }
      }
      
      public function requestFight(param1:int, param2:Function) : void
      {
         var _loc3_:WorldBossJoinFightStartReq = new WorldBossJoinFightStartReq();
         _loc3_.bossid = param1;
         model.crtAttackBossID = param1;
         ServerEngine.ins.send(7515,_loc3_,param2);
      }
      
      public function requestFastFight(param1:*, param2:Function) : void
      {
         var _loc3_:WorldBossQuickFightStartReq = new WorldBossQuickFightStartReq();
         _loc3_.bossid = param1;
         model.crtAttackBossID = param1;
         ServerEngine.ins.send(7518,_loc3_,param2);
      }
      
      public function requestDamageRank(param1:Function = null) : void
      {
         ServerEngine.ins.send(7503,null,new Handler(updateRank,[param1]));
      }
      
      private function updateRank(param1:Function, param2:WorldBossHurtInfoRes) : void
      {
         if(param2)
         {
            model.myRank = param2.ranknum;
            model.updateRewardDamagRank(param2.rank);
         }
         if(param1 != null)
         {
            param1.call();
         }
      }
      
      public function switchSetting(param1:int, param2:Boolean) : void
      {
         var _loc3_:WorldBossModelSetReq = new WorldBossModelSetReq();
         _loc3_.kind = param1;
         _loc3_.value = param2;
         ServerEngine.ins.send(7516,_loc3_);
      }
      
      public function getDamageReward(param1:Function) : void
      {
         var _loc2_:WorldBossHurtRewardReq = new WorldBossHurtRewardReq();
         ServerEngine.ins.send(7517,_loc2_,param1);
      }
      
      public function dispose() : void
      {
         removeAlwaysListerner();
      }
   }
}
