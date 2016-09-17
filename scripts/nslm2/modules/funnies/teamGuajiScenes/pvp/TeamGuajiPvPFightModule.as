package nslm2.modules.funnies.teamGuajiScenes.pvp
{
   import nslm2.modules.dungeons.DungeonSceneModule;
   import proto.GuajiPvpFightStartRes;
   import nslm2.modules.battles.sceneBases.BattleSceneBase;
   import nslm2.modules.dungeons.DungeonVo;
   import proto.GuajiBossFightEndRes;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.battles.battle.BattleEvent;
   import proto.GuajiPvpFightEndReq;
   import proto.StagePhaseCheckReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.GuajiPvpFightEndRes;
   import nslm2.modules.funnies.teamGuajiScenes.model.TeamGuajiModel;
   import nslm2.common.vo.FightResultVO;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.battles.battleResults.BattleResultConfigVo;
   
   public class TeamGuajiPvPFightModule extends DungeonSceneModule
   {
      
      public static const PVP_STAGE_ID:int = 32000;
      
      public static const PVP_FAIL:int = 2;
       
      
      private var startRes:GuajiPvpFightStartRes;
      
      public var battleScene:BattleSceneBase;
      
      private var _lastEIFER:GuajiBossFightEndRes;
      
      private var _replayRes:GuajiPvpFightEndRes;
      
      public function TeamGuajiPvPFightModule()
      {
         super();
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         dgVo = new DungeonVo(32000);
         serverCpl_guajiPvPFightStart(param1);
         this.moduleServerCpl();
      }
      
      private function serverCpl_guajiPvPFightStart(param1:GuajiPvpFightStartRes) : void
      {
         _lastSPCRArr.length = 0;
         dgVo.battleRandom = param1.random;
         PlayerModel.ins.createTeam(param1.player);
         dgVo.unitHash = PlayerModel.ins.team;
         _lastSPCRArr.push(param1);
      }
      
      override protected function replay_comp(param1:BattleEvent) : void
      {
         server_fightEnd_cpl(_replayRes);
      }
      
      override protected function fightPlayerCompHandler(param1:BattleEvent) : void
      {
         _lastSPCRArr.push(null);
         var _loc2_:GuajiPvpFightEndReq = new GuajiPvpFightEndReq();
         var _loc3_:StagePhaseCheckReq = param1.data.req as StagePhaseCheckReq;
         _loc2_.playMode = 2;
         _loc2_.stp = _loc3_.stp;
         _loc2_.cRet = _loc3_.clientRet;
         _loc2_.cDamage = _loc3_.damage;
         ServerEngine.ins.send(3144,_loc2_,server_fightEnd_cpl);
      }
      
      private function server_fightEnd_cpl(param1:GuajiPvpFightEndRes) : void
      {
         _replayRes = param1;
         if(this.dgUI)
         {
            this.dgUI.visible = false;
         }
         TeamGuajiModel.ins.rankToday = param1.rank;
         TeamGuajiModel.ins.robPieceCountToday = TeamGuajiModel.ins.robPieceCountToday + param1.stealCount;
         var _loc2_:FightResultVO = new FightResultVO();
         if(param1.result == 1)
         {
            if(param1.reward && param1.reward.length)
            {
               _loc2_.dropItems = param1.reward;
               if(param1.stealCount < 1)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(41300256));
               }
               else
               {
                  TeamGuajiModel.ins.updateKilledPlayer();
               }
            }
            showResultModule(_loc2_,true);
         }
         else
         {
            showResultModule(_loc2_,false);
         }
      }
      
      override protected function showResultModule(param1:FightResultVO, param2:Boolean) : void
      {
         var _loc3_:* = null;
         this.dgUI.visible = false;
         if(param2)
         {
            ModuleMgr.ins.showModule(40210,new BattleResultConfigVo(resultPage_clickHandler,battle_replay,open_statistic,param1));
         }
         else
         {
            _loc3_ = new BattleResultConfigVo(resultPage_clickHandler,battle_replay,open_statistic,param1);
            _loc3_.disableLossBtn = true;
            ModuleMgr.ins.showModule(40220,_loc3_);
         }
      }
      
      override protected function pauseHandlerYes() : void
      {
         var _loc1_:GuajiPvpFightEndReq = new GuajiPvpFightEndReq();
         _loc1_.isEscape = true;
         ServerEngine.ins.send(3144,_loc1_,exitFightHandler);
      }
      
      private function exitFightHandler(param1:Object) : void
      {
         resultPage_clickHandler();
      }
   }
}
