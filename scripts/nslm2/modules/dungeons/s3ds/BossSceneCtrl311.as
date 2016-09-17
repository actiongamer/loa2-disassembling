package nslm2.modules.dungeons.s3ds
{
   import away3d.cameras.Camera3D;
   import flash.geom.Vector3D;
   import nslm2.utils.TransformUtil;
   import nslm2.modules.fightPlayer.UnitView;
   import nslm2.modules.dungeons.ctrls.UnitEnterOriCtrl;
   import org.specter3d.display.Specter3D;
   import org.specter3d.display.avatar2.WeaponObject;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcModelVo;
   import nslm2.modules.fightPlayer.FactoryUtil;
   import com.mz.core.configs.ClientConfig;
   import com.greensock.TweenLite;
   import nslm2.common.scene.multiLayer.BgLayer;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.utils.Effect3DUtils;
   import org.specter3d.display.particle.SpecterEffect;
   import away3d.entities.Entity;
   import com.mz.core.utils2.ShakeUtil;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSpecialEffectVo;
   import away3d.containers.ObjectContainer3D;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.dungeons.DungeonSceneModule;
   
   public class BossSceneCtrl311 extends BossSceneCtrlBase
   {
      
      public static const MODEL_1:int = 900001;
      
      public static const MODEL_2:int = 900002;
       
      
      private var _transProcess:Number = 0;
      
      private var voArr:Array;
      
      private var transDuration:Number = 2;
      
      private var transDelay:Number = 1;
      
      public var flootBox3D:Specter3D;
      
      public var floorModel3D:Specter3D;
      
      private var floor2Arr:Vector.<WeaponObject>;
      
      private var scriptIsEnd:Boolean;
      
      private var bossEnterEnd:Boolean;
      
      public function BossSceneCtrl311(param1:DungeonSceneModule, param2:UnitView)
      {
         $dg = param1;
         $bossView = param2;
         voArr = [];
         floor2Arr = new Vector.<WeaponObject>();
         super($dg,$bossView);
         this.dg.rightUnitViewHash.array.forEach(function(param1:UnitView, ... rest):void
         {
            param1.visible = false;
            if(param1.shadow)
            {
               param1.shadow.visible = false;
            }
         });
      }
      
      public function get camera3d() : Camera3D
      {
         return dg.camera3d;
      }
      
      override public function exec() : void
      {
         super.exec();
         play();
      }
      
      public function set transProcess(param1:Number) : void
      {
         if(this.isStop)
         {
            return;
         }
         _transProcess = param1;
         var _loc2_:Camera3D = this.camera3d;
         _loc2_.position = new Vector3D(TransformUtil.cameraPos2a.x + (TransformUtil.cameraPos2.x - TransformUtil.cameraPos2a.x) * _transProcess,TransformUtil.cameraPos2a.y + (TransformUtil.cameraPos2.y - TransformUtil.cameraPos2a.y) * _transProcess,TransformUtil.cameraPos2a.z + (TransformUtil.cameraPos2.z - TransformUtil.cameraPos2a.z) * _transProcess);
         _loc2_.rotationX = TransformUtil.cameraRo2a.x + (TransformUtil.cameraRo2.x - TransformUtil.cameraRo2a.x) * _transProcess;
         _loc2_.rotationY = TransformUtil.cameraRo2a.y + (TransformUtil.cameraRo2.y - TransformUtil.cameraRo2a.y) * _transProcess;
         dg.validateBgBox(true);
      }
      
      public function get transProcess() : Number
      {
         return _transProcess;
      }
      
      private function play() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc1_:* = null;
         dg.dunGeonBgLayer.disposeParts();
         if(dg.currentSubSceneIndex == 0)
         {
            play1();
         }
         else
         {
            _loc3_ = dg.unitViewHash.array.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc2_ = dg.unitViewHash.array[_loc4_];
               _loc2_.vo.oriXY.x = 1000;
               _loc4_++;
            }
            _loc1_ = new UnitEnterOriCtrl(this.dg,true,true,true);
            _loc1_.addCompleteHandler(this.play1).exec();
         }
      }
      
      private function play1() : void
      {
         var _loc4_:* = null;
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc1_:* = null;
         _loc4_ = null;
         _loc3_ = 0;
         _loc5_ = 0;
         var _loc2_:* = null;
         this.dg.dunGeonBgLayer.switchLayerKind(3);
         flootBox3D = new Specter3D();
         this.dg.layer3d.addChild(new Specter3D());
         floorModel3D = new WeaponObject(null);
         (floorModel3D as WeaponObject).mipmap = false;
         _loc4_ = StcMgr.ins.getModelVo(900001);
         (floorModel3D as WeaponObject).initAvatar(_loc4_.path_mesh,_loc4_.path_texture);
         floorModel3D.scaleAll = 2.7;
         this.flootBox3D.addChild(floorModel3D);
         _loc3_ = 3;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc1_ = new WeaponObject();
            _loc1_.mipmap = false;
            _loc4_ = StcMgr.ins.getModelVo(900002);
            _loc1_.initAvatar(_loc4_.path_mesh,_loc4_.path_texture);
            _loc1_.scaleAll = 2.7;
            _loc1_.x = -470 + _loc5_ * -463;
            flootBox3D.addChild(_loc1_);
            if(dg.debugCtrl)
            {
               dg.debugCtrl.addDebugObject(_loc1_,"floor2" + _loc5_);
            }
            _loc5_++;
         }
         flootBox3D.x = 900;
         if(dg.debugCtrl)
         {
            dg.debugCtrl.addDebugObject(floorModel3D,"floor 1");
            dg.debugCtrl.addDebugObject(flootBox3D,"floor box",4);
            dg.debugCtrl.addDebugObject(this.dg.fightLayer3D,"fightLayer3D",4);
            dg.debugCtrl.addDebugObject(this.dg.dunGeonBgLayer.bgLayers[0].img3D,"bg",4);
         }
         play11();
         TransformUtil.cameraToBattlePerspective2a();
         dg.validateBgBox(true);
         TweenLite.to(this,transDuration,{
            "delay":transDelay,
            "transProcess":1
         });
         _loc3_ = this.dg.dunGeonBgLayer.bgLayers.length;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc2_ = this.dg.dunGeonBgLayer.bgLayers[_loc5_];
            if(_loc2_.configVo && _loc2_.configVo.kind == 3)
            {
               if(_loc2_.tileImg)
               {
                  TweenLite.to(_loc2_.tileImg,transDuration,{
                     "delay":transDelay,
                     "x":-ClientConfig.SCENE_BG_W / 2
                  });
               }
               else if(_loc2_.img3D)
               {
                  TweenLite.to(_loc2_.img3D,transDuration,{
                     "delay":transDelay,
                     "x":275
                  });
               }
            }
            _loc5_++;
         }
      }
      
      private function play11() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         if(isStop)
         {
            return;
         }
         this.makeAvatarAllToOriPos();
         var _loc2_:int = dg.unitViewHash.array.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = dg.unitViewHash.array[_loc3_];
            _loc1_.x = _loc1_.x - 600;
            _loc3_++;
         }
         if(ClientConfig.firstBattle)
         {
            TweenLite.delayedCall(2 + transDelay,this.bossEnter);
         }
         else
         {
            bossEnter();
         }
         TweenLite.delayedCall(this.transDelay,play11b);
      }
      
      private function play11b() : void
      {
         var _loc1_:UnitEnterOriCtrl = new UnitEnterOriCtrl(this.dg,true,true);
         _loc1_.exec();
         this.dg.playScript(true,scriptPlayerEnd);
      }
      
      private function scriptPlayerEnd() : void
      {
         if(isStop)
         {
            return;
         }
         scriptIsEnd = true;
         validateNext();
      }
      
      private function bossEnter() : void
      {
         bossView.visible = true;
         if(ClientConfig.firstBattle)
         {
            bossView.action = "std_2";
         }
         else
         {
            bossView.action = "run";
         }
         if(ClientConfig.firstBattle)
         {
            TweenLite.from(bossView.avatarBox,0.35,{
               "y":1200,
               "onComplete":this.bossEnterCpl
            });
            TweenLite.delayedCall(0.25,this.playBossEnterEff);
            TweenLite.delayedCall(0.3,this.playBossEnterShake);
         }
         else
         {
            TweenLite.from(bossView.avatarBox,3,{
               "x":2000,
               "y":-1200,
               "onComplete":this.bossEnterCpl
            });
            TweenLite.delayedCall(0.3,this.playBossEnterShake);
         }
      }
      
      public function playBossEnterEff() : void
      {
         var _loc1_:* = null;
         if(isStop)
         {
            return;
         }
         if(ClientConfig.firstBattle)
         {
            _loc1_ = EffectManager.createEffect(Effect3DUtils.getUrlBySid(13000),true,bossView.avatarBox);
            _loc1_.renderLayer = Entity.ALL_LAYER;
            _loc1_.scaleAll = 8.64;
         }
      }
      
      public function playBossEnterShake() : void
      {
         if(isStop)
         {
            return;
         }
         ShakeUtil.shake(false,dg.layer3d,0,8,16,50);
         ShakeUtil.shake(true,UIMgr.layer2D,0,8,16,50);
      }
      
      private function bossEnterCpl() : void
      {
         if(isStop)
         {
            return;
         }
         bossEnterEnd = true;
         validateNext();
      }
      
      private function validateNext() : void
      {
         if(isStop)
         {
            return;
         }
         if(scriptIsEnd == false || bossEnterEnd == false)
         {
            return;
         }
         bossView.action = "skill_3";
         var _loc1_:int = bossView.avatarBody.getAnimationTotalTime(bossView.action);
         if(ClientConfig.firstBattle)
         {
            TweenLite.delayedCall(1.6,playSkillShake);
         }
         else
         {
            TweenLite.delayedCall(_loc1_ > 0?_loc1_ / 1000 - 1.5:0.4,playSkillShake);
         }
         TweenLite.delayedCall(_loc1_ > 0?_loc1_ / 1000:0.5,playBossSkillCpl);
      }
      
      private function playSkillShake() : void
      {
         ShakeUtil.shake(false,dg.layer3d,2,16,6,30);
         ShakeUtil.shake(true,UIMgr.layer2D,2,16,4,30);
      }
      
      private function playSelfEff(param1:int) : void
      {
         if(this.isStop)
         {
            return;
         }
         var _loc4_:StcSpecialEffectVo = StcMgr.ins.getSpecialEffectVo(param1);
         var _loc3_:ObjectContainer3D = bossView.avatarBody.avatarMesh;
         if(_loc4_.tag != "" && _loc4_.tag != "0")
         {
            _loc3_ = bossView.avatarBody.getBoneTagByName(_loc4_.tag);
         }
         var _loc2_:SpecterEffect = EffectManager.createEffect(UrlLib.e3d_particle(_loc4_.effect),true,_loc3_,null,_loc4_.over_time,true,1,"default_group");
         _loc2_.scaleX = _loc2_.scaleX * -1;
      }
      
      private function playBossSkillCpl() : void
      {
         bossView.action = "std_2";
         showAvatarAll();
         onComplete();
      }
      
      private function get sceneOffsetX() : int
      {
         return dg.dgVo.subSceneW * dg.currentSubSceneIndex;
      }
      
      private function hideAvatar() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:int = dg.unitViewHash.array.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = dg.unitViewHash.array[_loc3_];
            _loc1_.visible = false;
            _loc3_++;
         }
      }
      
      private function showAvatarAll() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         if(isStop)
         {
            return;
         }
         var _loc2_:int = dg.unitViewHash.array.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = dg.unitViewHash.array[_loc3_];
            _loc1_.visible = true;
            _loc3_++;
         }
         _loc2_ = dg.rightUnitViewHash.array.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = dg.rightUnitViewHash.array[_loc3_];
            _loc1_.visible = true;
            _loc3_++;
         }
      }
      
      private function makeAvatarAllToOriPos() : void
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc1_:Number = NaN;
         var _loc4_:int = dg.unitViewHash.array.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = dg.unitViewHash.array[_loc5_];
            _loc3_.vo.init(true);
            _loc2_ = _loc3_.avatarBox.position;
            _loc3_.init();
            _loc1_ = _loc3_.avatarBody.scaleAll;
            _loc5_++;
         }
         _loc4_ = dg.rightUnitViewHash.array.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = dg.rightUnitViewHash.array[_loc5_];
            _loc3_.vo.init(true);
            _loc3_.init();
            _loc5_++;
         }
      }
      
      override public function dispose() : void
      {
         if(floorModel3D)
         {
            floorModel3D.dispose();
            floorModel3D = null;
         }
         super.dispose();
      }
   }
}
