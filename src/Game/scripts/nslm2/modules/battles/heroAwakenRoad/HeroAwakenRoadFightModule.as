package nslm2.modules.battles.heroAwakenRoad
{
   import nslm2.modules.dungeons.DungeonSceneModule;
   import nslm2.mgrs.stcMgrs.vos.StcConstellationVo;
   import nslm2.modules.battles.battleResults.BattleResultGlobel;
   import proto.JueRoadFightStartRes;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.dungeons.DungeonVo;
   import nslm2.common.model.PlayerModel;
   import proto.JueRoadFightEndRes;
   import nslm2.common.vo.FightResultVO;
   import nslm2.modules.battles.battle.BattleEvent;
   import proto.JueRoadFightEndReq;
   import nslm2.modules.battles.heroAwakenRoad.model.HeroAwakenRoadModel;
   import proto.StagePhaseCheckReq;
   import nslm2.nets.sockets.ServerEngine;
   
   public class HeroAwakenRoadFightModule extends DungeonSceneModule
   {
       
      
      private var nodeID:int;
      
      private var vo:StcConstellationVo;
      
      private var _lastEIFER:JueRoadFightEndRes;
      
      public function HeroAwakenRoadFightModule()
      {
         super();
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         serverCpl_guajiBossFightStart(param1);
         BattleResultGlobel.ins.doubleId = 1025;
         this.moduleServerCpl();
      }
      
      private function serverCpl_guajiBossFightStart(param1:JueRoadFightStartRes) : void
      {
         vo = StcMgr.ins.getConstellationVo(param1.nodeid);
         dgVo = new DungeonVo(vo.stage);
         nodeID = param1.nodeid;
         _lastSPCRArr.length = 0;
         dgVo.battleRandom = param1.random;
         PlayerModel.ins.createTeam(param1.player);
         dgVo.unitHash = PlayerModel.ins.team;
         _lastSPCRArr.push(param1);
      }
      
      private function serverCpl_guajiBossFightEnd_battleRs(param1:JueRoadFightEndRes) : void
      {
         _lastEIFER = param1;
         if(this.dgUI)
         {
            this.dgUI.visible = false;
         }
         var _loc2_:FightResultVO = new FightResultVO();
         if(param1.result == 1)
         {
            _loc2_.star = param1.stars;
            _loc2_.addExp = vo.exp;
            _loc2_.dropItems = param1.rewards;
            showResultModule(_loc2_,true);
         }
         else
         {
            showResultModule(_loc2_,false);
         }
      }
      
      override protected function replay_comp(param1:BattleEvent) : void
      {
         serverCpl_guajiBossFightEnd_battleRs(_lastEIFER);
      }
      
      override protected function fightPlayerCompHandler(param1:BattleEvent) : void
      {
         _lastSPCRArr.push(null);
         var _loc2_:JueRoadFightEndReq = new JueRoadFightEndReq();
         _loc2_.nodeid = nodeID;
         _loc2_.chapterid = HeroAwakenRoadModel.ins.currentChapterId;
         _loc2_.playmode = 0;
         _loc2_.stp = (param1.data.req as StagePhaseCheckReq).stp;
         ServerEngine.ins.send(7431,_loc2_,serverCpl_guajiBossFightEnd_battleRs);
      }
      
      override protected function pauseHandlerYes() : void
      {
         var _loc1_:JueRoadFightEndReq = new JueRoadFightEndReq();
         _loc1_.fightdrop = true;
         _loc1_.nodeid = nodeID;
         _loc1_.chapterid = HeroAwakenRoadModel.ins.currentChapterId;
         _loc1_.playmode = 0;
         ServerEngine.ins.send(7431,_loc1_);
         exitFightHandler(null);
      }
      
      private function exitFightHandler(param1:Object) : void
      {
         resultPage_clickHandler();
      }
   }
}
