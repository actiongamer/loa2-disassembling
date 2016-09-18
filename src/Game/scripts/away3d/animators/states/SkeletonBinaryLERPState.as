package away3d.animators.states
{
   import away3d.animators.nodes.SkeletonBinaryLERPNode;
   import away3d.animators.data.SkeletonPose;
   import away3d.animators.data.Skeleton;
   import flash.geom.Vector3D;
   import away3d.animators.data.JointPose;
   import away3d.animators.IAnimator;
   
   public class SkeletonBinaryLERPState extends AnimationStateBase implements away3d.animators.states.ISkeletonAnimationState
   {
       
      
      private var _blendWeight:Number = 0;
      
      private var _skeletonAnimationNode:SkeletonBinaryLERPNode;
      
      private var _skeletonPose:SkeletonPose;
      
      private var _skeletonPoseDirty:Boolean = true;
      
      private var _inputA:away3d.animators.states.ISkeletonAnimationState;
      
      private var _inputB:away3d.animators.states.ISkeletonAnimationState;
      
      public function SkeletonBinaryLERPState(param1:IAnimator, param2:SkeletonBinaryLERPNode)
      {
         _skeletonPose = new SkeletonPose();
         super(param1,param2);
         _skeletonAnimationNode = param2;
         _inputA = param1.getAnimationState(_skeletonAnimationNode.inputA) as away3d.animators.states.ISkeletonAnimationState;
         _inputB = param1.getAnimationState(_skeletonAnimationNode.inputB) as away3d.animators.states.ISkeletonAnimationState;
      }
      
      public function get blendWeight() : Number
      {
         return _blendWeight;
      }
      
      public function set blendWeight(param1:Number) : void
      {
         _blendWeight = param1;
         _positionDeltaDirty = true;
         _skeletonPoseDirty = true;
      }
      
      override public function phase(param1:Number) : void
      {
         _skeletonPoseDirty = true;
         _positionDeltaDirty = true;
         _inputA.phase(param1);
         _inputB.phase(param1);
      }
      
      override protected function updateTime(param1:int) : void
      {
         _skeletonPoseDirty = true;
         _inputA.update(param1);
         _inputB.update(param1);
         super.updateTime(param1);
      }
      
      public function getSkeletonPose(param1:Skeleton) : SkeletonPose
      {
         if(_skeletonPoseDirty)
         {
            updateSkeletonPose(param1);
         }
         return _skeletonPose;
      }
      
      override protected function updatePositionDelta() : void
      {
         _positionDeltaDirty = false;
         var _loc2_:Vector3D = _inputA.positionDelta;
         var _loc1_:Vector3D = _inputB.positionDelta;
         _rootDelta.x = _loc2_.x + _blendWeight * (_loc1_.x - _loc2_.x);
         _rootDelta.y = _loc2_.y + _blendWeight * (_loc1_.y - _loc2_.y);
         _rootDelta.z = _loc2_.z + _blendWeight * (_loc1_.z - _loc2_.z);
      }
      
      private function updateSkeletonPose(param1:Skeleton) : void
      {
         var _loc7_:* = null;
         var _loc12_:* = null;
         var _loc10_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc4_:* = null;
         var _loc11_:* = 0;
         _skeletonPoseDirty = false;
         var _loc2_:Vector.<JointPose> = _skeletonPose.jointPoses;
         var _loc9_:Vector.<JointPose> = _inputA.getSkeletonPose(param1).jointPoses;
         var _loc3_:Vector.<JointPose> = _inputB.getSkeletonPose(param1).jointPoses;
         var _loc8_:uint = param1.numJoints;
         if(_loc2_.length != _loc8_)
         {
            _loc2_.length = _loc8_;
         }
         _loc11_ = uint(0);
         while(_loc11_ < _loc8_)
         {
            var _loc13_:* = _loc11_;
            var _loc14_:* = _loc2_[_loc13_] || new JointPose();
            _loc2_[_loc13_] = _loc14_;
            _loc7_ = _loc14_;
            _loc10_ = _loc9_[_loc11_];
            _loc12_ = _loc3_[_loc11_];
            _loc6_ = _loc10_.translation;
            _loc5_ = _loc12_.translation;
            _loc7_.orientation.lerp(_loc10_.orientation,_loc12_.orientation,_blendWeight);
            _loc4_ = _loc7_.translation;
            _loc4_.x = _loc6_.x + _blendWeight * (_loc5_.x - _loc6_.x);
            _loc4_.y = _loc6_.y + _blendWeight * (_loc5_.y - _loc6_.y);
            _loc4_.z = _loc6_.z + _blendWeight * (_loc5_.z - _loc6_.z);
            _loc11_++;
         }
      }
   }
}
