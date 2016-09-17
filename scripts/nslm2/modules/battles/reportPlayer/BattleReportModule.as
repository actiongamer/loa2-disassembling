package nslm2.modules.battles.reportPlayer
{
   import nslm2.modules.dungeons.DungeonSceneModule;
   import proto.ITBattleReportData;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLVariables;
   import flash.events.Event;
   import morn.core.utils.StringUtils;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.loadingModules.LoadingMsg;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.nets.imsdk.Base64;
   import flash.utils.ByteArray;
   import com.mz.core.configs.ClientConfig;
   import com.mz.core.logging.Log;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.battles.guildDungeons.GuildDungeonVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.dungeons.DungeonVo;
   import nslm2.modules.dungeons.scripts.ScriptLib;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.battles.battle.BattleStartVo;
   import nslm2.modules.battles.battle.GameObjectManager;
   import nslm2.modules.battles.battle.BattlePlayer;
   import nslm2.modules.battles.battle.BattleEvent;
   import nslm2.modules.fightPlayer.UnitVo;
   import nslm2.common.vo.FightResultVO;
   import nslm2.modules.battles.battleResults.BattleResultConfigVo;
   import nslm2.modules.battles.battleResults.BattleWinArenaVo;
   import nslm2.modules.funnies.pkCrossSer.PKCrossComp.PKCrossResultVo;
   import nslm2.modules.funnies.pkCrossSer.PKCrossModel;
   import nslm2.modules.funnies.guildPKCrossSer.GPKCModel;
   import nslm2.modules.battles.battle.FPUtil;
   import nslm2.modules.fightPlayer.UnitView;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcGroupVo;
   import nslm2.modules.dungeons.s3ds.BossSceneCtrl32;
   import nslm2.modules.dungeons.s3ds.BossSceneCtrl31;
   import nslm2.modules.dungeons.s3ds.BossSceneCtrl311;
   import nslm2.modules.dungeons.s3ds.BossSceneCtrl0;
   
   public class BattleReportModule extends DungeonSceneModule
   {
      
      public static const REPORT_TYPE_PLAYER_PK:int = 6666;
      
      public static const REPROT_TYPE_TEAM_GUAJI:int = 2;
      
      public static const REPROT_TYPE_CHAMPION:int = 10;
      
      public static const REPORT_TYPE_FAMILY_BOSS:int = 5;
      
      public static const REPORT_TYPE_PK_CROSS_SER:int = 11;
      
      public static const REPORT_HERO_AWAKE:int = 12;
      
      public static const REPORT_TYPE_WORLD_BOSS:int = 13;
      
      public static const REPORT_TYPE_GPK:int = 14;
      
      public static const REPORT_TYPE_TPKC:int = 15;
      
      public static const BATTLE_REPORT_MODULE_SHOW:String = "battle_report_module_show";
       
      
      private var _currReport:ITBattleReportData;
      
      private var _reportIds:Array;
      
      private var _init:Boolean = false;
      
      private var _currResult:int;
      
      private var noNextSceneKind:Array;
      
      private var autoKind:Array;
      
      private var paramVo:nslm2.modules.battles.reportPlayer.BattleReportParamVo;
      
      public function BattleReportModule()
      {
         noNextSceneKind = [9,2,10,5,11,12,13];
         autoKind = [15,14,9,2,10,5,11,12,13];
         super();
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         _init = false;
         paramVo = param1 as nslm2.modules.battles.reportPlayer.BattleReportParamVo;
         _reportIds = paramVo.reportIds;
         var _loc2_:String = _reportIds.shift();
         loadBattleReportById(_loc2_);
      }
      
      private function loadBattleReportById(param1:String) : void
      {
         id = param1;
         onReportLoaded = function(param1:Event):void
         {
            loader.removeEventListener("complete",onReportLoaded);
            loader.removeEventListener("securityError",onError);
            loader.removeEventListener("ioError",onError);
            var _loc2_:* = loader.data;
            if(StringUtils.isNull(_loc2_))
            {
               ObserverMgr.ins.sendNotice("LOADING_BAR_CPL",new LoadingMsg(moduleId,2,0));
               AlertUtil.alert(LocaleMgr.ins.getStr(999000032),yesHandler);
               return;
            }
            var _loc3_:ByteArray = Base64.decodeToByteArray(_loc2_);
            loadReportComplete(_loc3_);
         };
         onError = function(param1:Event):void
         {
            loader.removeEventListener("complete",onReportLoaded);
            loader.removeEventListener("securityError",onError);
            loader.removeEventListener("ioError",onError);
            ObserverMgr.ins.sendNotice("LOADING_BAR_CPL",new LoadingMsg(moduleId,2,0));
            AlertUtil.alert(LocaleMgr.ins.getStr(999000033),yesHandler);
         };
         var loader:URLLoader = new URLLoader();
         var request:URLRequest = new URLRequest(ClientConfig.battleReportUrl);
         request.method = "POST";
         var param:URLVariables = new URLVariables();
         param.id = id;
         request.data = param;
         loader.addEventListener("complete",onReportLoaded);
         loader.addEventListener("securityError",onError);
         loader.addEventListener("ioError",onError);
         loader.load(request);
         Log.debug("战报地址：",request.url,param.id);
         ObserverMgr.ins.sendNotice("LOADING_BAR_ADD_PROGRESS",new LoadingMsg(moduleId,0,1,LocaleMgr.ins.getStr(999000623)));
      }
      
      private function yesHandler() : void
      {
         if(_currReport && _currReport.kind == 10)
         {
         }
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      override protected function resultPage_clickHandler() : void
      {
         yesHandler();
      }
      
      private function loadReportComplete(param1:ByteArray) : void
      {
         param1.endian = "littleEndian";
         _currReport = new ITBattleReportData();
         _currReport.readFromSlice(param1,0);
         if(!_init)
         {
            if(!(int(_currReport.kind) - 7))
            {
               dgVo = new GuildDungeonVo(_currReport.gParam[0]);
               dgVo.battleRandom = _currReport.param.seed;
               PlayerModel.ins.createTeam(_currReport.player);
               dgVo.unitHash = PlayerModel.ins.team;
            }
            else
            {
               dgVo = new DungeonVo(_currReport.gParam[0]);
               dgVo.battleRandom = _currReport.param.seed;
               PlayerModel.ins.createTeam(_currReport.player);
               dgVo.unitHash = PlayerModel.ins.team;
            }
            moduleServerCpl();
            _init = true;
         }
         else if(!(int(_currReport.kind) - 1))
         {
            dgVo.battleRandom = _currReport.param.seed;
            PlayerModel.ins.resetTeam(_currReport.player);
            nextScript(_currResult);
         }
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
         if([1,7,12].indexOf(_currReport.kind) != -1)
         {
            super.createBg(param1);
         }
         else
         {
            switch(int(_currReport.kind) - 2)
            {
               case 0:
                  super.createBgByMapId(DefindConsts.BATTLE_MAP_ID_TEAM_GUAJI,0,param1);
                  break;
               default:
               default:
                  super.createBgByMapId(DefindConsts.BATTLE_REPORT_SCENE_MAP_ID,0,param1);
                  break;
               case 3:
               default:
               default:
               default:
               default:
               default:
                  super.createBgByMapId(100,0,param1);
                  break;
               case 9:
                  super.createBgByMapId(DefindConsts.BATTLE_PK_CROSS_MAP_ID,0,param1);
                  break;
               case 10:
                  super.createBgByMapId(DefindConsts.BATTLE_HERO_AWAKEN_MAP_ID,0,param1);
                  break;
               case 11:
                  super.createBgByMapId(9001,0,param1);
                  break;
               case 12:
                  super.createBgByMapId(DefindConsts.FIGHT_MAP_GPK_ID,0,param1);
            }
         }
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
         _loc1_.replayStp = _currReport.timePoint;
         _loc1_.reportKind = _currReport.kind;
         if(autoKind.indexOf(_currReport.kind) != -1)
         {
            _loc1_.playMode = 1;
         }
         else
         {
            _loc1_.playMode = 2;
         }
         if(dgVo.battleRandom && dgVo.battleRandom.length > 0)
         {
            _loc1_.seeds = dgVo.battleRandom;
         }
         else
         {
            _loc1_.seeds = GameObjectManager.test_seed;
         }
         _loc1_.isBoss = isBossBattle;
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
         var _loc2_:* = null;
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
         if(_reportIds.length > 0)
         {
            _loc2_ = _reportIds.shift();
            loadBattleReportById(_loc2_);
         }
         else
         {
            nextScript(_currResult);
         }
      }
      
      override protected function scriptEnd_onCpl() : void
      {
         if(noNextSceneKind.indexOf(_currReport.kind) != -1)
         {
            this.gainDropAll();
            this.showWinPanel();
         }
         else
         {
            super.scriptEnd_onCpl();
         }
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
         var _loc2_:* = null;
         var _loc1_:* = null;
         _loc1_ = null;
         this.dgUI.visible = false;
         switch(int(paramVo.type))
         {
            case 0:
               AlertUtil.alert(LocaleMgr.ins.getStr(999000034),yesHandler);
               break;
            case 1:
               ModuleMgr.ins.showModule(40211,new BattleWinArenaVo(resultPage_clickHandler,battle_replay,open_statistic,PlayerModel.ins.team.array,PlayerModel.ins.rightTeam.array));
               break;
            case 2:
               _loc2_ = new FightResultVO();
               if(this.paramVo.drops)
               {
                  _loc2_.dropItems = this.paramVo.drops;
               }
               else
               {
                  _loc2_.dropItems = [];
               }
               _loc2_.gold = 0;
               _loc2_.addExp = 0;
               if(!paramVo.robSuccess)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(41300256));
               }
               showResultModule(_loc2_,true);
               break;
            case 3:
               _loc2_ = new FightResultVO();
               if(this.paramVo.drops)
               {
                  _loc2_.dropItems = this.paramVo.drops;
               }
               else
               {
                  _loc2_.dropItems = [];
               }
               _loc2_.gold = 0;
               _loc2_.addExp = 0;
               _loc2_.familyBossDmg = paramVo.familybossDmg;
               if(paramVo.otherskillBoss)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(40740180));
               }
               ModuleMgr.ins.showModule(40222,new BattleResultConfigVo(resultPage_clickHandler,battle_replay,open_statistic,_loc2_));
               break;
            case 4:
            case 5:
               _loc1_ = new BattleWinArenaVo(resultPage_clickHandler,battle_replay,open_statistic,PlayerModel.ins.team.array,PlayerModel.ins.rightTeam.array);
               ModuleMgr.ins.showModule(50250,new PKCrossResultVo(_loc1_,true,LocaleMgr.ins.getStr(50600033,[PKCrossModel.ins.addScore,PKCrossModel.ins.addCoin])));
               break;
            case 6:
               _loc1_ = new BattleWinArenaVo(resultPage_clickHandler,battle_replay,open_statistic,PlayerModel.ins.team.array,PlayerModel.ins.rightTeam.array);
               ModuleMgr.ins.showModule(50250,new PKCrossResultVo(_loc1_,true,LocaleMgr.ins.getStr(30610217,[GPKCModel.ins.coin,GPKCModel.ins.con]),LocaleMgr.ins.getStr(30610229,[GPKCModel.ins.hpPer])));
         }
      }
      
      override protected function showLossPanel() : void
      {
         var _loc1_:* = null;
         this.dgUI.visible = false;
         switch(int(paramVo.type))
         {
            case 0:
               AlertUtil.alert(LocaleMgr.ins.getStr(999000034),yesHandler);
               break;
            case 1:
               _loc1_ = new FightResultVO();
               _loc1_.star = 3;
               if(this.paramVo.drops)
               {
                  _loc1_.dropItems = this.paramVo.drops;
               }
               else
               {
                  _loc1_.dropItems = [];
               }
               _loc1_.gold = 0;
               _loc1_.addExp = 0;
               showResultModule(_loc1_,false);
               break;
            case 2:
               _loc1_ = new FightResultVO();
               if(this.paramVo.drops)
               {
                  _loc1_.dropItems = this.paramVo.drops;
               }
               else
               {
                  _loc1_.dropItems = [];
               }
               _loc1_.gold = 0;
               _loc1_.addExp = 0;
               showResultModule(_loc1_,false);
               break;
            case 3:
               _loc1_ = new FightResultVO();
               if(this.paramVo.drops)
               {
                  _loc1_.dropItems = this.paramVo.drops;
               }
               else
               {
                  _loc1_.dropItems = [];
               }
               _loc1_.gold = 0;
               _loc1_.addExp = 0;
               _loc1_.familyBossDmg = paramVo.familybossDmg;
               ModuleMgr.ins.showModule(40222,new BattleResultConfigVo(resultPage_clickHandler,battle_replay,open_statistic,_loc1_));
               break;
            case 4:
            case 5:
               _loc1_ = new FightResultVO();
               _loc1_.lossAward = "<font color=\'#00ff00\'>" + LocaleMgr.ins.getStr(999000035) + PKCrossModel.ins.addScore + LocaleMgr.ins.getStr(999000036) + PKCrossModel.ins.addCoin + "</font>";
               showResultModule(_loc1_,false);
               break;
            case 6:
               _loc1_ = new FightResultVO();
               _loc1_.lossAward = LocaleMgr.ins.getStr(30610233,[GPKCModel.ins.coin,GPKCModel.ins.con,GPKCModel.ins.hpPer]);
               showResultModule(_loc1_,false);
         }
      }
      
      override protected function battle_replay() : void
      {
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc2_:* = undefined;
         var _loc1_:* = null;
         this.switchLayer_sceneToFight();
         var _loc3_:Array = _currReport.player;
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
         _loc5_.reportKind = _currReport.kind;
         _loc5_.replayStp = _currReport.timePoint;
         if(autoKind.indexOf(_currReport.kind) != -1)
         {
            _loc5_.playMode = 1;
         }
         else
         {
            _loc5_.playMode = 2;
         }
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
      
      override protected function checkAndInitBoss() : void
      {
         var _loc1_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         if(this.isDisposed)
         {
            return;
         }
         if(paramVo.familybossId)
         {
            _loc1_ = StcMgr.ins.getNpcGroupVo(paramVo.familybossId);
            if(!_loc1_)
            {
               return;
            }
            _loc3_ = this.rightUnitViewHash.array.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc2_ = this.rightUnitViewHash.array[_loc4_];
               if(_loc2_.vo.stcNpcVo.kind == 12)
               {
                  if(this.dunGeonBgLayer.configVo.ctrlKind)
                  {
                     var _loc5_:* = this.dunGeonBgLayer.configVo.ctrlKind.id;
                     if(32 !== _loc5_)
                     {
                        if(31 !== _loc5_)
                        {
                           if(311 !== _loc5_)
                           {
                              this.bossSceneCtrl = new BossSceneCtrl0(this,_loc2_);
                           }
                           else
                           {
                              this.bossSceneCtrl = new BossSceneCtrl311(this,_loc2_);
                           }
                        }
                        else
                        {
                           this.bossSceneCtrl = new BossSceneCtrl31(this,_loc2_);
                        }
                     }
                     else
                     {
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
         else
         {
            super.checkAndInitBoss();
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
