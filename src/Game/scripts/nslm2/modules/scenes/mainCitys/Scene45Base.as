package nslm2.modules.scenes.mainCitys
{
   import morn.core.components.Component;
   import nslm2.modules.scenes.commons.ICameraLookAtPosition;
   import nslm2.modules.dungeons.scripts.IScriptBox;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.scenes.ctrls.ScenePlayerMoveCtrl;
   import nslm2.modules.scenes.commons.TweenMoveCameraCtrl;
   import nslm2.modules.scenes.ctrls.SceneNGCtrl;
   import nslm2.modules.scenes.ctrls.SceneCtrlBase;
   import nslm2.modules.footstones.newerGuideModules.NGScriptPlayer;
   import nslm2.modules.scenes.commons.SceneModel;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.configs.EnvConfig;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.loadingModules.LoadingMsg;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.events.Event;
   import nslm2.common.scene.multiLayer.DungeonMultilayerBg;
   import com.mz.core.utils2.task.TaskPool;
   import com.mz.core.mgrs.resMgrs.GetRes3DTask;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import flash.display.BitmapData;
   import org.specter3d.loaders.AssetLib;
   import nslm2.mgrs.SoundMgr;
   import com.greensock.TweenLite;
   import morn.core.handlers.Handler;
   import away3d.containers.ObjectContainer3D;
   import nslm2.common.scene.multiLayer.configs.BgMapConfigVo;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import nslm2.modules.scenes.commons.SceneCurPlayer3D;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.utils.TransformUtil;
   import org.specter3d.context.AppGlobalContext;
   import flash.geom.Point;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.scenes.ctrls.MainCityDebugCtrl;
   import proto.ScenePlayerInfo;
   import nslm2.utils.Uint64Util;
   import nslm2.common.ui.components.comp3ds.lightAndShadows.LightAndShadowCtrl;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageNpcRelationVo;
   import nslm2.modules.scenes.ctrls.SceneNpcCtrlBase;
   import com.mz.core.utils.MathUtil;
   import nslm2.modules.scenes.commons.SceneUnit3D;
   import nslm2.utils.RTools;
   import away3d.cameras.Camera3D;
   import nslm2.modules.scenes.commons.ScenePlayer3D;
   import nslm2.modules.scenes.commons.SceneOtherPlayer3D;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.foundations.vip.consts.VipUtils;
   import nslm2.modules.foundations.setting.model.SettingModel;
   import proto.PetSceneInfo;
   import nslm2.modules.scenes.commons.ScenePet3D;
   import nslm2.modules.funnies.families.familyBosses.FamilybossUnit3D;
   import nslm2.mgrs.stcMgrs.vos.StcNpcGroupVo;
   import nslm2.modules.funnies.families.familyBosses.sceneCtrls.FamilyBossSceneCtrl_Boss;
   import nslm2.modules.funnies.teamGuajiScenes.subpalaceBoss.SubpalaceBossUnit3D;
   import nslm2.modules.funnies.teamGuajiScenes.subpalaceBoss.SubpalaceBossSceneCtrl;
   import com.mz.core.utils.ArrayUtil;
   import com.netease.protobuf.UInt64;
   import nslm2.modules.scenes.commons.Unit3DBase;
   import nslm2.modules.scenes.commons.SceneNpc3D;
   import morn.core.utils.StringUtils;
   import nslm2.mgrs.stcMgrs.consts.StcNpcGroupConsts;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.EnterSceneOtherPlayerNotify;
   import proto.LeaveSceneNotify;
   import proto.WearChangeNotify;
   import proto.TitleChangeNotify;
   import proto.PlayerMoveNotify;
   import proto.PlayerMoveInfo;
   import com.mz.core.configs.ClientConfig;
   import morn.core.managers.timerMgrs.TimerManager;
   import flash.geom.Vector3D;
   import nslm2.nets.sockets.ServerEngine;
   import flash.display.DisplayObject;
   import nslm2.modules.dungeons.scripts.comps.ScriptCmdEffect3DView;
   import nslm2.modules.fightPlayer.UnitView;
   import nslm2.modules.fightPlayer.UnitVo;
   import nslm2.common.model.HeroModel;
   import org.specter3d.display.Specter3DStage;
   import away3d.entities.Entity;
   import morn.customs.expands.MornExpandUtil;
   
   public class Scene45Base extends Component implements ICameraLookAtPosition, IScriptBox, IObserver
   {
       
      
      public var isDragBool:Boolean = false;
      
      public var playerMoveCtrl:ScenePlayerMoveCtrl;
      
      private var _tweenMoveCtrl:TweenMoveCameraCtrl;
      
      private var ngCtrl:SceneNGCtrl;
      
      protected var ctrlArr:Vector.<SceneCtrlBase>;
      
      protected var ngScriptPlayer:NGScriptPlayer;
      
      private var initHandler;
      
      public var moduleId:int;
      
      public var ctrl_stop:Boolean;
      
      public var useFullScreen:Boolean = false;
      
      public var layer3D:ObjectContainer3D;
      
      public var multiBgLayer:DungeonMultilayerBg;
      
      public var mapConfigVo:BgMapConfigVo;
      
      public var debugPathMaskImg:Image3D;
      
      public var effLayer3D:ObjectContainer3D;
      
      public var avatarLayer:ObjectContainer3D;
      
      public var playerHero:SceneCurPlayer3D;
      
      public var otherRoleArr:Array;
      
      public var monsterArr:Array;
      
      public var npcArr:Array;
      
      public var monsterCtrArr:Array;
      
      private var lightCtrl:LightAndShadowCtrl;
      
      public var otherMaskIndex:int = -1;
      
      protected var isHideOtherRole:Boolean = false;
      
      private var _isNpcFuncModel:Boolean;
      
      public var focusNpcCtrl:SceneNpcCtrlBase;
      
      public var showByLimiteCount:int = 0;
      
      public var showByLimiteMax:int = 0;
      
      protected var _cameraScale:Number = 1;
      
      protected var _lookAtPos2d:Point;
      
      public var lockCamera:Boolean = false;
      
      private var _canTweenCamera:Boolean = true;
      
      private var _tweenCamera:TweenLite;
      
      private var lastTweenFrame:int;
      
      private var lastChangeTimer:int = 0;
      
      private var _cameraLookAt:Point;
      
      public function Scene45Base()
      {
         ctrlArr = new Vector.<SceneCtrlBase>();
         layer3D = new ObjectContainer3D();
         effLayer3D = new ObjectContainer3D();
         avatarLayer = new ObjectContainer3D();
         otherRoleArr = [];
         monsterArr = [];
         npcArr = [];
         monsterCtrArr = [];
         _cameraLookAt = new Point();
         super();
         this.ctrl_stop = false;
         MornExpandUtil.setLayout(this);
      }
      
      public function get tweenMoveCtrl() : TweenMoveCameraCtrl
      {
         if(_tweenMoveCtrl == null)
         {
            _tweenMoveCtrl = new TweenMoveCameraCtrl(this);
         }
         return _tweenMoveCtrl;
      }
      
      private function get model() : SceneModel
      {
         return SceneModel.ins;
      }
      
      public function init(param1:int, param2:int, param3:*) : void
      {
         this.moduleId = param1;
         this.initHandler = param3;
         PlayerModel.ins.currentCity = param2;
         if(EnvConfig.ins.useServer)
         {
            if(SceneModel.ins.sceneId != param2)
            {
               ObserverMgr.ins.sendNotice("LOADING_BAR_ADD_PROGRESS",new LoadingMsg(this.moduleId,0,0,LocaleMgr.ins.getStr(999000629)));
               SceneModel.ins.addEventListener("modelServerCplPrefix" + 8003,model_enterScene);
               SceneModel.ins.cmd_enterScene(param2);
            }
            else
            {
               this.showScene();
            }
         }
         else
         {
            this.showScene();
         }
      }
      
      private function model_enterScene(param1:Event) : void
      {
         SceneModel.ins.removeEventListener("modelServerCplPrefix" + 8003,model_enterScene);
         showScene();
      }
      
      private function showScene() : void
      {
         this.countShowByLimiteMax();
         multiBgLayer = new DungeonMultilayerBg();
         multiBgLayer.stcStageId = model.sceneId;
         ObserverMgr.ins.sendNotice("LOADING_BAR_ADD_PROGRESS",new LoadingMsg(this.moduleId,0,0,LocaleMgr.ins.getStr(998001157)));
         multiBgLayer.init(loadConfigCpl);
      }
      
      private function loadConfigCpl() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         this.mapConfigVo = multiBgLayer.configVo;
         SceneModel.ins.mapConfigVo = this.mapConfigVo;
         showScene2();
      }
      
      private function showScene2() : void
      {
         var _loc2_:int = 0;
         if(isDisposed)
         {
            return;
         }
         var _loc1_:int = this.mapConfigVo.pathMaskCount;
         var _loc3_:TaskPool = new TaskPool();
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_.addTask(new GetRes3DTask(UrlLib.scenePathMask(this.multiBgLayer.mapId,_loc2_)));
            _loc2_++;
         }
         _loc3_.addHandlers(pathMaskImg_cpl);
         _loc3_.exec();
      }
      
      private function pathMaskImg_cpl() : void
      {
         var _loc4_:int = 0;
         var _loc1_:* = null;
         if(isDisposed)
         {
            return;
         }
         var _loc3_:int = this.mapConfigVo.pathMaskCount;
         var _loc2_:Vector.<BitmapData> = new Vector.<BitmapData>();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc1_ = AssetLib.getBitmapData(UrlLib.scenePathMask(this.multiBgLayer.mapId,_loc4_));
            _loc2_.push(_loc1_);
            _loc4_++;
         }
         SceneModel.ins.findPathMed.pathMaskBmdArr = _loc2_;
         SceneModel.ins.findPathMed.initFindPathMed();
         this.showScene3();
      }
      
      private function showScene3() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         init3D();
         ngScriptPlayer = new NGScriptPlayer(this);
         this.switchEventListeners(true);
         SoundMgr.ins.playBackSoundByStageId(model.sceneId);
         TweenLite.delayedCall(1,this.callInitHandler,null,true);
      }
      
      private function callInitHandler() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         if(initHandler)
         {
            Handler.execute(initHandler);
         }
      }
      
      protected function validateFullScene() : void
      {
         if(SceneModel.ins.stcStageVo.kind == 4 || SceneModel.ins.stcStageVo.kind == 41)
         {
            UIMgr.ins.useFullScreen = true;
         }
         else
         {
            UIMgr.ins.useFullScreen = this.useFullScreen;
         }
      }
      
      protected function init3D() : void
      {
         var _loc1_:* = null;
         TransformUtil.cameraToScene45();
         this.initLight();
         this.initCtrl();
         AppGlobalContext.stage3d.addChild(layer3D);
         layer3D.addChild(avatarLayer);
         layer3D.addChild(effLayer3D);
         initBg();
         ObserverMgr.ins.sendNotice("msg_refresh_small_map",multiBgLayer.mapId);
         playerHero = new SceneCurPlayer3D(avatarLayer);
         playerHero.roleId = PlayerModel.ins.playerInfo.id;
         PlayerModel.ins.changePlayerViewByPlayerInfo(playerHero,PlayerModel.ins.playerInfo);
         if(PlayerModel.ins.playerInfo.horse > 0)
         {
            playerHero.initStcHorseId(PlayerModel.ins.playerInfo.horse);
         }
         var _loc3_:String = playerHeroInitName();
         if(PlayerModel.ins.playerInfo.familyId)
         {
            playerHero.tag3DVBox.showGuildName(PlayerModel.ins.playerInfo.familyName);
         }
         if(lightCtrl)
         {
            playerHero.lightPicker = lightCtrl.lightPicker;
         }
         var _loc2_:PlayerModel = PlayerModel.ins;
         if(PlayerModel.ins.playerInfo.showTitleId > 0)
         {
            playerHero.tag3DVBox.showTitle(PlayerModel.ins.playerInfo.showTitleId);
         }
         playerHero.pos2d = new Point(SceneModel.ins.playerRole.x,SceneModel.ins.playerRole.y);
         this.createPet(playerHero,SceneModel.ins.playerRole.pet,PlayerModel.ins.playerInfo.name,ColorLib.qualityColor(MilitaryModel.ins.getPlayerQuality(PlayerModel.ins.playerInfo.militaryrank)));
         this.showOtherRoleArr();
         this.initCtrlNpc();
         this.setLookAtPos2d(playerHero.pos2d.add(DefindConsts.SCENE45_CUR_OFFSET),false);
         if(false && EnvConfig.ins.showDebugModule)
         {
            _loc1_ = new MainCityDebugCtrl();
            _loc1_.init(this);
            this.ctrlArr.push(_loc1_);
            if(lightCtrl)
            {
               _loc1_.debugBox.addChild(this.lightCtrl.debugBox);
            }
         }
      }
      
      private function showRobot() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < 30)
         {
            _loc1_ = new ScenePlayerInfo();
            _loc1_.baseInfo = PlayerModel.ins.playerBaseInfo;
            _loc1_.baseInfo.id = Uint64Util.fromString(Uint64Util.toString(_loc1_.baseInfo.id) + _loc2_);
            _loc1_.x = playerHero.x2d + _loc2_ * 50;
            _loc1_.y = playerHero.y2d + _loc2_ % 5 * 50;
            SceneModel.ins.roleList.put(Uint64Util.toString(_loc1_.baseInfo.id),_loc1_);
            _loc2_++;
         }
      }
      
      private function playerHeroInitName() : String
      {
         var _loc1_:* = null;
         if(SceneModel.ins.isCrossScene)
         {
            _loc1_ = PlayerModel.ins.getPlayerNameWithAccType("S" + PlayerModel.ins.dist % 10000 + "." + PlayerModel.ins.playerInfo.name,PlayerModel.ins.playerInfo.gmType,0);
         }
         else
         {
            _loc1_ = PlayerModel.ins.getPlayerNameWithAccType(PlayerModel.ins.playerInfo.name,PlayerModel.ins.playerInfo.gmType,PlayerModel.ins.dist);
         }
         playerHero.tag3DVBox.initName(_loc1_,ColorLib.qualityColor(MilitaryModel.ins.getPlayerQuality(PlayerModel.ins.playerInfo.militaryrank)),0,PlayerModel.ins.vipInfoVo);
         return _loc1_;
      }
      
      private function initLight() : void
      {
      }
      
      protected function initCtrl() : void
      {
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc1_:* = null;
         this.playerMoveCtrl = new ScenePlayerMoveCtrl();
         this.ngCtrl = new SceneNGCtrl();
         var _loc2_:Array = StcMgr.ins.getVoArrByColumnValue("static_stage_npc_relation","stage_id",this.model.sceneId);
         var _loc4_:int = _loc2_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc1_ = _loc2_[_loc5_];
            _loc3_ = SceneNpcCtrlBase.createNpcCtrl(_loc1_);
            if(_loc3_)
            {
               ctrlArr.push(_loc3_);
            }
            _loc5_++;
         }
      }
      
      protected function initCtrlNpc() : void
      {
         var _loc1_:* = null;
         var _loc3_:int = 0;
         this.playerMoveCtrl.isActived = true;
         this.playerMoveCtrl.init(this);
         this.ngCtrl.init(this);
         this.ngCtrl.isActived = true;
         var _loc2_:int = ctrlArr.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = ctrlArr[_loc3_];
            _loc1_.init(this);
            _loc3_++;
         }
      }
      
      protected function initBg() : void
      {
         layer3D.addChild(multiBgLayer);
         multiBgLayer.createBgLayer();
      }
      
      protected function showOtherRoleArr() : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc1_:* = null;
         var _loc2_:int = SceneModel.ins.roleList.array.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = SceneModel.ins.roleList.array[_loc4_];
            if(Uint64Util.equal(_loc3_.baseInfo.id,PlayerModel.ins.playerInfo.id))
            {
               _loc1_ = new Point(MathUtil.maxMin(_loc3_.x,this.mapConfigVo.sceneSize.x,0),MathUtil.maxMin(_loc3_.y,this.mapConfigVo.sceneSize.y,0));
               _loc1_ = getOtherPlayerPos(_loc1_);
               playerHero.pos2d = _loc1_;
               randomInitPos(playerHero);
            }
            else if(!int(_loc3_.kind))
            {
               this.addOtherRole(_loc3_);
            }
            _loc4_++;
         }
      }
      
      protected function getOtherPlayerPos(param1:Point) : Point
      {
         return SceneModel.ins.findPathMed.getCanMovePoiNearest(param1);
      }
      
      protected function randomInitPos(param1:SceneUnit3D) : void
      {
         var _loc2_:Array = SceneModel.ins.stcStageVo.address.split(",");
         var _loc3_:Point = new Point(int(_loc2_[0]),int(_loc2_[1]));
         if(param1.x2d == _loc3_.x && param1.y2d == _loc3_.y)
         {
            param1.pos2d = new Point(MathUtil.randomRadii(param1.x2d,80),MathUtil.randomRadii(param1.y2d,80));
         }
         if(param1 != this.playerHero)
         {
            param1.setRotation(MathUtil.randomInt(360,0));
         }
      }
      
      private function onChangeLine(param1:Event) : void
      {
         if(isDisposed)
         {
            return;
         }
         RTools.disposeArrOrVector(this.otherRoleArr);
         showOtherRoleArr();
      }
      
      public function get camera3d() : Camera3D
      {
         return AppGlobalContext.stage3d.camera3d;
      }
      
      private function getRoleName(param1:ScenePlayerInfo, param2:Boolean) : String
      {
         var _loc3_:* = null;
         if(SceneModel.ins.isCrossScene)
         {
            _loc3_ = ".S" + param1.baseInfo.dist % 10000 + "." + param1.baseInfo.name;
            _loc3_ = PlayerModel.ins.getPlayerNameWithAccType(_loc3_,param1.baseInfo.gmType,0);
         }
         else
         {
            if(param2 && param1.baseInfo.dist != PlayerModel.ins.dist)
            {
               _loc3_ = param1.baseInfo.distName + "." + param1.baseInfo.name;
            }
            else
            {
               _loc3_ = param1.baseInfo.name;
            }
            _loc3_ = PlayerModel.ins.getPlayerNameWithAccType(_loc3_,param1.baseInfo.gmType,param1.baseInfo.dist);
         }
         return _loc3_;
      }
      
      public function addOtherRole(param1:ScenePlayerInfo, param2:Boolean = true, param3:Boolean = false) : ScenePlayer3D
      {
         if(this.isDisposed)
         {
            return null;
         }
         var _loc5_:SceneOtherPlayer3D = new SceneOtherPlayer3D(avatarLayer);
         _loc5_.showByLimite = this.showByLimiteCount < this.showByLimiteMax;
         if(_loc5_.showByLimite == true)
         {
            this.showByLimiteCount++;
         }
         if(lightCtrl)
         {
            _loc5_.lightPicker = lightCtrl.lightPicker;
         }
         _loc5_.playerInfo = param1;
         _loc5_.suitId = param1.baseInfo.clothes;
         _loc5_.wingId = param1.baseInfo.wing;
         _loc5_.stcNpcId = param1.baseInfo.npcId;
         var _loc6_:StcNpcVo = StcMgr.ins.getNpcVo(_loc5_.stcNpcId);
         PlayerModel.ins.changePlayerViewByPlayerBaseInfo(_loc5_,param1.baseInfo);
         if(param1.baseInfo.horse)
         {
            _loc5_.initStcHorseId(param1.baseInfo.horse);
         }
         var _loc4_:String = getRoleName(param1,param3);
         _loc5_.tag3DVBox.initName(_loc4_,ColorLib.qualityColor(MilitaryModel.ins.getPlayerQuality(param1.baseInfo.militaryRank)),0,VipUtils.vipInfoVo(param1.baseInfo));
         if(param2 && param1.baseInfo.familyName)
         {
            _loc5_.tag3DVBox.showGuildName(param1.baseInfo.familyName);
         }
         if(param1.showTitleId > 0)
         {
            _loc5_.tag3DVBox.showTitle(param1.showTitleId);
         }
         _loc5_.roleId = param1.baseInfo.id;
         _loc5_.x2d = param1.x;
         _loc5_.y2d = param1.y;
         randomInitPos(_loc5_);
         if(_loc5_.avatar)
         {
            _loc5_.avatar.effectsVisible = SettingModel.ins.otherSpecEffect == 0;
         }
         this.otherRoleArr.push(_loc5_);
         createPet(_loc5_,param1.pet,param1.baseInfo.name,ColorLib.qualityColor(MilitaryModel.ins.getPlayerQuality(param1.baseInfo.militaryRank)));
         _loc5_.visible = !this.isHideOtherRole;
         return _loc5_;
      }
      
      private function createPet(param1:ScenePlayer3D, param2:PetSceneInfo, param3:String, param4:uint) : void
      {
         var _loc5_:* = null;
         if(SceneModel.ins.stcStageVo.kind == 4 || SceneModel.ins.stcStageVo.kind == 41 || SceneModel.ins.stcStageVo.id == DefindConsts.SHEN_YUAN_STAGE_ID)
         {
            if(param2 && param2.id > 0)
            {
               if(param1.pet == null)
               {
                  param1.pet = new ScenePet3D(avatarLayer,param1);
               }
               else
               {
                  param1.pet.visible = true;
               }
               param1.pet.showByLimite = param1.showByLimite;
               _loc5_ = StcMgr.ins.getNpcVo(param2.id);
               param1.pet.initByStcNpcId(param2.id,false,0,StcMgr.ins.getPetStatusVo(param2.model).model);
               param1.pet.initSay(_loc5_.description2);
               param1.pet.box3D2.y = -80;
               param1.pet.tag3DVBox.initName(LocaleMgr.ins.getStr(_loc5_.name),ColorLib.qualityColor(_loc5_.quality));
               param1.pet.tag3DVBox.showGuildName(LocaleMgr.ins.getStr(32000076,[param3]),"",param4);
               param1.pet.tag3DVBox.fixedY = 170;
            }
            else if(param1.pet != null)
            {
               param1.pet.visible = false;
            }
         }
      }
      
      private function createTreasureByBaowuArr(param1:ScenePlayer3D, param2:Array) : void
      {
         if(SceneModel.ins.stcStageVo.kind == 4 || SceneModel.ins.stcStageVo.kind == 41 || SceneModel.ins.stcStageVo.id == DefindConsts.SHEN_YUAN_STAGE_ID)
         {
            param1.createTreasureByBaowuArr(param2);
         }
      }
      
      private function createTreasureByID(param1:ScenePlayer3D, param2:int, param3:int) : void
      {
         if(SceneModel.ins.stcStageVo.kind == 4 || SceneModel.ins.stcStageVo.kind == 41 || SceneModel.ins.stcStageVo.id == DefindConsts.SHEN_YUAN_STAGE_ID)
         {
            param1.createTreasure(param2,param3);
         }
      }
      
      public function addFamilyBoss(param1:int, param2:int, param3:Point) : FamilybossUnit3D
      {
         var _loc4_:StcNpcGroupVo = StcMgr.ins.getNpcGroupVo(param2);
         var _loc7_:StcNpcVo = StcMgr.ins.getNpcVo(_loc4_.display_npc);
         var _loc5_:FamilybossUnit3D = new FamilybossUnit3D(avatarLayer);
         _loc5_.sceneBase = this;
         _loc5_.initByStcNpcId(_loc7_.id,true);
         _loc5_.tag3DVBox.initName(LocaleMgr.ins.getStr(_loc7_.name),16723968);
         _loc5_.x2d = param3.x;
         _loc5_.y2d = param3.y;
         var _loc6_:FamilyBossSceneCtrl_Boss = new FamilyBossSceneCtrl_Boss(_loc5_);
         _loc6_.init(this);
         _loc6_.npcRelationId = param1;
         ctrlArr.push(_loc6_);
         this.monsterArr.push(_loc5_);
         return _loc5_;
      }
      
      public function addSubpalaceBoss(param1:int, param2:int, param3:int) : SubpalaceBossUnit3D
      {
         var _loc4_:SubpalaceBossUnit3D = new SubpalaceBossUnit3D(avatarLayer);
         _loc4_.initByStcNpcId(param1);
         var _loc5_:SubpalaceBossSceneCtrl = new SubpalaceBossSceneCtrl(_loc4_,param2,param3);
         _loc5_.npcRelationId = param1;
         _loc5_.init(this);
         ctrlArr.push(_loc5_);
         _loc4_.x2d = 600;
         _loc4_.y2d = 500;
         monsterCtrArr.push(_loc5_);
         this.monsterArr.push(_loc4_);
         return _loc4_;
      }
      
      public function removeSubpalaceBoss() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = monsterCtrArr;
         for each(var _loc1_ in monsterCtrArr)
         {
            _loc1_.dispose();
            _loc1_ = null;
         }
         monsterCtrArr = [];
      }
      
      public function removeAllFamilyBoss() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = monsterCtrArr;
         for each(var _loc1_ in monsterCtrArr)
         {
            _loc1_.dispose();
            _loc1_ = null;
         }
         monsterCtrArr = null;
      }
      
      public function autoTrack(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = ctrlArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = ctrlArr[_loc4_];
            if(_loc2_.npcRelationId == param1)
            {
               _loc2_.triggerAutoTrack();
            }
            _loc4_++;
         }
      }
      
      public function autoTrackByFuncId(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = ctrlArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = ctrlArr[_loc4_];
            if(_loc2_.npcRelationVo.mount_func == param1)
            {
               _loc2_.triggerAutoTrack();
            }
            _loc4_++;
         }
      }
      
      public function goToLottery() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:int = ctrlArr.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = ctrlArr[_loc3_];
            _loc1_.triggerLottery();
            _loc3_++;
         }
      }
      
      public function removeFamilyBoss(param1:SceneUnit3D) : void
      {
         if(this.monsterArr)
         {
            ArrayUtil.removeItem(this.monsterArr,param1);
            param1.dispose();
         }
      }
      
      public function removeOtherRole(param1:UInt64) : void
      {
         var _loc2_:Unit3DBase = Uint64Util.disposeAndRemoveItemByAttr(otherRoleArr,"roleId",param1);
         if(_loc2_ && _loc2_.showByLimite)
         {
            this.showByLimiteCount--;
         }
      }
      
      public function addNpcByNpcRelationId(param1:int, param2:Boolean = true) : SceneNpc3D
      {
         var _loc4_:* = null;
         var _loc3_:StcStageNpcRelationVo = StcMgr.ins.getStageNpcRelationVo(param1);
         if(_loc3_.display_npc)
         {
            _loc4_ = this.addNpcByStcNpcId(_loc3_.display_npc,param2);
            if(this.lightCtrl)
            {
               _loc4_.lightPicker = this.lightCtrl.lightPicker;
            }
            _loc4_.npcGroupId = _loc3_.id;
            _loc4_.visible = SettingModel.ins.npcDisplay == 0;
            if(_loc4_.avatar)
            {
               _loc4_.avatar.effectsVisible = SettingModel.ins.otherSpecEffect == 0;
            }
            if(StringUtils.isNull(_loc3_.name) == false)
            {
               _loc4_.tag3DVBox.initName(LocaleMgr.ins.getStr(_loc3_.name),12798193);
            }
            _loc4_.pos2d = StcNpcGroupConsts.positionToPoi(_loc3_.position);
            _loc4_.setRotation(-90 - StcNpcGroupConsts.positionToRo(_loc3_.position));
            if(_loc3_.icon)
            {
               _loc4_.tag3DVBox.showNpcFuncEff(_loc3_);
               _loc4_.switchMouseEvent(_loc4_.tag3DVBox.npcFuncTag,true);
            }
            ObserverMgr.ins.sendNotice("msg_add_NPC",_loc4_);
            return _loc4_;
         }
         return null;
      }
      
      private function addNpcByStcNpcId(param1:int, param2:Boolean = true) : SceneNpc3D
      {
         var _loc3_:SceneNpc3D = new SceneNpc3D(this.avatarLayer);
         _loc3_.hasAction = param2;
         _loc3_.initByStcNpcId(param1);
         npcArr.push(_loc3_);
         SceneModel.ins.findPathMed.addNpcMapMask(_loc3_);
         return _loc3_;
      }
      
      public function removeNpc(param1:SceneNpc3D) : void
      {
         if(this.npcArr)
         {
            SceneModel.ins.findPathMed.removeNpcMapMask(param1);
            ArrayUtil.removeItem(this.npcArr,param1);
            param1.dispose();
         }
      }
      
      public function get isNpcFuncModel() : Boolean
      {
         return _isNpcFuncModel;
      }
      
      public function set isNpcFuncModel(param1:Boolean) : void
      {
         _isNpcFuncModel = param1;
         isHideOtherRole = param1;
         if(param1)
         {
            ModuleMgr.ins.closeModule(10420);
         }
         else
         {
            ModuleMgr.ins.showModule(10420);
         }
         this.playerMoveCtrl.isActived = !param1;
         switchVisibleUnits(!param1);
      }
      
      public function hideOtherNpcAndAllPlayers(param1:SceneNpc3D) : void
      {
         var _loc2_:* = null;
         if(_isNpcFuncModel)
         {
            return;
         }
         if(param1)
         {
            isHideOtherRole = true;
            this.playerHero.visible = false;
            this.switchOtherRoleVisibleArr(false);
            _loc2_ = this.npcArr.concat();
            ArrayUtil.removeItem(_loc2_,param1);
            this.switchVisibleArr(_loc2_,false);
         }
         else
         {
            isHideOtherRole = false;
            this.playerHero.visible = true;
            this.switchOtherRoleVisibleArr(true);
            this.switchVisibleArr(this.npcArr,true);
         }
      }
      
      public function hideOtherNpcAndPlayers(param1:SceneNpc3D) : void
      {
         var _loc2_:* = null;
         if(param1)
         {
            isHideOtherRole = true;
            this.switchOtherRoleVisibleArr(false);
            _loc2_ = this.npcArr.concat();
            ArrayUtil.removeItem(_loc2_,param1);
            this.switchVisibleArr(_loc2_,false);
         }
         else
         {
            isHideOtherRole = false;
            this.switchOtherRoleVisibleArr(true);
            this.switchVisibleArr(this.npcArr,true);
         }
      }
      
      private function switchVisibleNpcs(param1:Boolean) : void
      {
         this.switchVisibleArr(this.npcArr,param1);
      }
      
      private function validateOtherRole() : void
      {
         this.limitVisibleRole();
      }
      
      private function switchVisibleUnits(param1:Boolean) : void
      {
         this.switchOtherRoleVisibleArr(param1);
         this.switchVisibleArr(this.npcArr,param1);
         this.playerHero.visible = param1;
      }
      
      private function switchOtherRoleVisibleArr(param1:Boolean, param2:int = -1) : void
      {
         switchVisibleArr(this.otherRoleArr,param1);
      }
      
      private function switchVisibleArr(param1:Array, param2:Boolean, param3:int = -1) : void
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = param1.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = param1[_loc6_];
            if(_loc6_ < param3 || param3 == -1)
            {
               switchVisible(_loc4_,param2);
            }
            else
            {
               switchVisible(_loc4_,false);
            }
            _loc6_++;
         }
      }
      
      public function countShowByLimiteMax() : void
      {
         var _loc1_:int = 0;
         if(SettingModel.ins.otherPlayers != 0 || PlayerModel.ins.level < DefindConsts.SHOW_OTHER_ROLE_LEVEL)
         {
            showByLimiteMax = 0;
            return;
         }
         switch(int(SettingModel.ins.peopleNum))
         {
            case 0:
               _loc1_ = 5;
               break;
            case 1:
               _loc1_ = 15;
               break;
            case 2:
               _loc1_ = 30;
         }
         showByLimiteMax = _loc1_;
      }
      
      private function limitVisibleRole() : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc1_:Array = this.otherRoleArr;
         countShowByLimiteMax();
         var _loc3_:int = _loc1_.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = _loc1_[_loc4_];
            if(_loc4_ < showByLimiteMax)
            {
               _loc2_.showByLimite = true;
               showByLimiteCount = Number(showByLimiteCount) + 1;
            }
            else
            {
               _loc2_.showByLimite = false;
            }
            _loc4_++;
         }
      }
      
      private function switchVisibleUnitsEffects(param1:Boolean) : void
      {
         this.switchEffectArr(this.otherRoleArr,param1);
         this.switchEffectArr(this.npcArr,param1);
      }
      
      private function switchEffectArr(param1:Array, param2:Boolean) : void
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = param1.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            switchEffectVisible(_loc3_,param2);
            _loc5_++;
         }
      }
      
      public function switchEffectVisible(param1:SceneUnit3D, param2:Boolean) : void
      {
         if(param1.avatar)
         {
            param1.avatar.effectsVisible = param2;
         }
      }
      
      public function switchVisible(param1:SceneUnit3D, param2:Boolean) : void
      {
         param1.visible = param2;
      }
      
      private function serverCpl_enterSceneOther(param1:EnterSceneOtherPlayerNotify) : void
      {
         this.addOtherRole(param1.player);
      }
      
      private function serverCpl_leaveScene(param1:LeaveSceneNotify) : void
      {
         this.removeOtherRole(param1.playerId);
      }
      
      private function serverCpl_wearChangeNotify(param1:WearChangeNotify) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(Uint64Util.equal(param1.uid,SceneModel.ins.playerRole.baseInfo.id))
         {
            if(!(int(param1.kind) - 21))
            {
               SceneModel.ins.playerRole.pet = param1.pet;
               _loc4_ = PlayerModel.ins.playerInfo.name;
               this.createPet(this.playerHero,param1.pet,_loc4_,ColorLib.qualityColor(MilitaryModel.ins.getPlayerQuality(PlayerModel.ins.playerInfo.militaryrank)));
            }
         }
         else
         {
            _loc3_ = Uint64Util.findItemByAttr(this.otherRoleArr,"roleId",param1.uid);
            if(_loc3_)
            {
               if(!(int(param1.kind) - 21))
               {
                  _loc2_ = _loc3_.playerInfo.baseInfo.name;
                  this.createPet(_loc3_,param1.pet,_loc2_,ColorLib.qualityColor(MilitaryModel.ins.getPlayerQuality(_loc3_.playerInfo.baseInfo.militaryRank)));
               }
               else
               {
                  _loc3_.changeWear(param1);
               }
            }
         }
      }
      
      public function serverCpl_titleChangeNotify(param1:TitleChangeNotify) : void
      {
         var _loc2_:* = null;
         if(param1)
         {
            if(Uint64Util.equal(param1.id,PlayerModel.ins.playerInfo.id))
            {
               PlayerModel.ins.playerInfo.showTitleId = param1.showTitleId;
               playerHero.tag3DVBox.showTitle(PlayerModel.ins.playerInfo.showTitleId);
            }
            else
            {
               var _loc5_:int = 0;
               var _loc4_:* = SceneModel.ins.roleList.array;
               for each(var _loc3_ in SceneModel.ins.roleList.array)
               {
                  if(_loc3_.baseInfo)
                  {
                     if(Uint64Util.equal(param1.id,_loc3_.baseInfo.id))
                     {
                        _loc3_.showTitleId = param1.showTitleId;
                     }
                  }
               }
               _loc2_ = Uint64Util.findItemByAttr(this.otherRoleArr,"roleId",param1.id);
               if(_loc2_)
               {
                  _loc2_.changeTitle(param1);
               }
            }
         }
      }
      
      private function server_playerMoveNotify(param1:PlayerMoveNotify) : void
      {
         var _loc8_:int = 0;
         var _loc4_:* = null;
         var _loc3_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc2_:Array = param1.infos;
         var _loc5_:int = _loc2_.length;
         _loc8_ = 0;
         while(_loc8_ < _loc5_)
         {
            _loc4_ = _loc2_[_loc8_];
            if(!Uint64Util.equal(_loc4_.id,PlayerModel.ins.playerInfo.id))
            {
               _loc3_ = this.otherRoleArr.length;
               _loc6_ = 0;
               while(_loc6_ < _loc3_)
               {
                  _loc7_ = this.otherRoleArr[_loc6_];
                  if(Uint64Util.equal(_loc7_.roleId,_loc4_.id))
                  {
                     _loc7_.runTo(_loc4_.x,_loc4_.y);
                     return;
                  }
                  _loc6_++;
               }
            }
            _loc8_++;
         }
      }
      
      public function get cameraScale() : Number
      {
         return _cameraScale;
      }
      
      public function set cameraScale(param1:Number) : void
      {
         if(this.isDisposed)
         {
            return;
         }
         _cameraScale = param1;
         this.layer3D.scaleAll = param1;
      }
      
      public function get lookAtPos2d() : Point
      {
         return _lookAtPos2d;
      }
      
      public function set lookAtPos2d(param1:Point) : void
      {
         setLookAtPos2d(param1,true);
      }
      
      public function setLookAtPos2d(param1:Point, param2:Boolean) : void
      {
         if(this.isDisposed)
         {
            return;
         }
         if(this.lockCamera)
         {
            return;
         }
         var _loc5_:int = ClientConfig.SCENE_FIXED_W;
         var _loc3_:int = ClientConfig.SCENE_FIXED_H;
         var _loc6_:int = Math.max(0,_loc5_ - UIMgr.gameWidth) / 2;
         var _loc8_:int = Math.max(0,_loc3_ - UIMgr.gameHeight) / 2;
         var _loc4_:Point = param1.clone();
         _loc4_.x = MathUtil.maxMin(_loc4_.x,this.mapConfigVo.sceneSize.x * _cameraScale - _loc5_ / 2 + _loc6_,_loc5_ / 2 - _loc6_);
         _loc4_.y = MathUtil.maxMin(_loc4_.y,this.mapConfigVo.sceneSize.y * _cameraScale - _loc3_ / 2 + _loc8_,_loc3_ / 2 - _loc8_);
         _lookAtPos2d = _loc4_;
         this.multiBgLayer.lookAtPos2d = _loc4_;
         validateCameralookAtPos(param2);
         var _loc7_:Point = new Point(_lookAtPos2d.x / _cameraScale,_lookAtPos2d.y / _cameraScale);
         ObserverMgr.ins.sendNotice("msg_scene_camera_change",_loc7_);
      }
      
      public function get canTweenCamera() : Boolean
      {
         return _canTweenCamera;
      }
      
      public function set canTweenCamera(param1:Boolean) : void
      {
         _canTweenCamera = param1;
      }
      
      protected function validateCameralookAtPos(param1:Boolean) : void
      {
         if(param1 && canTweenCamera)
         {
            if(TimerManager.ins.hasTimer(loopCameraLookAtPos) == false)
            {
               TimerManager.ins.doFrameLoop(1,loopCameraLookAtPos);
            }
         }
         else
         {
            cameraLookAt = _lookAtPos2d;
         }
      }
      
      private function loopCameraLookAtPos() : void
      {
         var _loc5_:Number = NaN;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(isDisposed)
         {
            TimerManager.ins.clearTimer(loopCameraLookAtPos);
            return;
         }
         var _loc1_:Point = _lookAtPos2d;
         var _loc2_:Point = _cameraLookAt;
         if(Math.abs(_loc1_.x - _loc2_.x) <= 1 && Math.abs(_loc1_.y - _loc2_.y) <= 1)
         {
            cameraLookAt = _loc1_;
            TimerManager.ins.clearTimer(loopCameraLookAtPos);
         }
         else
         {
            _loc5_ = 0.08 * TimerManager.ins.overTimerMs / ClientConfig.msPerFrame;
            _loc3_ = new Point();
            _loc3_.x = (_loc1_.x - _loc2_.x) * _loc5_;
            _loc3_.y = (_loc1_.y - _loc2_.y) * _loc5_;
            if(_loc2_.x != _loc1_.x && Math.abs(_loc3_.x) < 1)
            {
               if(_loc1_.x > _loc2_.x)
               {
                  _loc3_.x = 1;
               }
               else
               {
                  _loc3_.x = -1;
               }
            }
            if(_loc2_.y != _loc1_.y && Math.abs(_loc3_.y) < 1)
            {
               if(_loc1_.y > _loc2_.y)
               {
                  _loc3_.y = 1;
               }
               else
               {
                  _loc3_.y = -1;
               }
            }
            _loc4_ = new Point(int(_loc2_.x + _loc3_.x),int(_loc2_.y + _loc3_.y));
            _loc4_.x = int(_loc4_.x);
            _loc4_.y = int(_loc4_.y);
            cameraLookAt = _loc4_;
         }
      }
      
      protected function set cameraLookAt(param1:Point) : void
      {
         if(isDisposed)
         {
            return;
         }
         if(lastChangeTimer == TimerManager.ins.currTimer)
         {
         }
         lastChangeTimer = TimerManager.ins.currTimer;
         _cameraLookAt = param1;
         this.multiBgLayer.updateLayersPositon(param1.x,param1.y);
         var _loc2_:Vector3D = TransformUtil.tran2DTo3DByPoi(_cameraLookAt);
         _loc2_.x = Math.round(_loc2_.x);
         _loc2_.y = Math.round(_loc2_.y);
         _loc2_.z = Math.round(_loc2_.z);
         AppGlobalContext.stage3d.cameraController.lookAtPosition = _loc2_;
         this.ngCtrl.changeArrowPos();
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            SceneModel.ins.addEventListener("modelServerCplPrefix" + 6050,onChangeLine);
            ObserverMgr.ins.regObserver(this);
            ServerEngine.ins.addAlwayHandler(7001,server_playerMoveNotify);
            ServerEngine.ins.addAlwayHandler(8001,serverCpl_enterSceneOther);
            ServerEngine.ins.addAlwayHandler(8002,serverCpl_leaveScene);
            ServerEngine.ins.addAlwayHandler(2006,serverCpl_wearChangeNotify);
            ServerEngine.ins.addAlwayHandler(6703,serverCpl_titleChangeNotify);
         }
         else
         {
            SceneModel.ins.removeEventListener("modelServerCplPrefix" + 6050,onChangeLine);
            ObserverMgr.ins.unregObserver(this);
            SceneModel.ins.removeEventListener("modelServerCplPrefix" + 8003,model_enterScene);
            ServerEngine.ins.removeAlwayHandler(7001,server_playerMoveNotify);
            ServerEngine.ins.removeAlwayHandler(8001,serverCpl_enterSceneOther);
            ServerEngine.ins.removeAlwayHandler(8002,serverCpl_leaveScene);
            ServerEngine.ins.removeAlwayHandler(2006,serverCpl_wearChangeNotify);
         }
      }
      
      override public function dispose() : void
      {
         TimerManager.ins.clearTimer(loopCameraLookAtPos);
         switchEventListeners(false);
         if(_tweenCamera != null)
         {
            _tweenCamera.kill();
            _tweenCamera = null;
         }
         if(this.ngScriptPlayer)
         {
            this.ngScriptPlayer.dispose();
            this.ngScriptPlayer = null;
         }
         if(playerMoveCtrl)
         {
            this.playerMoveCtrl.dispose();
            this.playerMoveCtrl = null;
         }
         if(_tweenMoveCtrl)
         {
            _tweenMoveCtrl.dispose();
            _tweenMoveCtrl = null;
         }
         if(ngCtrl)
         {
            this.ngCtrl.dispose();
            this.ngCtrl = null;
         }
         RTools.disposeArrOrVector(this.ctrlArr);
         if(debugPathMaskImg)
         {
            debugPathMaskImg.dispose();
            debugPathMaskImg = null;
         }
         if(multiBgLayer)
         {
            multiBgLayer.dispose();
            multiBgLayer = null;
         }
         if(this.playerHero)
         {
            this.playerHero.dispose();
            this.playerHero = null;
         }
         RTools.disposeArrOrVector(this.npcArr);
         RTools.disposeArrOrVector(this.otherRoleArr);
         RTools.disposeArrOrVector(this.monsterCtrArr);
         RTools.disposeArrOrVector(this.monsterArr);
         if(this.layer3D)
         {
            this.layer3D.dispose();
            this.layer3D = null;
         }
         super.dispose();
         UIMgr.ins.useFullScreen = false;
      }
      
      public function addDisplay2D(param1:String, param2:DisplayObject) : void
      {
      }
      
      public function addDisplay3D(param1:String, param2:String, param3:ObjectContainer3D = null) : ScriptCmdEffect3DView
      {
         return null;
      }
      
      public function get anchorPoi() : Point
      {
         return null;
      }
      
      public function get isBossBattle() : Boolean
      {
         return false;
      }
      
      public function get cameraX() : int
      {
         return 0;
      }
      
      public function set cameraX(param1:int) : void
      {
      }
      
      public function createTempUnitByNpcId(param1:int, param2:String, param3:String, param4:int, param5:int, param6:int) : UnitView
      {
         return null;
      }
      
      public function deleteDisplay2D(param1:String) : void
      {
      }
      
      public function deleteDisplay3D(param1:String) : void
      {
      }
      
      public function deleteUnit(param1:String) : void
      {
      }
      
      public function getDisplay2DById(param1:String) : DisplayObject
      {
         return null;
      }
      
      public function getDisplay3DById(param1:String) : ScriptCmdEffect3DView
      {
         return null;
      }
      
      public function getUnitById(param1:String) : Array
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc4_:* = null;
         if(param1.indexOf(":") != -1)
         {
            _loc3_ = param1.split(":").shift();
            _loc5_ = param1.split(":")[1];
         }
         else if(param1 == "major")
         {
            _loc2_ = new UnitVo();
            _loc2_.name = PlayerModel.ins.playerInfo.name;
            _loc2_.isAttack = 1;
            _loc2_.npc_id = HeroModel.ins.playerHero.baseInfo.baseId;
            _loc4_ = new UnitView(null,null);
            _loc4_.vo = _loc2_;
            _loc4_.avatarBody = this.playerHero.avatar;
            return [_loc4_];
         }
         return [];
      }
      
      public function get topLayer2D() : Component
      {
         return ModuleMgr.ins.dramaLayer;
      }
      
      private function test_change_scta() : void
      {
         if(Specter3DStage.DEAFULT_TITLE_ANGLE != TransformUtil.scta)
         {
            if(AppGlobalContext.stage3d.camera3d.rotationX == TransformUtil.lastCameraRoX)
            {
               TweenLite.delayedCall(1,this.test_change_scta,null,true);
            }
            else
            {
               this.multiBgLayer.rotationX = -(90 - AppGlobalContext.stage3d.camera3d.rotationX);
               this.lookAtPos2d = this.lookAtPos2d;
            }
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["msg_game_resize","TEST_CHANGE_SCTA","MSG_SEE_OTHER_PLAYERS_SWITCH","MSG_SCENE_PATH_MASK","guild_notice_update_role_guild_data","evtFashionUsingChange","evtChangePlayerNameColor","MSG_SEE_NPCS_SWITCH","MSG_SEE_SCENE_EFFECT_SWITCH","MSG_SEE_OTHERS_EFFECT_SWITCH","MSG_SEE_OTHERS_NUMBER_SWITCH","MSG_MINIMAP_POS_CHANGE","msg_update_role_title"];
      }
      
      protected function onGameResize() : void
      {
         this.lookAtPos2d = this.lookAtPos2d;
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if("msg_game_resize" !== _loc4_)
         {
            if("TEST_CHANGE_SCTA" !== _loc4_)
            {
               if("MSG_SEE_OTHER_PLAYERS_SWITCH" !== _loc4_)
               {
                  if("MSG_SCENE_PATH_MASK" !== _loc4_)
                  {
                     if("guild_notice_update_role_guild_data" !== _loc4_)
                     {
                        if("evtFashionUsingChange" !== _loc4_)
                        {
                           if("evtChangePlayerNameColor" !== _loc4_)
                           {
                              if("MSG_SEE_NPCS_SWITCH" !== _loc4_)
                              {
                                 if("MSG_SEE_SCENE_EFFECT_SWITCH" !== _loc4_)
                                 {
                                    if("MSG_SEE_OTHERS_EFFECT_SWITCH" !== _loc4_)
                                    {
                                       if("MSG_SEE_OTHERS_NUMBER_SWITCH" !== _loc4_)
                                       {
                                          if("MSG_MINIMAP_POS_CHANGE" !== _loc4_)
                                          {
                                             if("msg_update_role_title" === _loc4_)
                                             {
                                                if(PlayerModel.ins.playerInfo.showTitleId > 0)
                                                {
                                                   playerHero.tag3DVBox.showTitle(PlayerModel.ins.playerInfo.showTitleId);
                                                }
                                                else
                                                {
                                                   playerHero.tag3DVBox.hideTitle();
                                                }
                                             }
                                          }
                                          else
                                          {
                                             _loc3_ = param2 as Point;
                                             this.playerHero.runTo(_loc3_.x,_loc3_.y);
                                          }
                                       }
                                       else
                                       {
                                          this.limitVisibleRole();
                                       }
                                    }
                                    else
                                    {
                                       this.switchVisibleUnitsEffects(SettingModel.ins.otherSpecEffect == 0);
                                    }
                                 }
                                 else
                                 {
                                    this.switchVisibleNpcs(SettingModel.ins.npcDisplay == 0);
                                 }
                              }
                              else
                              {
                                 this.switchVisibleNpcs(SettingModel.ins.npcDisplay == 0);
                              }
                           }
                           else
                           {
                              playerHero.tag3DVBox.initName(PlayerModel.ins.getPlayerNameWithAccType(PlayerModel.ins.playerInfo.name,PlayerModel.ins.playerInfo.gmType,PlayerModel.ins.dist),ColorLib.qualityColor(MilitaryModel.ins.getPlayerQuality(PlayerModel.ins.playerInfo.militaryrank)),0,PlayerModel.ins.vipInfoVo);
                           }
                        }
                        else
                        {
                           PlayerModel.ins.changePlayerViewByPlayerInfo(playerHero,PlayerModel.ins.playerInfo);
                        }
                     }
                     else if(PlayerModel.ins.playerInfo.familyId)
                     {
                        playerHero.tag3DVBox.showGuildName(PlayerModel.ins.playerInfo.familyName);
                     }
                     else
                     {
                        playerHero.tag3DVBox.hideGuildName();
                     }
                  }
                  else if(debugPathMaskImg == null)
                  {
                     debugPathMaskImg = new Image3D(null,multiBgLayer.configVo.sceneSize.x,multiBgLayer.configVo.sceneSize.y,0,false);
                     debugPathMaskImg.renderLayer = Entity.ALL_LAYER;
                     debugPathMaskImg.showByBmd(SceneModel.ins.findPathMed.curPathMaskBmd);
                     debugPathMaskImg.x = debugPathMaskImg.initW / 2;
                     debugPathMaskImg.y = -debugPathMaskImg.initH / 2;
                     debugPathMaskImg.alpha = 0.2;
                     this.multiBgLayer.bgAllLayer.addChild(debugPathMaskImg);
                  }
                  else
                  {
                     debugPathMaskImg.dispose();
                     debugPathMaskImg = null;
                  }
               }
               else
               {
                  this.validateOtherRole();
               }
            }
            else
            {
               test_change_scta();
            }
         }
         else
         {
            onGameResize();
         }
      }
      
      public function setOtherRolePos(param1:UInt64, param2:Point) : void
      {
         var _loc3_:* = null;
         var _loc4_:SceneUnit3D = Uint64Util.findItemByAttr(this.otherRoleArr,"roleId",param1);
         if(_loc4_)
         {
            _loc3_ = getOtherPlayerPos(param2);
            _loc4_.pos2d = param2;
         }
      }
   }
}
