package org.specter3d.display.avatar2
{
   import org.specter3d.display.avatar2.data.RegisterAnimCompleteVO;
   import org.specter3d.utils.HashMap;
   import away3d.animators.SkeletonAnimationSet;
   import away3d.animators.SkeletonAnimator;
   import away3d.animators.data.Skeleton;
   import org.specter3d.frameEventTrigger.FrameEventTriggerBase;
   import com.mz.core.logging.Log;
   import org.specter3d.enum.AnimationEnum;
   import away3d.animators.transitions.CrossfadeTransition;
   import away3d.animators.transitions.IAnimationTransition;
   import away3d.containers.ObjectContainer3D;
   import away3d.animators.data.SkeletonPose;
   import away3d.animators.data.JointPose;
   import flash.geom.Vector3D;
   import org.specter3d.events.Avatar3DEvent;
   import org.specter3d.loaders.AssetLib;
   import org.specter3d.loaders.S3DObject;
   import away3d.animators.nodes.SkeletonClipNode;
   import org.specter3d.context.AppGlobalContext;
   import away3d.entities.BoneTag;
   import org.specter3d.display.avatar2.data.AnimData;
   import org.specter3d.loaders.ResourceVo;
   import org.specter3d.debug.DebugEngineLog;
   import org.specter3d.display.avatar2.data.IRegisterAnimComplete;
   import away3d.events.AnimatorEvent;
   import org.specter3d.frameEventTrigger.ITriggerUnit;
   import org.specter3d.display.avatar2.data.AvatarEffectVO;
   import org.specter3d.display.particle.SpecterEffect;
   import org.specter3d.display.particle.EffectManager;
   
   public class AvatarPart3D extends AvatarEffect3D
   {
      
      private static const FRAME_ENTER_AMOUNT_LIMITED:int = 10;
      
      private static const BIP001:String = "Bip001";
      
      private static const DELTA_TIME_LIMIT:int = 60;
       
      
      private var _actFromParent:Boolean;
      
      private var _animCompleteVO:RegisterAnimCompleteVO;
      
      private var _needUpdateBounds:Boolean = true;
      
      protected var _animDic:HashMap;
      
      protected var _animationSet:SkeletonAnimationSet;
      
      protected var _animator:SkeletonAnimator;
      
      protected var _boneTagDic:HashMap;
      
      protected var _isAllowBinding:Boolean = false;
      
      protected var _skeleton:Skeleton;
      
      private var _action:String;
      
      private var _actionInvalid:Boolean;
      
      private var _animCont:uint = 0;
      
      private var _loadedAnimUrls:Vector.<String>;
      
      private var _playbackSpeed:Number = 1;
      
      private var _playbackSpeedInvalid:Boolean;
      
      protected var _triggers:FrameEventTriggerBase;
      
      private var _disX:int;
      
      private var _disY:int;
      
      private var _disZ:int;
      
      private var _lastFrame:uint;
      
      private var _totalTime:Number;
      
      private var _isBoundDirty:Boolean;
      
      private var _waitBindingEffect:Vector.<AvatarEffectVO>;
      
      public function AvatarPart3D(param1:String)
      {
         super(param1);
         AppGlobalContext.animatorManager.register(this);
         _boneTagDic = new HashMap();
         _animDic = new HashMap();
      }
      
      public function set needUpdateBounds(param1:Boolean) : void
      {
         _needUpdateBounds = param1;
      }
      
      public function get actFromParent() : Boolean
      {
         return _actFromParent;
      }
      
      public function set actFromParent(param1:Boolean) : void
      {
         _actFromParent = param1;
      }
      
      public function get action() : String
      {
         return _action;
      }
      
      public function set action(param1:String) : void
      {
         var _loc2_:* = null;
         if(action != param1)
         {
            _action = param1;
         }
         if(_animator == null)
         {
            return;
         }
         if(action == null)
         {
            return;
         }
         if(hasAnimation(param1) == false)
         {
            Log.warn(this,"缺少动作",param1,this.avatarMesh.name);
            return;
         }
         if(_animator.name != action && _animationSet != null)
         {
            if(AnimationEnum.getAutoTransition(_animator.name,action))
            {
               _loc2_ = new CrossfadeTransition(0.3);
            }
            animatorPlay(action,_loc2_,0);
         }
      }
      
      public function animatorPlay(param1:String, param2:IAnimationTransition = null, param3:Number = NaN) : void
      {
         if(_animator != null)
         {
            _animator.play(action,param2,param3);
            _isBoundDirty = true;
            _lastFrame = 0;
            _totalTime = _animator.totalTime(param1);
         }
      }
      
      protected function updateBounds() : void
      {
         var _loc14_:* = NaN;
         var _loc12_:* = null;
         var _loc8_:* = NaN;
         var _loc9_:* = NaN;
         var _loc1_:* = NaN;
         var _loc6_:* = NaN;
         var _loc5_:* = NaN;
         var _loc4_:* = NaN;
         var _loc11_:* = NaN;
         var _loc10_:* = NaN;
         var _loc7_:* = null;
         var _loc13_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(_animator && _avatarMesh && _avatarMesh.bounds && _needUpdateBounds)
         {
            _isBoundDirty = false;
            _loc14_ = 1;
            _loc12_ = _avatarMesh;
            while(_loc12_.parent)
            {
               _loc14_ = Number(_loc14_ * _loc12_.parent.scaleAll);
               _loc12_ = _loc12_.parent;
            }
            _loc8_ = 1;
            _loc9_ = 0;
            _loc1_ = 1;
            _loc6_ = -1;
            _loc5_ = -1;
            _loc4_ = -1;
            _loc11_ = 0;
            _loc10_ = 0;
            _loc7_ = SkeletonAnimator(_animator).globalPose;
            _loc13_ = 0;
            while(_loc13_ < _loc7_.jointPoses.length)
            {
               _loc2_ = _loc7_.jointPoses[_loc13_];
               if(_loc2_.name != "BoneRoot")
               {
                  _loc3_ = _loc2_.translation;
                  if(_loc8_ > _loc3_.x)
                  {
                     _loc8_ = Number(_loc3_.x);
                  }
                  if(_loc9_ > _loc3_.y)
                  {
                     _loc9_ = Number(_loc3_.y);
                  }
                  if(_loc1_ > _loc3_.z)
                  {
                     _loc1_ = Number(_loc3_.z);
                  }
                  if(_loc6_ < _loc3_.x)
                  {
                     _loc6_ = Number(_loc3_.x);
                  }
                  if(_loc5_ < _loc3_.y)
                  {
                     _loc5_ = Number(_loc3_.y);
                  }
                  if(_loc4_ < _loc3_.z)
                  {
                     _loc4_ = Number(_loc3_.z);
                  }
                  if(_loc2_.name == "Bip001")
                  {
                     _loc11_ = Number(_loc3_.x * 0.5);
                     _loc10_ = Number(_loc3_.z * 0.5);
                  }
               }
               _loc13_++;
            }
            _disX = (_loc6_ - _loc8_) * _loc14_;
            _disY = (_loc5_ - _loc9_) * _loc14_;
            _disZ = (_loc4_ - _loc1_) * _loc14_;
            if(_disX < 80)
            {
               _loc8_ = Number(-40 / _loc14_);
               _loc6_ = Number(40 / _loc14_);
            }
            if(_disY < 80)
            {
               _loc9_ = 0;
               _loc5_ = Number(80 / _loc14_);
            }
            if(_disZ < 80)
            {
               _loc1_ = Number(-40 / _loc14_);
               _loc4_ = 40;
            }
            if(_disX > 200)
            {
               _loc8_ = Number((_loc11_ - 100) / _loc14_);
               _loc6_ = Number((_loc11_ + 100) / _loc14_);
               _disX = 200;
            }
            if(_disY > 200)
            {
               _loc9_ = 0;
               _loc5_ = Number(200 / _loc14_);
               _disY = 200;
            }
            if(_disZ > 200)
            {
               _loc1_ = Number((_loc10_ - 100) / _loc14_);
               _loc4_ = Number((_loc10_ + 100) / _loc14_);
               _disZ = 200;
            }
            if(_disY < 200 && _disY > 50)
            {
               _loc5_ = Number(_loc5_ + 30 / _loc14_);
            }
            _avatarMesh.bounds.fromExtremes(_loc8_,_loc9_,_loc1_,_loc6_,_loc5_,_loc4_);
            dispatchEvent(new Avatar3DEvent("bound_fixed"));
         }
      }
      
      public function get height() : int
      {
         return _disY;
      }
      
      public function get width() : Number
      {
         if(_disX > _disZ)
         {
            return _disX;
         }
         return _disZ;
      }
      
      public function actionList() : Array
      {
         var _loc2_:* = 0;
         var _loc3_:int = 0;
         var _loc1_:Array = [];
         if(_animationSet)
         {
            _loc2_ = uint(_animationSet.animations.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc1_.push({
                  "label":_animationSet.animations[_loc3_].name,
                  "value":_animationSet.animations[_loc3_].name
               });
               _loc3_++;
            }
         }
         return _loc1_;
      }
      
      public function advanceLoadOver(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc4_:String = param1.substring(param1.lastIndexOf("/") + 1);
         _loc4_ = _loc4_.replace(".act","");
         var _loc2_:S3DObject = AssetLib.getS3DaddRefCount(param1);
         if(_loc2_)
         {
            _loc3_ = _loc2_.animationNodes[0] as SkeletonClipNode;
         }
         if(_loc3_)
         {
            _loc3_.name = _loc4_;
            _animationSet && _animationSet.addAnimation(_loc3_);
            _loc3_.looping = AnimationEnum.getLoop(_loc4_);
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _loadedAnimUrls = null;
         _animCompleteVO = null;
         if(_animator)
         {
            _animator.removeEventListener("animator_complete",onAnimatorComplete);
            _animator.dispose();
            _animator = null;
         }
         if(_animationSet)
         {
            _animationSet.dispose();
            _animationSet = null;
         }
         clearBones();
         _boneTagDic = null;
         _animDic && _animDic.clear();
         _animDic = null;
         _skeleton = null;
         AppGlobalContext.animatorManager.unregister(this);
         _triggers = null;
      }
      
      protected function clearBones() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         if(_boneTagDic)
         {
            _loc2_ = _boneTagDic.keySet();
            while(_loc2_.length)
            {
               _loc1_ = _boneTagDic.remove(_loc2_.pop()) as BoneTag;
               _loc1_ && _loc1_.dispose();
            }
            _boneTagDic.clear();
         }
      }
      
      public function getAnimationTotalTime(param1:String) : uint
      {
         var _loc2_:* = null;
         if(hasAnimation(param1))
         {
            _loc2_ = _animationSet.getAnimation(param1) as SkeletonClipNode;
            return _loc2_.totalDuration;
         }
         return 1;
      }
      
      public function hasAnimation(param1:String) : Boolean
      {
         if(_animationSet != null)
         {
            return _animationSet.hasAnimation(param1);
         }
         return false;
      }
      
      public function getBoneTagByName(param1:String) : BoneTag
      {
         var _loc2_:* = null;
         _loc2_ = getBoneTag(param1);
         return _loc2_;
      }
      
      public function getSkeletonNameAll() : Array
      {
         var _loc2_:int = 0;
         var _loc1_:Array = [];
         if(_skeleton)
         {
            _loc2_ = 0;
            while(_loc2_ < _skeleton.joints.length)
            {
               _loc1_.push(_skeleton.joints[_loc2_].name);
               _loc2_++;
            }
         }
         return _loc1_;
      }
      
      public function gotoAndStop(param1:int) : void
      {
         var _loc2_:* = undefined;
         if(param1 == 1)
         {
            _animator.isPlaying = false;
            _animator.start();
         }
         var _loc3_:Number = param1 * 1000 / 60;
         gotoAndStopByTime(_loc3_);
         if(triggers)
         {
            _loc2_ = triggers.getUnitByFrame(param1);
            if(_loc2_)
            {
               dispatchEvent(new Avatar3DEvent("avatar_trigger",_loc2_));
            }
         }
      }
      
      public function gotoAndStopByTime(param1:int) : void
      {
         _animator.isPlaying = true;
         _animator.autoUpdate = false;
         _animator.absoluteTime = param1;
         _animator.update(0,0);
      }
      
      public function get playbackSpeed() : Number
      {
         return _playbackSpeed;
      }
      
      public function set playbackSpeed(param1:Number) : void
      {
         if(_playbackSpeed != param1)
         {
            _playbackSpeed = param1;
            _playbackSpeedInvalid = true;
         }
      }
      
      public function registerAnim(param1:AnimData, param2:Boolean = false) : void
      {
         if(!isDispose && checkAnim(param1,param2))
         {
            _animDic.put(param1.animUrl,param1);
            if(!AssetLib.hasAsset(param1.animUrl))
            {
               AppGlobalContext.asynLoader.loadOne(new ResourceVo(param1.animUrl,param1.priority,onLoadAnimOver));
            }
            else
            {
               onLoadAnimOver(param1.animUrl);
            }
         }
      }
      
      private function checkAnim(param1:AnimData, param2:Boolean = false) : Boolean
      {
         if(param1 == null || param1.animUrl == null)
         {
            if(param2)
            {
               _animCompleteVO.addNoAnimList(null);
            }
            return false;
         }
         if(_animDic != null && _animDic.containsKey(param1.animUrl))
         {
            return false;
         }
         if(_loadedAnimUrls != null && _loadedAnimUrls.indexOf(param1.animUrl) >= 0)
         {
            return false;
         }
         if(_animationSet != null && _animationSet.hasAnimation(param1.animName))
         {
            if(param2)
            {
               _animCompleteVO.addHadAnimListList(param1.animName);
            }
            return false;
         }
         return true;
      }
      
      public function registerAnims(param1:Vector.<AnimData>) : void
      {
         if(param1 != null && !isDispose)
         {
            if(!_animCompleteVO)
            {
               _animCompleteVO = new RegisterAnimCompleteVO();
            }
            _animCompleteVO.addAllAnimList(param1);
            var _loc4_:int = 0;
            var _loc3_:* = param1;
            for each(var _loc2_ in param1)
            {
               registerAnim(_loc2_,true);
            }
         }
      }
      
      public function restart(param1:int = 0) : void
      {
         if(_animator)
         {
            _animator.start();
            _animator.autoUpdate = true;
            _animator.update(param1);
         }
      }
      
      public function startFrame() : void
      {
         startFrameBody();
      }
      
      public function stopFrame() : void
      {
         stopFrameBody();
      }
      
      public final function startFrameBody() : void
      {
      }
      
      public final function stopFrameBody() : void
      {
      }
      
      public function get totalFrame() : int
      {
         var _loc1_:* = null;
         if(hasAnimation(action))
         {
            _loc1_ = _animationSet.getAnimation(action) as SkeletonClipNode;
            return _loc1_.frames.length * 60 / _loc1_.frameRate;
         }
         return 1;
      }
      
      protected function getBoneTag(param1:String) : BoneTag
      {
         var _loc2_:* = null;
         if(_boneTagDic != null)
         {
            _loc2_ = _boneTagDic.getValue(param1) as BoneTag;
            if(_loc2_ == null && _animator != null)
            {
               _loc2_ = _animator.addBoneTag(param1);
               _boneTagDic.put(param1,_loc2_);
            }
         }
         return _loc2_;
      }
      
      protected function parseAnim(param1:String) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            DebugEngineLog.toChat("[parseAnim] url = null  加载器传了个空数据回来");
            return;
         }
         var _loc5_:AnimData = null;
         var _loc4_:* = param1;
         _loc4_ = _loc4_.replace(AssetLib.relativePath,"");
         if(_animDic == null)
         {
            DebugEngineLog.toChat("[parseAnim] _animDic = null 注册记录已经销毁" + _loc4_);
         }
         if(!_animDic.getValue(_loc4_))
         {
            DebugEngineLog.toChat("[parseAnim] _animDic no url  加载好了一个没有注册记录的动作" + _loc4_);
            return;
         }
         if(isDispose)
         {
            return;
         }
         _loc5_ = _animDic.remove(_loc4_) as AnimData;
         var _loc2_:S3DObject = AssetLib.getS3DaddRefCount(_loc5_.animUrl);
         if(_loc2_ != null)
         {
            if(_loc2_.animationNodes != null)
            {
               _loc3_ = _loc2_.animationNodes[0] as SkeletonClipNode;
               if(_loc3_ != null)
               {
                  _loc3_.name = _loc5_.animName;
                  _animationSet.addAnimation(_loc3_);
                  _loc3_.looping = AnimationEnum.getLoop(_loc5_.animName);
                  if(_animator && _loc3_.name == action)
                  {
                     animatorPlay(action,null,0);
                  }
                  if(_animCompleteVO != null)
                  {
                     _animCompleteVO.addAnimCompleteList(_loc5_.animName);
                  }
               }
               else
               {
                  DebugEngineLog.toWindowError("[parseAnim] _node = null 有s3d文件，但里面没动作数据" + _loc4_);
                  if(_animCompleteVO != null)
                  {
                     _animCompleteVO.addNoAnimList(_loc5_.animName);
                  }
               }
            }
            else
            {
               DebugEngineLog.toWindowError("[parseAnim] animationNodes = null 有s3d文件，但里面没动作数据" + _loc4_);
               if(_animCompleteVO != null)
               {
                  _animCompleteVO.addNoAnimList(urlGetName(_loc4_));
               }
            }
         }
         else
         {
            DebugEngineLog.toChat("没动作对应的act文件" + _loc4_);
            if(_animCompleteVO != null)
            {
               _animCompleteVO.addNoAnimList(urlGetName(_loc4_));
            }
         }
         if(_loc3_ != null && hasEventListener("avatar_anim_complete"))
         {
            dispatchEvent(new Avatar3DEvent("avatar_anim_complete",_loc5_));
         }
         if(_animCompleteVO != null && _animCompleteVO.isSendEvt)
         {
            if(!isDispose && hasEventListener("avatar_anim_all_complete"))
            {
               dispatchEventAnimAll();
            }
         }
      }
      
      private function urlGetName(param1:String) : String
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:Array = param1.split("/");
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.length;
            if(_loc4_ > 0)
            {
               _loc2_ = _loc3_[_loc4_ - 1];
               if(_loc2_ != null)
               {
                  return _loc2_.split(".")[0];
               }
            }
         }
         return param1;
      }
      
      private function dispatchEventAnimAll() : void
      {
         dispatchEvent(new Avatar3DEvent("avatar_anim_all_complete",_animCompleteVO as IRegisterAnimComplete));
         _animCompleteVO = null;
      }
      
      protected function onAnimatorComplete(param1:AnimatorEvent) : void
      {
         if(hasEventListener("animator_complete"))
         {
            dispatchEvent(new AnimatorEvent("animator_complete",null));
         }
      }
      
      protected function onLoadAnimOver(param1:String) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(!isDispose)
         {
            if(_animationSet == null)
            {
               _loadedAnimUrls = _loadedAnimUrls || new Vector.<String>();
               _loadedAnimUrls.push(param1);
            }
            else
            {
               parseAnim(param1);
            }
         }
      }
      
      override protected function onLoadMeshDone() : void
      {
         var _loc4_:* = null;
         var _loc2_:* = 0;
         if(isDispose)
         {
            return;
         }
         var _loc1_:S3DObject = AssetLib.getS3D(modelUrl);
         if(_loc1_ == null)
         {
            DebugEngineLog.toChat("模型解析错误,请检查模型. Path：" + modelUrl);
            return;
         }
         if(_skeleton == null)
         {
            _skeleton = _loc1_["skeleton"];
            if(_skeleton == null)
            {
               DebugEngineLog.toChat("_skeleton为null,请检查：" + modelUrl);
            }
            if(_skeleton.joints == null)
            {
               DebugEngineLog.toChat("_skeleton.joints为null,请检查：" + modelUrl);
            }
            if(_skeleton.joints.length)
            {
               _loc4_ = _loc1_["animationSet"];
               if(_loc4_ == null)
               {
                  DebugEngineLog.toChat("skeletonAnimationSet为null,请检查：" + modelUrl);
               }
               _loc2_ = uint(_loc4_.jointsPerVertex);
               _animationSet = new SkeletonAnimationSet(_loc2_);
               _animator = new SkeletonAnimator(_animationSet,_skeleton);
               _animator.addEventListener("animator_complete",onAnimatorComplete);
            }
            else
            {
               _skeleton = null;
            }
         }
         super.onLoadMeshDone();
         if(_loadedAnimUrls != null)
         {
            var _loc6_:int = 0;
            var _loc5_:* = _loadedAnimUrls;
            for each(var _loc3_ in _loadedAnimUrls)
            {
               parseAnim(_loc3_);
            }
            _loadedAnimUrls = null;
         }
      }
      
      override protected function assembleMesh() : void
      {
         super.assembleMesh();
         if(_avatarMesh != null && _skeleton != null && _animationSet != null)
         {
            _avatarMesh.animator = _animator;
         }
      }
      
      override protected function onRender(param1:Number) : void
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         super.onRender(param1);
         if(_playbackSpeedInvalid && _animator)
         {
            _animator.playbackSpeed = playbackSpeed;
            _playbackSpeedInvalid = false;
         }
         if(triggers && triggers.attach == action && _animator && _animator.autoUpdate)
         {
            _loc4_ = _animator.absoluteTime % _totalTime / 16.6666666666667;
            _loc3_ = _loc4_ - _lastFrame;
            if(_loc3_ > 1 && _loc3_ <= 10)
            {
               _loc5_ = _loc4_ - _loc3_;
               while(_loc5_ <= _loc4_)
               {
                  _loc2_ = triggers.getUnitByFrame(_loc5_);
                  if(_loc2_)
                  {
                     _loc2_.deltaTime = (_loc3_ - 1) * 16.6666666666667 / this.playbackSpeed;
                     dispatchEvent(new Avatar3DEvent("avatar_trigger",_loc2_));
                  }
                  _loc5_++;
               }
            }
            else
            {
               _loc2_ = triggers.getUnitByFrame(_loc4_);
               if(_loc2_)
               {
                  _loc2_.deltaTime = 0;
                  dispatchEvent(new Avatar3DEvent("avatar_trigger",_loc2_));
               }
            }
            _lastFrame = _loc4_;
         }
         if(_isBoundDirty && _animator && _animator.currentFrame == 0)
         {
            updateBounds();
         }
      }
      
      override public function removeEffect(param1:String) : Boolean
      {
         var _loc4_:* = undefined;
         if(isDispose)
         {
            return false;
         }
         _loc4_ = _bindingEffects.remove(param1) as Vector.<SpecterEffect>;
         var _loc6_:int = 0;
         var _loc5_:* = _loc4_;
         for each(var _loc3_ in _loc4_)
         {
            _loc3_.dispose();
            _loc3_ = null;
         }
         var _loc2_:int = -1;
         if(_waitBindingEffect)
         {
            _loc2_ = 0;
            while(_loc2_ < _waitBindingEffect.length && _loc2_ >= 0)
            {
               if(_waitBindingEffect[_loc2_].effectUrl == param1)
               {
                  _waitBindingEffect.splice(_loc2_,1);
                  _loc2_--;
               }
               _loc2_++;
            }
         }
         return true;
      }
      
      public function removeEffectForBoneTag(param1:String, param2:String) : Boolean
      {
         var _loc5_:* = undefined;
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:* = null;
         if(isDispose || param2 == null || param1 == null)
         {
            return false;
         }
         _loc5_ = _bindingEffects.remove(param1) as Vector.<SpecterEffect>;
         if(_loc5_ != null)
         {
            _loc6_ = _loc5_.length;
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc4_ = _loc5_[_loc7_];
               if(_loc4_ != null && _loc4_.url == param1 && _loc4_.boneTag == param2)
               {
                  _loc5_.splice(_loc7_,1);
                  _loc4_.dispose();
                  break;
               }
               _loc7_++;
            }
         }
         if(_waitBindingEffect)
         {
            _loc6_ = _waitBindingEffect.length;
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc3_ = _waitBindingEffect[_loc7_];
               if(_loc3_ != null && _loc3_.effectUrl == param1 && _loc3_.boneTag == param2)
               {
                  _waitBindingEffect.splice(_loc7_,1);
                  break;
               }
               _loc7_++;
            }
         }
         return true;
      }
      
      override public function removeEffectAll() : void
      {
         eachBone = function(param1:BoneTag):void
         {
            var _loc3_:int = 0;
            var _loc2_:* = null;
            if(param1)
            {
               _loc3_ = param1.numChildren;
               while(true)
               {
                  _loc3_--;
                  if(_loc3_ <= -1)
                  {
                     break;
                  }
                  _loc2_ = param1.getChildAt(_loc3_) as AvatarEffect3D;
                  if(_loc2_)
                  {
                     _loc2_.removeEffectAll();
                  }
               }
            }
         };
         if(isDispose)
         {
            return;
         }
         super.removeEffectAll();
         _waitBindingEffect && _loc1_;
         _waitBindingEffect = null;
      }
      
      private function creatEffect(param1:AvatarEffectVO, param2:*) : SpecterEffect
      {
         var _loc3_:SpecterEffect = EffectManager.createEffect(param1.effectUrl,true,param2);
         var _loc4_:Vector.<SpecterEffect> = _bindingEffects.getValue(param1.effectUrl) as Vector.<SpecterEffect>;
         if(_loc4_ == null)
         {
            _loc4_ = new Vector.<SpecterEffect>();
         }
         _loc4_.push(_loc3_);
         _bindingEffects.put(param1.effectUrl,_loc4_);
         _loc3_.boneTag = param1.boneTag;
         _loc3_.visibleAndStop = effectsVisible;
         _loc3_.billboard = param1.billboard;
         _loc3_.scaleAll = param1.scale;
         return _loc3_;
      }
      
      override public function addEffect(param1:AvatarEffectVO) : void
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         if(_isAllowBinding)
         {
            _loc2_ = getBoneTag(param1.boneTag) as BoneTag;
            if(param1.boneTag)
            {
               if(_loc2_)
               {
                  _loc4_ = _loc2_.numChildren;
                  while(true)
                  {
                     _loc4_--;
                     if(_loc4_ > -1)
                     {
                        _loc3_ = _loc2_.getChildAt(_loc4_) as AvatarEffect3D;
                        if(_loc3_)
                        {
                           _loc3_.addEffect(param1);
                           break;
                        }
                        continue;
                     }
                     break;
                  }
                  if(_loc3_ == null)
                  {
                     creatEffect(param1,_loc2_);
                  }
               }
               return;
            }
            super.addEffect(param1);
            return;
         }
         _waitBindingEffect = _waitBindingEffect || new Vector.<AvatarEffectVO>();
         _waitBindingEffect.push(param1);
      }
      
      public function set isAllowBinding(param1:Boolean) : void
      {
         var _loc2_:* = null;
         _isAllowBinding = param1;
         if(_waitBindingEffect == null)
         {
            return;
         }
         if(this.alpha != 1)
         {
            this.alphaDirty = true;
         }
         while(_waitBindingEffect.length)
         {
            _loc2_ = _waitBindingEffect.shift();
            addEffect(_loc2_);
         }
      }
      
      public function get triggers() : FrameEventTriggerBase
      {
         return _triggers;
      }
      
      public function set triggers(param1:FrameEventTriggerBase) : void
      {
         _triggers = param1;
      }
   }
}
