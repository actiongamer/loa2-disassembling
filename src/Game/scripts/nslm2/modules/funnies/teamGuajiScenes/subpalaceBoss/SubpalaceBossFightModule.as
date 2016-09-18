package nslm2.modules.funnies.teamGuajiScenes.subpalaceBoss
{
   import nslm2.modules.dungeons.DungeonSceneModule;
   import proto.GuajiBossFightStartRes;
   import nslm2.common.model.PlayerModel;
   import proto.GuajiBossFightEndRes;
   import nslm2.common.vo.FightResultVO;
   import nslm2.utils.Uint64Util;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.battles.battle.BattleEvent;
   import proto.GuajiBossFightEndReq;
   import proto.StagePhaseCheckReq;
   import nslm2.nets.sockets.ServerEngine;
   
   public class SubpalaceBossFightModule extends DungeonSceneModule
   {
       
      
      private var _lastEIFER:GuajiBossFightEndRes;
      
      public function SubpalaceBossFightModule()
      {
         super();
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         dgVo = param1["vo"] as SubpalaceBossDungeonVo;
         var _loc2_:GuajiBossFightStartRes = param1["res"];
         serverCpl_guajiBossFightStart(_loc2_);
         this.moduleServerCpl();
      }
      
      private function serverCpl_guajiBossFightStart(param1:GuajiBossFightStartRes) : void
      {
         _lastSPCRArr.length = 0;
         dgVo.drops = param1.drops;
         dgVo.countDropList();
         dgVo.battleRandom = param1.random;
         PlayerModel.ins.createTeam(param1.player);
         dgVo.unitHash = PlayerModel.ins.team;
         _lastSPCRArr.push(param1);
      }
      
      private function serverCpl_guajiBossFightEnd_battleRs(param1:GuajiBossFightEndRes) : void
      {
         var _loc2_:Number = NaN;
         _lastEIFER = param1;
         if(this.dgUI)
         {
            this.dgUI.visible = false;
         }
         var _loc3_:FightResultVO = new FightResultVO();
         if(param1.star > 0)
         {
            _loc3_.star = param1.star;
            _loc3_.dropItems = this.dgVo.drops;
            _loc3_.gold = this.dgVo.dropGold;
            _loc2_ = Uint64Util.toNumber(param1.player.exp);
            _loc3_.addExp = StcMgr.ins.getStageVo(this.dgVo.dungeonId).reward_exp;
            PlayerModel.ins.exp = _loc2_;
            showResultModule(_loc3_,true);
         }
         else
         {
            showResultModule(_loc3_,false);
         }
      }
      
      override protected function replay_comp(param1:BattleEvent) : void
      {
         serverCpl_guajiBossFightEnd_battleRs(_lastEIFER);
      }
      
      override protected function fightPlayerCompHandler(param1:BattleEvent) : void
      {
         _lastSPCRArr.push(null);
         var _loc2_:GuajiBossFightEndReq = new GuajiBossFightEndReq();
         _loc2_.isEscape = false;
         _loc2_.playMode = 0;
         _loc2_.stp = (param1.data.req as StagePhaseCheckReq).stp;
         ServerEngine.ins.send(3023,_loc2_,serverCpl_guajiBossFightEnd_battleRs);
      }
      
      override protected function pauseHandlerYes() : void
      {
         var _loc1_:GuajiBossFightEndReq = new GuajiBossFightEndReq();
         _loc1_.isEscape = true;
         ServerEngine.ins.send(3023,_loc1_,exitFightHandler);
      }
      
      private function exitFightHandler(param1:Object) : void
      {
         resultPage_clickHandler();
      }
   }
}
