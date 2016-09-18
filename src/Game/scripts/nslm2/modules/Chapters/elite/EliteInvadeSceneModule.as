package nslm2.modules.Chapters.elite
{
   import nslm2.modules.dungeons.DungeonSceneModule;
   import nslm2.modules.dungeons.EliteDungeonVo;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.scenes.commons.SceneModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import proto.EliteInvadeFightEndReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.dungeons.scripts.ScriptLib;
   import proto.EliteInvadeFightEndRes;
   import nslm2.common.vo.FightResultVO;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import proto.EliteInvadeFightStartRes;
   import nslm2.modules.battles.battle.BattleEvent;
   import proto.StagePhaseCheckReq;
   
   public class EliteInvadeSceneModule extends DungeonSceneModule
   {
       
      
      private var _lastEIFER:EliteInvadeFightEndRes;
      
      public function EliteInvadeSceneModule()
      {
         super();
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         dgVo = param1["vo"] as EliteDungeonVo;
         if(EnvConfig.ins.useServer)
         {
            if(SceneModel.ins.sceneId != this.dgVo.dungeonId)
            {
               SceneModel.ins.addEventListener("modelServerCplPrefix" + 8003,model_enterScene);
               SceneModel.ins.cmd_enterScene(StcMgr.ins.getEliteStageInvadeVo(this.dgVo.dungeonId).stage_id);
            }
            else
            {
               server_stageFightStart();
            }
         }
         else
         {
            this.moduleServerCpl();
         }
      }
      
      override protected function server_stageFightStart() : void
      {
         var _loc1_:EliteInvadeFightEndReq = new EliteInvadeFightEndReq();
         _loc1_.id = dgVo.dungeonId;
         ServerEngine.ins.send(8062,_loc1_,serverCpl_eliteStageFightStart);
      }
      
      override protected function start_load() : void
      {
         this.loadBg();
         scriptLib = new ScriptLib(0,null);
         scriptLib.addCompleteHandler(this.scriptLoad_cpl).exec();
      }
      
      private function serverCpl_eliteStageFightEnd_battleRs(param1:EliteInvadeFightEndRes) : void
      {
         var _loc2_:Number = NaN;
         _lastEIFER = param1;
         this.dgUI.visible = false;
         var _loc3_:FightResultVO = new FightResultVO();
         if(!(int(param1.result) - 1))
         {
            _loc3_.dropItems = this.dgVo.drops;
            _loc3_.gold = this.dgVo.dropGold;
            _loc2_ = Uint64Util.toNumber(param1.player.exp);
            _loc3_.addExp = StcMgr.ins.getEliteStageInvadeVo(this.dgVo.dungeonId).reward_exp;
            PlayerModel.ins.exp = _loc2_;
            showResultModule(_loc3_,true);
         }
         else
         {
            showResultModule(_loc3_,false);
         }
      }
      
      private function serverCpl_eliteStageFightStart(param1:EliteInvadeFightStartRes) : void
      {
         _lastSPCRArr.length = 0;
         dgVo.drops = param1.drops;
         dgVo.countDropList();
         dgVo.battleRandom = param1.random;
         PlayerModel.ins.createTeam(param1.player);
         dgVo.unitHash = PlayerModel.ins.team;
         this.moduleServerCpl();
         _lastSPCRArr.push(param1);
      }
      
      override protected function replay_comp(param1:BattleEvent) : void
      {
         serverCpl_eliteStageFightEnd_battleRs(_lastEIFER);
      }
      
      override protected function fightPlayer_onCpl(param1:BattleEvent) : void
      {
         _lastSPCRArr.push(param1);
         dgUI.timePaused = true;
         this.dunGeonBgLayer.isBattling = false;
         this.dgUI.box_auto.visible = false;
         if(this.bossSceneCtrl == null)
         {
            this.switchLayer_fightToScene();
         }
         disposeBattlePlayer();
         switchUnitAllActived(this.unitViewHash.array,true);
         switchUnitAllActived(this.rightUnitViewHash.array,true);
         var _loc2_:EliteInvadeFightEndReq = new EliteInvadeFightEndReq();
         _loc2_.id = dgVo.dungeonId;
         _loc2_.playMode = 2;
         _loc2_.stp = (param1.data.req as StagePhaseCheckReq).stp;
         ServerEngine.ins.send(8063,_loc2_,serverCpl_eliteStageFightEnd_battleRs);
      }
   }
}
