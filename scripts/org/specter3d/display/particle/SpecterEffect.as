package org.specter3d.display.particle
{
   import org.specter3d.display.Specter3D;
   import away3d.primitives.WireframeSphere;
   import org.specter3d.configs.particle.SpecterEffectData;
   import flash.geom.Vector3D;
   import org.specter3d.frameEventTrigger.FrameEventTriggerBase;
   import flash.utils.getTimer;
   import org.specter3d.utils.SpecterUtils;
   import away3d.entities.Mesh;
   import away3d.containers.ObjectContainer3D;
   import away3d.materials.TextureMaterial;
   import away3d.textures.Texture2DBase;
   import away3d.core.base.SubMesh;
   import org.specter3d.context.AppGlobalContext;
   import flash.events.Event;
   import away3d.entities.Entity;
   import away3d.events.AnimatorEvent;
   import com.greensock.TweenLite;
   import org.specter3d.frameEventTrigger.ITriggerUnit;
   import org.manager.TimerManager;
   
   public class SpecterEffect extends Specter3D
   {
      
      public static const REMOVED:String = "removed";
      
      private static const S_DEFAULT_GROUP:String = "default_group";
      
      private static var _callbackOnTrigger:Function;
      
      private static const FRAME_ENTER_AMOUNT_LIMITED:int = 30;
       
      
      public var url:String = "";
      
      public var boneTag:String;
      
      public var fileName:String = "";
      
      public var emmiterGroup:Vector.<org.specter3d.display.particle.SpecterEmmiter>;
      
      public var count:int = 0;
      
      public var parent3D;
      
      public var sphere:WireframeSphere;
      
      public var emmiterNums:int;
      
      private var _noLoopFinishCount:int;
      
      public var effectData:SpecterEffectData;
      
      public var autoPlay:Boolean = false;
      
      private var _alphaValue:Number = 1;
      
      private var _defaultScale:Vector3D;
      
      private var _group:String = "default_group";
      
      public var prepareClear:Boolean = false;
      
      private var _speedRate:Number = 1;
      
      private var _renderLayer:uint;
      
      private var _duTime:Number = 0;
      
      private var _lastFrame:uint;
      
      private var _triggers:FrameEventTriggerBase;
      
      private var _loadEmmiterTime:int;
      
      public var isEmpty:Boolean;
      
      private var _sDisabled:Boolean;
      
      private var _uvTarget:Mesh;
      
      private var _aniM:TextureMaterial;
      
      private var speedU:Number = 0;
      
      private var speedV:Number = 0;
      
      public function SpecterEffect(param1:* = null, param2:Number = 0, param3:String = "default_group", param4:Boolean = false)
      {
         emmiterGroup = new Vector.<org.specter3d.display.particle.SpecterEmmiter>();
         _defaultScale = new Vector3D(1,1,1);
         _renderLayer = Entity.EFFECT_LAYER;
         super();
         _sDisabled = param4;
         EffectManager.totalEffects++;
         parent3D = param1;
         _group = param3;
         if(EffectManager.isEditor)
         {
            sphere = new WireframeSphere();
            sphere.visible = false;
            addChild(sphere);
         }
         addToParent(parent3D);
         if(param2 > 0)
         {
            TimerManager.getInstance().setTimeout(dispose,param2);
         }
         this.mouseEnabled = false;
         this.mouseChildren = false;
      }
      
      static function setCallbackOnTrigger(param1:Function) : void
      {
         _callbackOnTrigger = param1;
      }
      
      public function set visibleAndStop(param1:Boolean) : void
      {
         visible = param1;
         if(param1)
         {
            reset();
         }
         else
         {
            gotoAndStop(1);
         }
      }
      
      public function init(param1:SpecterEffectData) : void
      {
         var _loc2_:int = 0;
         if(emmiterGroup == null)
         {
            return;
         }
         effectData = param1;
         emmiterNums = effectData.emmiterArr.length;
         _loadEmmiterTime = getTimer();
         _loc2_ = 0;
         while(_loc2_ < emmiterNums)
         {
            EffectManager.createEmmiter(effectData.emmiterArr[_loc2_],onLoaded,SpecterUtils.randomRange(0,param1.timeOffset),param1.disposeType,autoPlay,_group,_speedRate);
            _loc2_++;
         }
      }
      
      public function set renderLayer(param1:uint) : void
      {
         var _loc2_:int = 0;
         _renderLayer = param1;
         if(emmiterGroup == null)
         {
            return;
         }
         _loc2_ = 0;
         while(_loc2_ < emmiterGroup.length)
         {
            emmiterGroup[_loc2_].renderLayer = param1;
            _loc2_++;
         }
      }
      
      private function onLoaded(param1:org.specter3d.display.particle.SpecterEmmiter) : void
      {
         if(emmiterGroup == null)
         {
            if(param1)
            {
               param1.dispose();
            }
            return;
         }
         if(param1)
         {
            param1.shakeDisabled = _sDisabled;
            param1.parentUrl = url;
            addEmmiter(param1);
            param1.addCallbackOnReady(onEmmiterReady);
            param1.createParticle();
         }
         else
         {
            onEmmiterReady(null);
         }
      }
      
      private function onEmmiterReady(param1:org.specter3d.display.particle.SpecterEmmiter) : void
      {
         var _loc2_:* = null;
         count = Number(count) + 1;
         if(param1)
         {
            param1.removeCallbackOnReady(onEmmiterReady);
            if(param1.pData.meshData.shapeType == "avatar")
            {
               _loc2_ = this.parent;
               while(_loc2_)
               {
                  _uvTarget = _loc2_ as Mesh;
                  if(!_uvTarget)
                  {
                     _loc2_ = _loc2_.parent;
                     continue;
                  }
                  break;
               }
            }
         }
         if(_uvTarget && !_aniM && param1 && param1.driver.texture && !param1.driver.animationSet)
         {
            initFlowUV(param1);
         }
         if(param1 && !param1.driver.animationSet)
         {
            startSpecterEmmiter(null);
         }
         else
         {
            startSpecterEmmiter(param1);
         }
      }
      
      private function initFlowUV(param1:org.specter3d.display.particle.SpecterEmmiter) : void
      {
         var _loc5_:* = null;
         param1.useFlowUV = true;
         var _loc7_:Texture2DBase = param1.driver.texture;
         _aniM = param1.driver.material as TextureMaterial;
         var _loc4_:TextureMaterial = _uvTarget.subMeshes[0].material as TextureMaterial;
         var _loc3_:Number = _loc4_.texture.width / _loc7_.width;
         var _loc2_:Number = _loc4_.texture.height / _loc7_.height;
         speedU = param1.pData.uvScrollData.speedU * 0.01;
         speedV = param1.pData.uvScrollData.speedV * 0.01;
         _aniM.repeat = true;
         _aniM.renderPriority = _loc4_.renderPriority + 1;
         _aniM.animateUVs = true;
         _aniM.alpha = 1;
         _aniM.alphaBlending = true;
         _aniM.bothSides = param1.pData.meshData.bothSides;
         _aniM.blendMode = param1.pData.meshData.blendMode;
         _loc5_ = new SubMesh(_uvTarget.subMeshes[0].subGeometry,_uvTarget,_aniM);
         if(speedU != 0)
         {
            _loc5_.scaleU = -_loc3_;
         }
         if(speedV != 0)
         {
            _loc5_.scaleV = -_loc2_;
         }
         _uvTarget.subMeshes.push(_loc5_);
         _loc5_ = new SubMesh(_uvTarget.subMeshes[0].subGeometry,_uvTarget,_aniM);
         if(speedU != 0)
         {
            _loc5_.scaleU = _loc3_;
         }
         if(speedV != 0)
         {
            _loc5_.scaleV = _loc2_;
         }
         _uvTarget.subMeshes.push(_loc5_);
         var _loc6_:int = param1.driver.pData.meshData.heatFlag;
         _loc5_.postEffectData.heatFlag = _loc6_;
         if(_loc6_ > 0)
         {
            EffectManager.addHeatFilter();
         }
         if(speedU != 0 || speedV != 0)
         {
            AppGlobalContext.animatorManager.register(this);
         }
      }
      
      private function updateFlowUV() : void
      {
         var _loc3_:* = null;
         var _loc2_:* = NaN;
         var _loc1_:* = NaN;
         var _loc5_:int = 0;
         if(!this._uvTarget || _uvTarget.subMeshes.length <= 1)
         {
            return;
         }
         var _loc4_:int = _uvTarget.subMeshes.length;
         _loc5_ = 1;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = _uvTarget.subMeshes[_loc5_];
            if(_loc3_.material == _aniM)
            {
               _loc2_ = Number(_loc3_.offsetU);
               _loc1_ = Number(_loc3_.offsetV);
               if(_loc2_ >= 1)
               {
                  _loc2_ = 0;
               }
               if(_loc1_ >= 1)
               {
                  _loc1_ = 0;
               }
               _loc3_.offsetU = _loc2_ + speedU;
               _loc3_.offsetV = _loc1_ + speedV;
            }
            _loc5_++;
         }
      }
      
      private function startSpecterEmmiter(param1:org.specter3d.display.particle.SpecterEmmiter) : void
      {
         if(isDispose)
         {
            return;
         }
         var _loc2_:int = getTimer() - _loadEmmiterTime;
         param1 && param1.start(_loc2_);
         if(count == emmiterNums)
         {
            defaultScale = _defaultScale;
            if(hasEventListener("complete"))
            {
               dispatchEvent(new Event("complete"));
            }
         }
      }
      
      public function addEmmiter(param1:org.specter3d.display.particle.SpecterEmmiter) : void
      {
         param1.shakeDisabled = _sDisabled;
         if(_renderLayer != Entity.EFFECT_LAYER)
         {
            param1.renderLayer = _renderLayer;
         }
         addChild(param1);
         emmiterGroup.push(param1);
         if(param1.isLoop == false)
         {
            param1.addEventListener("animator_complete",onNoLoopEmmiterFinish);
         }
      }
      
      public function removeEmmiter(param1:org.specter3d.display.particle.SpecterEmmiter) : void
      {
         removeChild(param1);
         var _loc2_:int = emmiterGroup.indexOf(param1);
         if(_loc2_ != -1)
         {
            emmiterGroup.splice(_loc2_,1);
         }
      }
      
      public function removeAllEmmiter() : void
      {
         var _loc1_:* = null;
         while(emmiterGroup.length)
         {
            _loc1_ = emmiterGroup.pop();
            removeChild(_loc1_);
            _loc1_.dispose();
         }
      }
      
      protected function onNoLoopEmmiterFinish(param1:AnimatorEvent) : void
      {
         var _loc2_:org.specter3d.display.particle.SpecterEmmiter = param1.currentTarget as org.specter3d.display.particle.SpecterEmmiter;
         if(!_loc2_.isLoop)
         {
            _noLoopFinishCount = Number(_noLoopFinishCount) + 1;
         }
         if(emmiterGroup && emmiterGroup.length == _noLoopFinishCount)
         {
            EffectManager.removeEffect(this);
         }
      }
      
      public function getEmmiterByName(param1:String) : org.specter3d.display.particle.SpecterEmmiter
      {
         var _loc2_:int = 0;
         if(emmiterGroup != null)
         {
            _loc2_ = emmiterGroup.length;
            while(true)
            {
               _loc2_--;
               if(_loc2_ <= -1)
               {
                  break;
               }
               if(emmiterGroup[_loc2_] != null && emmiterGroup[_loc2_].emmiterName == param1)
               {
                  return emmiterGroup[_loc2_];
               }
            }
         }
         return null;
      }
      
      public function set alphaValue(param1:Number) : void
      {
         var _loc2_:int = 0;
         _alphaValue = param1;
         if(emmiterGroup)
         {
            _loc2_ = emmiterGroup.length;
            while(true)
            {
               _loc2_--;
               if(_loc2_ <= -1)
               {
                  break;
               }
               emmiterGroup[_loc2_].alphaValue = param1;
            }
         }
      }
      
      public function get alphaValue() : Number
      {
         return _alphaValue;
      }
      
      override public function set alpha(param1:Number) : void
      {
         alphaValue = param1;
      }
      
      override public function get alpha() : Number
      {
         return alphaValue;
      }
      
      public function restart() : void
      {
         var _loc1_:int = 0;
         _noLoopFinishCount = 0;
         if(emmiterGroup)
         {
            _loc1_ = emmiterGroup.length;
            while(true)
            {
               _loc1_--;
               if(_loc1_ <= -1)
               {
                  break;
               }
               emmiterGroup[_loc1_].restart();
            }
         }
      }
      
      public function addToParent(param1:*) : void
      {
         parent3D = param1;
         if(parent3D)
         {
            parent3D.addChild(this);
         }
         else
         {
            AppGlobalContext.stage3d.addChild(this);
         }
      }
      
      public function removeFromParent() : void
      {
         if(this.parent)
         {
            if(parent3D)
            {
               parent3D.removeChild(this);
            }
            else
            {
               AppGlobalContext.stage3d.removeChild(this);
            }
         }
         parent3D = null;
      }
      
      public function clear(param1:Function = null, param2:Boolean = false) : void
      {
         $callBack = param1;
         clearCache = param2;
         doDispose = function():void
         {
            if($callBack != null)
            {
               $callBack();
            }
            clean();
         };
         if(effectData && !clearCache)
         {
            if(!(int(effectData.disposeType) - 1))
            {
               TweenLite.to(this,effectData.lastTime * 0.001,{
                  "alphaValue":0,
                  "onComplete":doDispose
               });
            }
            else
            {
               doDispose();
            }
         }
         else
         {
            doDispose();
         }
      }
      
      public function clean() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         TweenLite.killTweensOf(this);
         removeFromParent();
         if(emmiterGroup)
         {
            _loc2_ = emmiterGroup.length;
            while(true)
            {
               _loc2_--;
               if(_loc2_ <= -1)
               {
                  break;
               }
               _loc1_ = emmiterGroup[_loc2_];
               removeChild(_loc1_);
               _loc1_.removeEventListener("animator_complete",onNoLoopEmmiterFinish);
               _loc1_.removeCallbackOnReady(onEmmiterReady);
               _loc1_.dispose();
            }
         }
         emmiterGroup = null;
         effectData = null;
         hasEventListener("removed") && dispatchEvent(new Event("removed"));
         if(!this.isDispose)
         {
            EffectManager.totalEffects--;
            if(this.isEmpty)
            {
               EffectManager.totalEmpty--;
            }
         }
         super.dispose();
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         EffectManager.removeEffect(this,null,prepareClear);
         _triggers = null;
         if(_uvTarget)
         {
            _loc1_ = _uvTarget.subMeshes.length;
            if(_loc1_ > 1)
            {
               _loc3_ = 1;
               while(_loc3_ < _loc1_)
               {
                  _loc2_ = _uvTarget.subMeshes[_loc3_];
                  if(_loc2_.material == _aniM)
                  {
                     _loc2_.dispose();
                     _uvTarget.subMeshes.splice(_loc3_,1);
                     _loc3_--;
                     _loc1_--;
                  }
                  _loc3_++;
               }
            }
            _uvTarget = null;
         }
         _aniM = null;
         AppGlobalContext.animatorManager.unregister(this);
      }
      
      public function gotoAndStop(param1:uint) : void
      {
         var _loc2_:* = null;
         if(emmiterGroup == null)
         {
            return;
         }
         if(param1 < 1)
         {
            param1 = 1;
         }
         var _loc4_:int = emmiterGroup.length;
         var _loc3_:Number = param1 * 16;
         while(true)
         {
            _loc4_--;
            if(_loc4_ <= -1)
            {
               break;
            }
            _loc2_ = emmiterGroup[_loc4_];
            if(_loc2_ && _loc2_.animator)
            {
               if(_loc2_.avatarBody)
               {
                  _loc2_.avatarBody.gotoAndStop(param1);
               }
               (_loc2_.animator as SpecterParticleAnimator).playAndStop(_loc3_);
               _loc2_.updateKeyFrame(_loc3_);
               _loc2_.updateShake(_loc3_);
            }
         }
      }
      
      public function pause() : void
      {
         var _loc1_:* = null;
         if(emmiterGroup == null)
         {
            return;
         }
         var _loc2_:int = emmiterGroup.length;
         while(true)
         {
            _loc2_--;
            if(_loc2_ <= -1)
            {
               break;
            }
            _loc1_ = emmiterGroup[_loc2_];
            if(_loc1_ && _loc1_.animator)
            {
               _loc1_.animator.autoUpdate = false;
            }
         }
      }
      
      public function set defaultScale(param1:Vector3D) : void
      {
         if(param1 == null)
         {
            return;
         }
         _defaultScale = param1;
         if(count != emmiterNums)
         {
            return;
         }
         if(effectData)
         {
            scaleX = param1.x * effectData.scale;
            scaleY = param1.y * effectData.scale;
            scaleZ = param1.z * effectData.scale;
         }
         else
         {
            scaleX = param1.x;
            scaleY = param1.y;
            scaleZ = param1.z;
         }
      }
      
      public function set playSpeed(param1:Number) : void
      {
         var _loc2_:* = null;
         if(emmiterGroup == null)
         {
            return;
         }
         _speedRate = param1;
         var _loc3_:int = emmiterGroup.length;
         while(true)
         {
            _loc3_--;
            if(_loc3_ <= -1)
            {
               break;
            }
            _loc2_ = emmiterGroup[_loc3_];
            if(_loc2_ && _loc2_.animator)
            {
               _loc2_.playSpeed = _speedRate;
            }
         }
      }
      
      override public function update(param1:int, param2:Number = 0) : void
      {
         var _loc3_:* = null;
         var _loc6_:int = 0;
         updateFlowUV();
         _duTime = _duTime + param2;
         if(_triggers == null || _callbackOnTrigger == null)
         {
            return;
         }
         var _loc5_:uint = _duTime / 16 + 1;
         var _loc4_:uint = _loc5_ - _lastFrame;
         if(_loc4_ > 1 && _loc4_ <= 30)
         {
            _loc6_ = _loc5_ - _loc4_;
            while(_loc6_ <= _loc5_)
            {
               _loc3_ = _triggers.getUnitByFrame(_loc6_);
               if(_loc3_)
               {
                  _loc3_.deltaTime = (_loc4_ - 1) * 16 / _speedRate;
                  _callbackOnTrigger(_loc3_,this.scenePosition.x,this.scenePosition.z);
               }
               _loc6_++;
            }
         }
         else
         {
            _loc3_ = _triggers.getUnitByFrame(_loc5_);
            if(_loc3_)
            {
               _loc3_.deltaTime = 0;
               _callbackOnTrigger(_loc3_,this.scenePosition.x,this.scenePosition.z);
            }
         }
         _lastFrame = _loc5_;
      }
      
      public function setTriggers(param1:FrameEventTriggerBase) : void
      {
         _triggers = param1;
         if(_triggers)
         {
            AppGlobalContext.animatorManager.register(this);
         }
         else
         {
            AppGlobalContext.animatorManager.unregister(this);
         }
      }
      
      public function showBounds(param1:Boolean) : void
      {
         if(sphere)
         {
            sphere.visible = param1;
         }
      }
      
      public function reset() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         if(emmiterGroup != null)
         {
            _loc2_ = emmiterGroup.length;
            _loadEmmiterTime = getTimer();
            count = 0;
            while(true)
            {
               _loc2_--;
               if(_loc2_ <= -1)
               {
                  break;
               }
               _loc1_ = emmiterGroup[_loc2_];
               if(_loc1_ != null)
               {
                  _loc1_.addCallbackOnReady(onEmmiterReady);
                  _loc1_.resetParticle();
               }
            }
         }
      }
      
      override public function get scaleAll() : Number
      {
         return this._defaultScale.x;
      }
      
      override public function set scaleAll(param1:Number) : void
      {
         this._defaultScale.x = param1;
         this._defaultScale.y = param1;
         this._defaultScale.z = param1;
         this.defaultScale = _defaultScale;
      }
      
      override public function scale(param1:Number) : void
      {
         if(_defaultScale.x != param1)
         {
            _defaultScale.x = param1;
            _defaultScale.y = param1;
            _defaultScale.z = param1;
            super.scale(param1);
         }
      }
   }
}
