package away3d.animators
{
   import away3d.animators.data.SkeletonPose;
   import flash.utils.Dictionary;
   import away3d.animators.data.Skeleton;
   import away3d.animators.states.ISkeletonAnimationState;
   import away3d.entities.BoneTag;
   import away3d.animators.transitions.CrossfadeTransition;
   import away3d.animators.transitions.IAnimationTransition;
   import away3d.core.managers.Stage3DProxy;
   import away3d.core.base.IRenderable;
   import away3d.cameras.Camera3D;
   import away3d.core.base.SkinnedSubGeometry;
   import away3d.core.base.SubMesh;
   import away3d.materials.passes.MaterialPassBase;
   import away3d.animators.data.JointPose;
   import away3d.animators.data.SkeletonJoint;
   import away3d.core.math.Quaternion;
   import flash.geom.Vector3D;
   import away3d.events.AnimatorEvent;
   import away3d.events.AnimationStateEvent;
   import org.specter3d.debug.DebugEngineLog;
   
   public class SkeletonAnimator extends AnimatorBase implements IAnimator
   {
      
      private static var _updateDeltaTimeLemited:Number = 0;
       
      
      private var _globalMatrices:Vector.<Number>;
      
      private var _globalPose:SkeletonPose;
      
      private var _globalPropertiesDirty:Boolean;
      
      private var _numJoints:uint;
      
      private var _animationStates:Dictionary;
      
      private var _skeleton:Skeleton;
      
      private var _forceCPU:Boolean;
      
      private var _useCondensedIndices:Boolean = true;
      
      private var _jointsPerVertex:uint;
      
      private var _activeSkeletonState:ISkeletonAnimationState;
      
      private var _BoneTags:Vector.<BoneTag>;
      
      private var _transition:IAnimationTransition;
      
      private var condensedMatrices0:Vector.<Number>;
      
      private var condensedMatrices1:Vector.<Number>;
      
      private var condensedMatrices2:Vector.<Number>;
      
      private var condensedMatrices3:Vector.<Number>;
      
      private var _renderTime:Number = 0;
      
      private var condensedMatricesCounter:int = -1;
      
      private var needUpdateCondensedMatricesCounter:int = 0;
      
      public function SkeletonAnimator(param1:SkeletonAnimationSet, param2:Skeleton, param3:Boolean = false)
      {
         var _loc4_:int = 0;
         var _loc5_:* = 0;
         _globalPose = new SkeletonPose();
         _animationStates = new Dictionary();
         _BoneTags = new Vector.<BoneTag>();
         super(param1);
         _skeleton = param2;
         _forceCPU = param3;
         _jointsPerVertex = param1.jointsPerVertex;
         _numJoints = _skeleton.numJoints;
         _globalMatrices = new Vector.<Number>(_numJoints * 12,true);
         _loc5_ = uint(0);
         while(_loc5_ < _numJoints)
         {
            _loc4_++;
            _globalMatrices[_loc4_] = 1;
            _loc4_++;
            _globalMatrices[_loc4_] = 0;
            _loc4_++;
            _globalMatrices[_loc4_] = 0;
            _loc4_++;
            _globalMatrices[_loc4_] = 0;
            _loc4_++;
            _globalMatrices[_loc4_] = 0;
            _loc4_++;
            _globalMatrices[_loc4_] = 1;
            _loc4_++;
            _globalMatrices[_loc4_] = 0;
            _loc4_++;
            _globalMatrices[_loc4_] = 0;
            _loc4_++;
            _globalMatrices[_loc4_] = 0;
            _loc4_++;
            _globalMatrices[_loc4_] = 0;
            _loc4_++;
            _globalMatrices[_loc4_] = 1;
            _loc4_++;
            _globalMatrices[_loc4_] = 0;
            _loc5_++;
         }
      }
      
      public static function setUpdateDeltaTimeLemited(param1:Number) : void
      {
         _updateDeltaTimeLemited = 16.6666666666667 / param1;
      }
      
      public function addBoneTag(param1:String) : BoneTag
      {
         var _loc2_:int = globalPose.jointPoseIndexFromName(param1);
         if(_loc2_ < 0)
         {
            return null;
         }
         return addBoneTagByIndex(_loc2_);
      }
      
      public function removeBoneTag(param1:String) : BoneTag
      {
         var _loc4_:int = 0;
         var _loc3_:int = globalPose.jointPoseIndexFromName(param1);
         if(_loc3_ < 0)
         {
            return null;
         }
         var _loc2_:BoneTag = null;
         _loc4_ = 0;
         while(_loc4_ < _BoneTags.length)
         {
            if(_BoneTags[_loc4_].boneIndex == _loc3_)
            {
               _loc2_ = _BoneTags[_loc4_];
               _BoneTags.splice(_loc4_,1);
               break;
            }
            _loc4_++;
         }
         if(_loc2_)
         {
            _loc4_ = 0;
            while(_loc4_ < _owners.length)
            {
               _owners[_loc4_].removeChild(_loc2_);
               _loc4_++;
            }
         }
         return _loc2_;
      }
      
      public function addBoneTagByIndex(param1:int) : BoneTag
      {
         var _loc3_:int = 0;
         var _loc2_:BoneTag = new BoneTag(this,param1);
         _loc3_ = 0;
         while(_loc3_ < _owners.length)
         {
            _owners[_loc3_].addChild(_loc2_);
            _loc3_++;
         }
         _BoneTags.push(_loc2_);
         return _loc2_;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get globalMatrices() : Vector.<Number>
      {
         if(_globalPropertiesDirty)
         {
            updateGlobalProperties();
         }
         return _globalMatrices;
      }
      
      public function get globalPose() : SkeletonPose
      {
         if(_globalPropertiesDirty)
         {
            updateGlobalProperties();
         }
         return _globalPose;
      }
      
      public function get skeleton() : Skeleton
      {
         return _skeleton;
      }
      
      public function get forceCPU() : Boolean
      {
         return _forceCPU;
      }
      
      override public function dispose() : void
      {
         if(this.isDispose)
         {
            return;
         }
         _globalMatrices = null;
         _globalPose.dispose();
         _globalPose = null;
         _animationStates = null;
         if(_transition is CrossfadeTransition)
         {
            (_transition as CrossfadeTransition).removeAnimationNode(this);
         }
         _transition = null;
         _skeleton = null;
         condensedMatrices0 = null;
         condensedMatrices1 = null;
         condensedMatrices2 = null;
         condensedMatrices3 = null;
         super.dispose();
         while(_BoneTags.length)
         {
            _BoneTags.shift().dispose();
         }
         _BoneTags = null;
      }
      
      public function get useCondensedIndices() : Boolean
      {
         return _useCondensedIndices;
      }
      
      public function set useCondensedIndices(param1:Boolean) : void
      {
         _useCondensedIndices = param1;
      }
      
      public function clone() : SkeletonAnimator
      {
         return new SkeletonAnimator(SkeletonAnimationSet(_animationSet),_skeleton);
      }
      
      public function play(param1:String, param2:IAnimationTransition = null, param3:Number = NaN) : void
      {
         if(_name == param1)
         {
            return;
         }
         if(!_animationSet.hasAnimation(param1))
         {
            throw new Error("Animation root node " + param1 + " not found!");
         }
         _name = param1;
         _transition = param2;
         if(param2 && _activeNode)
         {
            _activeNode = param2.getAnimationNode(this,_activeNode,_animationSet.getAnimation(param1),_absoluteTime);
            _activeNode.addEventListener("transitionComplete",onTransitionComplete);
         }
         else
         {
            _activeNode = _animationSet.getAnimation(param1);
         }
         _activeState = getAnimationState(_activeNode);
         if(updatePosition)
         {
            _activeState.update(_absoluteTime);
         }
         _activeSkeletonState = _activeState as ISkeletonAnimationState;
         start();
         if(!isNaN(param3))
         {
            reset(param1,param3);
         }
         _globalPropertiesDirty = true;
      }
      
      public function setRenderState(param1:Stage3DProxy, param2:IRenderable, param3:int, param4:int, param5:Camera3D) : void
      {
         var _loc9_:* = null;
         var _loc6_:* = undefined;
         if(_globalPropertiesDirty)
         {
            updateGlobalProperties();
         }
         var _loc8_:SkinnedSubGeometry = SkinnedSubGeometry(SubMesh(param2).subGeometry);
         if(_animationSet.usesCPU)
         {
            var _loc10_:* = _loc8_;
            var _loc11_:* = _animationStates[_loc10_] || new SubGeomAnimationState(_loc8_);
            _animationStates[_loc10_] = _loc11_;
            _loc9_ = _loc11_;
            if(_loc9_.dirty)
            {
               morphGeometry(_loc9_,_loc8_);
               _loc9_.dirty = false;
            }
            _loc8_.updateAnimatedData(_loc9_.animatedVertexData);
            return;
         }
         var _loc7_:uint = _loc8_.condensedNumJoints;
         if(_loc7_ == 0)
         {
            _loc8_.condenseIndexData();
            _loc7_ = _loc8_.condensedNumJoints;
         }
         if(condensedMatricesCounter == 0)
         {
            if(condensedMatrices0 == null)
            {
               condensedMatrices0 = new Vector.<Number>();
            }
            _loc6_ = condensedMatrices0;
         }
         else if(condensedMatricesCounter == 1)
         {
            if(condensedMatrices1 == null)
            {
               condensedMatrices1 = new Vector.<Number>();
            }
            _loc6_ = condensedMatrices1;
         }
         else if(condensedMatricesCounter == 2)
         {
            if(condensedMatrices2 == null)
            {
               condensedMatrices2 = new Vector.<Number>();
            }
            _loc6_ = condensedMatrices2;
         }
         else
         {
            if(condensedMatrices3 == null)
            {
               condensedMatrices3 = new Vector.<Number>();
            }
            _loc6_ = condensedMatrices3;
         }
         updateCondensedMatrices(_loc6_,_loc8_.condensedIndexLookUp,_loc7_);
         param1._context3D.setProgramConstantsFromVector("vertex",param3,_loc6_,_loc7_ * 3);
         condensedMatricesCounter = Number(condensedMatricesCounter) + 1;
         _loc8_.activateJointIndexBuffer(param4,param1);
         _loc8_.activateJointWeightsBuffer(param4 + 1,param1);
      }
      
      public function testGPUCompatibility(param1:MaterialPassBase) : void
      {
         if(_jointsPerVertex > 4)
         {
            _animationSet.cancelGPUCompatibility();
            trace("SkeletonAnimator:::\tjointsPerVertex = " + _jointsPerVertex + "  模型中有某些顶点绑定了4个以上的骨骼,动画将退回由CPU处理! 请优化你的模型!");
         }
      }
      
      override protected function updateDeltaTime(param1:Number) : void
      {
         super.updateDeltaTime(param1);
         _renderTime = _renderTime + param1;
         if(_renderTime >= _updateDeltaTimeLemited)
         {
            _globalPropertiesDirty = true;
            var _loc4_:int = 0;
            var _loc3_:* = _animationStates;
            for(var _loc2_ in _animationStates)
            {
               SubGeomAnimationState(_animationStates[_loc2_]).dirty = true;
            }
            _renderTime = _renderTime - _updateDeltaTimeLemited;
         }
         condensedMatricesCounter = 0;
         needUpdateCondensedMatricesCounter = 0;
      }
      
      private function updateCondensedMatrices(param1:Vector.<Number>, param2:Vector.<uint>, param3:uint) : void
      {
         var _loc5_:* = 0;
         var _loc4_:* = 0;
         var _loc8_:Boolean = true;
         if(_loc8_)
         {
            if(needUpdateCondensedMatricesCounter == 0 && param1.length == param3 * 12)
            {
               return;
            }
         }
         var _loc7_:uint = 0;
         var _loc6_:uint = 0;
         param1.length = 0;
         if(param2.length == 0)
         {
            return;
         }
         do
         {
            _loc4_ = uint(param2[_loc7_ * 3] * 4);
            _loc5_ = uint(_loc4_ + 12);
            while(_loc4_ < _loc5_)
            {
               param1[_loc6_++] = _globalMatrices[_loc4_++];
            }
         }
         while(++_loc7_ < param3);
         
      }
      
      private function updateGlobalProperties() : void
      {
         var _loc18_:* = 0;
         var _loc1_:* = undefined;
         var _loc30_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc36_:Number = NaN;
         var _loc34_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc31_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc37_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc38_:Number = NaN;
         var _loc39_:Number = NaN;
         var _loc41_:Number = NaN;
         var _loc35_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc7_:* = null;
         var _loc19_:* = null;
         var _loc40_:* = null;
         var _loc32_:Number = NaN;
         var _loc29_:* = 0;
         var _loc14_:int = 0;
         _globalPropertiesDirty = false;
         if(!_activeSkeletonState)
         {
            return;
         }
         needUpdateCondensedMatricesCounter = 1;
         localToGlobalPose(_activeSkeletonState.getSkeletonPose(_skeleton),_globalPose,_skeleton);
         var _loc33_:Vector.<JointPose> = _globalPose.jointPoses;
         var _loc6_:Vector.<SkeletonJoint> = _skeleton.joints;
         _loc29_ = uint(0);
         while(_loc29_ < _numJoints)
         {
            _loc7_ = _loc33_[_loc29_];
            _loc19_ = _loc7_.orientation;
            _loc40_ = _loc7_.translation;
            _loc26_ = _loc19_.x;
            _loc30_ = _loc19_.y;
            _loc28_ = _loc19_.z;
            _loc27_ = _loc19_.w;
            _loc32_ = 2 * _loc26_;
            _loc34_ = 2 * _loc26_ * _loc30_;
            _loc13_ = _loc32_ * _loc28_;
            _loc36_ = _loc32_ * _loc27_;
            _loc32_ = 2 * _loc30_;
            _loc12_ = 2 * _loc30_ * _loc28_;
            _loc25_ = _loc32_ * _loc27_;
            _loc31_ = 2 * _loc28_ * _loc27_;
            _loc12_ = 2 * _loc30_ * _loc28_;
            _loc25_ = 2 * _loc30_ * _loc27_;
            _loc31_ = 2 * _loc28_ * _loc27_;
            _loc26_ = _loc26_ * _loc26_;
            _loc30_ = _loc30_ * _loc30_;
            _loc28_ = _loc28_ * _loc28_;
            _loc27_ = _loc27_ * _loc27_;
            _loc32_ = _loc26_ - _loc30_;
            _loc21_ = _loc26_ - _loc30_ - _loc28_ + _loc27_;
            _loc20_ = _loc34_ - _loc31_;
            _loc37_ = _loc13_ + _loc25_;
            _loc4_ = _loc34_ + _loc31_;
            _loc3_ = -_loc32_ - _loc28_ + _loc27_;
            _loc2_ = _loc12_ - _loc36_;
            _loc23_ = _loc13_ - _loc25_;
            _loc22_ = _loc12_ + _loc36_;
            _loc24_ = -_loc26_ - _loc30_ + _loc28_ + _loc27_;
            _loc1_ = _loc6_[_loc29_].inverseBindPose;
            _loc17_ = _loc1_[0];
            _loc15_ = _loc1_[4];
            _loc16_ = _loc1_[8];
            _loc5_ = _loc1_[12];
            _loc35_ = _loc1_[1];
            _loc38_ = _loc1_[5];
            _loc39_ = _loc1_[9];
            _loc41_ = _loc1_[13];
            _loc11_ = _loc1_[2];
            _loc10_ = _loc1_[6];
            _loc9_ = _loc1_[10];
            _loc8_ = _loc1_[14];
            _globalMatrices[uint(_loc18_)] = _loc21_ * _loc17_ + _loc20_ * _loc35_ + _loc37_ * _loc11_;
            _globalMatrices[uint(_loc18_ + 1)] = _loc21_ * _loc15_ + _loc20_ * _loc38_ + _loc37_ * _loc10_;
            _globalMatrices[uint(_loc18_ + 2)] = _loc21_ * _loc16_ + _loc20_ * _loc39_ + _loc37_ * _loc9_;
            _globalMatrices[uint(_loc18_ + 3)] = _loc21_ * _loc5_ + _loc20_ * _loc41_ + _loc37_ * _loc8_ + _loc40_.x;
            _globalMatrices[uint(_loc18_ + 4)] = _loc4_ * _loc17_ + _loc3_ * _loc35_ + _loc2_ * _loc11_;
            _globalMatrices[uint(_loc18_ + 5)] = _loc4_ * _loc15_ + _loc3_ * _loc38_ + _loc2_ * _loc10_;
            _globalMatrices[uint(_loc18_ + 6)] = _loc4_ * _loc16_ + _loc3_ * _loc39_ + _loc2_ * _loc9_;
            _globalMatrices[uint(_loc18_ + 7)] = _loc4_ * _loc5_ + _loc3_ * _loc41_ + _loc2_ * _loc8_ + _loc40_.y;
            _globalMatrices[uint(_loc18_ + 8)] = _loc23_ * _loc17_ + _loc22_ * _loc35_ + _loc24_ * _loc11_;
            _globalMatrices[uint(_loc18_ + 9)] = _loc23_ * _loc15_ + _loc22_ * _loc38_ + _loc24_ * _loc10_;
            _globalMatrices[uint(_loc18_ + 10)] = _loc23_ * _loc16_ + _loc22_ * _loc39_ + _loc24_ * _loc9_;
            _globalMatrices[uint(_loc18_ + 11)] = _loc23_ * _loc5_ + _loc22_ * _loc41_ + _loc24_ * _loc8_ + _loc40_.z;
            _loc18_ = uint(_loc18_ + 12);
            _loc29_++;
         }
         _loc14_ = 0;
         while(_loc14_ < _BoneTags.length)
         {
            _BoneTags[_loc14_].needUpdateSceneTransform();
            _loc14_++;
         }
         if(hasEventListener("animator_enter_frame"))
         {
            dispatchEvent(new AnimatorEvent("animator_enter_frame",this));
         }
      }
      
      private function morphGeometry(param1:SubGeomAnimationState, param2:SkinnedSubGeometry) : void
      {
         var _loc28_:* = 0;
         var _loc31_:* = 0;
         var _loc30_:* = 0;
         var _loc34_:* = NaN;
         var _loc38_:* = NaN;
         var _loc35_:* = NaN;
         var _loc13_:* = NaN;
         var _loc11_:* = NaN;
         var _loc14_:* = NaN;
         var _loc32_:* = NaN;
         var _loc37_:* = NaN;
         var _loc33_:* = NaN;
         var _loc7_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc40_:Number = NaN;
         var _loc41_:Number = NaN;
         var _loc42_:Number = NaN;
         var _loc39_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc25_:* = 0;
         var _loc23_:Vector.<Number> = param2.vertexData;
         var _loc36_:Vector.<Number> = param1.animatedVertexData;
         var _loc20_:Vector.<Number> = param2.jointIndexData;
         var _loc5_:Vector.<Number> = param2.jointWeightsData;
         var _loc29_:int = _loc23_.length;
         while(_loc28_ < _loc29_)
         {
            _loc16_ = _loc23_[_loc28_];
            _loc24_ = _loc23_[uint(_loc28_ + 1)];
            _loc27_ = _loc23_[uint(_loc28_ + 2)];
            _loc4_ = _loc23_[uint(_loc28_ + 3)];
            _loc3_ = _loc23_[uint(_loc28_ + 4)];
            _loc8_ = _loc23_[uint(_loc28_ + 5)];
            _loc9_ = _loc23_[uint(_loc28_ + 6)];
            _loc10_ = _loc23_[uint(_loc28_ + 7)];
            _loc12_ = _loc23_[uint(_loc28_ + 8)];
            _loc35_ = 0;
            _loc34_ = 0;
            _loc38_ = 0;
            _loc14_ = 0;
            _loc13_ = 0;
            _loc11_ = 0;
            _loc33_ = 0;
            _loc32_ = 0;
            _loc37_ = 0;
            _loc31_ = uint(0);
            while(_loc31_ < _jointsPerVertex)
            {
               _loc7_ = _loc5_[_loc30_];
               if(_loc7_ > 0)
               {
                  _loc25_ = uint(uint(_loc20_[_loc30_++]) << 2);
                  _loc26_ = _globalMatrices[_loc25_];
                  _loc21_ = _globalMatrices[uint(_loc25_ + 1)];
                  _loc22_ = _globalMatrices[uint(_loc25_ + 2)];
                  _loc6_ = _globalMatrices[uint(_loc25_ + 3)];
                  _loc39_ = _globalMatrices[uint(_loc25_ + 4)];
                  _loc40_ = _globalMatrices[uint(_loc25_ + 5)];
                  _loc41_ = _globalMatrices[uint(_loc25_ + 6)];
                  _loc42_ = _globalMatrices[uint(_loc25_ + 7)];
                  _loc19_ = _globalMatrices[uint(_loc25_ + 8)];
                  _loc18_ = _globalMatrices[uint(_loc25_ + 9)];
                  _loc17_ = _globalMatrices[uint(_loc25_ + 10)];
                  _loc15_ = _globalMatrices[uint(_loc25_ + 11)];
                  _loc35_ = Number(_loc35_ + _loc7_ * (_loc26_ * _loc16_ + _loc21_ * _loc24_ + _loc22_ * _loc27_ + _loc6_));
                  _loc34_ = Number(_loc34_ + _loc7_ * (_loc39_ * _loc16_ + _loc40_ * _loc24_ + _loc41_ * _loc27_ + _loc42_));
                  _loc38_ = Number(_loc38_ + _loc7_ * (_loc19_ * _loc16_ + _loc18_ * _loc24_ + _loc17_ * _loc27_ + _loc15_));
                  _loc14_ = Number(_loc14_ + _loc7_ * (_loc26_ * _loc4_ + _loc21_ * _loc3_ + _loc22_ * _loc8_));
                  _loc13_ = Number(_loc13_ + _loc7_ * (_loc39_ * _loc4_ + _loc40_ * _loc3_ + _loc41_ * _loc8_));
                  _loc11_ = Number(_loc11_ + _loc7_ * (_loc19_ * _loc4_ + _loc18_ * _loc3_ + _loc17_ * _loc8_));
                  _loc33_ = Number(_loc33_ + _loc7_ * (_loc26_ * _loc9_ + _loc21_ * _loc10_ + _loc22_ * _loc12_));
                  _loc32_ = Number(_loc32_ + _loc7_ * (_loc39_ * _loc9_ + _loc40_ * _loc10_ + _loc41_ * _loc12_));
                  _loc37_ = Number(_loc37_ + _loc7_ * (_loc19_ * _loc9_ + _loc18_ * _loc10_ + _loc17_ * _loc12_));
                  _loc31_++;
               }
               else
               {
                  _loc30_ = uint(_loc30_ + (uint(_jointsPerVertex - _loc31_)));
                  _loc31_ = uint(_jointsPerVertex);
               }
            }
            _loc36_[_loc28_] = _loc35_;
            _loc36_[uint(_loc28_ + 1)] = _loc34_;
            _loc36_[uint(_loc28_ + 2)] = _loc38_;
            _loc36_[uint(_loc28_ + 3)] = _loc14_;
            _loc36_[uint(_loc28_ + 4)] = _loc13_;
            _loc36_[uint(_loc28_ + 5)] = _loc11_;
            _loc36_[uint(_loc28_ + 6)] = _loc33_;
            _loc36_[uint(_loc28_ + 7)] = _loc32_;
            _loc36_[uint(_loc28_ + 8)] = _loc37_;
            _loc28_ = uint(_loc28_ + 13);
         }
      }
      
      private function localToGlobalPose(param1:SkeletonPose, param2:SkeletonPose, param3:Skeleton) : void
      {
         var _loc14_:* = null;
         var _loc25_:int = 0;
         var _loc15_:* = null;
         var _loc6_:* = null;
         var _loc13_:* = null;
         var _loc16_:* = null;
         var _loc4_:* = null;
         var _loc26_:* = null;
         var _loc28_:* = null;
         var _loc17_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc23_:* = 0;
         var _loc27_:Vector.<JointPose> = param2.jointPoses;
         var _loc7_:Vector.<SkeletonJoint> = param3.joints;
         var _loc20_:uint = param1.numJointPoses;
         var _loc21_:Vector.<JointPose> = param1.jointPoses;
         if(_loc27_.length != _loc20_)
         {
            _loc27_.length = _loc20_;
         }
         _loc23_ = uint(0);
         while(_loc23_ < _loc20_)
         {
            var _loc29_:* = _loc23_;
            var _loc30_:* = _loc27_[_loc29_] || new JointPose();
            _loc27_[_loc29_] = _loc30_;
            _loc14_ = _loc30_;
            _loc15_ = _loc7_[_loc23_];
            _loc14_.name = _loc15_.name;
            _loc25_ = _loc15_.parentIndex;
            _loc13_ = _loc21_[_loc23_];
            _loc28_ = _loc14_.orientation;
            _loc26_ = _loc14_.translation;
            if(_loc25_ < 0)
            {
               _loc4_ = _loc13_.translation;
               _loc16_ = _loc13_.orientation;
               _loc28_.copyFrom(_loc16_);
               _loc26_.copyFrom(_loc4_);
            }
            else
            {
               _loc6_ = _loc27_[_loc25_];
               _loc16_ = _loc6_.orientation;
               _loc4_ = _loc13_.translation;
               _loc10_ = _loc16_.x;
               _loc18_ = _loc16_.y;
               _loc8_ = _loc16_.z;
               _loc24_ = _loc16_.w;
               _loc11_ = _loc4_.x;
               _loc19_ = _loc4_.y;
               _loc9_ = _loc4_.z;
               _loc22_ = -_loc10_ * _loc11_ - _loc18_ * _loc19_ - _loc8_ * _loc9_;
               _loc12_ = _loc24_ * _loc11_ + _loc18_ * _loc9_ - _loc8_ * _loc19_;
               _loc17_ = _loc24_ * _loc19_ - _loc10_ * _loc9_ + _loc8_ * _loc11_;
               _loc5_ = _loc24_ * _loc9_ + _loc10_ * _loc19_ - _loc18_ * _loc11_;
               _loc4_ = _loc6_.translation;
               _loc26_.x = -_loc22_ * _loc10_ + _loc12_ * _loc24_ - _loc17_ * _loc8_ + _loc5_ * _loc18_ + _loc4_.x;
               _loc26_.y = -_loc22_ * _loc18_ + _loc12_ * _loc8_ + _loc17_ * _loc24_ - _loc5_ * _loc10_ + _loc4_.y;
               _loc26_.z = -_loc22_ * _loc8_ - _loc12_ * _loc18_ + _loc17_ * _loc10_ + _loc5_ * _loc24_ + _loc4_.z;
               _loc12_ = _loc16_.x;
               _loc17_ = _loc16_.y;
               _loc5_ = _loc16_.z;
               _loc22_ = _loc16_.w;
               _loc16_ = _loc13_.orientation;
               _loc10_ = _loc16_.x;
               _loc18_ = _loc16_.y;
               _loc8_ = _loc16_.z;
               _loc24_ = _loc16_.w;
               _loc28_.w = _loc22_ * _loc24_ - _loc12_ * _loc10_ - _loc17_ * _loc18_ - _loc5_ * _loc8_;
               _loc28_.x = _loc22_ * _loc10_ + _loc12_ * _loc24_ + _loc17_ * _loc8_ - _loc5_ * _loc18_;
               _loc28_.y = _loc22_ * _loc18_ - _loc12_ * _loc8_ + _loc17_ * _loc24_ + _loc5_ * _loc10_;
               _loc28_.z = _loc22_ * _loc8_ + _loc12_ * _loc18_ - _loc17_ * _loc10_ + _loc5_ * _loc24_;
            }
            _loc23_++;
         }
      }
      
      private function onTransitionComplete(param1:AnimationStateEvent) : void
      {
         if(param1.type == "transitionComplete")
         {
            param1.animationNode.removeEventListener("transitionComplete",onTransitionComplete);
            if(_activeState == param1.animationState)
            {
               try
               {
                  if(_transition is CrossfadeTransition)
                  {
                     (_transition as CrossfadeTransition).removeAnimationNode(this);
                  }
                  _activeNode = _animationSet.getAnimation(_name);
                  _activeState = getAnimationState(_activeNode);
                  _activeSkeletonState = _activeState as ISkeletonAnimationState;
                  return;
               }
               catch(error:Error)
               {
                  DebugEngineLog.toChat("缺少动作：" + _name + " " + _owners[0].name);
                  _name = null;
                  return;
               }
            }
         }
      }
   }
}

import away3d.core.base.CompactSubGeometry;

class SubGeomAnimationState
{
    
   
   public var animatedVertexData:Vector.<Number>;
   
   public var dirty:Boolean = true;
   
   function SubGeomAnimationState(param1:CompactSubGeometry)
   {
      super();
      animatedVertexData = param1.vertexData.concat();
   }
}
