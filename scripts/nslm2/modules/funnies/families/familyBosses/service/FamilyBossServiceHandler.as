package nslm2.modules.funnies.families.familyBosses.service
{
   import nslm2.modules.funnies.families.familyBosses.model.FamilyBossModel;
   import nslm2.nets.sockets.ServerEngine;
   import proto.FamilyBossMemberReliveNotify;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.FamilyBossMemberDeadNotify;
   import proto.FamilyBossTopRankNotify;
   import proto.FamilyBossNextWaveNotify;
   import proto.FamilyBossInfoNotify;
   import proto.FamilyBossStartEventNotify;
   import proto.FamilyBossInfoRes;
   import proto.FamilyBossJoinFightStartReq;
   import proto.FamilyBossQuickFightStartReq;
   import proto.FamilyBossHurtInfoRes;
   import proto.FamilyBossModelSetReq;
   import proto.FamilyBossBuyGuliReq;
   import proto.FamilyBossBuyGuliRes;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.FamilyBossSetNextStartTimeReq;
   import morn.core.handlers.Handler;
   import proto.FamilyBossHurtRewardReq;
   import proto.FamilyBossSupperRankRes;
   
   public class FamilyBossServiceHandler
   {
      
      private static var _ins:nslm2.modules.funnies.families.familyBosses.service.FamilyBossServiceHandler;
       
      
      private var model:FamilyBossModel;
      
      private var guwuType:int;
      
      public function FamilyBossServiceHandler()
      {
         model = FamilyBossModel.ins;
         super();
      }
      
      public static function get ins() : nslm2.modules.funnies.families.familyBosses.service.FamilyBossServiceHandler
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.families.familyBosses.service.FamilyBossServiceHandler();
         }
         return _ins;
      }
      
      public function addAlwaysListerner() : void
      {
         ServerEngine.ins.addAlwayHandler(7181,updateActivityStatus);
         ServerEngine.ins.addAlwayHandler(7178,reviveNotifyHandler);
         ServerEngine.ins.addAlwayHandler(7179,dieNotifyHandler);
         ServerEngine.ins.addAlwayHandler(7182,damageRankNotifyHandler);
         ServerEngine.ins.addAlwayHandler(7183,nextWaveNotifyHandler);
         ServerEngine.ins.addAlwayHandler(7184,bossInfoNotifyHandler);
      }
      
      public function removeAlwaysListerner() : void
      {
         ServerEngine.ins.removeAlwayHandler(7181,updateActivityStatus);
         ServerEngine.ins.removeAlwayHandler(7178,reviveNotifyHandler);
         ServerEngine.ins.removeAlwayHandler(7179,dieNotifyHandler);
         ServerEngine.ins.removeAlwayHandler(7182,damageRankNotifyHandler);
         ServerEngine.ins.removeAlwayHandler(7183,nextWaveNotifyHandler);
         ServerEngine.ins.removeAlwayHandler(7184,bossInfoNotifyHandler);
      }
      
      private function reviveNotifyHandler(param1:FamilyBossMemberReliveNotify) : void
      {
         if(PlayerModel.ins.isCurPlayer(param1.playerid))
         {
            model.reviveCD = 0;
         }
         ObserverMgr.ins.sendNotice("family_boss_player_revive",param1.playerid);
      }
      
      private function dieNotifyHandler(param1:FamilyBossMemberDeadNotify) : void
      {
         ObserverMgr.ins.sendNotice("family_boss_player_die",param1);
      }
      
      private function damageRankNotifyHandler(param1:FamilyBossTopRankNotify) : void
      {
         model.updateDmgRank(param1.rankdata);
      }
      
      private function nextWaveNotifyHandler(param1:FamilyBossNextWaveNotify) : void
      {
         model.crtWave = param1.rank;
         model.updateBossInfo(param1.infos,true);
      }
      
      private function bossInfoNotifyHandler(param1:FamilyBossInfoNotify) : void
      {
         model.updateBossInfo(param1.infos,false);
      }
      
      public function updateActivityStatus(param1:FamilyBossStartEventNotify) : void
      {
         model.updateStatus(param1.kind,param1.time);
      }
      
      public function getInfo() : void
      {
         ServerEngine.ins.send(7170,null,getInfoHandler);
      }
      
      private function getInfoHandler(param1:FamilyBossInfoRes) : void
      {
         if(param1)
         {
            model.updateBaseInfo(param1);
         }
      }
      
      public function requestFight(param1:int, param2:Function) : void
      {
         var _loc3_:FamilyBossJoinFightStartReq = new FamilyBossJoinFightStartReq();
         _loc3_.bossid = param1;
         model.crtAttackBossID = param1;
         ServerEngine.ins.send(7176,_loc3_,param2);
      }
      
      public function requestFastFight(param1:*, param2:Function) : void
      {
         var _loc3_:FamilyBossQuickFightStartReq = new FamilyBossQuickFightStartReq();
         _loc3_.bossid = param1;
         model.crtAttackBossID = param1;
         ServerEngine.ins.send(7188,_loc3_,param2);
      }
      
      public function requestDamageRank() : void
      {
         ServerEngine.ins.send(7173,null,updateRank);
      }
      
      private function updateRank(param1:FamilyBossHurtInfoRes) : void
      {
         if(param1)
         {
            model.updateDmgRank(param1.rank);
         }
      }
      
      public function switchSetting(param1:int, param2:Boolean) : void
      {
         var _loc3_:FamilyBossModelSetReq = new FamilyBossModelSetReq();
         _loc3_.kind = param1;
         _loc3_.value = param2;
         ServerEngine.ins.send(7174,_loc3_);
      }
      
      public function requestStimulate(param1:int) : void
      {
         var _loc2_:FamilyBossBuyGuliReq = new FamilyBossBuyGuliReq();
         _loc2_.gulitype = param1;
         guwuType = param1;
         ServerEngine.ins.send(7172,_loc2_,stimulateSuccessHandler);
      }
      
      private function stimulateSuccessHandler(param1:FamilyBossBuyGuliRes) : void
      {
         model.normalGwCnt = param1.normalguwucount;
         model.premierGwCnt = param1.supperguwucount;
         ObserverMgr.ins.sendNotice("family_boss_update_stimulate_info");
         if(guwuType == 1)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(40740018));
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(40740019));
         }
      }
      
      public function setNextTime(param1:uint, param2:Function) : void
      {
         var _loc3_:FamilyBossSetNextStartTimeReq = new FamilyBossSetNextStartTimeReq();
         _loc3_.nextstarttime = param1;
         ServerEngine.ins.send(7171,_loc3_,param2);
      }
      
      public function getDamageReward(param1:int, param2:Handler) : void
      {
         var _loc3_:FamilyBossHurtRewardReq = new FamilyBossHurtRewardReq();
         _loc3_.id = param1;
         ServerEngine.ins.send(7187,_loc3_,param2);
      }
      
      public function getHornorRank() : void
      {
         ServerEngine.ins.send(7189,null,getHoroRankHandler);
      }
      
      private function getHoroRankHandler(param1:FamilyBossSupperRankRes) : void
      {
         if(param1)
         {
            model.hornorRank = param1.datas;
         }
      }
      
      public function dispose() : void
      {
         removeAlwaysListerner();
      }
   }
}
