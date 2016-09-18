package away3d.animators.states
{
   import flash.utils.Dictionary;
   import flash.geom.Vector3D;
   import away3d.animators.data.SkeletonPose;
   import away3d.animators.nodes.SkeletonClipNode;
   import away3d.animators.data.Skeleton;
   import away3d.animators.data.JointPose;
   import org.specter3d.debug.DebugEngineLog;
   import away3d.animators.IAnimator;
   
   public class SkeletonClipState extends AnimationClipState implements ISkeletonAnimationState
   {
      
      private static var _clipNodes:Dictionary = new Dictionary();
       
      
      private var _rootPos:Vector3D;
      
      private var _frames:Vector.<SkeletonPose>;
      
      private var _skeletonClipNode:SkeletonClipNode;
      
      private var _skeletonPose:SkeletonPose;
      
      private var _skeletonPoseDirty:Boolean = true;
      
      private var _currentPose:SkeletonPose;
      
      private var _nextPose:SkeletonPose;
      
      private var _boneNumErrorDirty:Boolean;
      
      public function SkeletonClipState(param1:IAnimator, param2:SkeletonClipNode)
      {
         _rootPos = new Vector3D();
         _skeletonPose = new SkeletonPose();
         super(param1,param2);
         _skeletonClipNode = param2;
         _frames = _skeletonClipNode.frames;
      }
      
      public static function cleanCacheNodes() : void
      {
         _clipNodes = new Dictionary();
      }
      
      public static function cleanCacheNode(param1:String) : void
      {
      }
      
      public function get currentPose() : SkeletonPose
      {
         if(_framesDirty)
         {
            updateFrames();
         }
         return _currentPose;
      }
      
      public function get nextPose() : SkeletonPose
      {
         if(_framesDirty)
         {
            updateFrames();
         }
         return _nextPose;
      }
      
      public function getSkeletonPose(param1:Skeleton) : SkeletonPose
      {
         if(_skeletonPoseDirty)
         {
            updateSkeletonPose(param1);
         }
         return _skeletonPose;
      }
      
      override protected function updateTime(param1:int) : void
      {
         _skeletonPoseDirty = true;
         super.updateTime(param1);
      }
      
      override protected function updateFrames() : void
      {
         super.updateFrames();
         _currentPose = _frames[_currentFrame];
         if(_skeletonClipNode.looping && _nextFrame >= _skeletonClipNode.lastFrame)
         {
            _nextPose = _frames[0];
         }
         else
         {
            _nextPose = _frames[_nextFrame];
         }
      }
      
      private function updateSkeletonPose(param1:Skeleton) : void
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc17_:* = null;
         var _loc16_:* = null;
         var _loc11_:* = null;
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc12_:* = null;
         var _loc8_:* = 0;
         _skeletonPoseDirty = false;
         if(!_skeletonClipNode.totalDuration || _skeletonClipNode.frames == null)
         {
            return;
         }
         if(_framesDirty)
         {
            updateFrames();
         }
         var _loc6_:Vector.<JointPose> = _currentPose.jointPoses;
         var _loc7_:Vector.<JointPose> = _nextPose.jointPoses;
         var _loc13_:uint = param1.numJoints;
         var _loc9_:Vector.<JointPose> = _skeletonPose.jointPoses;
         if(_loc9_.length != _loc13_)
         {
            _loc9_.length = _loc13_;
         }
         var _loc10_:int = _loc6_.length;
         var _loc14_:int = _loc7_.length;
         checkBoneNumError(_loc6_,_loc7_,param1,_loc13_,_loc10_,_loc14_);
         if(!_clipNodes[_skeletonClipNode.url])
         {
            _clipNodes[_skeletonClipNode.url] = new Dictionary();
         }
         var _loc15_:Dictionary = _clipNodes[_skeletonClipNode.url] as Dictionary;
         _loc8_ = uint(0);
         while(_loc8_ < _loc13_)
         {
            var _loc18_:* = _loc8_;
            var _loc19_:* = _loc9_[_loc18_] || new JointPose();
            _loc9_[_loc18_] = _loc19_;
            _loc11_ = _loc19_;
            _loc11_.name = _loc8_ < _loc14_?_loc7_[_loc8_].name:_loc7_[_loc7_.length - 1].name;
            _loc2_ = _loc15_[_loc11_.name] as Array;
            _loc2_ = _loc2_ || _loc2_;
            _loc12_ = _loc2_[_currentFrame];
            if(_loc12_)
            {
               _loc11_.orientation.copyFrom(_loc12_.orientation);
               _loc11_.translation.copyFrom(_loc12_.translation);
            }
            else
            {
               _loc16_ = _loc8_ < _loc10_?_loc6_[_loc8_]:_loc6_[_loc6_.length - 1];
               _loc17_ = _loc8_ < _loc14_?_loc7_[_loc8_]:_loc7_[_loc7_.length - 1];
               _loc5_ = _loc16_.translation;
               _loc3_ = _loc17_.translation;
               if(_skeletonClipNode.highQuality)
               {
                  _loc11_.orientation.slerp(_loc16_.orientation,_loc17_.orientation,_blendWeight);
               }
               else
               {
                  _loc11_.orientation.lerp(_loc16_.orientation,_loc17_.orientation,_blendWeight);
               }
               if(_loc8_ > 0)
               {
                  _loc4_ = _loc11_.translation;
                  _loc4_.x = _loc5_.x + _blendWeight * (_loc3_.x - _loc5_.x);
                  _loc4_.y = _loc5_.y + _blendWeight * (_loc3_.y - _loc5_.y);
                  _loc4_.z = _loc5_.z + _blendWeight * (_loc3_.z - _loc5_.z);
               }
               _loc12_ = {};
               _loc12_.orientation = _loc11_.orientation.clone();
               _loc12_.translation = _loc11_.translation.clone();
               _loc2_[_currentFrame] = _loc12_;
            }
            if(!_boneNumErrorDirty)
            {
               _loc15_[_loc11_.name] = _loc2_;
            }
            _loc8_++;
         }
      }
      
      private function checkBoneNumError(param1:Vector.<JointPose>, param2:Vector.<JointPose>, param3:Skeleton, param4:int, param5:int, param6:int) : void
      {
         var _loc7_:* = null;
         if(param4 == 0)
         {
            throw new Error("正在使用一个被释放释放过的模型资源！URL:" + _skeletonClipNode.url);
         }
         if(!_boneNumErrorDirty && (param4 != param5 || param4 != param6))
         {
            _boneNumErrorDirty = true;
            _loc7_ = "动作与模型的骨骼数不匹配! 动作URL:" + _skeletonClipNode.url + "\n模型骨骼数:" + param4 + "  缺少:" + checkBoneVec(param1,param3.joints) + "\n当前骨骼数:" + param1.length + "  缺少:" + checkBoneVec(param3.joints,param1) + "\n下一个骨骼数:" + param2.length + "  缺少:" + checkBoneVec(param3.joints,param2);
            DebugEngineLog.toWindowError(_loc7_);
         }
      }
      
      private function checkBoneVec(param1:Object, param2:Object) : Array
      {
         var _loc8_:* = null;
         var _loc5_:* = null;
         var _loc7_:int = 0;
         var _loc6_:Boolean = false;
         var _loc4_:int = 0;
         var _loc3_:Array = [];
         _loc7_ = 0;
         while(_loc7_ < param1.length)
         {
            _loc6_ = false;
            _loc8_ = param1[_loc7_].name;
            _loc4_ = 0;
            while(_loc4_ < param2.length)
            {
               _loc5_ = param2[_loc4_].name;
               if(_loc8_ == _loc5_)
               {
                  _loc6_ = true;
               }
               _loc4_++;
            }
            if(!_loc6_)
            {
               _loc3_.push(_loc8_);
            }
            _loc7_++;
         }
         return _loc3_;
      }
      
      override protected function updatePositionDelta() : void
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc6_:* = null;
         _positionDeltaDirty = false;
         if(_framesDirty)
         {
            updateFrames();
         }
         if(_skeletonClipNode.frames == null)
         {
            return;
         }
         var _loc7_:Vector3D = _skeletonClipNode.totalDelta;
         if(_timeDir > 0 && _nextFrame < _oldFrame || _timeDir < 0 && _nextFrame > _oldFrame)
         {
            _rootPos.x = _rootPos.x - _loc7_.x * _timeDir;
            _rootPos.y = _rootPos.y - _loc7_.y * _timeDir;
            _rootPos.z = _rootPos.z - _loc7_.z * _timeDir;
         }
         var _loc1_:Number = _rootPos.x;
         var _loc3_:Number = _rootPos.y;
         var _loc5_:Number = _rootPos.z;
         if(_skeletonClipNode.stitchFinalFrame && _nextFrame == _skeletonClipNode.lastFrame)
         {
            _loc6_ = _frames[0].jointPoses[0].translation;
            _loc4_ = _frames[1].jointPoses[0].translation;
            _loc2_ = _currentPose.jointPoses[0].translation;
            _rootPos.x = _loc2_.x + _loc6_.x + _blendWeight * (_loc4_.x - _loc6_.x);
            _rootPos.y = _loc2_.y + _loc6_.y + _blendWeight * (_loc4_.y - _loc6_.y);
            _rootPos.z = _loc2_.z + _loc6_.z + _blendWeight * (_loc4_.z - _loc6_.z);
         }
         else
         {
            _loc6_ = _currentPose.jointPoses[0].translation;
            _loc4_ = _frames[_nextFrame].jointPoses[0].translation;
            _rootPos.x = _loc6_.x + _blendWeight * (_loc4_.x - _loc6_.x);
            _rootPos.y = _loc6_.y + _blendWeight * (_loc4_.y - _loc6_.y);
            _rootPos.z = _loc6_.z + _blendWeight * (_loc4_.z - _loc6_.z);
         }
         _rootDelta.x = _rootPos.x - _loc1_;
         _rootDelta.y = _rootPos.y - _loc3_;
         _rootDelta.z = _rootPos.z - _loc5_;
         _oldFrame = _nextFrame;
      }
   }
}
