package nslm2.modules.battles.sceneBases
{
   import morn.customs.components.FadeView;
   import away3d.containers.ObjectContainer3D;
   import nslm2.modules.battles.battle.BattlePlayer;
   import com.mz.core.utils.DictHash;
   import flash.events.MouseEvent;
   import nslm2.modules.dungeons.ctrls.BattlePlayQualityUtil;
   import morn.core.components.Button;
   import nslm2.modules.battles.battle.GameObjectManager;
   import nslm2.modules.fightPlayer.FPConsts;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.battles.battle.BattleEvent;
   import away3d.cameras.Camera3D;
   import org.specter3d.context.AppGlobalContext;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.utils.TransformUtil;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.battles.battle.skillConfig.SkillConfig;
   import nslm2.modules.fightPlayer.UnitVo;
   import nslm2.modules.fightPlayer.UnitView;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.common.ui.components.debug3d.Object3DParams;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.loadingModules.LoadingMsg;
   import nslm2.common.configs.StcLanguageConfig;
   import flash.events.Event;
   import com.mz.core.utils.ArrayUtil;
   import com.greensock.TweenLite;
   import nslm2.common.scene.multiLayer.DungeonMultilayerBg;
   import nslm2.modules.dungeons.DungeonVo;
   import morn.core.components.Box;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.utils.Effect3DUtils;
   import org.specter3d.display.particle.SpecterEffect;
   import com.mz.core.utils2.ShakeUtil;
   import nslm2.modules.battles.battle.FPUtil;
   import com.mz.core.utils2.task.TaskPool;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSpecialEffectVo;
   import com.mz.core.mgrs.resMgrs.GetResEffect3DTask;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.common.globals.GlobalRef;
   import morn.customs.tests.TestTimerCount;
   import nslm2.mgrs.SoundMgr;
   import nslm2.modules.battles.battle.BattleStartVo;
   import proto.StagePhaseCheckReq;
   import morn.core.components.VBox;
   import morn.core.components.HBox;
   
   public class BattleSceneBase extends FadeView
   {
      
      public static const PRE_LOAD_CPL:String = "preloadCpl";
       
      
      private var unitVoArr:Array;
      
      private var rightUnitVoArr:Array;
      
      public var ui2D:nslm2.modules.battles.sceneBases.BattleScene;
      
      private var layer3D:ObjectContainer3D;
      
      private var fightLayer3D:ObjectContainer3D;
      
      private var battlePlayer:BattlePlayer;
      
      private var unitViewHash:DictHash;
      
      public var rightUnitViewHash:DictHash;
      
      public var configVo:nslm2.modules.battles.sceneBases.BattleSceneConfigVo;
      
      private var avatarLoadArr:Vector.<UnitView>;
      
      private var dunGeonBgLayer:DungeonMultilayerBg;
      
      private var debugBox0:Box;
      
      private var debugBox1:Box;
      
      private var debugBox2:Box;
      
      private var debugBox3:Box;
      
      private var bossUnitView:UnitView;
      
      private var preLoadEff3D_process_addTick:Number = 2;
      
      private var _lastStp:Array;
      
      public function BattleSceneBase()
      {
         debugBox0 = new VBox();
         debugBox1 = new HBox();
         debugBox2 = new HBox();
         debugBox3 = new HBox();
         super();
         MornExpandUtil.setLayout(this);
         GlobalRef.isInBattleModule = true;
      }
      
      private function txt_quality_click(param1:MouseEvent) : void
      {
         BattlePlayQualityUtil.switchPlayQuality();
         BattlePlayQualityUtil.switchBattlePlayQuality_hash(unitViewHash);
         BattlePlayQualityUtil.switchBattlePlayQuality_hash(rightUnitViewHash);
      }
      
      private function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc5_:* = param1;
         if(ui2D.btn_speed !== _loc5_)
         {
            if(ui2D.btn_pause !== _loc5_)
            {
               if(ui2D.btn_auto === _loc5_)
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
               }
            }
            else
            {
               if(battlePlayer)
               {
                  battlePlayer.pause(true);
               }
               AlertUtil.comfirm(LocaleMgr.ins.getStr(40200007),pauseHandlerYes,pauseHanderNo);
            }
         }
         else
         {
            _loc4_ = GameObjectManager.Instance.speedType;
            _loc3_ = FPConsts.speed_label.length;
            _loc4_ = (_loc4_ + 1) % _loc3_;
            GameObjectManager.Instance.speedType = _loc4_;
            ui2D.btn_speed.selected = _loc4_ == 1;
         }
      }
      
      public function getLeftRightUnitVo() : Array
      {
         return unitVoArr.concat(this.rightUnitVoArr);
      }
      
      protected function check_btn_auto_state() : void
      {
         ui2D.btn_auto.selected = GameObjectManager.Instance.autoFire;
      }
      
      protected function pauseHandlerYes() : void
      {
         disposeBattlePlayer();
         this.dispatchEvent(new BattleEvent("FIGHT_ABORT"));
      }
      
      protected function pauseHanderNo() : void
      {
         if(battlePlayer)
         {
            battlePlayer.pause(false);
         }
      }
      
      public function finishImmediately() : void
      {
         this.battlePlayer.finishImmediately();
      }
      
      public function get camera3d() : Camera3D
      {
         return AppGlobalContext.stage3d.camera3d;
      }
      
      public function initScene(param1:nslm2.modules.battles.sceneBases.BattleSceneConfigVo) : void
      {
         this.configVo = param1;
         createBgByMapId(configVo.mapId,configVo.mapConfigId,init);
      }
      
      private function init() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         ui2D = new nslm2.modules.battles.sceneBases.BattleScene();
         this.addChild(ui2D);
         ui2D.visible = false;
         MornExpandUtil.setLayout(ui2D);
         if(this.configVo.isBossScene)
         {
            TransformUtil.cameraToBattlePerspective2();
         }
         else
         {
            TransformUtil.cameraToBattlePerspective1();
         }
         layer3D = new ObjectContainer3D();
         fightLayer3D = new ObjectContainer3D();
         if(this.configVo.isBossScene)
         {
            fightLayer3D.rotationY = 0;
         }
         else
         {
            fightLayer3D.rotationY = 0;
         }
         layer3D.addChild(fightLayer3D);
         UIMgr.root3D.addChild(layer3D);
         PlayerModel.ins.createTeam(configVo.spArr);
         SkillConfig.intConfig();
         unitVoArr = PlayerModel.ins.team.array;
         var _loc2_:int = unitVoArr.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = unitVoArr[_loc3_];
            _loc1_.init(this.configVo.isBossScene);
            _loc3_++;
         }
         rightUnitVoArr = PlayerModel.ins.rightTeam.array;
         _loc2_ = rightUnitVoArr.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = rightUnitVoArr[_loc3_];
            _loc1_.init(this.configVo.isBossScene);
            _loc3_++;
         }
         ui2D.battleHeadPortrait.show(unitVoArr);
         this.avatarLoadArr = new Vector.<UnitView>();
         this.initLeftUnitViewArr();
         this.initRightUnitViewArr();
         MornExpandUtil.addHandlerForBtnAll(ui2D,btn_handler);
         check_btn_auto_state();
         this.start_load();
         ui2D.box_speed.visible = FuncOpenAutoCtrl.checkOpen(40257);
         ui2D.btn_speed.selected = GameObjectManager.Instance.speedType == 1;
         BattlePlayQualityUtil.validatePlayQuality();
      }
      
      public function reStart() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = unitVoArr;
         for each(var _loc1_ in unitVoArr)
         {
            _loc1_.hp = _loc1_.hp_max;
            _loc1_.rage = 0;
         }
         var _loc5_:int = 0;
         var _loc4_:* = this.rightUnitVoArr;
         for each(_loc1_ in this.rightUnitVoArr)
         {
            _loc1_.hp = _loc1_.hp_max;
            _loc1_.rage = 0;
         }
         this.disposeRighUnitView();
         this.initRightUnitViewArr();
         this.start_load();
      }
      
      private function initLeftUnitViewArr() : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc1_:* = null;
         unitViewHash = new DictHash();
         var _loc3_:int = unitVoArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = unitVoArr[_loc4_];
            _loc1_ = new UnitView(_loc2_,this);
            if(avatarLoadArr && _loc1_.isLoaded == false)
            {
               _loc1_.addEventListener("avatar_anim_all_complete",avatarAsset_onCpl);
               avatarLoadArr.push(_loc1_);
            }
            this.fightLayer3D.addChild(_loc1_.avatarBox);
            _loc1_.init();
            _loc1_.action = "std_2";
            unitViewHash.put(_loc2_.id,_loc1_);
            _loc4_++;
         }
         BattlePlayQualityUtil.switchBattlePlayQuality_hash(unitViewHash);
      }
      
      private function initRightUnitViewArr() : void
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc1_:* = null;
         var _loc4_:* = null;
         rightUnitViewHash = new DictHash();
         var _loc3_:int = rightUnitVoArr.length;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc2_ = rightUnitVoArr[_loc5_];
            _loc1_ = new UnitView(_loc2_,this);
            if(EnvConfig.ins.showDebugModule)
            {
               _loc4_ = new Object3DParams("unit R");
               _loc4_.bind(_loc1_.avatarBox);
               debugBox3.addChild(_loc4_);
            }
            if(avatarLoadArr && _loc1_.isLoaded == false)
            {
               _loc1_.addEventListener("avatar_anim_all_complete",avatarAsset_onCpl);
               avatarLoadArr.push(_loc1_);
            }
            this.fightLayer3D.addChild(_loc1_.avatarBox);
            _loc1_.init();
            if(_loc2_.stcNpcVo.kind == 12)
            {
               _loc1_.avatarBox.y = 1500;
               _loc1_.action = "std_2";
               this.bossUnitView = _loc1_;
            }
            else
            {
               _loc1_.action = "std_2";
            }
            rightUnitViewHash.put(_loc2_.id,_loc1_);
            _loc5_++;
         }
         BattlePlayQualityUtil.switchBattlePlayQuality_hash(rightUnitViewHash);
      }
      
      protected function start_load() : void
      {
         if(this.avatarLoadArr == null || this.avatarLoadArr.length == 0)
         {
            this.loadAvatarCpl();
         }
         else
         {
            ObserverMgr.ins.sendNotice("LOADING_BAR_ADD_PROGRESS",new LoadingMsg(configVo.moduleId,0,1,StcLanguageConfig.ins.getLanguage(998001155)));
         }
      }
      
      private function avatarAsset_onCpl(param1:Event) : void
      {
         var _loc2_:* = null;
         if(this.avatarLoadArr != null)
         {
            _loc2_ = param1.currentTarget as UnitView;
            ArrayUtil.removeItem(this.avatarLoadArr,_loc2_);
            ObserverMgr.ins.sendNotice("LOADING_BAR_ADD_PROGRESS",new LoadingMsg(configVo.moduleId,0,2,StcLanguageConfig.ins.getLanguage(998001155)));
            if(this.avatarLoadArr.length == 0)
            {
               avatarLoadArr = null;
               this.loadAvatarCpl();
            }
         }
      }
      
      private function loadAvatarCpl() : void
      {
         preloadEff3D();
      }
      
      private function start() : void
      {
         if(!EnvConfig.ins.showDebugModule)
         {
         }
         if(bossUnitView)
         {
            TweenLite.delayedCall(0.3,this.playBossFadeInEff);
            TweenLite.to(bossUnitView.avatarBox,0.5,{
               "y":0,
               "onComplete":preloadEff3D
            });
         }
         else
         {
            this.preloadEff3D();
         }
      }
      
      protected function createBgByMapId(param1:int, param2:int, param3:*) : void
      {
         dunGeonBgLayer = new DungeonMultilayerBg();
         var _loc4_:DungeonVo = new DungeonVo(configVo.stageId);
         _loc4_.checkIsBossScene = true;
         dunGeonBgLayer.dungeonVO = _loc4_;
         dunGeonBgLayer.mapId = param1;
         dunGeonBgLayer.mapConfigId = param2;
         dunGeonBgLayer.init(param3);
      }
      
      protected function loadBg() : void
      {
         dunGeonBgLayer.createBgLayer();
         layer3D.addChild(dunGeonBgLayer);
         if(this.configVo.isBossScene)
         {
            dunGeonBgLayer.switchLayerKind(3);
            validateBgBox(true);
         }
         else
         {
            validateBgBox();
         }
      }
      
      public function validateBgBox(param1:Boolean = false) : void
      {
         dunGeonBgLayer.synchroCamera(AppGlobalContext.stage3d.camera3d,param1);
      }
      
      private function createDebug() : void
      {
         var _loc1_:* = null;
         this.addChild(debugBox0);
         debugBox0.addChild(debugBox3);
         _loc1_ = new Object3DParams("camera");
         _loc1_.bind(AppGlobalContext.stage3d.view3d.camera);
         debugBox1.addChild(_loc1_);
         _loc1_ = new Object3DParams("fightLayer3D");
         _loc1_.bind(fightLayer3D);
         debugBox1.addChild(_loc1_);
         debugBox0.right = 0;
         debugBox0.top = 25;
      }
      
      public function playBossFadeInEff() : void
      {
         var _loc1_:SpecterEffect = EffectManager.createEffect(Effect3DUtils.getUrlBySid(13000),true,bossUnitView.avatarBox);
         _loc1_.scaleAll = 1.6;
         ShakeUtil.shake(false,this.layer3D,0,8,16,50);
         ShakeUtil.shake(true,UIMgr.layer2D,0,8,16,50);
      }
      
      private function preloadEff3D() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         ObserverMgr.ins.sendNotice("LOADING_BAR_ADD_PROGRESS",new LoadingMsg(configVo.moduleId,0,0,StcLanguageConfig.ins.getLanguage(998001156)));
         var _loc5_:Array = [];
         var _loc8_:int = 0;
         var _loc7_:* = this.unitViewHash.array;
         for each(_loc1_ in this.unitViewHash.array)
         {
            _loc5_.push(_loc1_.vo);
         }
         var _loc10_:int = 0;
         var _loc9_:* = this.rightUnitViewHash.array;
         for each(_loc1_ in this.rightUnitViewHash.array)
         {
            _loc5_.push(_loc1_.vo);
         }
         var _loc4_:Array = FPUtil.getBattleEffectIdByVos(_loc5_);
         var _loc3_:TaskPool = new TaskPool();
         var _loc12_:int = 0;
         var _loc11_:* = _loc4_;
         for each(var _loc6_ in _loc4_)
         {
            _loc2_ = StcMgr.ins.getSpecialEffectVo(_loc6_);
            _loc3_.addTask(new GetResEffect3DTask(UrlLib.e3d_particle(_loc2_.effect)).addCompleteHandler(preLoadEff3D_process));
         }
         if(GlobalRef.loadingModule)
         {
            preLoadEff3D_process_addTick = (GlobalRef.loadingModule.total - GlobalRef.loadingModule.progress) / _loc3_.totalCount;
         }
         _loc3_.addCompleteHandler(preloadEff3DCpl);
         _loc3_.stopWhenError = false;
         _loc3_.exec();
      }
      
      private function preLoadEff3D_process() : void
      {
         TestTimerCount.ins.add();
         ObserverMgr.ins.sendNotice("LOADING_BAR_ADD_PROGRESS",new LoadingMsg(configVo.moduleId,0,preLoadEff3D_process_addTick,LocaleMgr.ins.getStr(998001156)));
      }
      
      private function preloadEff3DCpl() : void
      {
         this.dispatchEvent(new Event("preloadCpl"));
      }
      
      public function show() : void
      {
         SoundMgr.ins.playBackSoundByStageId(configVo.mapId);
         loadBg();
         disposeBattlePlayer();
         switchUnitAllActived(this.unitViewHash.array,false);
         switchUnitAllActived(this.rightUnitViewHash.array,false);
         var _loc1_:BattleStartVo = new BattleStartVo();
         _loc1_.container = this.fightLayer3D;
         _loc1_.unitViews = this.unitViewHash.merge(this.rightUnitViewHash);
         _loc1_.heads = this.ui2D.battleHeadPortrait;
         _loc1_.maps = this.dunGeonBgLayer;
         _loc1_.seeds = this.configVo.battleRandom;
         battlePlayer = new BattlePlayer(_loc1_);
         this.battlePlayer.addEventListener("FIGHT_COMPLETE",fightPlayer_onCpl);
         this.battlePlayer.addEventListener("FIGHT_NEW_TURN_BEGIN",onNewTurnBegin);
         this.battlePlayer.addEventListener("FIGHT_DEFENDER_GET_DAMAGE",onNewGetDamage);
         this.battlePlayer.play();
      }
      
      private function disposeBattlePlayer() : void
      {
         if(this.battlePlayer != null)
         {
            this.battlePlayer.removeEventListener("FIGHT_COMPLETE",fightPlayer_onCpl);
            this.battlePlayer.removeEventListener("FIGHT_NEW_TURN_BEGIN",onNewTurnBegin);
            this.battlePlayer.removeEventListener("FIGHT_DEFENDER_GET_DAMAGE",onNewGetDamage);
            this.battlePlayer.dispose();
            this.battlePlayer = null;
         }
      }
      
      private function switchUnitAllActived(param1:Array, param2:Boolean) : void
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
      
      public function replay() : void
      {
         var _loc4_:* = null;
         var _loc7_:* = null;
         var _loc6_:int = 0;
         var _loc2_:* = undefined;
         var _loc1_:* = null;
         var _loc3_:Array = configVo.spArr;
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
         _loc5_.heads = this.ui2D.battleHeadPortrait;
         _loc5_.maps = this.dunGeonBgLayer;
         _loc5_.seeds = this.configVo.battleRandom;
         _loc5_.playMode = 2;
         _loc5_.replayStp = _lastStp;
         if(this.dunGeonBgLayer && this.dunGeonBgLayer.configVo)
         {
            _loc5_.isDeadFall = this.dunGeonBgLayer.configVo.isDeadFall;
         }
         battlePlayer = new BattlePlayer(_loc5_);
         this.ui2D.box_auto.visible = false;
         this.battlePlayer.addEventListener("FIGHT_COMPLETE",replay_comp);
         this.battlePlayer.addEventListener("FIGHT_NEW_TURN_BEGIN",onNewTurnBegin);
         this.dunGeonBgLayer.isBattling = true;
         this.battlePlayer.play();
      }
      
      protected function replay_comp(param1:BattleEvent) : void
      {
         this.dispatchEvent(new BattleEvent("FIGHT_REPLAY_COMPLETE",param1.data));
      }
      
      protected function fightPlayer_onCpl(param1:BattleEvent) : void
      {
         var _loc2_:StagePhaseCheckReq = param1.data.req as StagePhaseCheckReq;
         _lastStp = _loc2_.stp;
         switchUnitAllActived(this.unitViewHash.array,true);
         switchUnitAllActived(this.rightUnitViewHash.array,true);
         this.dispatchEvent(param1);
      }
      
      protected function onNewTurnBegin(param1:BattleEvent) : void
      {
         this.ui2D.turnCount = param1.data as int;
         this.dispatchEvent(param1);
      }
      
      protected function onNewGetDamage(param1:BattleEvent) : void
      {
         this.dispatchEvent(param1);
      }
      
      private function disposeLeftUnitView() : void
      {
         if(unitViewHash)
         {
            unitViewHash.array.forEach(eachUnit_dispose);
            unitViewHash = null;
         }
      }
      
      private function disposeRighUnitView() : void
      {
         if(rightUnitViewHash)
         {
            rightUnitViewHash.array.forEach(eachUnit_dispose);
            rightUnitViewHash = null;
         }
      }
      
      public function eachUnit_dispose(param1:UnitView, ... rest) : void
      {
         param1.dispose();
      }
      
      override public function dispose() : void
      {
         if(this.dunGeonBgLayer)
         {
            dunGeonBgLayer.dispose();
            dunGeonBgLayer = null;
         }
         disposeBattlePlayer();
         disposeLeftUnitView();
         disposeRighUnitView();
         this.layer3D.dispose();
         GlobalRef.isInBattleModule = false;
         super.dispose();
      }
   }
}
