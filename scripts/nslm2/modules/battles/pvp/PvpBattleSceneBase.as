package nslm2.modules.battles.pvp
{
   import morn.customs.components.FadeView;
   import nslm2.modules.battles.sceneBases.BattleScene;
   import away3d.containers.ObjectContainer3D;
   import nslm2.common.ui.components.comp3ds.TileImg;
   import nslm2.modules.battles.battle.BattlePlayer;
   import com.mz.core.utils.DictHash;
   import away3d.cameras.Camera3D;
   import org.specter3d.context.AppGlobalContext;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.utils.TransformUtil;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.battles.battle.skillConfig.SkillConfig;
   import nslm2.modules.fightPlayer.UnitVo;
   import com.mz.core.mgrs.resMgrs.GetResEffect3DTask;
   import nslm2.utils.Effect3DUtils;
   import com.greensock.TweenLite;
   import nslm2.modules.fightPlayer.UnitView;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import com.game.scene.vo.SceneVO;
   import nslm2.common.scene.multiLayer.configs.BgTileImgConfigVo;
   import com.mz.core.configs.ClientConfig;
   import morn.core.components.Box;
   import nslm2.common.ui.components.debug3d.Object3DParams;
   import org.specter3d.display.particle.EffectManager;
   import org.specter3d.display.particle.SpecterEffect;
   import com.mz.core.utils2.ShakeUtil;
   import nslm2.modules.battles.battle.FPUtil;
   import com.mz.core.utils2.task.TaskPool;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSpecialEffectVo;
   import nslm2.modules.battles.battle.BattleStartVo;
   import nslm2.modules.battles.battle.BattleEvent;
   import morn.core.components.VBox;
   import morn.core.components.HBox;
   
   public class PvpBattleSceneBase extends FadeView
   {
       
      
      private var left_unitVoArr:Array;
      
      private var right_unitVoArr:Array;
      
      private var ui2D:BattleScene;
      
      private var layer3D:ObjectContainer3D;
      
      private var fightLayer3D:ObjectContainer3D;
      
      private var tileBg:TileImg;
      
      private var bgBox:ObjectContainer3D;
      
      public var bgBox2:ObjectContainer3D;
      
      private var battlePlayer:BattlePlayer;
      
      private var unitViewHash:DictHash;
      
      public var rightUnitViewHash:DictHash;
      
      public var configVo:nslm2.modules.battles.pvp.PvpBattleSceneConfigVo;
      
      private var debugBox0:Box;
      
      private var debugBox1:Box;
      
      private var debugBox2:Box;
      
      private var debugBox3:Box;
      
      private var bossUnitView:UnitView;
      
      public function PvpBattleSceneBase()
      {
         bgBox = new ObjectContainer3D();
         bgBox2 = new ObjectContainer3D();
         debugBox0 = new VBox();
         debugBox1 = new HBox();
         debugBox2 = new HBox();
         debugBox3 = new HBox();
         super();
         MornExpandUtil.setLayout(this);
      }
      
      public function get camera3d() : Camera3D
      {
         return AppGlobalContext.stage3d.camera3d;
      }
      
      public function initScene(param1:nslm2.modules.battles.pvp.PvpBattleSceneConfigVo) : void
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         this.configVo = param1;
         ui2D = new BattleScene();
         this.addChild(ui2D);
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
         layer3D.addChild(bgBox);
         layer3D.addChild(fightLayer3D);
         UIMgr.root3D.addChild(layer3D);
         PlayerModel.ins.createTeam(configVo.playerArr);
         SkillConfig.intConfig();
         left_unitVoArr = PlayerModel.ins.team.array;
         right_unitVoArr = PlayerModel.ins.rightTeam.array;
         var _loc3_:int = left_unitVoArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = left_unitVoArr[_loc4_];
            _loc2_.init();
            _loc4_++;
         }
         _loc3_ = right_unitVoArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = right_unitVoArr[_loc4_];
            _loc2_.init();
            _loc4_++;
         }
         if(configVo.isAttack == 1)
         {
            ui2D.battleHeadPortrait.show(left_unitVoArr);
         }
         else
         {
            ui2D.battleHeadPortrait.showDef(right_unitVoArr);
         }
         this.initLeftUnitViewArr();
         this.initRightUnitArr();
         new GetResEffect3DTask(Effect3DUtils.getUrlBySid(13000)).exec();
         TweenLite.delayedCall(1,this.createBg);
      }
      
      public function reStart() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = left_unitVoArr;
         for each(var _loc1_ in left_unitVoArr)
         {
            _loc1_.hp = _loc1_.hp_max;
            _loc1_.rage = 0;
         }
         this.disposeRighUnitView();
         this.initRightUnitArr();
      }
      
      private function initLeftUnitViewArr() : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc1_:* = null;
         unitViewHash = new DictHash();
         var _loc3_:int = left_unitVoArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = left_unitVoArr[_loc4_];
            _loc1_ = new UnitView(_loc2_,this);
            unitViewHash.put(_loc2_.id,_loc1_);
            _loc1_.action = "std_2";
            _loc1_.init();
            this.fightLayer3D.addChild(_loc1_.avatarBox);
            _loc4_++;
         }
      }
      
      private function initRightUnitArr() : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc1_:* = null;
         rightUnitViewHash = new DictHash();
         var _loc3_:int = right_unitVoArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = right_unitVoArr[_loc4_];
            _loc1_ = new UnitView(_loc2_,this);
            rightUnitViewHash.put(_loc2_.id,_loc1_);
            _loc1_.action = "std_2";
            _loc1_.init();
            this.fightLayer3D.addChild(_loc1_.avatarBox);
            _loc4_++;
         }
         _loc1_.addEventListener("avatar_anim_all_complete",avatarAsset_onCpl);
      }
      
      private function avatarAsset_onCpl(param1:Event) : void
      {
         (param1.currentTarget as EventDispatcher).removeEventListener("avatar_anim_all_complete",avatarAsset_onCpl);
         TweenLite.delayedCall(1,this.start);
      }
      
      private function start() : void
      {
         if(bossUnitView)
         {
            TweenLite.delayedCall(0.3,this.playBossFadeInEff);
            TweenLite.to(bossUnitView.avatarBox,0.5,{
               "y":0,
               "onComplete":preload
            });
         }
         else
         {
            this.preload();
         }
      }
      
      public function createBg() : void
      {
         var _loc1_:SceneVO = new SceneVO();
         var _loc2_:BgTileImgConfigVo = new BgTileImgConfigVo();
         _loc2_.needLoadConfigXML = true;
         _loc2_.mapId = this.configVo.mapId;
         _loc2_.id = this.configVo.sceneCameraKind;
         tileBg = new TileImg(_loc2_);
         tileBg.z = -1;
         tileBg.x = -ClientConfig.SCENE_BG_W >> 1;
         tileBg.y = ClientConfig.SCENE_BG_H >> 1;
         bgBox2.addChild(tileBg);
         bgBox2.z = 7000;
         bgBox2.scaleAll = TransformUtil.countBgScale(this.configVo.isBossScene,bgBox2.z);
         bgBox.addChild(bgBox2);
         this.layer3D.addChild(bgBox);
         TransformUtil.synchroPosRo(bgBox,camera3d);
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
      
      private function preload() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
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
            _loc3_.addTask(new GetResEffect3DTask("particle/" + _loc2_.effect));
         }
         _loc3_.addCompleteHandler(bEffectComplete);
         _loc3_.stopWhenError = false;
         _loc3_.exec();
      }
      
      private function bEffectComplete() : void
      {
         disposeBattlePlayer();
         var _loc1_:BattleStartVo = new BattleStartVo();
         _loc1_.container = this.fightLayer3D;
         _loc1_.unitViews = this.unitViewHash.merge(this.rightUnitViewHash);
         _loc1_.heads = this.ui2D.battleHeadPortrait;
         _loc1_.maps = this.tileBg;
         _loc1_.isBoss = false;
         _loc1_.playMode = 3;
         _loc1_.isAttack = configVo.isAttack;
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
      
      protected function fightPlayer_onCpl(param1:BattleEvent) : void
      {
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
         disposeBattlePlayer();
         disposeRighUnitView();
         this.layer3D.dispose();
         super.dispose();
      }
   }
}
