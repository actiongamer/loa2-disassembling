package nslm2.modules.battles.reportPlayer
{
   import nslm2.modules.dungeons.DungeonSceneModule;
   import nslm2.nets.imsdk.Base64;
   import flash.utils.ByteArray;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.ITBattleReportData;
   import nslm2.modules.battles.battle.InitCCReplacer;
   import nslm2.modules.battles.battle.BServerRunner;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.utils.DictHash;
   import nslm2.modules.battles.battle.BattleStartVo;
   import nslm2.modules.dungeons.DungeonVo;
   import nslm2.modules.dungeons.scripts.ScriptLib;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.battles.battle.BattlePlayer;
   import nslm2.modules.battles.battle.BattleEvent;
   import com.mz.core.logging.Log;
   import nslm2.modules.fightPlayer.UnitVo;
   import nslm2.common.vo.FightResultVO;
   import nslm2.modules.battles.battleResults.BattleWinArenaVo;
   import nslm2.modules.battles.battleResults.BattleResultConfigVo;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class BattleReportTestModule extends DungeonSceneModule
   {
       
      
      private var _currReport;
      
      private var _reportIds:Array;
      
      private var _init:Boolean = false;
      
      private var _currResult:int;
      
      private var noNextSceneKind:Array;
      
      private var serRunSim:Boolean = false;
      
      private var paramVo:nslm2.modules.battles.reportPlayer.BattleReportParamVo;
      
      public function BattleReportTestModule()
      {
         noNextSceneKind = [9,10,2];
         super();
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         _init = false;
         loadBattleReportById();
      }
      
      private function loadBattleReportById() : void
      {
         var _loc2_:String = "";
         var _loc1_:ByteArray = Base64.decodeToByteArray(_loc2_);
         loadReportComplete(_loc1_);
      }
      
      private function yesHandler() : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      override protected function resultPage_clickHandler() : void
      {
         yesHandler();
      }
      
      private function loadReportComplete(param1:ByteArray) : void
      {
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc7_:* = null;
         var _loc2_:* = null;
         var _loc6_:* = null;
         param1.endian = "littleEndian";
         _currReport = new ITBattleReportData();
         _currReport.readFromSlice(param1,0);
         if(serRunSim)
         {
            new InitCCReplacer();
            _loc5_ = new BServerRunner();
            _loc4_ = _currReport.player;
            PlayerModel.ins.createTeam(_loc4_);
            _loc3_ = PlayerModel.ins.team;
            _loc7_ = PlayerModel.ins.rightTeam;
            _loc2_ = _loc3_.array.concat(_loc7_.array);
            _loc6_ = new BattleStartVo();
            _loc6_.seeds = _currReport.param.seed;
            _loc6_.playMode = _currReport.param.playerMode;
            _loc6_.replayStp = _currReport.timePoint;
            _loc5_.startup(_loc2_,_loc6_);
            return;
         }
         dgVo = new DungeonVo(797979);
         if(_currReport.hasOwnProperty("random"))
         {
            dgVo.battleRandom = _currReport.random;
         }
         if(_currReport.hasOwnProperty("param"))
         {
            dgVo.battleRandom = _currReport.param.seed;
         }
         if(!(dgVo.battleRandom && dgVo.battleRandom.length > 0))
         {
            dgVo.battleRandom = [6512,4268,5038,4189,2483,9264,335,9970,968,516,9912,42,4074,7323,9603,9879,823,9958,3216,5034,34,5411,5696,7871,8903,6312,3671,822,945,4867,46,8932,5832,845,7728,1813,2490,8009,8038,9341,1968,4202,5204,5732,7262,9019,906,8884,9515,4340,8041,8609,3774,3511,5619,6735,759,2991,7656,3697,225,7488,3032,9454];
         }
         PlayerModel.ins.createTeam(_currReport.player);
         dgVo.unitHash = PlayerModel.ins.team;
         moduleServerCpl();
      }
      
      override protected function toNextScene() : void
      {
         this.scriptStart_onCpl();
      }
      
      override protected function start_load() : void
      {
         scriptLib = new ScriptLib(0,null);
         scriptLib.addCompleteHandler(this.scriptLoad_cpl).exec();
      }
      
      override protected function loadBgConfig_cpl() : void
      {
         super.loadBgConfig_cpl();
         dgUI.setMode(1);
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
         if(_currReport.hasOwnProperty("timePoint"))
         {
            _loc1_.replayStp = _currReport.timePoint;
         }
         else
         {
            _loc1_.replayStp = [{
               "objId":1002,
               "timePoint":71
            },{
               "objId":1003,
               "timePoint":352
            },{
               "objId":1000,
               "timePoint":532
            },{
               "objId":1004,
               "timePoint":791
            },{
               "objId":1004,
               "timePoint":1166
            },{
               "objId":1002,
               "timePoint":1835
            }];
         }
         if(_currReport.hasOwnProperty("param"))
         {
            _loc1_.playMode = _currReport.param.playerMode;
         }
         else
         {
            _loc1_.playMode = 2;
         }
         _loc1_.seeds = dgVo.battleRandom;
         _loc1_.isBoss = isBossBattle;
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
         _currResult = param1.data.bResult;
         nextScript(_currResult);
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
         this.dgUI.visible = false;
         if(param2)
         {
            ModuleMgr.ins.showModule(40211,new BattleWinArenaVo(resultPage_clickHandler,battle_replay,open_statistic,PlayerModel.ins.team.array,PlayerModel.ins.rightTeam.array));
         }
         else
         {
            ModuleMgr.ins.showModule(40220,new BattleResultConfigVo(resultPage_clickHandler,battle_replay,open_statistic,param1));
         }
      }
      
      override protected function showWinPanel() : void
      {
         AlertUtil.alert(LocaleMgr.ins.getStr(999000034),yesHandler);
      }
      
      override protected function showLossPanel() : void
      {
         AlertUtil.alert(LocaleMgr.ins.getStr(999000034),yesHandler);
      }
      
      override protected function battle_replay() : void
      {
      }
   }
}
