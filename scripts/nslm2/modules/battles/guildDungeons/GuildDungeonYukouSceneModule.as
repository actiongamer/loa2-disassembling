package nslm2.modules.battles.guildDungeons
{
   import nslm2.modules.dungeons.DungeonSceneModule;
   import proto.FamilyStageYuKouStartRes;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.dungeons.scripts.ScriptLib;
   import proto.FamilyStageYuKouEndReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.FamilyStageYuKouEndRes;
   import nslm2.common.vo.FightResultVO;
   import nslm2.modules.battles.battle.BattleEvent;
   import proto.StagePhaseCheckReq;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.battles.battleResults.BattleResultConfigVo;
   
   public class GuildDungeonYukouSceneModule extends DungeonSceneModule
   {
       
      
      private var _lastEIFER:FamilyStageYuKouEndRes;
      
      public function GuildDungeonYukouSceneModule()
      {
         super();
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         dgVo = param1["vo"] as GuildDungeonVo;
         var _loc2_:FamilyStageYuKouStartRes = (dgVo as GuildDungeonVo).res;
         _lastSPCRArr.length = 0;
         dgVo.dropGold = 0;
         dgVo.drops = [];
         dgVo.countDropList();
         dgVo.battleRandom = _loc2_.random;
         PlayerModel.ins.createTeam(_loc2_.player);
         dgVo.unitHash = PlayerModel.ins.team;
         this.moduleServerCpl();
         _lastSPCRArr.push(_loc2_);
      }
      
      override protected function startLoadScript() : void
      {
         scriptLib = new ScriptLib(0,null);
         scriptLib.addCompleteHandler(this.scriptLoad_cpl).exec();
      }
      
      override protected function pauseHandlerYes() : void
      {
         var _loc1_:FamilyStageYuKouEndReq = new FamilyStageYuKouEndReq();
         _loc1_.nodeid = dgVo.dungeonId;
         _loc1_.fightdrop = true;
         ServerEngine.ins.send(7154,_loc1_);
         super.pauseHandlerYes();
      }
      
      private function serverCpl_familyStageFightEnd(param1:FamilyStageYuKouEndRes) : void
      {
         _lastEIFER = param1;
         this.dgUI.visible = false;
         var _loc2_:FightResultVO = new FightResultVO();
         if(!(int(param1.result) - 1))
         {
            _loc2_.dropItems = param1.rewards;
            _loc2_.gold = this.dgVo.dropGold;
            _loc2_.addExp = 0;
            showResultModule(_loc2_,true);
         }
         else
         {
            showResultModule(_loc2_,false);
         }
      }
      
      override protected function replay_comp(param1:BattleEvent) : void
      {
         serverCpl_familyStageFightEnd(_lastEIFER);
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
         var _loc2_:FamilyStageYuKouEndReq = new FamilyStageYuKouEndReq();
         _loc2_.playMode = 2;
         _loc2_.stp = (param1.data.req as StagePhaseCheckReq).stp;
         _loc2_.nodeid = dgVo.dungeonId;
         ServerEngine.ins.send(7154,_loc2_,serverCpl_familyStageFightEnd);
      }
      
      override protected function showResultModule(param1:FightResultVO, param2:Boolean) : void
      {
         if(param2)
         {
            ModuleMgr.ins.showModule(40210,new BattleResultConfigVo(resultPage_clickHandler,battle_replay,open_statistic,param1,1));
         }
         else
         {
            ModuleMgr.ins.showModule(40220,new BattleResultConfigVo(resultPage_clickHandler,battle_replay,open_statistic,param1));
         }
      }
   }
}
