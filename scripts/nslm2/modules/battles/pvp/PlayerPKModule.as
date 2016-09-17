package nslm2.modules.battles.pvp
{
   import nslm2.modules.dungeons.DungeonSceneModule;
   import proto.PlayerPvpRes;
   import nslm2.modules.dungeons.DungeonVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.dungeons.scripts.ScriptLib;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.battles.battle.BattleStartVo;
   import nslm2.modules.battles.battle.GameObjectManager;
   import nslm2.modules.battles.battle.BattlePlayer;
   import nslm2.modules.battles.battle.BattleEvent;
   import com.mz.core.logging.Log;
   import nslm2.modules.fightPlayer.UnitVo;
   import nslm2.common.vo.FightResultVO;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.battles.battleResults.BattleResultConfigVo;
   import nslm2.modules.battles.battleResults.BattleWinArenaVo;
   import nslm2.modules.battles.battle.FPUtil;
   import nslm2.modules.fightPlayer.UnitView;
   
   public class PlayerPKModule extends DungeonSceneModule
   {
       
      
      private var paramVo:PlayerPvpRes;
      
      public function PlayerPKModule()
      {
         super();
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         paramVo = param1 as PlayerPvpRes;
         paramVo.self = paramVo.self.concat(paramVo.target);
         loadComplete();
      }
      
      private function loadComplete() : void
      {
         dgVo = new DungeonVo(100);
         dgVo.battleRandom = paramVo.seeds;
         PlayerModel.ins.createTeam(paramVo.self);
         dgVo.unitHash = PlayerModel.ins.team;
         super.moduleServerCpl();
      }
      
      override protected function startLoadScript() : void
      {
         scriptLib = new ScriptLib(0,null);
         scriptLib.addCompleteHandler(this.scriptLoad_cpl).exec();
      }
      
      override protected function loadBgConfig_cpl() : void
      {
         super.loadBgConfig_cpl();
         if(dgUI)
         {
            dgUI.setMode(1);
            dgUI.btn_return.skin = "png.uiAreanStart.btn_return";
         }
      }
      
      override protected function createBg(param1:*) : void
      {
         super.createBgByMapId(DefindConsts.BATTLE_REPORT_SCENE_MAP_ID,0,param1);
      }
      
      override protected function createBattlePlayer() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         switchUnitAllActived(this.unitViewHash.array,false);
         switchUnitAllActived(this.rightUnitViewHash.array,false);
         disposeBattlePlayer();
         var _loc1_:BattleStartVo = new BattleStartVo();
         _loc1_.container = this.fightLayer3D;
         _loc1_.unitViews = this.unitViewHash.merge(this.rightUnitViewHash);
         _loc1_.heads = this.dgUI.battleHeadPortrait;
         _loc1_.maps = this.dunGeonBgLayer;
         _loc1_.reportKind = 6666;
         _loc1_.playMode = 1;
         if(dgVo.battleRandom && dgVo.battleRandom.length > 0)
         {
            _loc1_.seeds = dgVo.battleRandom;
         }
         else
         {
            _loc1_.seeds = GameObjectManager.test_seed;
         }
         if(this.dunGeonBgLayer && this.dunGeonBgLayer.configVo)
         {
            _loc1_.isDeadFall = this.dunGeonBgLayer.configVo.isDeadFall;
         }
         if(dgVo && this.currentSubSceneIndex < this.dgVo.subSceneMax - 1)
         {
            _loc1_.isWinAct = false;
         }
         battlePlayer = new BattlePlayer(_loc1_);
         this.dgUI.box_auto.visible = true;
         this.dgUI.btn_return.visible = PlayerModel.ins.level >= DefindConsts.ARENA_BATTLE_JUMP;
         this.dgUI.lockAutoFight(true);
         this.battlePlayer.addEventListener("FIGHT_COMPLETE",fightPlayer_onCpl);
         this.battlePlayer.addEventListener("FIGHT_PLAYER_DIE",onFightPlayerDie);
         this.battlePlayer.addEventListener("FIGHT_NEW_TURN_BEGIN",onNewTurnBegin);
         this.dunGeonBgLayer.isBattling = true;
         this.battlePlayer.play();
      }
      
      override protected function fightPlayer_onCpl(param1:BattleEvent) : void
      {
         dgUI.timePaused = true;
         this.dunGeonBgLayer.isBattling = false;
         if(this.bossSceneCtrl == null)
         {
            this.switchLayer_fightToScene();
         }
         disposeBattlePlayer();
         switchUnitAllActived(this.unitViewHash.array,true);
         switchUnitAllActived(this.rightUnitViewHash.array,true);
         nextScript(param1.data.bResult);
      }
      
      override protected function scriptEnd_onCpl() : void
      {
         this.showWinPanel();
      }
      
      override protected function onFightPlayerDie(param1:BattleEvent) : void
      {
         Log.info(this,"Some one die");
         var _loc2_:UnitVo = param1.data as UnitVo;
         if(_loc2_.isAttack)
         {
            dgUI.leftAlive--;
         }
      }
      
      override protected function showResultModule(param1:FightResultVO, param2:Boolean) : void
      {
         var _loc3_:* = null;
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
      
      override protected function showWinPanel() : void
      {
         var _loc1_:* = null;
         this.dgUI.visible = false;
         ModuleMgr.ins.showModule(40211,new BattleWinArenaVo(resultPage_clickHandler,battle_replay,open_statistic,PlayerModel.ins.team.array,PlayerModel.ins.rightTeam.array));
      }
      
      override protected function showLossPanel() : void
      {
         var _loc1_:* = null;
         this.dgUI.visible = false;
         _loc1_ = new FightResultVO();
         _loc1_.dropItems = [];
         _loc1_.gold = 0;
         _loc1_.addExp = 0;
         showResultModule(_loc1_,false);
      }
      
      override protected function battle_replay() : void
      {
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc2_:* = undefined;
         var _loc1_:* = null;
         this.switchLayer_sceneToFight();
         var _loc3_:Array = paramVo.self;
         _loc6_ = 0;
         while(_loc6_ < _loc3_.length)
         {
            _loc2_ = _loc3_[_loc6_];
            _loc1_ = FPUtil.genBattleId(_loc2_.isAttack,_loc2_.posId) + "";
            if(_loc2_.isAttack == 1)
            {
               _loc4_ = unitViewHash.getValue(_loc1_);
            }
            else
            {
               _loc4_ = rightUnitViewHash.getValue(_loc1_);
            }
            _loc4_.vo.serVo = _loc2_;
            _loc4_.vo.rage = _loc2_.rage;
            _loc4_.vo.hp = _loc2_.prop.hp;
            _loc6_++;
         }
         disposeBattlePlayer();
         var _loc5_:BattleStartVo = new BattleStartVo();
         _loc5_.container = this.fightLayer3D;
         _loc5_.unitViews = this.unitViewHash.merge(this.rightUnitViewHash);
         _loc5_.heads = this.dgUI.battleHeadPortrait;
         _loc5_.maps = this.dunGeonBgLayer;
         _loc5_.reportKind = 6666;
         _loc5_.playMode = 1;
         if(dgVo.battleRandom && dgVo.battleRandom.length > 0)
         {
            _loc5_.seeds = dgVo.battleRandom;
         }
         else
         {
            _loc5_.seeds = GameObjectManager.test_seed;
         }
         _loc5_.isBoss = isBossBattle;
         battlePlayer = new BattlePlayer(_loc5_);
         this.battlePlayer.addEventListener("FIGHT_COMPLETE",fightPlayer_onCpl);
         this.battlePlayer.addEventListener("FIGHT_PLAYER_DIE",onFightPlayerDie);
         this.battlePlayer.addEventListener("FIGHT_NEW_TURN_BEGIN",onNewTurnBegin);
         this.dunGeonBgLayer.isBattling = true;
         this.battlePlayer.play();
      }
   }
}
