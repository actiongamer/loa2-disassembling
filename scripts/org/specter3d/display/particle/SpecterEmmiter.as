package org.specter3d.display.particle
{
   import org.specter3d.display.Specter3D;
   import org.specter3d.configs.particle.EmmiterData;
   import org.specter3d.display.avatar2.AvatarBody3D;
   import org.specter3d.display.AniTrailEffect;
   import away3d.materials.methods.SimpleCutMethod;
   import flash.utils.getTimer;
   import org.specter3d.configs.particle.MeshData;
   import away3d.materials.TextureMaterial;
   import flash.geom.Vector3D;
   import org.specter3d.debug.DebugEngineLog;
   import org.specter3d.display.avatar2.data.AnimData;
   import flash.events.Event;
   import org.specter3d.events.Avatar3DEvent;
   import away3d.containers.ObjectContainer3D;
   import org.specter3d.configs.particle.KeyFrameData;
   import org.specter3d.utils.DelayTimers;
   import org.specter3d.utils.FunctionDelegate;
   import org.specter3d.context.AppGlobalContext;
   import com.mz.core.mgrs.UIMgr;
   import away3d.events.AnimatorEvent;
   import flash.utils.Dictionary;
   import org.specter3d.configs.particle.SpecterParticleData;
   import away3d.entities.Entity;
   import org.specter3d.configs.Specter3DConfig;
   
   public class SpecterEmmiter extends Specter3D
   {
      
      public static const ON_EMMITER_RESET:String = "on_emmiter_reset";
      
      private static const REG:RegExp = /\\/g;
      
      private static const KEY_FRAME_TIME:Number = 16.666666666666668;
       
      
      public var parentUrl:String;
      
      private var _particle:org.specter3d.display.particle.SpecterParticle;
      
      private var _emmiterData:EmmiterData;
      
      private var _followContainer:org.specter3d.display.particle.FollowParticleContainer;
      
      private var _driver:org.specter3d.display.particle.ParticleDirver;
      
      public var isVisible:Boolean = true;
      
      private var _startTime:Number = 0;
      
      private var _timeOffset:Number = 0;
      
      private var _alphaValue:Number = 1;
      
      private var _avatarBody:AvatarBody3D;
      
      public var isKeyFrameFinish:Boolean = false;
      
      public var useFlowUV:Boolean;
      
      private var _aniTrailEffect:AniTrailEffect;
      
      private var _autoPlay:Boolean = false;
      
      private var _baseSpeed:Number = 1;
      
      private var _speedRate:Number = 1;
      
      private var _callbackOnReady:Function;
      
      private var _shakeDisabled:Boolean;
      
      private var _frameLife:Number = 0;
      
      private var _frameTime:Number = 0;
      
      private var _frameOffsetTime:Number = 0;
      
      private var _renderLayer:uint;
      
      private var _delayTimerDic:Dictionary;
      
      public function SpecterEmmiter(param1:org.specter3d.display.particle.ParticleDirver, param2:EmmiterData, param3:Number = 0, param4:Boolean = true, param5:Number = 1)
      {
         _renderLayer = Entity.EFFECT_LAYER;
         _shakeDisabled = false;
         _delayTimerDic = new Dictionary();
         super(new Specter3DConfig(1));
         _emmiterData = param2;
         if(_emmiterData && _emmiterData.renderLayer != Entity.ALL_LAYER)
         {
            _renderLayer = _emmiterData.renderLayer;
         }
         _driver = param1;
         _driver.emmiterData = _emmiterData;
         _timeOffset = param3;
         _autoPlay = param4;
         _speedRate = param5;
      }
      
      public function get avatarBody() : AvatarBody3D
      {
         return _avatarBody;
      }
      
      public function set avatarBody(param1:AvatarBody3D) : void
      {
         _avatarBody = param1;
         if(_avatarBody && _driver && _driver.pData.yCut)
         {
            _avatarBody.addMethod(new SimpleCutMethod());
         }
      }
      
      public function addCallbackOnReady(param1:Function) : void
      {
         _callbackOnReady = param1;
      }
      
      public function removeCallbackOnReady(param1:Function) : void
      {
         _callbackOnReady = null;
      }
      
      public function set shakeDisabled(param1:Boolean) : void
      {
         _shakeDisabled = param1;
      }
      
      public function set alphaValue(param1:Number) : void
      {
         _alphaValue = param1;
         if(animator && _driver && _driver.animationSet)
         {
            (animator as SpecterParticleAnimator).updateAlpha(param1);
         }
         if(avatarBody && avatarBody.alpha != param1)
         {
            avatarBody.alpha = param1;
         }
      }
      
      public function get alphaValue() : Number
      {
         return _alphaValue;
      }
      
      public function set renderLayer(param1:uint) : void
      {
         _renderLayer = param1;
         _particle && _loc2_;
         if(avatarBody != null && avatarBody.avatarMesh != null)
         {
            avatarBody.avatarMesh.renderLayer = param1;
         }
      }
      
      public function get renderLayer() : uint
      {
         return _renderLayer;
      }
      
      public function createParticle() : void
      {
         _startTime = getTimer();
         _particle = new org.specter3d.display.particle.SpecterParticle(_driver);
         _particle.renderLayer = this._renderLayer;
         if(_driver.isFollow)
         {
            _followContainer = new org.specter3d.display.particle.FollowParticleContainer();
            addChild(_followContainer);
         }
         _driver.addCallbackOnReady(onDriverLoaded);
      }
      
      private function onDriverLoaded(param1:org.specter3d.display.particle.ParticleDirver) : void
      {
         if(_callbackOnReady != null)
         {
            _callbackOnReady(this);
            _callbackOnReady = null;
         }
      }
      
      public function start(param1:int) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         var _loc4_:* = undefined;
         var _loc5_:* = null;
         if(useFlowUV)
         {
            return;
         }
         var _loc6_:MeshData = pData.meshData;
         if(_loc6_.shapeType == "trail")
         {
            if(_aniTrailEffect)
            {
               _aniTrailEffect.dispose();
            }
            _aniTrailEffect = new AniTrailEffect(driver.material as TextureMaterial);
            _aniTrailEffect.setRange(new Vector3D(_loc6_.x_a,_loc6_.y_a,_loc6_.z_a),new Vector3D(_loc6_.x_b,_loc6_.y_b,_loc6_.z_b));
            _aniTrailEffect.fragments = _loc6_.fragments;
            _aniTrailEffect.fadeOut = _loc6_.fadeOut;
            _aniTrailEffect.offsetU = _loc6_.offset_u;
            _aniTrailEffect.offsetV = _loc6_.offset_v;
            _aniTrailEffect.uvRotation = _loc6_.rotate_uv;
            _aniTrailEffect.startTrail(this,_loc6_.heatFlag);
         }
         _particle.initMesh();
         _baseSpeed = _driver.pData.speed;
         playSpeed = _speedRate;
         if(_particle.mesh.material)
         {
            if(_driver.isFollow)
            {
               _followContainer.addFollowParticle(_particle);
            }
            else
            {
               addChild(_particle.mesh);
            }
         }
         if(_autoPlay)
         {
            restart(param1);
         }
         else
         {
            visible = isVisible;
            initTransform();
            (animator as SpecterParticleAnimator).playAndStop(0);
         }
         if(emmiterData.modelUrl != "" && emmiterData.modelTextureUrl != "" && emmiterData.modelAction != "" && !avatarBody)
         {
            if(emmiterData.modelUrl.indexOf(".S3D") != -1)
            {
               DebugEngineLog.toWindowError(emmiterData.modelUrl + "后缀不可大写");
               emmiterData.modelUrl = emmiterData.modelUrl.replace(".S3D",".s3d");
            }
            avatarBody = new AvatarBody3D();
            avatarBody.alpha = emmiterData.alpha;
            avatarBody.alphaBlend = true;
            avatarBody.blendMode = !!emmiterData.modelAddMode?"add":"normal";
            avatarBody.addEventListener("avatar_anim_all_complete",onAvatarBodyInitComplete);
            _loc3_ = emmiterData.modelUrl.replace(REG,"/");
            _loc2_ = _loc3_.lastIndexOf("/");
            _loc3_ = _loc3_.substr(0,_loc2_ + 1);
            _loc4_ = new Vector.<AnimData>();
            _loc5_ = new AnimData(emmiterData.modelAction);
            _loc5_.animUrl = EffectManager.getUrl(_loc3_ + emmiterData.modelAction + ".act");
            _loc4_.push(_loc5_);
            avatarBody.initAvatar(EffectManager.getUrl(emmiterData.modelUrl),EffectManager.getUrl(emmiterData.modelTextureUrl));
            avatarBody.registerAnims(_loc4_);
         }
         if(hasEventListener("complete"))
         {
            dispatchEvent(new Event("complete"));
         }
      }
      
      protected function onAvatarBodyInitComplete(param1:Avatar3DEvent) : void
      {
         avatarBody.removeEventListener("avatar_anim_all_complete",onAvatarBodyInitComplete);
         avatarBody.visible = true;
         avatarBody.bothSides = true;
         avatarBody.avatarMesh.renderLayer = _renderLayer;
         if(emmiterData && emmiterData.modelAction != "")
         {
            avatarBody.action = emmiterData.modelAction;
            addChild(avatarBody as ObjectContainer3D);
         }
      }
      
      private function startShake() : void
      {
         var _loc3_:* = null;
         var _loc1_:* = 0;
         var _loc4_:int = 0;
         if(!_emmiterData || !this._autoPlay || _shakeDisabled)
         {
            return;
         }
         var _loc2_:uint = _emmiterData.keyFrames.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = _emmiterData.keyFrames[_loc4_];
            if(_loc3_.shake > 0)
            {
               _loc1_ = uint(Math.round(_loc3_.keyFrame * 16.6666666666667 / animator.playbackSpeed));
               _delayTimerDic[_loc4_] = new DelayTimers(_loc1_,FunctionDelegate.create(shaking,_loc3_.shake));
            }
            _loc4_++;
         }
      }
      
      public function updateShake(param1:Number = 0) : void
      {
         var _loc4_:* = null;
         var _loc2_:Number = NaN;
         var _loc5_:int = 0;
         if(!_emmiterData)
         {
            return;
         }
         var _loc3_:uint = _emmiterData.keyFrames.length;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ = _emmiterData.keyFrames[_loc5_];
            if(_loc4_.shake > 0)
            {
               _loc2_ = _loc4_.keyFrame * 16.6666666666667 - param1;
               if(_loc2_ >= 0 && _loc2_ - 16.6666666666667 < -0.00001)
               {
                  shaking(_loc4_.shake);
               }
            }
            _loc5_++;
         }
      }
      
      private function shaking(param1:uint) : void
      {
         var _loc2_:* = undefined;
         _loc2_ = UIMgr.root3D;
         switch(int(param1) - 1)
         {
            case 0:
               Shake.shake(_loc2_,param1,2,4,32);
               break;
            case 1:
               Shake.shake(_loc2_,param1,4,40,50);
               break;
            case 2:
               Shake.shake(_loc2_,param1,4,6,80);
         }
      }
      
      private function initTransform() : void
      {
         x = emmiterData.x;
         y = emmiterData.y;
         z = emmiterData.z;
         rotationX = emmiterData.rotationX;
         rotationY = emmiterData.rotationY;
         rotationZ = emmiterData.rotationZ;
         scaleX = emmiterData.scaleX;
         scaleY = emmiterData.scaleY;
         scaleZ = emmiterData.scaleZ;
         alphaValue = emmiterData.alpha;
      }
      
      protected function onEmmiterFinish(param1:AnimatorEvent) : void
      {
         if(animator)
         {
            animator.stop();
            animator.removeEventListener("animator_complete",onEmmiterFinish);
            animator.callbackOnEnterFrame = null;
            visible = false;
            if(hasEventListener(param1.type))
            {
               dispatchEvent(param1);
            }
         }
      }
      
      public function restart(param1:Number = 0) : void
      {
         isKeyFrameFinish = false;
         visible = isVisible;
         initTransform();
         if(animator)
         {
            if(isLoop == false)
            {
               animator.addEventListener("animator_complete",onEmmiterFinish);
            }
            animator.callbackOnEnterFrame = onAnimationFrame;
            animator.start();
            animator.autoUpdate = true;
            _frameOffsetTime = animator.absoluteTime;
            animator.absoluteTime = animator.absoluteTime + (param1 + _timeOffset);
            updateKeyFrame(param1);
            startShake();
            if(avatarBody)
            {
               if(emmiterData.modelAction != "")
               {
                  avatarBody.action = emmiterData.modelAction;
               }
               avatarBody.restart(param1);
            }
         }
      }
      
      private final function onAnimationFrame() : void
      {
         if(animator.autoUpdate)
         {
            updateKeyFrame(animator.absoluteTime - _frameOffsetTime);
         }
      }
      
      public function resetParticle(param1:org.specter3d.display.particle.ParticleDirver = null) : void
      {
         if(_particle)
         {
            if(_particle.mesh)
            {
               if(_driver.isFollow)
               {
                  _followContainer.removeFollowParticle(_particle);
               }
               else
               {
                  removeChild(_particle.mesh);
               }
            }
            _followContainer && removeChild(_followContainer);
            _particle.dispose();
            alphaValue = 1;
         }
         if(param1)
         {
            _driver.removeCallbackOnReady(onDriverLoaded);
            _driver = param1;
         }
         createParticle();
      }
      
      public final function updateKeyFrame(param1:Number) : void
      {
         var _loc4_:Number = NaN;
         var _loc7_:int = 0;
         var _loc13_:* = null;
         var _loc8_:* = null;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc14_:int = 0;
         var _loc6_:int = 0;
         if(_particle && _particle.mesh && this.pData.uvScrollData.usesNode && this.pData.uvScrollData.rotation != 0)
         {
            _particle.mesh.subMeshes[0].uvRotation = param1 / 16.6666666666667 * this.pData.uvScrollData.rotation * 0.0174532925199433;
         }
         _aniTrailEffect && _aniTrailEffect.update();
         var _loc5_:int = _emmiterData.keyFrames.length;
         if(_loc5_ == 0)
         {
            return;
         }
         var _loc2_:int = _loc5_ - 1;
         _frameLife = _emmiterData.keyFrames[_loc2_].keyFrame * 16.6666666666667;
         _frameTime = param1;
         if(_emmiterData.isKeyFramesLoop == true)
         {
            if(_frameTime != 0)
            {
               _loc4_ = _frameTime / _frameLife;
               _loc4_ = _loc4_ - int(_loc4_);
               _loc4_ = _loc4_ == 0?1:Number(_loc4_);
               _frameTime = _loc4_ * _frameLife;
            }
         }
         var _loc3_:int = 0;
         var _loc12_:int = 0;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc7_ = _emmiterData.keyFrames[_loc6_].keyFrame;
            if(_frameTime >= _loc7_ * 16.6666666666667)
            {
               _loc3_ = _loc7_ > 0?_loc7_:0;
               _loc6_++;
               continue;
            }
            break;
         }
         if(_loc6_ > _loc2_)
         {
            if(false || !isKeyFrameFinish)
            {
               isKeyFrameFinish = true;
               _loc8_ = _emmiterData.keyFrames[_loc2_];
               x = _loc8_.x;
               y = _loc8_.y;
               z = _loc8_.z;
               rotationX = _loc8_.rotationX;
               rotationY = _loc8_.rotationY;
               rotationZ = _loc8_.rotationZ;
               scaleX = _loc8_.scaleX;
               scaleY = _loc8_.scaleY;
               scaleZ = _loc8_.scaleZ;
               alphaValue = _loc8_.alpha;
            }
         }
         else
         {
            _loc12_ = _loc3_ > _emmiterData.keyFrames[_loc6_].keyFrame?_loc3_:int(_emmiterData.keyFrames[_loc6_].keyFrame);
            _loc13_ = getFrameDataByFrame(_loc3_);
            _loc8_ = getFrameDataByFrame(_loc12_);
            if(_loc13_ == null)
            {
               if(_loc8_.keyFrame == 1)
               {
                  _loc13_ = _loc8_;
               }
               else
               {
                  _loc13_ = new KeyFrameData();
               }
            }
            _loc10_ = _frameTime - _loc3_ * 16.6666666666667;
            _loc11_ = (_loc12_ - _loc3_) * 16.6666666666667;
            _loc9_ = _loc10_ / _loc11_;
            x = _loc9_ * (_loc8_.x - _loc13_.x) + _loc13_.x;
            y = _loc9_ * (_loc8_.y - _loc13_.y) + _loc13_.y;
            z = _loc9_ * (_loc8_.z - _loc13_.z) + _loc13_.z;
            rotationX = _loc9_ * (_loc8_.rotationX - _loc13_.rotationX) + _loc13_.rotationX;
            rotationY = _loc9_ * (_loc8_.rotationY - _loc13_.rotationY) + _loc13_.rotationY;
            rotationZ = _loc9_ * (_loc8_.rotationZ - _loc13_.rotationZ) + _loc13_.rotationZ;
            scaleX = _loc9_ * (_loc8_.scaleX - _loc13_.scaleX) + _loc13_.scaleX;
            scaleY = _loc9_ * (_loc8_.scaleY - _loc13_.scaleY) + _loc13_.scaleY;
            scaleZ = _loc9_ * (_loc8_.scaleZ - _loc13_.scaleZ) + _loc13_.scaleZ;
            alphaValue = _loc9_ * (_loc8_.alpha - _loc13_.alpha) + _loc13_.alpha;
         }
      }
      
      private function getFrameDataByFrame(param1:int) : KeyFrameData
      {
         var _loc3_:int = 0;
         var _loc2_:int = _emmiterData.keyFrames.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            if(param1 == _emmiterData.keyFrames[_loc3_].keyFrame)
            {
               return _emmiterData.keyFrames[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      public function get isLoop() : Boolean
      {
         return _driver.pData.usesLooping;
      }
      
      public final function get animator() : SpecterParticleAnimator
      {
         if(_particle == null)
         {
            return null;
         }
         return _particle.particleAnimator;
      }
      
      public function set playSpeed(param1:Number) : void
      {
         var _loc2_:* = 0;
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc3_:* = 0;
         var _loc5_:int = 0;
         _speedRate = param1;
         if(animator == null)
         {
            return;
         }
         animator.playbackSpeed = _baseSpeed * _speedRate;
         if(_delayTimerDic != null && _emmiterData != null && _emmiterData.keyFrames != null)
         {
            _loc5_ = _emmiterData.keyFrames.length;
            var _loc9_:int = 0;
            var _loc8_:* = _delayTimerDic;
            for(_loc3_ in _delayTimerDic)
            {
               _loc4_ = _delayTimerDic[_loc3_];
               if(_loc3_ < _loc5_)
               {
                  _loc6_ = _emmiterData.keyFrames[_loc3_];
                  if(_loc4_ != null && _loc6_ != null)
                  {
                     _loc2_ = uint(Math.round(_loc6_.keyFrame * 16.6666666666667 / animator.playbackSpeed));
                     _loc4_.updateDelayTime(_loc2_);
                  }
               }
            }
         }
         if(avatarBody)
         {
            avatarBody.playbackSpeed = _speedRate;
         }
      }
      
      public function set emmiterName(param1:String) : void
      {
         emmiterData.name = param1;
      }
      
      public function get emmiterName() : String
      {
         return emmiterData.name;
      }
      
      public function get particle() : org.specter3d.display.particle.SpecterParticle
      {
         return _particle;
      }
      
      public function set particle(param1:org.specter3d.display.particle.SpecterParticle) : void
      {
         _particle = param1;
      }
      
      public function get emmiterData() : EmmiterData
      {
         return _emmiterData;
      }
      
      public function set emmiterData(param1:EmmiterData) : void
      {
         _emmiterData = param1;
      }
      
      public function get pData() : SpecterParticleData
      {
         return _driver.pData;
      }
      
      public function get driver() : org.specter3d.display.particle.ParticleDirver
      {
         return _driver;
      }
      
      override public function dispose() : void
      {
         if(isDispose)
         {
            return;
         }
         if(_delayTimerDic != null)
         {
            var _loc3_:int = 0;
            var _loc2_:* = _delayTimerDic;
            for each(var _loc1_ in _delayTimerDic)
            {
               if(_loc1_ != null)
               {
                  _loc1_.dispose();
               }
            }
            _delayTimerDic = null;
         }
         if(_particle)
         {
            if(animator)
            {
               animator.removeEventListener("animator_complete",onEmmiterFinish);
               animator.callbackOnEnterFrame = null;
            }
            if(_particle.mesh)
            {
               if(_driver.isFollow)
               {
                  _followContainer.removeFollowParticle(_particle);
               }
               else
               {
                  removeChild(_particle.mesh);
               }
            }
            _particle.dispose();
         }
         if(_followContainer)
         {
            removeChild(_followContainer);
            _followContainer.dispose();
         }
         if(avatarBody)
         {
            avatarBody.removeEventListener("avatar_anim_all_complete",onAvatarBodyInitComplete);
            removeChild(avatarBody as ObjectContainer3D);
            EffectManager.disposeEffectAvatar(avatarBody);
         }
         if(_driver)
         {
            _driver.removeCallbackOnReady(onDriverLoaded);
            _driver = null;
         }
         if(_aniTrailEffect)
         {
            _aniTrailEffect.dispose();
            _aniTrailEffect = null;
         }
         EffectManager.totalEmmiters--;
         _emmiterData = null;
         _callbackOnReady = null;
         super.dispose();
      }
   }
}
