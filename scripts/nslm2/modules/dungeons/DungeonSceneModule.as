package nslm2.modules.dungeons
{
   import morn.customs.components.SceneModuleView;
   import nslm2.modules.dungeons.scripts.IScriptBox;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideGetComp;
   import nslm2.common.ui.components.comp3ds.lightAndShadows.LightAndShadowCtrl2;
   import nslm2.modules.footstones.newerGuideModules.NGScriptPlayer;
   import com.mz.core.utils.DictHash;
   import nslm2.common.ui.components.comps2d.BmcS1;
   import nslm2.common.ui.components.comps2d.others.TaskAlertRender;
   import com.mz.core.configs.ClientConfig;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import proto.Reward;
   import nslm2.utils.Uint64Util;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.footstones.gmModules.PlayerLogUtil;
   import nslm2.modules.scenes.commons.SceneModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.loadingModules.LoadingMsg;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.StageFightStartReq;
   import proto.StagePhaseCheckReq;
   import proto.StageFightStartRes;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.battles.battle.skillConfig.SkillConfig;
   import nslm2.utils.TransformUtil;
   import morn.customs.expands.MornExpandUtil;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.common.globals.GlobalRef;
   import away3d.containers.ObjectContainer3D;
   import nslm2.modules.fightPlayer.UnitView;
   import flash.geom.Point;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.chatModules.ChatModuleParam;
   import nslm2.modules.foundations.mainToolBar.MainToolBarChangeMsg;
   import nslm2.modules.battles.battle.GameObjectManager;
   import com.mz.core.display.MzSprite;
   import morn.core.components.Component;
   import nslm2.modules.dungeons.scripts.ScriptRunner;
   import nslm2.modules.dungeons.ctrls.UnitEnterOriCtrl;
   import flash.events.MouseEvent;
   import com.mz.core.logging.Log;
   import flash.utils.getTimer;
   import nslm2.common.scene.multiLayer.DungeonMultilayerBg;
   import away3d.cameras.Camera3D;
   import org.specter3d.context.AppGlobalContext;
   import nslm2.modules.dungeons.s3ds.BossSceneCtrlBase;
   import nslm2.modules.fightPlayer.UnitVo;
   import nslm2.modules.dungeons.ctrls.DgDebugCtrl;
   import flash.events.Event;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.dungeons.scripts.ScriptLib;
   import nslm2.modules.Chapters.ChapterModel;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.mgrs.resMgrs.GetRes3DTask;
   import nslm2.modules.fightPlayer.FactoryUtil;
   import morn.customs.tests.TestTimerCount;
   import nslm2.common.configs.StcLanguageConfig;
   import nslm2.modules.battles.battle.FPUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import com.mz.core.utils2.task.TaskPool;
   import nslm2.mgrs.stcMgrs.vos.StcSpecialEffectVo;
   import com.mz.core.mgrs.resMgrs.GetResEffect3DTask;
   import nslm2.mgrs.SoundMgr;
   import nslm2.modules.footstones.driverInfoModules.DriverInfoChecker;
   import nslm2.inits.firstBattles.InitDelayFirstBattleTask;
   import nslm2.mgrs.stcMgrs.vos.StcNpcGroupVo;
   import nslm2.modules.dungeons.s3ds.BossSceneCtrl32;
   import nslm2.modules.dungeons.s3ds.BossSceneCtrl31;
   import nslm2.modules.dungeons.s3ds.BossSceneCtrl0;
   import nslm2.modules.dungeons.scripts.configs.ScriptConfigList;
   import morn.core.handlers.Handler;
   import nslm2.modules.battles.battle.BattlePlayer;
   import nslm2.modules.battles.battle.BattleStartVo;
   import nslm2.modules.battles.battle.BattleEvent;
   import flash.geom.Vector3D;
   import morn.core.utils.StringUtils;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import proto.StagePhaseCheckRes;
   import proto.SkillTimePoint;
   import nslm2.modules.battles.battle.BattleLogger;
   import com.greensock.TweenLite;
   import nslm2.common.vo.FightResultVO;
   import nslm2.modules.battles.battleResults.BattleResultConfigVo;
   import proto.StageFightEndReq;
   import proto.StageFightEndRes;
   import morn.core.components.Button;
   import nslm2.modules.fightPlayer.FPConsts;
   import nslm2.modules.foundations.AlertUtil;
   import flash.display.Sprite;
   import com.mz.core.utils.DisplayUtils;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import nslm2.modules.dungeons.scripts.comps.ScriptCmdEffect3DView;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   
   public class DungeonSceneModule extends SceneModuleView implements IScriptBox, INewerGuideGetComp
   {
      
      public static const FIXED_BORDER:int = 50;
      
      public static const FIXED_W:int = 1500;
      
      public static const FIXED_H:int = 900;
      
      public static const INIT_OFFSET:int = 900;
       
      
      public var lightCtrl:LightAndShadowCtrl2;
      
      public var currentSubSceneIndex:int = 0;
      
      protected var ngScriptPlayer:NGScriptPlayer;
      
      public var display2DHash:DictHash;
      
      public var display3DHash:DictHash;
      
      public var mc_go:BmcS1;
      
      private var _taskAlertRender:TaskAlertRender;
      
      public var dgVo:nslm2.modules.dungeons.DungeonVo;
      
      private var _resForDebug;
      
      private var _clientRetForDebug:StagePhaseCheckReq;
      
      public var layer3d:ObjectContainer3D;
      
      private var sceneLayer3D:ObjectContainer3D;
      
      public var fightLayer3D:ObjectContainer3D;
      
      private var cameraLayer3D:ObjectContainer3D;
      
      public var sceneLayer2D:MzSprite;
      
      protected var _topLayer2D:Component;
      
      public var dgUI:nslm2.modules.dungeons.DungeonScene;
      
      protected var scriptCtrl:ScriptRunner;
      
      protected var oriCtrl:UnitEnterOriCtrl;
      
      public var tileBgInitOffsetX:int;
      
      public var dunGeonBgLayer:DungeonMultilayerBg;
      
      public var bossSceneCtrl:BossSceneCtrlBase;
      
      public var tempUnitHash:DictHash;
      
      public var unitViewHash:DictHash;
      
      public var rightUnitViewHash:DictHash;
      
      public var trashUnitViewArr:Array;
      
      protected var major:UnitView;
      
      private var avatarLoadArr:Vector.<UnitView>;
      
      protected var rightCount:int = 0;
      
      protected var _cameraX:int;
      
      protected var _cameraY:int = 0;
      
      protected var _anchorPoi:Point;
      
      public var debugCtrl:DgDebugCtrl;
      
      protected var scriptLib:ScriptLib;
      
      private var preLoadEff3D_process_addTick:Number = 2;
      
      public var battlePlayer:BattlePlayer;
      
      protected var dropViewArr:Array;
      
      protected var _lastStp:Array;
      
      protected var _lastSPCRArr:Array;
      
      protected var _lastSFER:StageFightEndRes;
      
      protected var useFightLayer:Boolean = false;
      
      protected var hotSprite:Sprite;
      
      private var _testHideUI:Boolean = false;
      
      public function DungeonSceneModule()
      {
         sceneLayer2D = new MzSprite(true);
         _topLayer2D = new Component();
         trashUnitViewArr = [];
         _anchorPoi = new Point(0,0);
         dropViewArr = [];
         _lastSPCRArr = [];
         super();
         GlobalRef.isInBattleModule = true;
         GlobalRef.skipAllScript = false;
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc2_:* = null;
         dgVo = param1["vo"];
         if(ClientConfig.firstBattle == 1)
         {
            ServerEngine.ins.send(4080);
            dgVo.dropGold = StcMgr.ins.getStageVo(dgVo.dungeonId).reward_coin;
            _loc4_ = new Reward();
            _loc4_.id = Uint64Util.fromNumber(1);
            _loc4_.dropId = 61000;
            _loc4_.dropType = 20;
            _loc4_.count = Uint64Util.fromNumber(1);
            dgVo.drops = [_loc4_];
            if(EnvConfig.ins.ptId == 610 && checkYiYeTime())
            {
               _loc3_ = new Reward();
               _loc3_.id = Uint64Util.fromNumber(1);
               _loc3_.dropId = 200002;
               _loc3_.dropType = 20;
               _loc3_.count = Uint64Util.fromNumber(1);
               _loc2_ = new Reward();
               _loc2_.id = Uint64Util.fromNumber(1);
               _loc2_.dropId = 200003;
               _loc2_.dropType = 20;
               _loc2_.count = Uint64Util.fromNumber(1);
               dgVo.drops.push(_loc3_);
               dgVo.drops.push(_loc2_);
            }
            dgVo.countDropList();
            dgVo.battleRandom = [9153,87,4527,6167,3177,5450,4506,7832,5510,2332,903,6515,1331,6374,598,4394,6747,3749,9403,7692,7495,453,4590,3035,2077,8424,5659,8033,3801,7099,7104,804,8517,6825,741,8222,1176,5237,48,2351,903,3138,426,8148,7907,7687,7868,3880,407,8450,4976,9834,778,2273,8388,1289,7652,263,3655,8288,2357,864,9083,8360];
            PlayerLogUtil.ins.saveType1(600 + EnvConfig.ins.firstBattleType);
            this.moduleServerCpl();
         }
         else if(EnvConfig.ins.useServer)
         {
            if(SceneModel.ins.sceneId != this.dgVo.dungeonId)
            {
               ObserverMgr.ins.sendNotice("LOADING_BAR_ADD_PROGRESS",new LoadingMsg(this.moduleId,0,2,LocaleMgr.ins.getStr(999000629)));
               SceneModel.ins.addEventListener("modelServerCplPrefix" + 8003,model_enterScene);
               SceneModel.ins.cmd_enterScene(dgVo.dungeonId);
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
      
      private function checkYiYeTime() : Boolean
      {
         var _loc1_:Number = new Date().time;
         if(_loc1_ > 1457946833000 && _loc1_ < 1459872000000)
         {
            return true;
         }
         return false;
      }
      
      protected function model_enterScene(... rest) : void
      {
         SceneModel.ins.removeEventListener("modelServerCplPrefix" + 8003,model_enterScene);
         server_stageFightStart();
      }
      
      protected function server_stageFightStart() : void
      {
         ObserverMgr.ins.sendNotice("LOADING_BAR_ADD_PROGRESS",new LoadingMsg(this.moduleId,0,2,LocaleMgr.ins.getStr(999000630)));
         var _loc1_:StageFightStartReq = new StageFightStartReq();
         _loc1_.stageId = dgVo.dungeonId;
         ServerEngine.ins.send(8053,_loc1_,serverCpl_stageFightStart);
      }
      
      protected function serverCpl_stageFightStart(param1:StageFightStartRes) : void
      {
         _resForDebug = param1;
         _lastSPCRArr.length = 0;
         dgVo.dropGold = StcMgr.ins.getStageVo(dgVo.dungeonId).reward_coin;
         dgVo.drops = param1.drops;
         dgVo.countDropList();
         dgVo.battleRandom = param1.random;
         PlayerModel.ins.createTeam(param1.player);
         dgVo.unitHash = PlayerModel.ins.team;
         _lastSPCRArr.push(param1);
         this.moduleServerCpl();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         ObserverMgr.ins.sendNotice("LOADING_BAR_ADD_PROGRESS",new LoadingMsg(this.moduleId,0,2,LocaleMgr.ins.getStr(998001157)));
         if(EnvConfig.ins.testAuthor != 991)
         {
            this.createBg(loadBgConfig_cpl);
         }
         else
         {
            loadBgConfig_cpl();
         }
      }
      
      protected function loadBgConfig_cpl() : void
      {
         SkillConfig.intConfig();
         TransformUtil.cameraToBattlePerspective1();
         if(EnvConfig.ins.testAuthor != 991)
         {
            dgUI = new nslm2.modules.dungeons.DungeonScene();
            this.addChild(sceneLayer2D);
            this.addChild(dgUI);
            this.addChild(topLayer2D);
            MornExpandUtil.setLayout(topLayer2D);
            dgUI.visible = false;
            this.dgUI.box_auto.visible = false;
            this.dgUI.btn_return.visible = false;
            MornExpandUtil.addHandlerForBtnAll(dgUI,btn_handler);
            this.mc_go = new BmcS1();
            this.mc_go.init(7001);
            mc_go.x = UIMgr.gameWidth * 3 / 4;
            mc_go.y = UIMgr.gameHeight - mc_go.height >> 1;
            UIMgr.layer2D.addChild(mc_go);
            this.mc_go.visible = false;
            if(ClientConfig.firstBattle != 1 && PlayerModel.ins.level == FuncOpenAutoCtrl.getOpenLevel(40256) && GlobalRef.needShowAutoAlert == true)
            {
               _taskAlertRender = new TaskAlertRender();
               _taskAlertRender.x = 322;
               _taskAlertRender.img_bg.scaleX = -1;
               _taskAlertRender.img_bg.x = 268;
               _taskAlertRender.txt_content.text = LocaleMgr.ins.getStr(40740222);
               this.dgUI.btn_auto.addChild(_taskAlertRender);
            }
         }
         layer3d = new ObjectContainer3D();
         sceneLayer3D = new ObjectContainer3D();
         fightLayer3D = new ObjectContainer3D();
         cameraLayer3D = new ObjectContainer3D();
         layer3d.addChild(sceneLayer3D);
         layer3d.addChild(cameraLayer3D);
         this.sceneLayer3D.addChild(fightLayer3D);
         UIMgr.root3D.addChild(layer3d);
         initLight();
         tempUnitHash = new DictHash();
         if(EnvConfig.ins.testAuthor != 991)
         {
            this.avatarLoadArr = new Vector.<UnitView>();
            createLeftUnitView();
            createRightUnitView(0);
            this.anchorPoi = new Point(this.dunGeonBgLayer.configVo.initX,0);
            rightUnitViewHash.array.forEach(eachUnit_validateXY);
         }
         else
         {
            createLeftUnitView();
         }
         this.cameraX = this.dunGeonBgLayer.configVo.initX;
         ModuleMgr.ins.staticLayer.closeAll([10430]);
         if(ClientConfig.firstBattle == false)
         {
            ModuleMgr.ins.showModule(10500,ChatModuleParam.init(this.moduleId,false,true));
         }
         ObserverMgr.ins.sendNotice("msg_main_tool_bar_id",new MainToolBarChangeMsg([],[],false,false));
         display2DHash = new DictHash();
         display3DHash = new DictHash();
         this.resetPosition();
         if(EnvConfig.ins.testAuthor != 991)
         {
            check_btn_auto_state();
            this.dgUI.initboNum(1,dgVo.subSceneMax);
            dgUI.box_speed.visible = FuncOpenAutoCtrl.checkOpen(40257);
            dgUI.btn_speed.selected = GameObjectManager.Instance.speedType == 1;
         }
         if(EnvConfig.ins.testAuthor != 991)
         {
            this.start_load();
         }
      }
      
      public function get topLayer2D() : Component
      {
         return _topLayer2D;
      }
      
      protected function stage_onClick(param1:MouseEvent) : void
      {
         if(EnvConfig.ins.showDevModule && param1.altKey)
         {
            Log.debug(getTimer()," flash特效和图片坐标(" + sceneLayer2D.mouseX + "," + sceneLayer2D.mouseY + "),");
         }
      }
      
      protected function createBg(param1:*) : void
      {
         if(EnvConfig.ins.testAuthor != 991)
         {
            dunGeonBgLayer = new DungeonMultilayerBg();
            dunGeonBgLayer.dungeonVO = dgVo;
            dunGeonBgLayer.init(param1);
         }
      }
      
      protected function createBgByMapId(param1:int, param2:int, param3:*) : void
      {
         if(EnvConfig.ins.testAuthor != 991)
         {
            dunGeonBgLayer = new DungeonMultilayerBg();
            dunGeonBgLayer.dungeonVO = dgVo;
            dunGeonBgLayer.mapId = param1;
            dunGeonBgLayer.mapConfigId = param2;
            dunGeonBgLayer.init(param3);
         }
      }
      
      protected function loadBg() : void
      {
         dunGeonBgLayer.cameraX = _cameraX;
         dunGeonBgLayer.createBgLayer();
         sceneLayer3D.addChild(dunGeonBgLayer);
         validateBgBox();
      }
      
      public function get camera3d() : Camera3D
      {
         return AppGlobalContext.stage3d.camera3d;
      }
      
      public function validateBgBox(param1:Boolean = false) : void
      {
         dunGeonBgLayer.synchroCamera(camera3d,param1);
      }
      
      public function deleteUnit(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc3_:String = param1.split(":")[1];
         if(tempUnitHash.getValue(_loc3_))
         {
            _loc2_ = tempUnitHash.getValue(_loc3_) as UnitView;
            if(_loc2_.isTemp)
            {
               _loc2_.dispose();
            }
            tempUnitHash.remove(param1);
         }
         else
         {
            Log.error(this,"deleteUnit 没找到id对应的单位， id:",param1);
         }
      }
      
      public function getUnitById(param1:String) : Array
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc4_:* = undefined;
         if(param1.indexOf(":") != -1)
         {
            _loc3_ = param1.split(":").shift();
            _loc5_ = param1.split(":")[1];
            var _loc6_:* = _loc3_;
            if("npc_id" !== _loc6_)
            {
               if("side" !== _loc6_)
               {
                  if("left" !== _loc6_)
                  {
                     if("right" !== _loc6_)
                     {
                        if("temp" === _loc6_)
                        {
                           _loc2_ = tempUnitHash.getValue(_loc5_) as UnitView;
                           if(_loc2_ == null)
                           {
                              _loc4_ = this.display2DHash.getValue(_loc5_);
                              if(_loc4_ == null)
                              {
                                 _loc4_ = this.display3DHash.getValue(_loc5_);
                                 if(_loc4_ != null)
                                 {
                                    return [_loc4_];
                                 }
                              }
                              else
                              {
                                 return [_loc4_];
                              }
                           }
                           else
                           {
                              return [_loc2_];
                           }
                        }
                     }
                     else
                     {
                        if(rightUnitViewHash.array[int(_loc5_)])
                        {
                           return [rightUnitViewHash.array[int(_loc5_)]];
                        }
                        return [];
                     }
                  }
                  else
                  {
                     if(unitViewHash.array[int(_loc5_)])
                     {
                        return [unitViewHash.array[int(_loc5_)]];
                     }
                     return [];
                  }
               }
               else
               {
                  switch(int(_loc5_) - 1)
                  {
                     case 0:
                        return unitViewHash.array;
                     case 1:
                        return rightUnitViewHash.array;
                     case 2:
                        return unitViewHash.array.concat(rightUnitViewHash.array);
                  }
               }
            }
            else
            {
               _loc2_ = getUnitByNpcId(this.unitViewHash.array,int(_loc5_));
               if(_loc2_ == null)
               {
                  _loc2_ = getUnitByNpcId(this.rightUnitViewHash.array,int(_loc5_));
               }
               if(_loc2_ != null)
               {
                  return [_loc2_];
               }
            }
            return [];
         }
         if(param1 == "major")
         {
            return [major];
         }
         if(unitViewHash.getValue(param1))
         {
            return [unitViewHash.getValue(param1)];
         }
         if(rightUnitViewHash.getValue(param1))
         {
            return [rightUnitViewHash.getValue(param1)];
         }
         if(tempUnitHash.getValue(param1))
         {
            return [tempUnitHash.getValue(param1)];
         }
         return [];
      }
      
      protected function getUnitByNpcId(param1:Array, param2:int) : UnitView
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = param1.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            if(_loc3_.vo.npc_id == param2)
            {
               return _loc3_;
            }
            _loc5_++;
         }
         return null;
      }
      
      public function defTempUnit(param1:UnitView, param2:String) : void
      {
         this.tempUnitHash.put(param2,param1);
      }
      
      public function createTempUnitByNpcId(param1:int, param2:String, param3:String, param4:int, param5:int, param6:int) : UnitView
      {
         var _loc8_:UnitVo = new UnitVo();
         _loc8_.id = param2;
         _loc8_.npc_id = param1;
         _loc8_.hp_max = _loc8_.stcNpcVo.hp;
         _loc8_.hp = _loc8_.hp_max;
         _loc8_.isAttack = 1;
         _loc8_.name = param3;
         _loc8_.xy.x = param4;
         _loc8_.xy.y = param5;
         var _loc7_:UnitView = new UnitView(_loc8_,this.sceneLayer2D);
         sceneLayer3D.addChild(_loc7_.avatarBox);
         _loc7_.init();
         _loc7_.isTemp = true;
         tempUnitHash.put(param2,_loc7_);
         return _loc7_;
      }
      
      protected function createLeftUnitView() : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc1_:* = null;
         unitViewHash = new DictHash();
         var _loc3_:int = dgVo.unitHash.array.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = dgVo.unitHash.array[_loc4_];
            if(ClientConfig.firstBattle == 1)
            {
               _loc2_.rage = _loc2_.stcNpcVo.init_rage;
            }
            _loc2_.init(isBossBattle);
            _loc2_.xy.x = _loc2_.xy.x - 900;
            _loc2_.xy.x = _loc2_.xy.x + this.dunGeonBgLayer.configVo.initX;
            _loc1_ = new UnitView(_loc2_,this.sceneLayer2D);
            if(lightCtrl)
            {
               _loc1_.lightPicker = this.lightCtrl.lightPicker;
            }
            if(avatarLoadArr && _loc1_.isLoaded == false)
            {
               _loc1_.addEventListener("avatar_anim_all_complete",avatarAsset_onCpl);
               avatarLoadArr.push(_loc1_);
            }
            if(_loc2_.isMajor)
            {
               major = _loc1_;
            }
            sceneLayer3D.addChild(_loc1_.avatarBox);
            _loc1_.init();
            unitViewHash.put(_loc2_.id,_loc1_);
            _loc4_++;
         }
         if(this.dgUI)
         {
            this.dgUI.initLeftUnit(dgVo.unitHash.array);
         }
      }
      
      protected function getLeaveAllRightUnitVo() : Array
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:Array = [];
         if(this.dgVo && this.dgVo.stcStageVo && (this.dgVo.stcStageVo.kind == 2 || this.dgVo.stcStageVo.kind == 3 || this.dgVo.stcStageVo.kind == 1))
         {
            _loc2_ = dgVo.subSceneMax;
            _loc3_ = 1;
            while(_loc3_ < _loc2_)
            {
               _loc1_ = _loc1_.concat(createRightUnitVo(_loc3_));
               _loc3_++;
            }
         }
         return _loc1_;
      }
      
      protected function createRightUnitVo(param1:int) : Array
      {
         var _loc7_:int = 0;
         var _loc2_:int = 0;
         var _loc4_:* = null;
         var _loc3_:Array = [];
         var _loc5_:Array = dgVo.monsterIdArr(param1);
         var _loc6_:int = _loc5_.length;
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc2_ = _loc5_[_loc7_];
            if(_loc2_ != 0)
            {
               _loc4_ = new UnitVo();
               _loc4_.id = "right_" + rightCount;
               rightCount = Number(rightCount) + 1;
               _loc4_.npc_id = _loc2_;
               _loc4_.isAttack = 0;
               _loc4_.posId = _loc7_;
               _loc4_.hp_max = _loc4_.stcNpcVo.hp;
               _loc4_.hp = _loc4_.hp_max;
               initRightUnitPos(_loc4_,param1);
               _loc3_.push(_loc4_);
            }
            _loc7_++;
         }
         return _loc3_;
      }
      
      protected function initRightUnitPos(param1:UnitVo, param2:int) : void
      {
         param1.init(isBossBattle);
         if(!dgVo.isElevator)
         {
            param1.xy.x = param1.xy.x + dgVo.subSceneW * param2;
            param1.xy.x = param1.xy.x + 900;
         }
         else
         {
            param1.xy.x = param1.xy.x + 900;
         }
         param1.xy.x = param1.xy.x + this.dunGeonBgLayer.configVo.initX;
      }
      
      private function createRightUnitView(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc6_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(rightUnitViewHash)
         {
            trashUnitViewArr = trashUnitViewArr.concat(rightUnitViewHash.array);
            rightUnitViewHash = null;
         }
         rightUnitViewHash = new DictHash();
         if(EnvConfig.ins.useServer && ClientConfig.firstBattle != 1)
         {
            _loc2_ = PlayerModel.ins.rightTeam.array;
         }
         else
         {
            _loc2_ = createRightUnitVo(param1);
         }
         var _loc5_:int = _loc2_.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = _loc2_[_loc6_];
            initRightUnitPos(_loc3_,param1);
            _loc4_ = new UnitView(_loc3_,this.sceneLayer2D);
            if(avatarLoadArr && _loc4_.isLoaded == false)
            {
               _loc4_.addEventListener("avatar_anim_all_complete",avatarAsset_onCpl);
               avatarLoadArr.push(_loc4_);
            }
            if(lightCtrl)
            {
               _loc4_.lightPicker = this.lightCtrl.lightPicker;
            }
            _loc4_.anchorPoi = new Point(1500 * param1,0);
            sceneLayer3D.addChild(_loc4_.avatarBox);
            _loc4_.init();
            rightUnitViewHash.put(_loc3_.id,_loc4_);
            if(_loc3_.stcNpcVo.kind == 12)
            {
               _loc4_.visible = false;
            }
            _loc6_++;
         }
      }
      
      protected function check_showState2d(param1:UnitView, ... rest) : void
      {
         param1.switchState2d(false);
      }
      
      protected function disposeOldRightUnit(param1:UnitView, ... rest) : void
      {
         param1.dispose();
      }
      
      public function get cameraX() : int
      {
         return _cameraX;
      }
      
      public function set cameraX(param1:int) : void
      {
         _cameraX = param1;
         camera3d.x = _cameraX;
         validateBg();
         changeBgLookAtPoi();
      }
      
      public function get cameraY() : int
      {
         return _cameraY;
      }
      
      public function set cameraY(param1:int) : void
      {
         _cameraY = param1;
         camera3d.y = _cameraY;
         validateBg();
         changeBgLookAtPoi();
      }
      
      public function validateBg() : void
      {
         dunGeonBgLayer.x = camera3d.x;
         dunGeonBgLayer.updateLayersPositon(_cameraX,_cameraY);
      }
      
      private function changeBgLookAtPoi() : void
      {
      }
      
      public function get anchorPoi() : Point
      {
         return _anchorPoi;
      }
      
      public function set anchorPoi(param1:Point) : void
      {
         _anchorPoi = param1;
         this.fightLayer3D.x = _anchorPoi.x;
      }
      
      protected function start_load() : void
      {
         if(this.avatarLoadArr == null || this.avatarLoadArr.length == 0)
         {
            this.startLoadScript();
         }
         else
         {
            ObserverMgr.ins.sendNotice("LOADING_BAR_ADD_PROGRESS",new LoadingMsg(this.moduleId,0,1,LocaleMgr.ins.getStr(998001155)));
         }
      }
      
      protected function avatarAsset_onCpl(param1:Event) : void
      {
         var _loc2_:* = null;
         if(this.avatarLoadArr != null)
         {
            _loc2_ = param1.currentTarget as UnitView;
            ArrayUtil.removeItem(this.avatarLoadArr,_loc2_);
            ObserverMgr.ins.sendNotice("LOADING_BAR_ADD_PROGRESS",new LoadingMsg(this.moduleId,0,2,LocaleMgr.ins.getStr(998001155)));
            if(this.avatarLoadArr.length == 0)
            {
               avatarLoadArr = null;
               this.startLoadScript();
            }
         }
      }
      
      protected function startLoadScript() : void
      {
         ObserverMgr.ins.sendNotice("LOADING_BAR_ADD_PROGRESS",new LoadingMsg(this.moduleId,0,1,LocaleMgr.ins.getStr(999000621)));
         if(EnvConfig.ins.showScript && GlobalRef.skipAllScript == false && (ClientConfig.firstBattle == 1 || ChapterModel.ins.needPlayScript(!!this.dgVo.stcStageVo?this.dgVo.stcStageVo.id:int(this.dgVo.dungeonId))))
         {
            scriptLib = new ScriptLib(int(this.dgVo.scriptId),UrlLib.dgScript(int(this.dgVo.scriptId)));
         }
         else
         {
            scriptLib = new ScriptLib(0,null);
         }
         scriptLib.addCompleteHandler(this.scriptLoad_cpl).exec();
      }
      
      protected function scriptLoad_cpl() : void
      {
         preloadEff3D();
      }
      
      protected function preLoadEff2D() : void
      {
         ObserverMgr.ins.sendNotice("LOADING_BAR_ADD_PROGRESS",new LoadingMsg(this.moduleId,0,1,LocaleMgr.ins.getStr(999000622)));
      }
      
      private function preloadEff3D() : void
      {
         var _loc3_:* = null;
         var _loc7_:* = null;
         var _loc4_:* = null;
         if(ClientConfig.firstBattle == 1)
         {
            new GetRes3DTask(UrlLib.sceneImg3D(100,3,"jpg")).exec();
            FactoryUtil.preload3D(false,StcMgr.ins.getModelVo(90000),0,null,11);
         }
         TestTimerCount.ins.start();
         ObserverMgr.ins.sendNotice("LOADING_BAR_ADD_PROGRESS",new LoadingMsg(this.moduleId,0,1,StcLanguageConfig.ins.getLanguage(998001156)));
         var _loc2_:Array = [];
         var _loc6_:Array = [];
         var _loc9_:int = 0;
         var _loc8_:* = this.unitViewHash.array;
         for each(_loc3_ in this.unitViewHash.array)
         {
            _loc6_.push(_loc3_.vo);
         }
         var _loc11_:int = 0;
         var _loc10_:* = this.rightUnitViewHash.array;
         for each(_loc3_ in this.rightUnitViewHash.array)
         {
            _loc6_.push(_loc3_.vo);
         }
         _loc2_ = _loc2_.concat(FPUtil.getBattleEffectIdByVos(_loc6_));
         if(ClientConfig.firstBattle == 1)
         {
            _loc2_.push(13000);
            _loc7_ = DefindConsts.FIRST_BATTLE_DELAY_LOAD_EFFIDS(ClientConfig.createRoleSex);
            _loc2_ = ArrayUtil.differenceBetweenArrs(_loc2_,_loc7_);
         }
         var _loc5_:TaskPool = new TaskPool();
         var _loc13_:int = 0;
         var _loc12_:* = _loc2_;
         for each(var _loc1_ in _loc2_)
         {
            _loc4_ = StcMgr.ins.getSpecialEffectVo(_loc1_);
            _loc5_.addTask(new GetResEffect3DTask(UrlLib.e3d_particle(_loc4_.effect)).addCompleteHandler(preLoadEff3D_process));
         }
         if(GlobalRef.loadingModule)
         {
            preLoadEff3D_process_addTick = (GlobalRef.loadingModule.total - GlobalRef.loadingModule.progress) / _loc5_.totalCount;
         }
         _loc5_.addCompleteHandler(preloadEff3DCpl);
         _loc5_.stopWhenError = false;
         _loc5_.exec();
      }
      
      private function preLoadEff3D_process() : void
      {
         TestTimerCount.ins.add();
         ObserverMgr.ins.sendNotice("LOADING_BAR_ADD_PROGRESS",new LoadingMsg(this.moduleId,0,preLoadEff3D_process_addTick,StcLanguageConfig.ins.getLanguage(998001156)));
      }
      
      private function preloadEff3DCpl() : void
      {
         if(ClientConfig.firstBattle == 1)
         {
            ClientConfig.firstBattle_sub = 2;
         }
         this.preShowCpl();
      }
      
      override public function moduleFadeIn(param1:Number = 0) : void
      {
         this.moduleFadeInCpl();
      }
      
      private function initLight() : void
      {
      }
      
      protected function playBackSound() : void
      {
         if(dgVo.dungeonId == 0)
         {
            SoundMgr.ins.playBackSoundByStageId(DefindConsts.BATTLE_REPORT_SCENE_MAP_ID);
         }
         else
         {
            SoundMgr.ins.playBackSoundByStageId(dgVo.dungeonId);
         }
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         if(EnvConfig.ins.testAuthor == 991)
         {
            return;
         }
         this.loadBg();
         ngScriptPlayer = new NGScriptPlayer(this);
         toNextScene();
         this.playBackSound();
         if(ClientConfig.firstBattle == 1)
         {
            new DriverInfoChecker().check();
            delayPreloadEff3d();
         }
         else
         {
            delayLoadOther();
         }
      }
      
      private function delayPreloadEff3d() : void
      {
         var _loc1_:Array = DefindConsts.FIRST_BATTLE_DELAY_LOAD_EFFIDS(ClientConfig.createRoleSex);
         preloadEff3dIds(_loc1_,delayLoadOther);
      }
      
      private function delayLoadOther() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         preloadEff3Dother();
         preLoadEff2D();
         if(ClientConfig.firstBattle == 1)
         {
            new InitDelayFirstBattleTask().exec();
         }
      }
      
      private function preloadEff3Dother() : void
      {
         var _loc3_:Array = getLeaveAllRightUnitVo();
         var _loc5_:int = 0;
         var _loc4_:* = _loc3_;
         for each(var _loc1_ in _loc3_)
         {
            FactoryUtil.preload3D(false,_loc1_.body_stcModel3DVo,_loc1_.sex,FactoryUtil.weapon_ModelVos(_loc1_.npc_id),55,_loc1_.wing_stcModel3DVo);
         }
         var _loc2_:Array = FPUtil.getBattleEffectIdByVos(_loc3_);
         preloadEff3dIds(_loc2_,null);
      }
      
      private function preloadEff3dIds(param1:Array, param2:*) : void
      {
         var _loc4_:* = null;
         var _loc5_:TaskPool = new TaskPool();
         var _loc7_:int = 0;
         var _loc6_:* = param1;
         for each(var _loc3_ in param1)
         {
            _loc4_ = StcMgr.ins.getSpecialEffectVo(_loc3_);
            _loc5_.addTask(new GetResEffect3DTask(UrlLib.e3d_particle(_loc4_.effect)));
         }
         if(param2)
         {
            _loc5_.addCompleteHandler(param2);
         }
         _loc5_.stopWhenError = false;
         _loc5_.exec();
      }
      
      protected function checkAndInitBoss() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         if(this.isDisposed)
         {
            return;
         }
         var _loc1_:StcNpcGroupVo = this.dgVo.monsterGroupVo(this.currentSubSceneIndex);
         if(!_loc1_)
         {
            return;
         }
         if(_loc1_.kind == 2)
         {
            _loc3_ = this.rightUnitViewHash.array.length;
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
                  break;
               }
               _loc4_++;
            }
            if(bossSceneCtrl == null)
            {
               Log.fatal(this,"(第" + currentSubSceneIndex + "波 StcNpcGroupID:" + _loc1_.id + ")没有找到Boss npc");
            }
         }
      }
      
      protected function changeTex(param1:Boolean) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = this.unitViewHash.array.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.unitViewHash.array[_loc4_];
            if(_loc2_.vo.hp > 0)
            {
               _loc2_.changeTex(param1);
            }
            _loc4_++;
         }
      }
      
      protected function toNextScene() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         this.rightUnitViewHash.array.forEach(check_showState2d);
         checkAndInitBoss();
         if(bossSceneCtrl == null)
         {
            playScript(true,this.scriptStart_onCpl);
         }
         else
         {
            this.scriptStart_onCpl();
         }
      }
      
      protected function scriptStart_onCpl() : void
      {
         if(bossSceneCtrl == null)
         {
            oriCtrl = new UnitEnterOriCtrl(this);
            oriCtrl.addCompleteHandler(unitEnterOri_onCpl).exec();
         }
         else
         {
            dgUI.showBossHeader(this.bossSceneCtrl.bossView.vo);
            unitEnterOri_onCpl();
         }
      }
      
      public function get isBossBattle() : Boolean
      {
         return this.bossSceneCtrl != null;
      }
      
      public function playScript(param1:Boolean, param2:*) : void
      {
         var _loc3_:Array = scriptLib.getScript(ScriptConfigList.countDgScriptKey(this.currentSubSceneIndex,param1));
         if(_loc3_ && _loc3_.length && (_loc3_[0] as Array).length)
         {
            if(param1)
            {
               dgUI.timePaused = true;
            }
            dgUI.visible = false;
            scriptCtrl = new ScriptRunner(this,_loc3_,false);
            if(param2)
            {
               scriptCtrl.addCompleteHandler(param2);
            }
            scriptCtrl.exec();
         }
         else if(param2)
         {
            Handler.execute(param2);
         }
      }
      
      protected function unitEnterOri_onCpl() : void
      {
         this.switchLayer_sceneToFight();
         if(this.bossSceneCtrl)
         {
            this.bossSceneCtrl.addHandlers(bossSceneCtrl_cpl).exec();
         }
         else
         {
            bossSceneCtrl_cpl();
         }
      }
      
      protected function bossSceneCtrl_cpl() : void
      {
         dgUI.timePaused = false;
         this.createBattlePlayer();
      }
      
      protected function createBattlePlayer() : void
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
         this.dgUI.box_auto.visible = FuncOpenAutoCtrl.checkOpen(40256);
         this.battlePlayer.addEventListener("FIGHT_COMPLETE",fightPlayer_onCpl);
         this.battlePlayer.addEventListener("FIGHT_PLAYER_DIE",onFightPlayerDie);
         this.battlePlayer.addEventListener("FIGHT_NEW_TURN_BEGIN",onNewTurnBegin);
         this.dunGeonBgLayer.isBattling = true;
         this.battlePlayer.play();
      }
      
      protected function switchUnitAllActived(param1:Array, param2:Boolean) : void
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = param1.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            _loc3_.isActived = param2;
            _loc5_++;
         }
      }
      
      protected function onNewTurnBegin(param1:BattleEvent) : void
      {
         this.dgUI.turnCount = param1.data as int;
      }
      
      protected function onFightPlayerDie(param1:BattleEvent) : void
      {
         var _loc2_:* = null;
         var _loc7_:* = null;
         var _loc4_:* = null;
         Log.info(this,"Some one die");
         var _loc3_:UnitVo = param1.data as UnitVo;
         if(_loc3_.isAttack)
         {
            dgUI.leftAlive--;
         }
         var _loc6_:Array = dgVo.getUnitDropArr(_loc3_,currentSubSceneIndex);
         var _loc5_:int = _loc6_.length;
         if(_loc5_ > 0)
         {
            _loc2_ = rightUnitViewHash.getValue(_loc3_.id);
            if(_loc2_ == null)
            {
               return;
            }
            _loc7_ = _loc2_.avatarBox.scenePosition;
            _loc4_ = TransformUtil.stage3Dto2D(_loc7_,ModuleMgr.ins.topEffectLayer);
            createDrop(_loc4_.x,_loc4_.y,_loc6_);
         }
      }
      
      protected function createDrop(param1:int, param2:int, param3:Array) : void
      {
         var _loc4_:DropItemView = new DropItemView(param3,param1,param2,fightLayer3D,this.topLayer2D,this.dgUI);
         _loc4_.addEventListener("moveToEnd",dropView_onEnd);
         dropViewArr.push(_loc4_);
      }
      
      protected function dropView_onEnd(param1:Event) : void
      {
         if(this.isDisposed)
         {
            return;
         }
         var _loc2_:DropItemView = param1.currentTarget as DropItemView;
         _loc2_.removeEventListener("moveToEnd",dropView_onEnd);
         ArrayUtil.removeItem(dropViewArr,_loc2_);
      }
      
      protected function gainDropAll() : void
      {
         dropViewArr = [];
      }
      
      protected function fightPlayer_onCpl(param1:BattleEvent) : void
      {
         _lastStp = StagePhaseCheckReq(param1.data.req).stp;
         dgUI.timePaused = true;
         this.dunGeonBgLayer.isBattling = false;
         this.dgUI.box_auto.visible = false;
         if(this.bossSceneCtrl == null)
         {
            this.switchLayer_fightToScene();
         }
         dgUI.visible = false;
         disposeBattlePlayer();
         switchUnitAllActived(this.unitViewHash.array,true);
         switchUnitAllActived(this.rightUnitViewHash.array,true);
         fightPlayerCompHandler(param1);
      }
      
      protected function fightPlayerCompHandler(param1:BattleEvent) : void
      {
         var _loc2_:StagePhaseCheckReq = param1.data.req as StagePhaseCheckReq;
         if(ClientConfig.firstBattle == 1)
         {
            GlobalRef.firstBattleReqArr.push(_loc2_);
            nextScript(param1.data.bResult);
         }
         else if(EnvConfig.ins.useServer)
         {
            serverBattleCheck(_loc2_);
         }
         else
         {
            nextScript(param1.data.bResult);
         }
      }
      
      protected function nextScript(param1:int) : void
      {
         if(param1 == 1)
         {
            if(this.dgVo && EnvConfig.ins.useServer)
            {
               if(ClientConfig.firstBattle != 1)
               {
                  if(this.currentSubSceneIndex >= this.dgVo.subSceneMax - 1)
                  {
                     if(this.dgVo.stcStageVo && StringUtils.isNull(this.dgVo.stcStageVo.drama_script_4) == false)
                     {
                        if(ChapterModel.ins.nextId == dgVo.stcStageVo.id)
                        {
                           NGUtil.chapterCpl(int(this.dgVo.stcStageVo.drama_script_4));
                        }
                     }
                  }
               }
            }
            this.playScript(false,scriptEnd_onCpl);
         }
         else
         {
            this.showLossPanel();
         }
      }
      
      protected function serverBattleCheck(param1:StagePhaseCheckReq) : void
      {
         _clientRetForDebug = param1;
         ServerEngine.ins.send(8059,param1,reqServerBattleChk);
      }
      
      protected function reqServerBattleChk(param1:StagePhaseCheckRes) : void
      {
         var _loc3_:int = 0;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc6_:* = null;
         if(_clientRetForDebug.clientRet != param1.result)
         {
            _loc5_ = "";
            _loc4_ = GameObjectManager.Instance.debugActions;
            _loc3_ = 0;
            while(_loc3_ < _clientRetForDebug.stp.length)
            {
               _loc2_ = _clientRetForDebug.stp[_loc3_];
               _loc5_ = _loc5_ + ("{objId:" + _loc2_.objId + ",timePoint:" + _loc2_.timePoint + "},");
               _loc3_++;
            }
            _loc6_ = FPUtil.protoToBase64(_resForDebug) + "[seed]" + dgVo.battleRandom.join(",") + "[stp]" + _loc5_ + "[frame]\n" + _loc4_;
            new BattleLogger().send(_loc6_);
         }
         _lastSPCRArr.push(param1);
         _resForDebug = param1;
         PlayerModel.ins.resetTeam(param1.player);
         nextScript(param1.result);
      }
      
      protected function scriptEnd_onCpl() : void
      {
         if(this.currentSubSceneIndex < this.dgVo.subSceneMax - 1)
         {
            this.switchBtnNext(true);
            NGUtil.checkModuleShow(40254,this);
            TweenLite.delayedCall(2,onClk,[null]);
         }
         else
         {
            this.gainDropAll();
            this.showWinPanel();
         }
      }
      
      protected function showWinPanel() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         if(EnvConfig.ins.useServer)
         {
            if(ClientConfig.firstBattle == 1)
            {
               this.dgUI.visible = false;
               _loc2_ = new FightResultVO();
               _loc2_.star = 3;
               _loc2_.dropItems = this.dgVo.drops;
               _loc2_.gold = this.dgVo.dropGold;
               _loc2_.addExp = StcMgr.ins.getStageVo(this.dgVo.dungeonId).reward_exp;
               ModuleMgr.ins.showModule(40210,new BattleResultConfigVo(resultPage_clickHandler,battle_replay,open_statistic,_loc2_));
            }
            else
            {
               _loc1_ = new StageFightEndReq();
               _loc1_.stageId = dgVo.dungeonId;
               ServerEngine.ins.send(8054,_loc1_,serverCpl_stageFightEnd_battleRs);
            }
         }
      }
      
      protected function showLossPanel() : void
      {
         var _loc1_:* = null;
         if(EnvConfig.ins.useServer)
         {
            _loc1_ = new StageFightEndReq();
            _loc1_.stageId = dgVo.dungeonId;
            ServerEngine.ins.send(8054,_loc1_,serverCpl_stageFightEnd_battleRs);
         }
         else
         {
            ModuleMgr.ins.showModule(40220,new BattleResultConfigVo(resultPage_clickHandler,battle_replay,open_statistic));
         }
      }
      
      protected function serverCpl_stageFightEnd_battleRs(param1:StageFightEndRes) : void
      {
         var _loc2_:Number = NaN;
         _lastSFER = param1;
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
      
      protected function showResultModule(param1:FightResultVO, param2:Boolean) : void
      {
         if(param2)
         {
            ModuleMgr.ins.showModule(40210,new BattleResultConfigVo(resultPage_clickHandler,battle_replay,open_statistic,param1));
         }
         else
         {
            ModuleMgr.ins.showModule(40220,new BattleResultConfigVo(resultPage_clickHandler,battle_replay,open_statistic,param1));
         }
      }
      
      protected function open_statistic() : void
      {
         var _loc1_:* = null;
         var _loc2_:Array = [];
         var _loc4_:int = 0;
         var _loc3_:* = this.unitViewHash.array;
         for each(_loc1_ in this.unitViewHash.array)
         {
            _loc2_.push(_loc1_.vo);
         }
         var _loc6_:int = 0;
         var _loc5_:* = this.rightUnitViewHash.array;
         for each(_loc1_ in this.rightUnitViewHash.array)
         {
            _loc2_.push(_loc1_.vo);
         }
         ModuleMgr.ins.showModule(40221,_loc2_,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      protected function battle_replay() : void
      {
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc2_:* = undefined;
         var _loc1_:* = null;
         this.switchLayer_sceneToFight();
         var _loc3_:Array = _lastSPCRArr[_lastSPCRArr.length - 2].player;
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
         _loc5_.seeds = dgVo.battleRandom;
         _loc5_.isBoss = isBossBattle;
         _loc5_.playMode = 2;
         _loc5_.replayStp = _lastStp;
         if(this.dunGeonBgLayer && this.dunGeonBgLayer.configVo)
         {
            _loc5_.isDeadFall = this.dunGeonBgLayer.configVo.isDeadFall;
         }
         if(dgVo && this.currentSubSceneIndex < this.dgVo.subSceneMax - 1)
         {
            _loc5_.isWinAct = false;
         }
         battlePlayer = new BattlePlayer(_loc5_);
         this.dgUI.box_auto.visible = false;
         this.battlePlayer.addEventListener("FIGHT_COMPLETE",replay_comp);
         this.battlePlayer.addEventListener("FIGHT_PLAYER_DIE",onFightPlayerDie);
         this.battlePlayer.addEventListener("FIGHT_NEW_TURN_BEGIN",onNewTurnBegin);
         this.dunGeonBgLayer.isBattling = true;
         this.battlePlayer.play();
      }
      
      protected function replay_comp(param1:BattleEvent) : void
      {
         serverCpl_stageFightEnd_battleRs(_lastSFER);
      }
      
      protected function resultPage_clickHandler() : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      protected function leaveDungeon() : void
      {
         var _loc1_:StageFightEndReq = new StageFightEndReq();
         _loc1_.stageId = dgVo.dungeonId;
         ServerEngine.ins.send(8054,_loc1_,serverCpl_StageFightEnd);
      }
      
      protected function serverCpl_StageFightEnd(param1:StageFightEndRes) : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc5_:* = param1;
         if(dgUI.btn_speed !== _loc5_)
         {
            if(dgUI.btn_auto !== _loc5_)
            {
               if(dgUI.btn_return !== _loc5_)
               {
                  if(dgUI.btn_pause === _loc5_)
                  {
                     this.toPause();
                  }
               }
               else
               {
                  this.battlePlayer.finishImmediately();
               }
            }
            else
            {
               if(EnvConfig.ins.showDevModule && param2.altKey)
               {
                  this.battlePlayer.finishImmediately();
               }
               else
               {
                  GameObjectManager.Instance.autoFire = !GameObjectManager.Instance.autoFire;
                  check_btn_auto_state();
               }
               if(_taskAlertRender)
               {
                  _taskAlertRender.dispose();
                  _taskAlertRender = null;
                  GlobalRef.needShowAutoAlert = false;
               }
            }
         }
         else
         {
            _loc4_ = GameObjectManager.Instance.speedType;
            _loc3_ = FPConsts.speed_label.length;
            _loc4_ = (_loc4_ + 1) % _loc3_;
            GameObjectManager.Instance.speedType = _loc4_;
            dgUI.btn_speed.selected = _loc4_ == 1;
            if(_taskAlertRender)
            {
               _taskAlertRender.dispose();
               _taskAlertRender = null;
               GlobalRef.needShowAutoAlert = false;
            }
         }
      }
      
      protected function toPause() : void
      {
         if(battlePlayer)
         {
            battlePlayer.pause(true);
         }
         AlertUtil.comfirm(LocaleMgr.ins.getStr(40200007),pauseHandlerYes,pauseHanderNo);
      }
      
      protected function check_btn_auto_state() : void
      {
         dgUI.btn_auto.selected = GameObjectManager.Instance.autoFire;
      }
      
      protected function pauseHandlerYes() : void
      {
         resultPage_clickHandler();
      }
      
      protected function pauseHanderNo() : void
      {
         if(battlePlayer)
         {
            battlePlayer.pause(false);
         }
      }
      
      protected function btn_next_area_click() : void
      {
         this.dgUI.visible = false;
         this.gainDropAll();
         this.rightUnitViewHash.array.forEach(disposeOldRightUnit);
         currentSubSceneIndex = Number(currentSubSceneIndex) + 1;
         this.createRightUnitView(this.currentSubSceneIndex);
         if(!this.dgVo.isElevator)
         {
            this.anchorPoi = new Point(currentSubSceneIndex * dgVo.subSceneW + this.dunGeonBgLayer.configVo.initX,0);
         }
         switchBtnNext(false);
         this.toNextScene();
      }
      
      public function eachUnit_validateXY(param1:UnitView, ... rest) : void
      {
         param1.validateXY();
      }
      
      public function eachUnit_onOri(param1:UnitView, param2:int, param3:Array) : void
      {
         param1.onFree();
         param1.vo.xy = param1.vo.oriXY;
         param1.validateXY();
      }
      
      public function eachUnit_onFree(param1:UnitView, param2:int, param3:Array) : void
      {
         param1.onFree();
      }
      
      public function eachUnit_dispose(param1:UnitView, ... rest) : void
      {
         param1.dispose();
      }
      
      public function switchLayer_sceneToFight() : void
      {
         useFightLayer = true;
         unitViewHash.array.forEach(this.each_switchLayer_sceneToFight);
         rightUnitViewHash.array.forEach(this.each_switchLayer_sceneToFight);
      }
      
      protected function each_switchLayer_sceneToFight(param1:UnitView, ... rest) : void
      {
         if(param1.avatarBox.parent == fightLayer3D)
         {
            return;
         }
         fightLayer3D.addChild(param1.avatarBox);
         param1.vo.xy.x = param1.vo.xy.x - fightLayer3D.x;
         param1.vo.xy.y = param1.vo.xy.y - fightLayer3D.y;
         param1.anchorPoi = null;
         param1.validateXY();
      }
      
      public function switchLayer_fightToScene() : void
      {
         useFightLayer = false;
         unitViewHash.array.forEach(this.each_switchLayer_fightToScene);
         rightUnitViewHash.array.forEach(this.each_switchLayer_fightToScene);
      }
      
      public function each_switchLayer_fightToScene(param1:UnitView, ... rest) : void
      {
         if(param1.avatarBox.parent == sceneLayer3D)
         {
            return;
         }
         sceneLayer3D.addChild(param1.avatarBox);
         param1.vo.xy.x = param1.vo.xy.x + fightLayer3D.x;
         param1.vo.xy.y = param1.vo.xy.y + fightLayer3D.y;
         param1.anchorPoi = anchorPoi.clone();
         param1.validateXY();
      }
      
      public function switchBtnNext(param1:Boolean) : void
      {
         if(!mc_go)
         {
            return;
         }
         this.mc_go.visible = param1 && this.currentSubSceneIndex < this.dgVo.subSceneMax - 1;
         if(this.mc_go.visible)
         {
            if(!hotSprite)
            {
               hotSprite = new Sprite();
               hotSprite.graphics.beginFill(16711680,0);
               hotSprite.graphics.drawRect(0,0,ClientConfig.SCENE_FIXED_W,ClientConfig.SCENE_FIXED_H);
               hotSprite.graphics.endFill();
               hotSprite.addEventListener("click",onClk);
               hotSprite.buttonMode = true;
            }
            addChild(hotSprite);
         }
      }
      
      protected function onClk(param1:MouseEvent) : void
      {
         if(param1 && param1.altKey && EnvConfig.ins.showDebugModule)
         {
            this.hotSprite.visible = false;
            return;
         }
         TweenLite.killDelayedCallsTo(onClk);
         if(mc_go)
         {
            this.mc_go.dispatchEvent(new MouseEvent("click"));
         }
         this.dgUI.turnCount = 0;
         dgUI.setboNext();
         DisplayUtils.removeSelf(hotSprite);
         btn_next_area_click();
      }
      
      protected function removeListeners() : void
      {
      }
      
      public function addDisplay2D(param1:String, param2:DisplayObject) : void
      {
         this.topLayer2D.addChild(param2);
         this.display2DHash.put(param1,param2);
      }
      
      public function getDisplay2DById(param1:String) : DisplayObject
      {
         return this.display2DHash.getValue(param1) as DisplayObject;
      }
      
      public function deleteDisplay2D(param1:String) : void
      {
         if(param1.indexOf(":") != -1)
         {
            param1 = param1.split(":").pop();
         }
         var _loc2_:DisplayObject = this.display2DHash.getValue(param1) as DisplayObject;
         if(_loc2_)
         {
            if(_loc2_ is MovieClip)
            {
               (_loc2_ as MovieClip).stop();
            }
            DisplayUtils.removeSelf(_loc2_);
            this.display2DHash.remove(param1);
         }
      }
      
      public function addDisplay3D(param1:String, param2:String, param3:ObjectContainer3D = null) : ScriptCmdEffect3DView
      {
         if(param3 == null)
         {
            param3 = this.sceneLayer3D;
         }
         var _loc4_:ScriptCmdEffect3DView = new ScriptCmdEffect3DView(param2,param3);
         this.display3DHash.put(param1,_loc4_);
         return _loc4_;
      }
      
      public function getDisplay3DById(param1:String) : ScriptCmdEffect3DView
      {
         return this.display3DHash.getValue(param1) as ScriptCmdEffect3DView;
      }
      
      public function deleteDisplay3D(param1:String) : void
      {
         if(param1.indexOf(":") != -1)
         {
            param1 = param1.split(":").pop();
         }
         var _loc2_:ScriptCmdEffect3DView = this.display3DHash.getValue(param1) as ScriptCmdEffect3DView;
         if(_loc2_)
         {
            _loc2_.dispose();
            this.display3DHash.remove(param1);
         }
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            if(this.stage)
            {
               this.stage.addEventListener("click",stage_onClick);
            }
         }
         else
         {
            if(this.stage)
            {
               this.stage.removeEventListener("click",stage_onClick);
            }
            SceneModel.ins.removeEventListener("modelServerCplPrefix" + 8003,model_enterScene);
         }
      }
      
      override protected function resetPosition() : void
      {
         super.resetPosition();
         if(dgUI)
         {
            dgUI.width = this.width;
            dgUI.height = UIMgr.gameHeight;
            fightLayer3D.x = anchorPoi.x;
         }
      }
      
      protected function disposeBattlePlayer() : void
      {
         if(this.battlePlayer)
         {
            this.battlePlayer.removeEventListener("FIGHT_COMPLETE",fightPlayer_onCpl);
            this.battlePlayer.removeEventListener("FIGHT_COMPLETE",replay_comp);
            this.battlePlayer.removeEventListener("FIGHT_PLAYER_DIE",onFightPlayerDie);
            this.battlePlayer.removeEventListener("FIGHT_NEW_TURN_BEGIN",onNewTurnBegin);
            this.battlePlayer.dispose();
            this.battlePlayer = null;
         }
      }
      
      override public function preClose(param1:Object = null) : void
      {
         super.preClose(param1);
      }
      
      override public function dispose() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc1_:* = null;
         if(isDisposed)
         {
            return;
         }
         if(mc_go)
         {
            mc_go.dispose();
            mc_go = null;
         }
         if(this.ngScriptPlayer)
         {
            this.ngScriptPlayer.dispose();
            this.ngScriptPlayer = null;
         }
         disposeBattlePlayer();
         if(this.dunGeonBgLayer)
         {
            dunGeonBgLayer.dispose();
            dunGeonBgLayer = null;
         }
         if(scriptCtrl)
         {
            scriptCtrl.dispose();
            scriptCtrl = null;
         }
         if(oriCtrl)
         {
            oriCtrl.dispose();
            oriCtrl = null;
         }
         if(this.bossSceneCtrl)
         {
            this.bossSceneCtrl.dispose();
            this.bossSceneCtrl = null;
         }
         dropViewArr = null;
         if(unitViewHash)
         {
            unitViewHash.array.forEach(eachUnit_dispose);
            unitViewHash = null;
         }
         if(rightUnitViewHash)
         {
            rightUnitViewHash.array.forEach(eachUnit_dispose);
            rightUnitViewHash = null;
         }
         if(trashUnitViewArr)
         {
            trashUnitViewArr.forEach(eachUnit_dispose);
            trashUnitViewArr = null;
         }
         if(this.display2DHash)
         {
            _loc3_ = this.display2DHash.array.length;
            _loc4_ = _loc3_ - 1;
            while(_loc4_ >= 0)
            {
               _loc2_ = this.display2DHash.array[_loc4_];
               if(_loc2_)
               {
                  if(_loc2_ is MovieClip)
                  {
                     (_loc2_ as MovieClip).stop();
                  }
                  DisplayUtils.removeSelf(_loc2_);
               }
               _loc4_--;
            }
            display2DHash.clear();
            display2DHash = null;
         }
         if(this.display3DHash)
         {
            _loc3_ = this.display3DHash.array.length;
            _loc4_ = _loc3_ - 1;
            while(_loc4_ >= 0)
            {
               _loc1_ = this.display3DHash.array[_loc4_];
               _loc1_.dispose();
               _loc4_--;
            }
            display3DHash.clear();
            display3DHash = null;
         }
         if(this.layer3d)
         {
            this.layer3d.dispose();
            layer3d = null;
         }
         GlobalRef.isInBattleModule = false;
         super.dispose();
      }
      
      override public function getFocusNotices() : Array
      {
         return ["MSG_GM_CMD","msg_add_debug_avatar","msg_hide_dg_ui"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:* = param1;
         if("MSG_GM_CMD" !== _loc4_)
         {
            if("msg_add_debug_avatar" !== _loc4_)
            {
               if("msg_hide_dg_ui" === _loc4_)
               {
                  _loc3_ = param2 as Boolean;
                  UIMgr.layer2D.visible = _loc3_;
               }
            }
            else
            {
               this.sceneLayer3D.addChild(param2 as ObjectContainer3D);
            }
         }
         else
         {
            _loc4_ = param2[0];
            if("p" !== _loc4_)
            {
               if("s" === _loc4_)
               {
                  if(this.battlePlayer)
                  {
                     this.battlePlayer.finishImmediately();
                  }
               }
            }
            else
            {
               pauseHandlerYes();
            }
         }
      }
      
      public function getCompById(param1:String, param2:StcGuideVo) : Component
      {
         var _loc3_:* = param1;
         if("img_rim" === _loc3_)
         {
            this.dgUI.battleHeadPortrait.list_headPortrait;
         }
         return NGUtil.getCompById(this,param1,param2);
      }
   }
}
