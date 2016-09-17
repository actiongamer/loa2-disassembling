package nslm2.modules.fightPlayer
{
   import morn.customs.components.SceneModuleView;
   import nslm2.common.scene.multiLayer.DungeonMultilayerBg;
   import away3d.containers.ObjectContainer3D;
   import nslm2.modules.battles.sceneBases.BattleScene;
   import away3d.cameras.Camera3D;
   import org.specter3d.context.AppGlobalContext;
   import nslm2.modules.battles.battle.skillConfig.SkillConfig;
   import morn.customs.expands.MornExpandUtil;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.modules.dungeons.DungeonVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.battles.battle.GameObjectManager;
   import nslm2.utils.TransformUtil;
   import com.mz.core.configs.EnvConfig;
   import nslm2.common.ui.components.debug3d.Object3DParams;
   import nslm2.common.ui.components.debug3d.Param3DRender;
   import nslm2.common.ui.components.comp3ds.lightAndShadows.LightAndShadowCtrl3;
   import morn.core.components.VBox;
   import com.mz.core.mediators.DragMediator;
   import nslm2.modules.battles.battle.BattleEvent;
   import away3d.cameras.lenses.PerspectiveLens;
   import flash.utils.getTimer;
   import nslm2.modules.battles.battle.FPUtil;
   import com.mz.core.utils2.task.TaskPool;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSpecialEffectVo;
   import com.mz.core.logging.Log;
   import com.mz.core.mgrs.resMgrs.GetResEffect3DTask;
   import nslm2.modules.battles.battle.BattleStartVo;
   import com.mz.core.utils.LocalData;
   import nslm2.modules.battles.battle.BattlePlayer;
   import com.mz.core.utils.DictHash;
   import flash.geom.Vector3D;
   
   public class FightSceneModule extends SceneModuleView
   {
       
      
      private var bg:DungeonMultilayerBg;
      
      private var layer3D:ObjectContainer3D;
      
      private var unitVoArr:Array;
      
      private var fightLayer:ObjectContainer3D;
      
      private var battleUI:BattleScene;
      
      private var isBossScene:Boolean = false;
      
      public var lightCtrl:LightAndShadowCtrl3;
      
      private var _camera3dLen:Number = 16;
      
      private var _scaleAllUnit:Number = 180;
      
      private var test_loadt:Number;
      
      private var battlePlayer:BattlePlayer;
      
      private var unitViewHash:DictHash;
      
      public function FightSceneModule()
      {
         super();
      }
      
      public function get camear3d() : Camera3D
      {
         return AppGlobalContext.stage3d.camera3d;
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         SkillConfig.intConfig();
         battleUI = new BattleScene();
         this.addChild(battleUI);
         MornExpandUtil.setLayout(battleUI);
         MornExpandUtil.addHandlerForBtnAll(battleUI,btn_handler);
         unitVoArr = param1 as Array;
         layer3D = new ObjectContainer3D();
         fightLayer = new ObjectContainer3D();
         UIMgr.root3D.addChild(layer3D);
         var _loc2_:DungeonVo = new DungeonVo(101);
         bg = new DungeonMultilayerBg();
         bg.dungeonVO = _loc2_;
         bg.mapId = 101;
         bg.init(loadBgConfigCpl);
         if(ModuleMgr.ins.isShow(96400) == true)
         {
            ModuleMgr.ins.closeModule(96400);
         }
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(battleUI.btn_auto === _loc3_)
         {
            GameObjectManager.Instance.autoFire = !GameObjectManager.Instance.autoFire;
            check_btn_auto_state();
         }
      }
      
      protected function check_btn_auto_state() : void
      {
         battleUI.btn_auto.selected = GameObjectManager.Instance.autoFire;
      }
      
      private function loadBgConfigCpl() : void
      {
         var _loc6_:int = 0;
         var _loc1_:* = null;
         bg.createBgLayer();
         layer3D.addChild(bg);
         layer3D.addChild(fightLayer);
         var _loc4_:int = unitVoArr.length;
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc1_ = unitVoArr[_loc6_];
            _loc1_.init(isBossScene);
            _loc6_++;
         }
         initUnitViewArr();
         battleUI.battleHeadPortrait.show(unitVoArr);
         if(isBossScene)
         {
            TransformUtil.cameraToBattlePerspective2();
            fightLayer.rotationY = 0;
         }
         else
         {
            TransformUtil.cameraToBattlePerspective1();
            fightLayer.rotationY = 0;
         }
         bg.synchroCamera(this.camear3d);
         if(EnvConfig.ins.showDebugModule)
         {
            initLight();
         }
      }
      
      private function initLight() : void
      {
         var _loc4_:int = 0;
         var _loc1_:* = null;
         lightCtrl = new LightAndShadowCtrl3(this.layer3D);
         lightCtrl.initLightEntity();
         var _loc2_:int = unitViewHash.array.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc1_ = unitViewHash.array[_loc4_];
            _loc1_.lightPicker = lightCtrl.lightPicker;
            _loc4_++;
         }
         var _loc3_:VBox = new VBox();
         this.addChild(_loc3_);
         _loc3_.bottom = 0;
         this.parts.push(new DragMediator(_loc3_,this.stage));
         if(this.lightCtrl)
         {
            _loc3_.addChild(this.lightCtrl.debugBox);
         }
      }
      
      protected function onNewTurnBegin(param1:BattleEvent) : void
      {
         this.battleUI.turnCount = param1.data as int;
         this.dispatchEvent(param1);
      }
      
      public function get camera3dLen() : Number
      {
         return _camera3dLen;
      }
      
      public function set camera3dLen(param1:Number) : void
      {
         _camera3dLen = param1;
         AppGlobalContext.stage3d.camera3d.lens = new PerspectiveLens(param1);
      }
      
      public function get scaleAllUnit() : Number
      {
         return _scaleAllUnit;
      }
      
      public function set scaleAllUnit(param1:Number) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         _scaleAllUnit = param1;
         unitViewHash.array;
         var _loc3_:int = unitViewHash.array.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = unitViewHash.array[_loc4_];
            _loc4_++;
         }
      }
      
      protected function preload() : void
      {
         var _loc1_:* = null;
         test_loadt = getTimer();
         var _loc3_:Array = FPUtil.getBattleEffectIdByVos(this.unitVoArr);
         var _loc2_:TaskPool = new TaskPool();
         var _loc6_:int = 0;
         var _loc5_:* = _loc3_;
         for each(var _loc4_ in _loc3_)
         {
            _loc1_ = StcMgr.ins.getSpecialEffectVo(_loc4_);
            if(_loc1_ == null)
            {
               Log.fatal(this,"光效没有配置" + _loc4_);
            }
            _loc2_.addTask(new GetResEffect3DTask("particle/" + _loc1_.effect));
         }
         _loc2_.addCompleteHandler(bEffectComplete);
         _loc2_.stopWhenError = false;
         _loc2_.exec();
      }
      
      private function bEffectComplete() : void
      {
         var _loc3_:* = null;
         var _loc1_:Boolean = false;
         Log.debug("光效加载时间:" + (getTimer() - test_loadt) / 1000 + "s");
         var _loc5_:int = 0;
         var _loc4_:* = unitVoArr;
         for each(var _loc2_ in unitVoArr)
         {
            _loc2_.hp = _loc2_.hp_max;
            _loc2_.rage = 0;
         }
         if(battlePlayer == null)
         {
            _loc3_ = new BattleStartVo();
            _loc3_.container = this.fightLayer;
            _loc3_.unitViews = this.unitViewHash;
            _loc3_.heads = battleUI.battleHeadPortrait;
            _loc3_.maps = bg;
            _loc3_.seeds = GameObjectManager.test_seed;
            _loc3_.playMode = GameObjectManager.test_playMode;
            _loc3_.isBoss = isBossScene;
            _loc1_ = LocalData.insTools.load("settingBattleSkillTest",false);
            if(_loc1_)
            {
               _loc3_.playMode = 4;
            }
            battlePlayer = new BattlePlayer(_loc3_);
            battlePlayer.addEventListener("FIGHT_NEW_TURN_BEGIN",onNewTurnBegin);
         }
         this.battlePlayer.play();
      }
      
      private function initUnitViewArr() : void
      {
         var _loc4_:int = 0;
         var _loc1_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:* = null;
         var _loc2_:* = null;
         unitViewHash = new DictHash();
         var _loc5_:int = unitVoArr.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = unitVoArr[_loc6_];
            _loc2_ = new UnitView(_loc3_,this);
            unitViewHash.put(_loc3_.id,_loc2_);
            _loc2_.action = "std_2";
            _loc3_.isBossScene = isBossScene;
            if(_loc3_.isAttack)
            {
               _loc3_.rotation = 0;
               _loc2_.avatarBox.position = TransformUtil.fight2Dto3DByPoi(PosConts.xyArrL[_loc3_.posId]);
               _loc4_++;
            }
            else
            {
               _loc3_.rotation = 180;
               _loc2_.avatarBox.position = TransformUtil.fight2Dto3DByPoi(PosConts.xyArrR[_loc3_.posId]);
               _loc1_++;
            }
            _loc2_.validateRo();
            this.fightLayer.addChild(_loc2_.avatarBox);
            _loc6_++;
         }
      }
      
      private function scalePos(param1:Vector3D) : Vector3D
      {
         return param1;
      }
      
      override public function getFocusNotices() : Array
      {
         return ["fightStart","fightFinishImmediately","fight_test_btn"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         super.handleNotices(param1,param2);
         var _loc3_:* = param1;
         if("fightStart" !== _loc3_)
         {
            if("fightFinishImmediately" !== _loc3_)
            {
               if("fight_test_btn" === _loc3_)
               {
                  battlePlayer.test_btn(param2 as int);
               }
            }
            else
            {
               this.battlePlayer.finishImmediately();
               ModuleMgr.ins.showModule(40221,this.unitVoArr);
            }
         }
         else
         {
            preload();
         }
      }
   }
}
