package nslm2.modules.funnies.families.familyBosses
{
   import nslm2.modules.dungeons.DungeonSceneModule;
   import nslm2.modules.dungeons.DungeonVo;
   import proto.FamilyBossJoinFightStartRes;
   import nslm2.common.model.PlayerModel;
   import proto.FamilyBossJoinFightEndRes;
   import nslm2.common.vo.FightResultVO;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.scenes.commons.SceneModel;
   import nslm2.modules.battles.battle.BattleEvent;
   import proto.FamilyBossJoinFightEndReq;
   import proto.StagePhaseCheckReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcGroupVo;
   import nslm2.modules.fightPlayer.UnitView;
   import nslm2.modules.dungeons.s3ds.BossSceneCtrl32;
   import nslm2.modules.dungeons.s3ds.BossSceneCtrl31;
   import nslm2.modules.dungeons.s3ds.BossSceneCtrl0;
   import com.mz.core.logging.Log;
   
   public class FamilyBossFightModule extends DungeonSceneModule
   {
       
      
      private var bossID:int;
      
      private var _lastEIFER:FamilyBossJoinFightEndRes;
      
      public function FamilyBossFightModule()
      {
         super();
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         dgVo = new DungeonVo(30100);
         serverCpl_guajiBossFightStart(param1);
         this.moduleServerCpl();
      }
      
      private function serverCpl_guajiBossFightStart(param1:FamilyBossJoinFightStartRes) : void
      {
         _lastSPCRArr.length = 0;
         dgVo.battleRandom = param1.random;
         PlayerModel.ins.createTeam(param1.player);
         dgVo.unitHash = PlayerModel.ins.team;
         bossID = param1.bossid;
         _lastSPCRArr.push(param1);
      }
      
      private function serverCpl_guajiBossFightEnd_battleRs(param1:FamilyBossJoinFightEndRes) : void
      {
         _lastEIFER = param1;
         if(this.dgUI)
         {
            this.dgUI.visible = false;
         }
         var _loc2_:FightResultVO = new FightResultVO();
         if(param1.result == 1)
         {
            _loc2_.dropItems = param1.rewards;
            showResultModule(_loc2_,true);
            if(param1.invalidefight)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(40740180));
            }
         }
         else
         {
            SceneModel.ins.changePlayerPos(PlayerModel.ins.playerInfo.id,FamilyBossModule.radomRebornPos());
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
         var _loc2_:FamilyBossJoinFightEndReq = new FamilyBossJoinFightEndReq();
         _loc2_.bossid = bossID;
         _loc2_.playmode = 0;
         _loc2_.steps = (param1.data.req as StagePhaseCheckReq).stp;
         ServerEngine.ins.send(7177,_loc2_,serverCpl_guajiBossFightEnd_battleRs);
      }
      
      override protected function pauseHandlerYes() : void
      {
         var _loc1_:FamilyBossJoinFightEndReq = new FamilyBossJoinFightEndReq();
         _loc1_.fightdrop = true;
         _loc1_.bossid = bossID;
         ServerEngine.ins.send(7177,_loc1_,exitFightHandler);
      }
      
      override protected function checkAndInitBoss() : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         if(this.isDisposed)
         {
            return;
         }
         var _loc1_:StcNpcGroupVo = StcMgr.ins.getNpcGroupVo(bossID);
         if(!_loc1_)
         {
            return;
         }
         var _loc3_:int = this.rightUnitViewHash.array.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.rightUnitViewHash.array[_loc4_];
            if(_loc2_.vo.stcNpcVo.kind == 12)
            {
               if(this.dunGeonBgLayer.configVo.ctrlKind)
               {
                  switch(int(this.dunGeonBgLayer.configVo.ctrlKind.id) - 31)
                  {
                     case 0:
                        this.bossSceneCtrl = new BossSceneCtrl31(this,_loc2_);
                        break;
                     case 1:
                        this.bossSceneCtrl = new BossSceneCtrl32(this,_loc2_);
                  }
               }
               else
               {
                  this.bossSceneCtrl = new BossSceneCtrl0(this,_loc2_);
               }
               this.changeTex(true);
               break;
            }
            _loc4_++;
         }
         if(bossSceneCtrl == null)
         {
            Log.fatal(this,"(第" + currentSubSceneIndex + "波 StcNpcGroupID:" + _loc1_.id + ")没有找到Boss npc");
         }
      }
      
      private function exitFightHandler(param1:Object) : void
      {
         resultPage_clickHandler();
      }
   }
}
