package away3d.entities
{
   import away3d.containers.ObjectContainer3D;
   import away3d.animators.SkeletonAnimator;
   import §away3d:arcane§.invalidateTransform;
   import flash.geom.Matrix3D;
   
   public class BoneTag extends ObjectContainer3D
   {
       
      
      private var _skeletonAnimator:SkeletonAnimator;
      
      private var _boneIndex:int;
      
      public function BoneTag(param1:SkeletonAnimator, param2:int)
      {
         super();
         _skeletonAnimator = param1;
         _boneIndex = param2;
      }
      
      public function get boneIndex() : int
      {
         return _boneIndex;
      }
      
      override public function get assetType() : String
      {
         return "skeletonBoneTag";
      }
      
      public function needUpdateSceneTransform() : void
      {
         invalidateTransform();
      }
      
      override protected function updateSceneTransform() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = undefined;
         if(_parent)
         {
            if(_skeletonAnimator.globalPose.jointPoses.length)
            {
               _loc1_ = _skeletonAnimator.globalPose.jointPoses[_boneIndex].toMatrix3D();
            }
            else
            {
               _loc2_ = _skeletonAnimator.skeleton.joints[_boneIndex].inverseBindPose;
               _loc1_ = new Matrix3D(_loc2_);
            }
            _loc1_.prependScale(-1,1,1);
            _sceneTransform.copyFrom(_loc1_);
            _sceneTransform.append(_parent.sceneTransform);
            _sceneTransform.prepend(transform);
         }
         _sceneTransformDirty = false;
      }
      
      override public function dispose() : void
      {
         _skeletonAnimator = null;
         super.dispose();
      }
   }
}
